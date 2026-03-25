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

# Harita Yükleme
filename = "/home/sdka/Documents/lanelet2_map.osm"
latitude, longitude = 0.0, 0.0
origin = lanelet2.io.Origin(latitude, longitude)
projector = lanelet2.projection.LocalCartesianProjector(origin)

map = lanelet2.io.load(filename, projector)
traffic_rules = lanelet2.traffic_rules.create(
    lanelet2.traffic_rules.Locations.Germany,
    lanelet2.traffic_rules.Participants.Vehicle,
)
routing_graph = lanelet2.routing.RoutingGraph(map, traffic_rules)

print("Harita başarıyla yüklendi!")
print("Lanelet sayısı:", len(map.laneletLayer))

# --- TÜM helper fonksiyonlar AYNI bırakıldı ---
def get_local_coords(point):
    x_tag = point.attributes['local_x']
    y_tag = point.attributes['local_y']
    if x_tag is None or y_tag is None:
        return None
    return float(x_tag), float(y_tag)

def relevant_direction_exists(sign, followers):
    directions = []
    for f in followers:
        if "turn_direction" in f.attributes:
            td = f.attributes["turn_direction"]
            directions.append(td)
    if sign == "saga donulmez":
        return "right" in directions
    elif sign == "sola donulmez":
        return "left" in directions
    elif sign == "sola mecburi yon":
        return "left" in directions
    elif sign == "saga mecburi yon":
        return "right" in directions
    elif sign == "girilmez":
        return "straight" in directions
    elif sign == "Durak":
        return True
    elif sign == "Park yeri":
        return True
    elif sign == "Ileri mecburi yon":
        return "straight" in directions
    elif sign == "Ileri ve saga mecburi yon":
        return "straight" in directions or "right" in directions
    elif sign == "Ileri ve sola mecburi yon":
        return "straight" in directions or "left" in directions
    elif sign in ["Ileriden sola mecburi yon", "Ileriden saga mecburi yon"]:
        return any(
            "turn_direction" in f.attributes and f.attributes["turn_direction"] == "straight"
            for f in followers
        )
    return False

def straight_followed_but_turn_missing(followers, required_td):
    for nxt in followers:
        td = nxt.attributes.get("turn_direction", "")
        if td == "straight":
            second_followers = routing_graph.following(nxt)
            for sec in second_followers:
                sec_td = sec.attributes.get("turn_direction", "")
                if sec_td == "straight":
                    third_followers = routing_graph.following(sec)
                    if not any(f.attributes.get("turn_direction", "") == required_td
                              for f in third_followers):
                        return True
            return False
    return True

