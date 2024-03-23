// Auto-generated. Do not edit!

// (in-package ainstein_radar_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class RadarInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.update_rate = null;
      this.max_num_targets = null;
      this.range_min = null;
      this.range_max = null;
      this.speed_min = null;
      this.speed_max = null;
      this.azimuth_min = null;
      this.azimuth_max = null;
      this.elevation_min = null;
      this.elevation_max = null;
      this.range_resolution = null;
      this.range_accuracy = null;
      this.speed_resolution = null;
      this.speed_accuracy = null;
      this.azimuth_resolution = null;
      this.azimuth_accuracy = null;
      this.elevation_resolution = null;
      this.elevation_accuracy = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('update_rate')) {
        this.update_rate = initObj.update_rate
      }
      else {
        this.update_rate = 0.0;
      }
      if (initObj.hasOwnProperty('max_num_targets')) {
        this.max_num_targets = initObj.max_num_targets
      }
      else {
        this.max_num_targets = 0;
      }
      if (initObj.hasOwnProperty('range_min')) {
        this.range_min = initObj.range_min
      }
      else {
        this.range_min = 0.0;
      }
      if (initObj.hasOwnProperty('range_max')) {
        this.range_max = initObj.range_max
      }
      else {
        this.range_max = 0.0;
      }
      if (initObj.hasOwnProperty('speed_min')) {
        this.speed_min = initObj.speed_min
      }
      else {
        this.speed_min = 0.0;
      }
      if (initObj.hasOwnProperty('speed_max')) {
        this.speed_max = initObj.speed_max
      }
      else {
        this.speed_max = 0.0;
      }
      if (initObj.hasOwnProperty('azimuth_min')) {
        this.azimuth_min = initObj.azimuth_min
      }
      else {
        this.azimuth_min = 0.0;
      }
      if (initObj.hasOwnProperty('azimuth_max')) {
        this.azimuth_max = initObj.azimuth_max
      }
      else {
        this.azimuth_max = 0.0;
      }
      if (initObj.hasOwnProperty('elevation_min')) {
        this.elevation_min = initObj.elevation_min
      }
      else {
        this.elevation_min = 0.0;
      }
      if (initObj.hasOwnProperty('elevation_max')) {
        this.elevation_max = initObj.elevation_max
      }
      else {
        this.elevation_max = 0.0;
      }
      if (initObj.hasOwnProperty('range_resolution')) {
        this.range_resolution = initObj.range_resolution
      }
      else {
        this.range_resolution = 0.0;
      }
      if (initObj.hasOwnProperty('range_accuracy')) {
        this.range_accuracy = initObj.range_accuracy
      }
      else {
        this.range_accuracy = 0.0;
      }
      if (initObj.hasOwnProperty('speed_resolution')) {
        this.speed_resolution = initObj.speed_resolution
      }
      else {
        this.speed_resolution = 0.0;
      }
      if (initObj.hasOwnProperty('speed_accuracy')) {
        this.speed_accuracy = initObj.speed_accuracy
      }
      else {
        this.speed_accuracy = 0.0;
      }
      if (initObj.hasOwnProperty('azimuth_resolution')) {
        this.azimuth_resolution = initObj.azimuth_resolution
      }
      else {
        this.azimuth_resolution = 0.0;
      }
      if (initObj.hasOwnProperty('azimuth_accuracy')) {
        this.azimuth_accuracy = initObj.azimuth_accuracy
      }
      else {
        this.azimuth_accuracy = 0.0;
      }
      if (initObj.hasOwnProperty('elevation_resolution')) {
        this.elevation_resolution = initObj.elevation_resolution
      }
      else {
        this.elevation_resolution = 0.0;
      }
      if (initObj.hasOwnProperty('elevation_accuracy')) {
        this.elevation_accuracy = initObj.elevation_accuracy
      }
      else {
        this.elevation_accuracy = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RadarInfo
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [update_rate]
    bufferOffset = _serializer.float64(obj.update_rate, buffer, bufferOffset);
    // Serialize message field [max_num_targets]
    bufferOffset = _serializer.uint16(obj.max_num_targets, buffer, bufferOffset);
    // Serialize message field [range_min]
    bufferOffset = _serializer.float64(obj.range_min, buffer, bufferOffset);
    // Serialize message field [range_max]
    bufferOffset = _serializer.float64(obj.range_max, buffer, bufferOffset);
    // Serialize message field [speed_min]
    bufferOffset = _serializer.float64(obj.speed_min, buffer, bufferOffset);
    // Serialize message field [speed_max]
    bufferOffset = _serializer.float64(obj.speed_max, buffer, bufferOffset);
    // Serialize message field [azimuth_min]
    bufferOffset = _serializer.float64(obj.azimuth_min, buffer, bufferOffset);
    // Serialize message field [azimuth_max]
    bufferOffset = _serializer.float64(obj.azimuth_max, buffer, bufferOffset);
    // Serialize message field [elevation_min]
    bufferOffset = _serializer.float64(obj.elevation_min, buffer, bufferOffset);
    // Serialize message field [elevation_max]
    bufferOffset = _serializer.float64(obj.elevation_max, buffer, bufferOffset);
    // Serialize message field [range_resolution]
    bufferOffset = _serializer.float64(obj.range_resolution, buffer, bufferOffset);
    // Serialize message field [range_accuracy]
    bufferOffset = _serializer.float64(obj.range_accuracy, buffer, bufferOffset);
    // Serialize message field [speed_resolution]
    bufferOffset = _serializer.float64(obj.speed_resolution, buffer, bufferOffset);
    // Serialize message field [speed_accuracy]
    bufferOffset = _serializer.float64(obj.speed_accuracy, buffer, bufferOffset);
    // Serialize message field [azimuth_resolution]
    bufferOffset = _serializer.float64(obj.azimuth_resolution, buffer, bufferOffset);
    // Serialize message field [azimuth_accuracy]
    bufferOffset = _serializer.float64(obj.azimuth_accuracy, buffer, bufferOffset);
    // Serialize message field [elevation_resolution]
    bufferOffset = _serializer.float64(obj.elevation_resolution, buffer, bufferOffset);
    // Serialize message field [elevation_accuracy]
    bufferOffset = _serializer.float64(obj.elevation_accuracy, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RadarInfo
    let len;
    let data = new RadarInfo(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [update_rate]
    data.update_rate = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [max_num_targets]
    data.max_num_targets = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [range_min]
    data.range_min = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [range_max]
    data.range_max = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [speed_min]
    data.speed_min = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [speed_max]
    data.speed_max = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [azimuth_min]
    data.azimuth_min = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [azimuth_max]
    data.azimuth_max = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [elevation_min]
    data.elevation_min = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [elevation_max]
    data.elevation_max = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [range_resolution]
    data.range_resolution = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [range_accuracy]
    data.range_accuracy = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [speed_resolution]
    data.speed_resolution = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [speed_accuracy]
    data.speed_accuracy = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [azimuth_resolution]
    data.azimuth_resolution = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [azimuth_accuracy]
    data.azimuth_accuracy = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [elevation_resolution]
    data.elevation_resolution = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [elevation_accuracy]
    data.elevation_accuracy = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 138;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ainstein_radar_msgs/RadarInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '517f7ed5e498f66b6af3caaa2c6f2059';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message defines meta information for a radar sensor. It should
    # be in a radar namespace on topic "radar_info" and accompanied by up
    # to three radar topics named:
    #
    #   targets/raw      - raw (untracked) radar detections
    #   targets/tracked  - tracked radar detections
    #   alarms           - alarms based on detections, eg BSD
    #
    # In general, all Ainstein radars output raw detections and may also
    # output tracked detections if trackign algorithms are implemented in
    # firmware. Tracking from raw data is also available in ROS; see the
    # ainstein_radar_filters package for more information. Most radars do
    # not output alarms as this is specific to the automotive use case,
    # however this message type is retained for the time being for backward
    # compatibility.
    
    #######################################################################
    #                     Data acquisition info                           #
    #######################################################################
    
    # Time of data acquisition, radar coordinate frame ID
    Header header    # Header timestamp should be acquisition time of data
                     # Header frame_id should be radar sensing frame
                     # origin of frame should be center of sensor
                     # +x should point radially outwards from the radar
                     # +y should point to complete a right-handed frame
                     # +z should point upwards
    
    #######################################################################
    #                    General sensor properties                        #
    #######################################################################
    
    # The nominal update rate of the sensor reported in Hz.
    float64 update_rate
    
    # The maximum number of detections (targets) the sensors can report.
    uint16 max_num_targets
    
    #######################################################################
    #                    Physical sensing limits                          #
    #######################################################################
    # These are limits imposed by the antenna hardware and/or cutoffs set #
    # in the detection processing firmware. They come from sensor data    #
    # sheets and must be updated with each hardware revision as necessary.#
    #######################################################################
    
    # The minimum and maximum range, in meters, of detections (targets)
    # reported by the sensor.
    float64 range_min
    float64 range_max
    
    # The minimum and maximum speed, in meters per second, of detections
    # (targets) reported by the sensor.
    float64 speed_min
    float64 speed_max
    
    # The minimum and maximum azimuth angle, in degrees.
    float64 azimuth_min
    float64 azimuth_max
    
    # The minimum and maximum azimuth angle, in degrees.
    float64 elevation_min
    float64 elevation_max
    
    #######################################################################
    #                    Physical sensing precision                       #
    #######################################################################
    # These are also imposed by the antenna hardware and/or set in the    #
    # detection processing firmware. They also come from sensor data      #
    # sheets and must be updated with each hardware revision as necessary.#
    #######################################################################
    
    # Range resolution, in meters. The resolution is defined as the minimum
    # distance between two objects which results in distinct detections.
    float64 range_resolution
    
    # Range accuracy, in meters. The accuracy is defined as the precision
    # with which range of a detection is reported.
    float64 range_accuracy
    
    # Speed resolution, in meters per second. The resolution is defined as
    # the minimum speed difference between two objects which results in
    # distinct detections.
    float64 speed_resolution
    
    # Speed accuracy, in meters per second. The accuracy is defined as the
    # precision with which speed of a detection is reported.
    float64 speed_accuracy
    
    # Azimuth angle resolution, in degrees. The resolution is defined as
    # the minimum azimuth angle between two objects which results in
    # distinct detections.
    float64 azimuth_resolution
    
    # Azimuth angle accuracy, in degrees. The accuracy is defined as the
    # precision with which the azimuth angle of a detection is reported.
    float64 azimuth_accuracy
    
    # Elevation angle resolution, in degrees. The resolution is defined as
    # the minimum elevation angle between two objects which results in
    # distinct detections.
    float64 elevation_resolution
    
    # Elevation angle accuracy, in degrees. The accuracy is defined as the
    # precision with which the elevation angle of a detection is reported.
    float64 elevation_accuracy
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RadarInfo(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.update_rate !== undefined) {
      resolved.update_rate = msg.update_rate;
    }
    else {
      resolved.update_rate = 0.0
    }

    if (msg.max_num_targets !== undefined) {
      resolved.max_num_targets = msg.max_num_targets;
    }
    else {
      resolved.max_num_targets = 0
    }

    if (msg.range_min !== undefined) {
      resolved.range_min = msg.range_min;
    }
    else {
      resolved.range_min = 0.0
    }

    if (msg.range_max !== undefined) {
      resolved.range_max = msg.range_max;
    }
    else {
      resolved.range_max = 0.0
    }

    if (msg.speed_min !== undefined) {
      resolved.speed_min = msg.speed_min;
    }
    else {
      resolved.speed_min = 0.0
    }

    if (msg.speed_max !== undefined) {
      resolved.speed_max = msg.speed_max;
    }
    else {
      resolved.speed_max = 0.0
    }

    if (msg.azimuth_min !== undefined) {
      resolved.azimuth_min = msg.azimuth_min;
    }
    else {
      resolved.azimuth_min = 0.0
    }

    if (msg.azimuth_max !== undefined) {
      resolved.azimuth_max = msg.azimuth_max;
    }
    else {
      resolved.azimuth_max = 0.0
    }

    if (msg.elevation_min !== undefined) {
      resolved.elevation_min = msg.elevation_min;
    }
    else {
      resolved.elevation_min = 0.0
    }

    if (msg.elevation_max !== undefined) {
      resolved.elevation_max = msg.elevation_max;
    }
    else {
      resolved.elevation_max = 0.0
    }

    if (msg.range_resolution !== undefined) {
      resolved.range_resolution = msg.range_resolution;
    }
    else {
      resolved.range_resolution = 0.0
    }

    if (msg.range_accuracy !== undefined) {
      resolved.range_accuracy = msg.range_accuracy;
    }
    else {
      resolved.range_accuracy = 0.0
    }

    if (msg.speed_resolution !== undefined) {
      resolved.speed_resolution = msg.speed_resolution;
    }
    else {
      resolved.speed_resolution = 0.0
    }

    if (msg.speed_accuracy !== undefined) {
      resolved.speed_accuracy = msg.speed_accuracy;
    }
    else {
      resolved.speed_accuracy = 0.0
    }

    if (msg.azimuth_resolution !== undefined) {
      resolved.azimuth_resolution = msg.azimuth_resolution;
    }
    else {
      resolved.azimuth_resolution = 0.0
    }

    if (msg.azimuth_accuracy !== undefined) {
      resolved.azimuth_accuracy = msg.azimuth_accuracy;
    }
    else {
      resolved.azimuth_accuracy = 0.0
    }

    if (msg.elevation_resolution !== undefined) {
      resolved.elevation_resolution = msg.elevation_resolution;
    }
    else {
      resolved.elevation_resolution = 0.0
    }

    if (msg.elevation_accuracy !== undefined) {
      resolved.elevation_accuracy = msg.elevation_accuracy;
    }
    else {
      resolved.elevation_accuracy = 0.0
    }

    return resolved;
    }
};

module.exports = RadarInfo;
