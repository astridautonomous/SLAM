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

class O79NetworkParams {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ip = null;
      this.netmask = null;
      this.gateway = null;
      this.host_ip = null;
      this.host_port = null;
    }
    else {
      if (initObj.hasOwnProperty('ip')) {
        this.ip = initObj.ip
      }
      else {
        this.ip = '';
      }
      if (initObj.hasOwnProperty('netmask')) {
        this.netmask = initObj.netmask
      }
      else {
        this.netmask = '';
      }
      if (initObj.hasOwnProperty('gateway')) {
        this.gateway = initObj.gateway
      }
      else {
        this.gateway = '';
      }
      if (initObj.hasOwnProperty('host_ip')) {
        this.host_ip = initObj.host_ip
      }
      else {
        this.host_ip = '';
      }
      if (initObj.hasOwnProperty('host_port')) {
        this.host_port = initObj.host_port
      }
      else {
        this.host_port = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type O79NetworkParams
    // Serialize message field [ip]
    bufferOffset = _serializer.string(obj.ip, buffer, bufferOffset);
    // Serialize message field [netmask]
    bufferOffset = _serializer.string(obj.netmask, buffer, bufferOffset);
    // Serialize message field [gateway]
    bufferOffset = _serializer.string(obj.gateway, buffer, bufferOffset);
    // Serialize message field [host_ip]
    bufferOffset = _serializer.string(obj.host_ip, buffer, bufferOffset);
    // Serialize message field [host_port]
    bufferOffset = _serializer.uint16(obj.host_port, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type O79NetworkParams
    let len;
    let data = new O79NetworkParams(null);
    // Deserialize message field [ip]
    data.ip = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [netmask]
    data.netmask = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [gateway]
    data.gateway = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [host_ip]
    data.host_ip = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [host_port]
    data.host_port = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.ip);
    length += _getByteLength(object.netmask);
    length += _getByteLength(object.gateway);
    length += _getByteLength(object.host_ip);
    return length + 18;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ainstein_radar_drivers/O79NetworkParams';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a69287f037293465b761a7fa4a733b65';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message describes the O-79 imaging radar network parameters.
    
    string ip           # Radar IP address
    string netmask      # Radar network mask
    string gateway      # Radar network gateway
    string host_ip      # Host PC IP address
    uint16 host_port    # Host PC port
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new O79NetworkParams(null);
    if (msg.ip !== undefined) {
      resolved.ip = msg.ip;
    }
    else {
      resolved.ip = ''
    }

    if (msg.netmask !== undefined) {
      resolved.netmask = msg.netmask;
    }
    else {
      resolved.netmask = ''
    }

    if (msg.gateway !== undefined) {
      resolved.gateway = msg.gateway;
    }
    else {
      resolved.gateway = ''
    }

    if (msg.host_ip !== undefined) {
      resolved.host_ip = msg.host_ip;
    }
    else {
      resolved.host_ip = ''
    }

    if (msg.host_port !== undefined) {
      resolved.host_port = msg.host_port;
    }
    else {
      resolved.host_port = 0
    }

    return resolved;
    }
};

module.exports = O79NetworkParams;