class TrafficSignProcessor(Node):
    def __init__(self):
        super().__init__('traffic_sign_processor')
        
        # Trafik işareti aboneliği
        self.traffic_sign_sub = self.create_subscription(
            String,
            '/astrid/perception/traffic_sign',
            self.traffic_sign_callback,
            10
        )
        self.detected_sign = None
        self.sign_detection_lanelet = None
        self.active_blocked_ids = []
        
        # Manevra tipleri                                                                       # osm deki linestringlere göre burayı değiştir
        self.manevra_linestring_types = ["park1","park2","park3","park4",
                                        "park5","park6","park7","park8","park9","station_maneuver1","station_maneuver2","station_maneuver3"]
        
        # Manevra noktaları
        self.manevra_pointler = []
        self.manevra_yayinlandi = False
        self.collect_maneuver_points()
 
        # QoS Profilleri
        self.transient_qos = QoSProfile(
            depth=10,
            durability=QoSDurabilityPolicy.TRANSIENT_LOCAL,
            reliability=QoSReliabilityPolicy.RELIABLE
 
        )
 
        # Yayıncılar
        self.blocked_pub = self.create_publisher(Int32MultiArray, '/astrid/slam/blocked_lanelet_ids', self.transient_qos)
        self.manevra_pub = self.create_publisher(Float32MultiArray, '/astrid/slam/station_park_manevuer_points', self.transient_qos)
 
        # Lanelet aboneliği
        self.sub = self.create_subscription(Int32, '/astrid/slam/current_lanelet_id', self.lanelet_callback, 10)
        self.current_lanelet_id = None
        self.last_processed_id = -9999
        self.last_sign_name = None


    def traffic_sign_callback(self, msg):
        try:
            signs = json.loads(msg.data)
 
            # Veri yapısı: [["tabela_adi", değer]]
            if isinstance(signs, list) and len(signs) > 0:
                first_item = signs[0]
 
                # Eğer listenin ilk elemanı da bir listeyse (çıktıdaki gibi)
                if isinstance(first_item, list) and len(first_item) > 0:
                    raw_sign_name = first_item[0]  # "name" kısmını buradan alır
                
                # Eğer veri sözlük olarak gelirse (eski ihtimal için güvenlik)
                elif isinstance(first_item, dict):
                    raw_sign_name = first_item.get("name")
                
                else:
                    raw_sign_name = None
 
                if raw_sign_name:
                    # Bloklamaları temizle ve diğer işlemler...
                    if self.active_blocked_ids:
                        self.clear_blocking()
                    
                    self.sign_detection_lanelet = self.current_lanelet_id
                    self.detected_sign = self.translate_sign(raw_sign_name)
                    
                    self.get_logger().info(f"Yeni trafik işareti: {raw_sign_name} -> {self.detected_sign}")
                    self.process_and_publish_blocking()
                else:
                    self.get_logger().warn("Veri içinden tabela ismi ayıklanamadı.")
            else:
                self.get_logger().warn("Trafik işareti listesi boş veya geçersiz.")
 
        except Exception as e:
            self.get_logger().error(f"Hata oluştu: {str(e)}")
 
    def translate_sign(self, sign):
        """İngilizce/Türkçe işaret dönüşümü"""                 # Modeldeki isimlere göre bu kısmı değiştir
        sign_mapping = {
            "IleriSag": "Ileri ve sağa mecburi yon",
            "ileriSol": "Ileri ve sola mecburi yon",
            "yasakSag": "saga donulmez",
            "yasakSol": "sola donulmez",
            "durak": "Durak",
            "park_yeri": "Park",
            "ileri": "Ileri mecburi yon",
            "girilmez":"girilmez"
        }
        return sign_mapping.get(sign, sign)
    
 
    def collect_maneuver_points(self):
        """Tüm manevra noktalarını toplar"""
        for ls in map.lineStringLayer:
            if "type" in ls.attributes and ls.attributes["type"] in self.manevra_linestring_types:
                ls_type = ls.attributes["type"]
                point_list = []
 
                for pt in ls:
                    if "local_x" in pt.attributes and "local_y" in pt.attributes:
                        x = float(pt.attributes["local_x"])
                        y = float(pt.attributes["local_y"])
                        self.manevra_pointler.append((x, y))
                        point_list.append((x, y))
 
                self.get_logger().info(f"'{ls_type}' linestring'e ait {len(point_list)} nokta bulundu")
 
    def publish_maneuver_points(self):
        """Manevra noktalarını yayınlar"""
        if not self.manevra_pointler or self.manevra_yayinlandi:
            return
 
        flat_points = [coord for point in self.manevra_pointler for coord in point]
 
 
        msg = Float32MultiArray()
        msg.data = flat_points
        self.manevra_pub.publish(msg)
        self.get_logger().info(f"Toplam {len(self.manevra_pointler)} manevra noktası yayınlandı")
 
        self.manevra_yayinlandi = True
 
    def process_traffic_sign(self, lanelet_id):
        """Trafik işaretine göre yasaklı lanelet'leri hesaplar"""
        if lanelet_id not in map.laneletLayer:
            self.get_logger().error(f"Lanelet ID {lanelet_id} bulunamadı!")
            return []
 
        current_lanelet = map.laneletLayer[lanelet_id]
        followers = routing_graph.following(current_lanelet)
        
        if not followers:
            self.get_logger().info("Takip edilebilecek lanelet yok")
            return []
 
        # Yön kontrolü
        sign = self.detected_sign.replace("_", " ")
 
        if sign in ["yesil isik", "ada etrafinda donunuz", "Durak", "Park"]:
            return []
 
        if sign == "girisi olmayan yol":
            sign = "girilmez"
 
        if not relevant_direction_exists(sign, followers):
            self.get_logger().warning(f"Uygun yön bulunamadı: {sign}")
            return []
            
        # Özel durumlar
        if sign == "Ileriden sola mecburi yon" and straight_followed_but_turn_missing(followers, "left"):
            self.get_logger().warning("İleriden sola mecburi yön için uygun yol yok")
            return []
        if sign == "Ileriden saga mecburi yon" and straight_followed_but_turn_missing(followers, "right"):
            self.get_logger().warning("İleriden sağa mecburi yön için uygun yol yok")
            return []
 
        # Yasaklı laneletleri hesapla
        yasakli_ids = []
        for nxt in followers:
            td = nxt.attributes["turn_direction"] if "turn_direction" in nxt.attributes else "belirtilmemiş"
            block = False
 
            if sign == "saga donulmez" and td == "right":
                block = True
            elif sign == "sola donulmez" and td == "left":
                block = True
            elif sign == "girilmez" and td == "straight" :
                block = True
            elif sign == "sola mecburi yon" and td != "left":
                block = True
            elif sign == "saga mecburi yon" and td != "right":
                block = True
            elif sign == "Ileri mecburi yon" and td != "straight":
                block = True
            elif sign == "Ileri ve saga mecburi yon" and td == "left":
                block = True
            elif sign == "Ileri ve sola mecburi yon" and td == "right":
                block = True
                        # İLERİDEN SOLA MECBURİ YÖN: 3 AŞAMALI BLOKLAMA
            elif sign == "Ileriden sola mecburi yon":
                # 1. Aşama: Düz olmayanları blokla
                if td != "straight":
                    block = True
                else:
                    # 2. Aşama: Düz laneletin takipçilerini al
                    second_followers = routing_graph.following(nxt)
                    for sec in second_followers:
                        sec_td = sec.attributes["turn_direction"] if "turn_direction" in sec.attributes else "belirtilmemiş"
                        
                        # 3. Aşama: Sola dönmeyenleri blokla
                        if sec_td != "left":
                            yasakli_ids.append(sec.id)
            
            # İLERİDEN SAĞA MECBURİ YÖN: 3 AŞAMALI BLOKLAMA
            elif sign == "Ileriden saga mecburi yon":
                # 1. Aşama: Düz olmayanları blokla
                if td != "straight":
                    block = True
                else:
                    # 2. Aşama: Düz laneletin takipçilerini al
                    second_followers = routing_graph.following(nxt)
                    for sec in second_followers:
                        sec_td = sec.attributes["turn_direction"] if "turn_direction" in sec.attributes else "belirtilmemiş"
                        
                        # 3. Aşama: Sağa dönmeyenleri blokla
                        if sec_td != "right":
                            yasakli_ids.append(sec.id)
            
            if block:
                yasakli_ids.append(nxt.id)
 
        return yasakli_ids
 
    def process_and_publish_blocking(self):
        """Trafik işaretini işle ve bloklamayı yayınla"""
        if self.sign_detection_lanelet is None or self.detected_sign is None:
            return
            
        blocked_ids = self.process_traffic_sign(self.sign_detection_lanelet)
        self.active_blocked_ids = blocked_ids
        
        blocked_msg = Int32MultiArray()
        blocked_msg.data = blocked_ids
        self.blocked_pub.publish(blocked_msg)
        self.get_logger().info(f"Lanelet {self.sign_detection_lanelet} için yasaklı laneletler: {blocked_ids}")
 
    def clear_blocking(self):
        """Aktif bloklamaları temizle"""
        clear_msg = Int32MultiArray()
        clear_msg.data = []
        self.blocked_pub.publish(clear_msg)
        self.active_blocked_ids = []
        self.get_logger().info("Tüm bloklamalar kaldırıldı")
 
    def lanelet_callback(self, msg):
        self.current_lanelet_id = msg.data
        
        # Lanelet değiştiyse ve önceki bloklama varsa temizle
        if (self.current_lanelet_id != self.last_processed_id and
            self.current_lanelet_id != self.sign_detection_lanelet and
            self.active_blocked_ids):
            self.clear_blocking()
            self.sign_detection_lanelet = None
            self.detected_sign = None
        
        self.last_processed_id = self.current_lanelet_id

        # Manevra noktalarını yayınla (sadece ilk seferde)
        if not self.manevra_yayinlandi:
            self.publish_maneuver_points()
 
# Ana Fonksiyon ---------------------------------------------------------------
def main():
    rclpy.init()

    node = TrafficSignProcessor()

    rclpy.spin(node)

    node.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()
    