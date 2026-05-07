#!/usr/bin/env python3
import json
import lanelet2
import lanelet2.io
import lanelet2.projection
import lanelet2.traffic_rules
import lanelet2.routing
import rclpy
from rclpy.node import Node
from std_msgs.msg import Int32MultiArray, Float32MultiArray, Int32, String
from nav_msgs.msg import Odometry
from rclpy.qos import QoSProfile, QoSDurabilityPolicy, QoSReliabilityPolicy
from shapely.geometry import Point, Polygon

# ─── Harita Yükleme ───────────────────────────────────────────────────────────
filename = "/home/astrid/test-27.04/carla_test.osm"
origin = lanelet2.io.Origin(0.0, 0.0)
projector = lanelet2.projection.LocalCartesianProjector(origin)

lanelet_map = lanelet2.io.load(filename, projector)
traffic_rules = lanelet2.traffic_rules.create(
    lanelet2.traffic_rules.Locations.Germany,
    lanelet2.traffic_rules.Participants.Vehicle,
)
routing_graph = lanelet2.routing.RoutingGraph(lanelet_map, traffic_rules)

print("Harita başarıyla yüklendi!")
print("Lanelet sayısı:", len(lanelet_map.laneletLayer))


SIGN_ALIASES = {
    "mecburiSag":          "saga_mecburi_yon",
    "mecburiSol":          "sola_mecburi_yon",
    "mecburi-ileri":         "ileri_mecburi_yon",
    "ileriveSaga": "ileri_ve_saga_mecburi_yon",
    "ileriveSola": "ileri_ve_sola_mecburi_yon",
    "ileridenSag": "ileriden_saga_mecburi_yon",
    "ileridenSol": "ileriden_sola_mecburi_yon",
    "girilmez":                  "girilmez",
    "donelKavsak":     "ada_etrafinda_donunuz",
    "yasakSag": "saga_donulmez",
    "yasakSol": "sola_donulmez",
}

# ─── Yardımcı fonksiyonlar ────────────────────────────────────────────────────
def attr_get(obj, key, default=""):
    """Lanelet2 AttributeMap için .get() yerine kullanılır."""
    return obj.attributes[key] if key in obj.attributes else default

def relevant_direction_exists(sign, followers):
    directions = [attr_get(f, "turn_direction") for f in followers]
    if sign == "saga_donulmez":               return "right" in directions
    elif sign == "sola_donulmez":             return "left" in directions
    elif sign == "sola_mecburi_yon":          return "left" in directions
    elif sign == "saga_mecburi_yon":          return "right" in directions
    elif sign == "girilmez":                  return len(followers) > 0
    elif sign in ["durak", "park", "yesil_isik", "ada_etrafinda_donunuz"]: return True
    elif sign == "ileri_mecburi_yon":         return "straight" in directions
    elif sign == "ileri_ve_saga_mecburi_yon": return "straight" in directions or "right" in directions
    elif sign == "ileri_ve_sola_mecburi_yon": return "straight" in directions or "left" in directions
    elif sign in ["ileriden_sola_mecburi_yon", "ileriden_saga_mecburi_yon"]:
        return any(attr_get(f, "turn_direction") == "straight" for f in followers)
    return False

def straight_followed_but_turn_missing(followers, required_td):
    for nxt in followers:
        if attr_get(nxt, "turn_direction") == "straight":
            for sec in routing_graph.following(nxt):
                if attr_get(sec, "turn_direction") == "straight":
                    third = routing_graph.following(sec)
                    if not any(attr_get(f, "turn_direction") == required_td for f in third):
                        return True
            return False
    return True

