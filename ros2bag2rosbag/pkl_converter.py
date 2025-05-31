from rosbags.rosbag2 import Reader
from rosbags.serde import deserialize_cdr
import pickle

input_bag = '/home/jetson/your_ros2_bag_directory'
output_pkl = 'converted_ros2_data.pkl'

reader = Reader(input_bag)
reader.open()

msgs = []

for connection, timestamp, rawdata in reader.messages():
    if connection.topic == '/velodyne_points':
        msg = deserialize_cdr(rawdata, connection.msgtype)
        # Yalnızca dictionary veriyi kaydet (pickle'da bağımsız olur)
        msg_dict = {
            'header': {
                'frame_id': msg.header.frame_id
            },
            'height': msg.height,
            'width': msg.width,
            'is_bigendian': msg.is_bigendian,
            'point_step': msg.point_step,
            'row_step': msg.row_step,
            'is_dense': msg.is_dense,
            'data': msg.data
        }
        msgs.append({'timestamp': timestamp, 'msg': msg_dict})

reader.close()

with open(output_pkl, 'wb') as f:
    pickle.dump(msgs, f)

print(f"Pkl dosyasi başariyla kaydedildi: {output_pkl}")
