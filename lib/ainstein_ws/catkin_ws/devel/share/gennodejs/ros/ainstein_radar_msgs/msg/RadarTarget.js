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

class RadarTarget {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.target_id = null;
      this.snr = null;
      this.range = null;
      this.speed = null;
      this.azimuth = null;
      this.elevation = null;
    }
    else {
      if (initObj.hasOwnProperty('target_id')) {
        this.target_id = initObj.target_id
      }
      else {
        this.target_id = 0;
      }
      if (initObj.hasOwnProperty('snr')) {
        this.snr = initObj.snr
      }
      else {
        this.snr = 0.0;
      }
      if (initObj.hasOwnProperty('range')) {
        this.range = initObj.range
      }
      else {
        this.range = 0.0;
      }
      if (initObj.hasOwnProperty('speed')) {
        this.speed = initObj.speed
      }
      else {
        this.speed = 0.0;
      }
      if (initObj.hasOwnProperty('azimuth')) {
        this.azimuth = initObj.azimuth
      }
      else {
        this.azimuth = 0.0;
      }
      if (initObj.hasOwnProperty('elevation')) {
        this.elevation = initObj.elevation
      }
      else {
        this.elevation = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RadarTarget
    // Serialize message field [target_id]
    bufferOffset = _serializer.uint16(obj.target_id, buffer, bufferOffset);
    // Serialize message field [snr]
    bufferOffset = _serializer.float64(obj.snr, buffer, bufferOffset);
    // Serialize message field [range]
    bufferOffset = _serializer.float64(obj.range, buffer, bufferOffset);
    // Serialize message field [speed]
    bufferOffset = _serializer.float64(obj.speed, buffer, bufferOffset);
    // Serialize message field [azimuth]
    bufferOffset = _serializer.float64(obj.azimuth, buffer, bufferOffset);
    // Serialize message field [elevation]
    bufferOffset = _serializer.float64(obj.elevation, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RadarTarget
    let len;
    let data = new RadarTarget(null);
    // Deserialize message field [target_id]
    data.target_id = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [snr]
    data.snr = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [range]
    data.range = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [speed]
    data.speed = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [azimuth]
    data.azimuth = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [elevation]
    data.elevation = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 42;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ainstein_radar_msgs/RadarTarget';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '942d59f5ed2080c1747d5b79ce6dc1c0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new RadarTarget(null);
    if (msg.target_id !== undefined) {
      resolved.target_id = msg.target_id;
    }
    else {
      resolved.target_id = 0
    }

    if (msg.snr !== undefined) {
      resolved.snr = msg.snr;
    }
    else {
      resolved.snr = 0.0
    }

    if (msg.range !== undefined) {
      resolved.range = msg.range;
    }
    else {
      resolved.range = 0.0
    }

    if (msg.speed !== undefined) {
      resolved.speed = msg.speed;
    }
    else {
      resolved.speed = 0.0
    }

    if (msg.azimuth !== undefined) {
      resolved.azimuth = msg.azimuth;
    }
    else {
      resolved.azimuth = 0.0
    }

    if (msg.elevation !== undefined) {
      resolved.elevation = msg.elevation;
    }
    else {
      resolved.elevation = 0.0
    }

    return resolved;
    }
};

module.exports = RadarTarget;