# ─── Node ─────────────────────────────────────────────────────────────────────
class TrafficSignProcessor(Node):
    def __init__(self):
        super().__init__('traffic_sign_processor')

        self.transient_qos = QoSProfile(
            depth=10,
            durability=QoSDurabilityPolicy.TRANSIENT_LOCAL,
            reliability=QoSReliabilityPolicy.RELIABLE,
        )

        self.transient_qos_perception = QoSProfile(
            depth=5,
            durability=QoSDurabilityPolicy.VOLATILE,
            reliability=QoSReliabilityPolicy.BEST_EFFORT,
        )

        # ── Publisher'lar ──
        self.blocked_pub = self.create_publisher(
            Int32MultiArray, '/astrid/slam/blocked_lanelet_ids',10)
        self.manevra_pub = self.create_publisher(
            Float32MultiArray, '/astrid/slam/station_park_manevuer_points', self.transient_qos)

        # ── Subscriber'lar ──
        self.create_subscription(String, '/astrid/perception/traffic_sign',
                                 self.traffic_sign_callback, self.transient_qos_perception)
        self.create_subscription(Int32, '/astrid/slam/current_lanelet_id',
                                 self.lanelet_callback, 10)
        self.create_subscription(Odometry, '/carla/hero/odometry',
                                 self.odom_callback, 10)

        # ── Durum değişkenleri ──
        self.current_lanelet_id     = None
        self.detected_sign          = None
        self.sign_detection_lanelet = None
        self.active_blocked_ids     = []
        self.last_processed_id      = -9999

        # ── Manevra noktaları ──
        self.manevra_linestring_types = [
            "park1","park2","park3","park4","park5",
            "park6","park7","park8","park9",
            "station_maneuver1","station_maneuver2","station_maneuver3",
        ]
        self.manevra_pointler   = []
        self.manevra_yayinlandi = False
        self.collect_maneuver_points()

    # ── Odom'dan lanelet bul (local_x/local_y CARLA frame) ───────────────────
    def _find_lanelet_at(self, x, y):
        pt = Point(x, y)
        for ll in lanelet_map.laneletLayer:
            left_pts, right_pts = [], []
            for p in ll.leftBound:
                if 'local_x' in p.attributes and 'local_y' in p.attributes:
                    try:
                        left_pts.append((float(p.attributes['local_x']),
                                         float(p.attributes['local_y'])))
                    except Exception:
                        pass
            for p in ll.rightBound:
                if 'local_x' in p.attributes and 'local_y' in p.attributes:
                    try:
                        right_pts.append((float(p.attributes['local_x']),
                                          float(p.attributes['local_y'])))
                    except Exception:
                        pass
            poly_pts = left_pts + list(reversed(right_pts))
            if len(poly_pts) < 3:
                continue
            try:
                if Polygon(poly_pts).contains(pt):
                    return ll.id
            except Exception:
                continue
        return None

    def odom_callback(self, msg):
        """local_lanelet_matcher çalışmıyorsa fallback: odom'dan lanelet bul."""
        if self.current_lanelet_id is not None:
            return  # Zaten lanelet topiği geliyor

        # local_x/local_y CARLA frame'inde → ham koordinat kullan
        x = msg.pose.pose.position.x
        y = msg.pose.pose.position.y

        found_id = self._find_lanelet_at(x, y)
        if found_id is not None:
            fake = Int32()
            fake.data = found_id
            self.lanelet_callback(fake)

    # ── İşaret çevirme ────────────────────────────────────────────────────────
    def translate_sign(self, sign):
        canonical  = SIGN_ALIASES.get(sign, None)
        if canonical is None:
            self.get_logger().warn(
                f"Bilinmeyen işaret: '{sign}' (sign: '{sign}')")
        return canonical

    def extract_sign_name(self, payload):
        if not isinstance(payload, list):
            return None
        for item in payload:
            if isinstance(item, list) and len(item) > 0:
                return item[0]
            if isinstance(item, dict):
                return item.get("name")
        return None

    # ── Traffic sign callback ─────────────────────────────────────────────────
    def traffic_sign_callback(self, msg):
        try:
            signs = json.loads(msg.data)
            raw   = self.extract_sign_name(signs)
            if not raw:
                self.get_logger().warn("Tabela ismi ayıklanamadı.")
                return

            canonical = self.translate_sign(raw)
            if canonical is None:
                return

            if self.active_blocked_ids:
                self.clear_blocking()

            self.detected_sign = canonical

            if self.current_lanelet_id is None:
                self.sign_detection_lanelet = None
                self.get_logger().warn(
                    f"Levha geldi ama lanelet yok, bekleniyor — raw='{raw}' → '{canonical}'")
                return

            self.sign_detection_lanelet = self.current_lanelet_id
            self.get_logger().info(
                f"Trafik işareti: '{raw}' → '{canonical}', lanelet={self.sign_detection_lanelet}")
            self.process_and_publish_blocking()

        except Exception as e:
            self.get_logger().error(f"traffic_sign_callback hatası: {e}")

    # ── Lanelet callback ──────────────────────────────────────────────────────
    def lanelet_callback(self, msg):
        # -1 = "lanelet bulunamadı" → None gibi davran, odom fallback devreye girsin
        if msg.data == -1:
            self.current_lanelet_id = None
            return

        self.current_lanelet_id = msg.data

        # Araç kavşaktan çıktıysa bloklamayı temizle
        if (self.sign_detection_lanelet is not None
                and self.current_lanelet_id != self.sign_detection_lanelet
                and self.active_blocked_ids):
            self.clear_blocking()
            self.sign_detection_lanelet = None
            self.detected_sign = None

        self.last_processed_id = self.current_lanelet_id

        # Retry: işaret geldi ama o an lanelet yoktu
        if self.detected_sign is not None and self.sign_detection_lanelet is None:
            self.sign_detection_lanelet = self.current_lanelet_id
            self.get_logger().info(
                f"[RETRY] Bekleyen işaret: '{self.detected_sign}', lanelet={self.current_lanelet_id}")
            self.process_and_publish_blocking()

        if not self.manevra_yayinlandi:
            self.publish_maneuver_points()

    # ── Bloklama hesaplama ────────────────────────────────────────────────────
    def process_traffic_sign(self, lanelet_id):
        if lanelet_id is None:
            return []

        try:
            current_ll = lanelet_map.laneletLayer[lanelet_id]
        except Exception:
            self.get_logger().error(f"Lanelet {lanelet_id} haritada yok!")
            return []

        followers = list(routing_graph.following(current_ll))
        if not followers:
            self.get_logger().warn(
                f"Lanelet {lanelet_id} takipçisi yok (kavşak lanelete henüz girilmedi?)")
            return []

        sign = self.detected_sign

        if sign in ["yesil_isik", "ada_etrafinda_donunuz", "durak", "park"]:
            return []

        follower_info = [(f.id, attr_get(f, "turn_direction", "—")) for f in followers]
        self.get_logger().info(
            f"Bloklama: sign='{sign}', lanelet={lanelet_id}, takipçiler={follower_info}")

        if not relevant_direction_exists(sign, followers):
            self.get_logger().warn(
                f"relevant_direction_exists FALSE — sign='{sign}', yönler={follower_info}")
            return []

        if sign == "ileriden_sola_mecburi_yon" and straight_followed_but_turn_missing(followers, "left"):
            return []
        if sign == "ileriden_saga_mecburi_yon" and straight_followed_but_turn_missing(followers, "right"):
            return []

        yasakli_ids = []
        for nxt in followers:
            td    = attr_get(nxt, "turn_direction")
            block = False

            if   sign == "saga_donulmez"             and td == "right":                   block = True
            elif sign == "sola_donulmez"             and td == "left":                    block = True
            elif sign == "girilmez"                  and td == "straight":                block = True
            elif sign == "sola_mecburi_yon"          and td != "left":                   block = True
            elif sign == "saga_mecburi_yon"          and td != "right":                  block = True
            elif sign == "ileri_mecburi_yon"         and td != "straight":               block = True
            elif sign == "ileri_ve_saga_mecburi_yon" and td not in ["straight", "right"]: block = True
            elif sign == "ileri_ve_sola_mecburi_yon" and td not in ["straight", "left"]:  block = True
            elif sign == "ileriden_sola_mecburi_yon":
                if td != "straight":
                    block = True  # 1. aşama: düz olmayanı blokla
                else:
                    for sec in routing_graph.following(nxt):
                        sec_td = attr_get(sec, "turn_direction")
                        if sec_td == "left":
                            pass  # 2. aşama: sola dönüyor, bloklanmaz
                        elif sec_td == "right":
                            yasakli_ids.append(sec.id)  # 2. aşama: sağa dönüyor, blokla
                        elif sec_td == "straight":
                            third_followers = list(routing_graph.following(sec))
                            if any(attr_get(t, "turn_direction") == "left" for t in third_followers):
                                pass  # 3. aşama: ileride sola var, bloklanmaz
                            else:
                                # 4. aşama: bir adım daha git
                                has_left = False
                                for t in third_followers:
                                    if attr_get(t, "turn_direction") == "straight":
                                        fourth_followers = routing_graph.following(t)
                                        if any(attr_get(f4, "turn_direction") == "left" for f4 in fourth_followers):
                                            has_left = True
                                            break
                                if not has_left:
                                    yasakli_ids.append(sec.id)  # ileride sola yok, blokla
            elif sign == "ileriden_saga_mecburi_yon":
                if td != "straight":
                    block = True  # 1. aşama: düz olmayanı blokla
                else:
                    for sec in routing_graph.following(nxt):
                        sec_td = attr_get(sec, "turn_direction")
                        if sec_td == "right":
                            pass  # 2. aşama: sağa dönüyor, bloklanmaz
                        elif sec_td == "left":
                            yasakli_ids.append(sec.id)  # 2. aşama: sola dönüyor, blokla
                        elif sec_td == "straight":
                            third_followers = list(routing_graph.following(sec))
                            if any(attr_get(t, "turn_direction") == "right" for t in third_followers):
                                pass  # 3. aşama: ileride sağa var, bloklanmaz
                            else:
                                # 4. aşama: bir adım daha git
                                has_right = False
                                for t in third_followers:
                                    if attr_get(t, "turn_direction") == "straight":
                                        fourth_followers = routing_graph.following(t)
                                        if any(attr_get(f4, "turn_direction") == "right" for f4 in fourth_followers):
                                            has_right = True
                                            break
                                if not has_right:
                                    yasakli_ids.append(sec.id)  # ileride sağa yok, blokla

            if block:
                yasakli_ids.append(nxt.id)
                self.get_logger().info(f"  BLOKLANDI → id={nxt.id}, td='{td}'")

        return list(dict.fromkeys(yasakli_ids))

    def process_and_publish_blocking(self):
        if self.sign_detection_lanelet is None or self.detected_sign is None:
            return

        blocked_ids = self.process_traffic_sign(self.sign_detection_lanelet)
        self.active_blocked_ids = blocked_ids

        blocked_msg = Int32MultiArray()
        blocked_msg.data = blocked_ids
        self.blocked_pub.publish(blocked_msg)
        self.get_logger().info(
            f"YAYINLANDI → lanelet={self.sign_detection_lanelet}, blocked={blocked_ids}")

    def clear_blocking(self):
        msg = Int32MultiArray()
        msg.data = []
        self.blocked_pub.publish(msg)
        self.active_blocked_ids = []
        self.get_logger().info("Bloklamalar temizlendi")

    # ── Manevra noktaları ─────────────────────────────────────────────────────
    def collect_maneuver_points(self):
        for ls in lanelet_map.lineStringLayer:
            if 'type' in ls.attributes and ls.attributes['type'] in self.manevra_linestring_types:
                pts = []
                for pt in ls:
                    if 'local_x' in pt.attributes and 'local_y' in pt.attributes:
                        try:
                            x = float(pt.attributes['local_x'])
                            y = float(pt.attributes['local_y'])
                            self.manevra_pointler.append((x, y))
                            pts.append((x, y))
                        except Exception:
                            pass
                self.get_logger().info(
                    f"'{ls.attributes['type']}': {len(pts)} nokta")

    def publish_maneuver_points(self):
        if not self.manevra_pointler or self.manevra_yayinlandi:
            return
        flat = [c for pt in self.manevra_pointler for c in pt]
        msg  = Float32MultiArray()
        msg.data = flat
        self.manevra_pub.publish(msg)
        self.get_logger().info(
            f"Manevra noktaları yayınlandı: {len(self.manevra_pointler)} nokta")
        self.manevra_yayinlandi = True


# ─── Main ─────────────────────────────────────────────────────────────────────
def main():
    rclpy.init()
    node = TrafficSignProcessor()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()
