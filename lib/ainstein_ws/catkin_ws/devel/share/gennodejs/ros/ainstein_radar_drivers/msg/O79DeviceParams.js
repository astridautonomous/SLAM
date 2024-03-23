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

class O79DeviceParams {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.fw_version = null;
      this.can_id = null;
      this.serial_no = null;
      this.mac_address = null;
    }
    else {
      if (initObj.hasOwnProperty('fw_version')) {
        this.fw_version = initObj.fw_version
      }
      else {
        this.fw_version = '';
      }
      if (initObj.hasOwnProperty('can_id')) {
        this.can_id = initObj.can_id
      }
      else {
        this.can_id = '';
      }
      if (initObj.hasOwnProperty('serial_no')) {
        this.serial_no = initObj.serial_no
      }
      else {
        this.serial_no = '';
      }
      if (initObj.hasOwnProperty('mac_address')) {
        this.mac_address = initObj.mac_address
      }
      else {
        this.mac_address = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type O79DeviceParams
    // Serialize message field [fw_version]
    bufferOffset = _serializer.string(obj.fw_version, buffer, bufferOffset);
    // Serialize message field [can_id]
    bufferOffset = _serializer.string(obj.can_id, buffer, bufferOffset);
    // Serialize message field [serial_no]
    bufferOffset = _serializer.string(obj.serial_no, buffer, bufferOffset);
    // Serialize message field [mac_address]
    bufferOffset = _serializer.string(obj.mac_address, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type O79DeviceParams
    let len;
    let data = new O79DeviceParams(null);
    // Deserialize message field [fw_version]
    data.fw_version = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [can_id]
    data.can_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [serial_no]
    data.serial_no = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [mac_address]
    data.mac_address = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.fw_version);
    length += _getByteLength(object.can_id);
    length += _getByteLength(object.serial_no);
    length += _getByteLength(object.mac_address);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ainstein_radar_drivers/O79DeviceParams';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9486679d9acc068b9eb160f4d0978a74';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message describes the O-79 imaging radar device parameters.
    
    string fw_version     # Firmware version
    string can_id         # Radar CAN ID
    string serial_no      # Radar serial number
    string mac_address    # Radar MAC address
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new O79DeviceParams(null);
    if (msg.fw_version !== undefined) {
      resolved.fw_version = msg.fw_version;
    }
    else {
      resolved.fw_version = ''
    }

    if (msg.can_id !== undefined) {
      resolved.can_id = msg.can_id;
    }
    else {
      resolved.can_id = ''
    }

    if (msg.serial_no !== undefined) {
      resolved.serial_no = msg.serial_no;
    }
    else {
      resolved.serial_no = ''
    }

    if (msg.mac_address !== undefined) {
      resolved.mac_address = msg.mac_address;
    }
    else {
      resolved.mac_address = ''
    }

    return resolved;
    }
};

module.exports = O79DeviceParams;
