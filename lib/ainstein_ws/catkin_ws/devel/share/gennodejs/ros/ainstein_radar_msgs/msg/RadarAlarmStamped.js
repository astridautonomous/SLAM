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

class RadarAlarmStamped {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.LCA_alarm = null;
      this.CVW_alarm = null;
      this.BSD_alarm = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('LCA_alarm')) {
        this.LCA_alarm = initObj.LCA_alarm
      }
      else {
        this.LCA_alarm = false;
      }
      if (initObj.hasOwnProperty('CVW_alarm')) {
        this.CVW_alarm = initObj.CVW_alarm
      }
      else {
        this.CVW_alarm = false;
      }
      if (initObj.hasOwnProperty('BSD_alarm')) {
        this.BSD_alarm = initObj.BSD_alarm
      }
      else {
        this.BSD_alarm = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RadarAlarmStamped
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [LCA_alarm]
    bufferOffset = _serializer.bool(obj.LCA_alarm, buffer, bufferOffset);
    // Serialize message field [CVW_alarm]
    bufferOffset = _serializer.bool(obj.CVW_alarm, buffer, bufferOffset);
    // Serialize message field [BSD_alarm]
    bufferOffset = _serializer.bool(obj.BSD_alarm, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RadarAlarmStamped
    let len;
    let data = new RadarAlarmStamped(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [LCA_alarm]
    data.LCA_alarm = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [CVW_alarm]
    data.CVW_alarm = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [BSD_alarm]
    data.BSD_alarm = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 3;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ainstein_radar_msgs/RadarAlarmStamped';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c8302a7df5f42db7b8e1cc9a4e4b392a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message describes alarms (eg BSD) from a RADAR sensor.
    
    std_msgs/Header header
    
    bool LCA_alarm    # Lane Change Assist alarm
    bool CVW_alarm    # Collision (Vehicle?) Warning alarm
    bool BSD_alarm    # Blind Spot Detection alarm
    
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
    const resolved = new RadarAlarmStamped(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.LCA_alarm !== undefined) {
      resolved.LCA_alarm = msg.LCA_alarm;
    }
    else {
      resolved.LCA_alarm = false
    }

    if (msg.CVW_alarm !== undefined) {
      resolved.CVW_alarm = msg.CVW_alarm;
    }
    else {
      resolved.CVW_alarm = false
    }

    if (msg.BSD_alarm !== undefined) {
      resolved.BSD_alarm = msg.BSD_alarm;
    }
    else {
      resolved.BSD_alarm = false
    }

    return resolved;
    }
};

module.exports = RadarAlarmStamped;
