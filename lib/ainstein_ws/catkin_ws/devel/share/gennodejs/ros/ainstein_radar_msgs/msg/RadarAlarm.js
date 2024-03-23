// Auto-generated. Do not edit!

// (in-package ainstein_radar_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class RadarAlarm {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.LCA_alarm = null;
      this.CVW_alarm = null;
      this.BSD_alarm = null;
    }
    else {
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
    // Serializes a message object of type RadarAlarm
    // Serialize message field [LCA_alarm]
    bufferOffset = _serializer.bool(obj.LCA_alarm, buffer, bufferOffset);
    // Serialize message field [CVW_alarm]
    bufferOffset = _serializer.bool(obj.CVW_alarm, buffer, bufferOffset);
    // Serialize message field [BSD_alarm]
    bufferOffset = _serializer.bool(obj.BSD_alarm, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RadarAlarm
    let len;
    let data = new RadarAlarm(null);
    // Deserialize message field [LCA_alarm]
    data.LCA_alarm = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [CVW_alarm]
    data.CVW_alarm = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [BSD_alarm]
    data.BSD_alarm = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 3;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ainstein_radar_msgs/RadarAlarm';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bf40054820bd713d25eca0cd48632dd2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message describes alarms (eg BSD) from a RADAR sensor.
    
    bool LCA_alarm    # Lane Change Assist alarm
    bool CVW_alarm    # Collision (Vehicle?) Warning alarm
    bool BSD_alarm    # Blind Spot Detection alarm
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RadarAlarm(null);
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

module.exports = RadarAlarm;
