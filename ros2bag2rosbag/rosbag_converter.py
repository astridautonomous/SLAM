import pickle
import rosbag
import rospy
import numpy as np
from std_msgs.msg import Header
from sensor_msgs.msg import PointCloud2, PointField

# Pkl dosya yolu
input_pkl_file = '/home/jetson/Documents/converted_ros2_data.pkl2'

# Oluşturulacak rosbag dosyası
output_bag_file = 'converted_velodyne_ros1.bag'

# ROS başlatma (timestamp için gerekli)
rospy.init_node('pkl_to_rosbag_converter', anonymous=True)

# Pickle dosyasını aç
try:
    with open(input_pkl_file, 'rb') as f:
        messages = pickle.load(f, encoding='latin1')
except Exception as e:
    print(f"Pkl dosyası okunamadı! Hata: {e}")
    exit(1)

# Bag dosyasını yazmak için aç
bag = rosbag.Bag(output_bag_file, 'w')

for entry in messages:
    timestamp = entry['timestamp']
    msg_data = entry['msg']

    stamp = rospy.Time.from_sec(timestamp * 1e-9)

    # PointCloud2 mesajını oluştur
    pc2_msg = PointCloud2()
    pc2_msg.header = Header()
    pc2_msg.header.stamp = stamp
    pc2_msg.header.frame_id = msg_data['header']['frame_id']
    pc2_msg.height = msg_data['height']
    pc2_msg.width = msg_data['width']
    pc2_msg.is_bigendian = msg_data['is_bigendian']
    pc2_msg.point_step = msg_data['point_step']
    pc2_msg.row_step = msg_data['row_step']
    pc2_msg.is_dense = msg_data['is_dense']

    # data alanını uygun formata çevir (bytes)
    if isinstance(msg_data['data'], (bytes, bytearray)):
        pc2_msg.data = msg_data['data']
    elif isinstance(msg_data['data'], list):
        pc2_msg.data = bytes(msg_data['data'])
    elif isinstance(msg_data['data'], np.ndarray):
        pc2_msg.data = msg_data['data'].tobytes()
    else:
        print("Uyarı: 'data' alanı bilinmeyen formatta. Boş geçildi.")
        pc2_msg.data = b''

    # PointField tanımları (Velodyne için genellikle x, y, z, intensity)
    pc2_msg.fields = [
        PointField(name='x', offset=0,  datatype=PointField.FLOAT32, count=1),
        PointField(name='y', offset=4,  datatype=PointField.FLOAT32, count=1),
        PointField(name='z', offset=8,  datatype=PointField.FLOAT32, count=1),
        PointField(name='intensity', offset=12, datatype=PointField.FLOAT32, count=1),
    ]

    # Mesajı yaz
    bag.write('/velodyne_points', pc2_msg, t=stamp)

bag.close()
print(f"✅ Tamamlandi! ROS 1 bag dosyasi oluşturuldu: {output_bag_file}")
