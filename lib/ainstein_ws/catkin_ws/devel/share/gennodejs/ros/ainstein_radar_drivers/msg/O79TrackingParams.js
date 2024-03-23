// Auto-generated. Do not edit!

// (in-package ainstein_radar_drivers.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class O79TrackingParams {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.update_rate = null;
      this.min_time = null;
      this.timeout = null;
      this.confidence_level = null;
      this.proc_noise_speed = null;
      this.proc_noise_azim = null;
      this.proc_noise_elev = null;
      this.min_range = null;
      this.max_range = null;
      this.proc_noise_vel_x = null;
      this.proc_noise_vel_y = null;
      this.proc_noise_vel_z = null;
      this.meas_noise_speed = null;
      this.meas_noise_pos = null;
      this.filter_type = null;
    }
    else {
      if (initObj.hasOwnProperty('update_rate')) {
        this.update_rate = initObj.update_rate
      }
      else {
        this.update_rate = 0.0;
      }
      if (initObj.hasOwnProperty('min_time')) {
        this.min_time = initObj.min_time
      }
      else {
        this.min_time = 0.0;
      }
      if (initObj.hasOwnProperty('timeout')) {
        this.timeout = initObj.timeout
      }
      else {
        this.timeout = 0.0;
      }
      if (initObj.hasOwnProperty('confidence_level')) {
        this.confidence_level = initObj.confidence_level
      }
      else {
        this.confidence_level = 0.0;
      }
      if (initObj.hasOwnProperty('proc_noise_speed')) {
        this.proc_noise_speed = initObj.proc_noise_speed
      }
      else {
        this.proc_noise_speed = 0.0;
      }
      if (initObj.hasOwnProperty('proc_noise_azim')) {
        this.proc_noise_azim = initObj.proc_noise_azim
      }
      else {
        this.proc_noise_azim = 0.0;
      }
      if (initObj.hasOwnProperty('proc_noise_elev')) {
        this.proc_noise_elev = initObj.proc_noise_elev
      }
      else {
        this.proc_noise_elev = 0.0;
      }
      if (initObj.hasOwnProperty('min_range')) {
        this.min_range = initObj.min_range
      }
      else {
        this.min_range = 0.0;
      }
      if (initObj.hasOwnProperty('max_range')) {
        this.max_range = initObj.max_range
      }
      else {
        this.max_range = 0.0;
      }
      if (initObj.hasOwnProperty('proc_noise_vel_x')) {
        this.proc_noise_vel_x = initObj.proc_noise_vel_x
      }
      else {
        this.proc_noise_vel_x = 0.0;
      }
      if (initObj.hasOwnProperty('proc_noise_vel_y')) {
        this.proc_noise_vel_y = initObj.proc_noise_vel_y
      }
      else {
        this.proc_noise_vel_y = 0.0;
      }
      if (initObj.hasOwnProperty('proc_noise_vel_z')) {
        this.proc_noise_vel_z = initObj.proc_noise_vel_z
      }
      else {
        this.proc_noise_vel_z = 0.0;
      }
      if (initObj.hasOwnProperty('meas_noise_speed')) {
        this.meas_noise_speed = initObj.meas_noise_speed
      }
      else {
        this.meas_noise_speed = 0.0;
      }
      if (initObj.hasOwnProperty('meas_noise_pos')) {
        this.meas_noise_pos = initObj.meas_noise_pos
      }
      else {
        this.meas_noise_pos = 0.0;
      }
      if (initObj.hasOwnProperty('filter_type')) {
        this.filter_type = initObj.filter_type
      }
      else {
        this.filter_type = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type O79TrackingParams
    // Serialize message field [update_rate]
    bufferOffset = _serializer.float32(obj.update_rate, buffer, bufferOffset);
    // Serialize message field [min_time]
    bufferOffset = _serializer.float32(obj.min_time, buffer, bufferOffset);
    // Serialize message field [timeout]
    bufferOffset = _serializer.float32(obj.timeout, buffer, bufferOffset);
    // Serialize message field [confidence_level]
    bufferOffset = _serializer.float32(obj.confidence_level, buffer, bufferOffset);
    // Serialize message field [proc_noise_speed]
    bufferOffset = _serializer.float32(obj.proc_noise_speed, buffer, bufferOffset);
    // Serialize message field [proc_noise_azim]
    bufferOffset = _serializer.float32(obj.proc_noise_azim, buffer, bufferOffset);
    // Serialize message field [proc_noise_elev]
    bufferOffset = _serializer.float32(obj.proc_noise_elev, buffer, bufferOffset);
    // Serialize message field [min_range]
    bufferOffset = _serializer.float32(obj.min_range, buffer, bufferOffset);
    // Serialize message field [max_range]
    bufferOffset = _serializer.float32(obj.max_range, buffer, bufferOffset);
    // Serialize message field [proc_noise_vel_x]
    bufferOffset = _serializer.float32(obj.proc_noise_vel_x, buffer, bufferOffset);
    // Serialize message field [proc_noise_vel_y]
    bufferOffset = _serializer.float32(obj.proc_noise_vel_y, buffer, bufferOffset);
    // Serialize message field [proc_noise_vel_z]
    bufferOffset = _serializer.float32(obj.proc_noise_vel_z, buffer, bufferOffset);
    // Serialize message field [meas_noise_speed]
    bufferOffset = _serializer.float32(obj.meas_noise_speed, buffer, bufferOffset);
    // Serialize message field [meas_noise_pos]
    bufferOffset = _serializer.float32(obj.meas_noise_pos, buffer, bufferOffset);
    // Serialize message field [filter_type]
    bufferOffset = _serializer.int8(obj.filter_type, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type O79TrackingParams
    let len;
    let data = new O79TrackingParams(null);
    // Deserialize message field [update_rate]
    data.update_rate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [min_time]
    data.min_time = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [timeout]
    data.timeout = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [confidence_level]
    data.confidence_level = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [proc_noise_speed]
    data.proc_noise_speed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [proc_noise_azim]
    data.proc_noise_azim = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [proc_noise_elev]
    data.proc_noise_elev = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [min_range]
    data.min_range = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [max_range]
    data.max_range = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [proc_noise_vel_x]
    data.proc_noise_vel_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [proc_noise_vel_y]
    data.proc_noise_vel_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [proc_noise_vel_z]
    data.proc_noise_vel_z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [meas_noise_speed]
    data.meas_noise_speed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [meas_noise_pos]
    data.meas_noise_pos = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [filter_type]
    data.filter_type = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 57;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ainstein_radar_drivers/O79TrackingParams';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8794997c1f9ccf549a183253ff0fcb2e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message describes the O-79 imaging radar tracking filter parameters.
    
    float32 update_rate
    float32 min_time
    float32 timeout
    float32 confidence_level
    float32 proc_noise_speed
    float32 proc_noise_azim
    float32 proc_noise_elev
    float32 min_range
    float32 max_range
    float32 proc_noise_vel_x
    float32 proc_noise_vel_y
    float32 proc_noise_vel_z
    float32 meas_noise_speed
    float32 meas_noise_pos
    int8 filter_type
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new O79TrackingParams(null);
    if (msg.update_rate !== undefined) {
      resolved.update_rate = msg.update_rate;
    }
    else {
      resolved.update_rate = 0.0
    }

    if (msg.min_time !== undefined) {
      resolved.min_time = msg.min_time;
    }
    else {
      resolved.min_time = 0.0
    }

    if (msg.timeout !== undefined) {
      resolved.timeout = msg.timeout;
    }
    else {
      resolved.timeout = 0.0
    }

    if (msg.confidence_level !== undefined) {
      resolved.confidence_level = msg.confidence_level;
    }
    else {
      resolved.confidence_level = 0.0
    }

    if (msg.proc_noise_speed !== undefined) {
      resolved.proc_noise_speed = msg.proc_noise_speed;
    }
    else {
      resolved.proc_noise_speed = 0.0
    }

    if (msg.proc_noise_azim !== undefined) {
      resolved.proc_noise_azim = msg.proc_noise_azim;
    }
    else {
      resolved.proc_noise_azim = 0.0
    }

    if (msg.proc_noise_elev !== undefined) {
      resolved.proc_noise_elev = msg.proc_noise_elev;
    }
    else {
      resolved.proc_noise_elev = 0.0
    }

    if (msg.min_range !== undefined) {
      resolved.min_range = msg.min_range;
    }
    else {
      resolved.min_range = 0.0
    }

    if (msg.max_range !== undefined) {
      resolved.max_range = msg.max_range;
    }
    else {
      resolved.max_range = 0.0
    }

    if (msg.proc_noise_vel_x !== undefined) {
      resolved.proc_noise_vel_x = msg.proc_noise_vel_x;
    }
    else {
      resolved.proc_noise_vel_x = 0.0
    }

    if (msg.proc_noise_vel_y !== undefined) {
      resolved.proc_noise_vel_y = msg.proc_noise_vel_y;
    }
    else {
      resolved.proc_noise_vel_y = 0.0
    }

    if (msg.proc_noise_vel_z !== undefined) {
      resolved.proc_noise_vel_z = msg.proc_noise_vel_z;
    }
    else {
      resolved.proc_noise_vel_z = 0.0
    }

    if (msg.meas_noise_speed !== undefined) {
      resolved.meas_noise_speed = msg.meas_noise_speed;
    }
    else {
      resolved.meas_noise_speed = 0.0
    }

    if (msg.meas_noise_pos !== undefined) {
      resolved.meas_noise_pos = msg.meas_noise_pos;
    }
    else {
      resolved.meas_noise_pos = 0.0
    }

    if (msg.filter_type !== undefined) {
      resolved.filter_type = msg.filter_type;
    }
    else {
      resolved.filter_type = 0
    }

    return resolved;
    }
};

module.exports = O79TrackingParams;
