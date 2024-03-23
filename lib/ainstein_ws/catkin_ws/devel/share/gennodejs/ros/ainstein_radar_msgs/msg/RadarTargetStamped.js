// Auto-generated. Do not edit!

// (in-package ainstein_radar_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let RadarTarget = require('./RadarTarget.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class RadarTargetStamped {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.target = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('target')) {
        this.target = initObj.target
      }
      else {
        this.target = new RadarTarget();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RadarTargetStamped
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [target]
    bufferOffset = RadarTarget.serialize(obj.target, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RadarTargetStamped
    let len;
    let data = new RadarTargetStamped(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [target]
    data.target = RadarTarget.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 42;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ainstein_radar_msgs/RadarTargetStamped';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b1fbe9d124fcb7889ff4a0fa4df5665a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message describes a target (detection) from a RADAR sensor with a timestamp.
    
    std_msgs/Header header
    
    RadarTarget target
    
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
    
    ================================================================================
    MSG: ainstein_radar_msgs/RadarTarget
    # This message describes a target (detection) from a RADAR sensor.
    
    uint16 target_id    # ID of the target, as set by the sensor
    float64 snr         # Signal-to-noise ratio
    float64 range       # Distance from sensor to target along sensor x-axis
    float64 speed       # Speed (range rate of change) of target along sensor x-axis
    float64 azimuth     # Angle of target relative to sensor within x-y plane
    float64 elevation   # Angle of target relative to sensor within y-z plane
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RadarTargetStamped(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.target !== undefined) {
      resolved.target = RadarTarget.Resolve(msg.target)
    }
    else {
      resolved.target = new RadarTarget()
    }

    return resolved;
    }
};

module.exports = RadarTargetStamped;
