// Auto-generated. Do not edit!

// (in-package open3d_slam_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class SaveMapRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SaveMapRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SaveMapRequest
    let len;
    let data = new SaveMapRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'open3d_slam_msgs/SaveMapRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SaveMapRequest(null);
    return resolved;
    }
};

class SaveMapResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.statusMessage = null;
    }
    else {
      if (initObj.hasOwnProperty('statusMessage')) {
        this.statusMessage = initObj.statusMessage
      }
      else {
        this.statusMessage = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SaveMapResponse
    // Serialize message field [statusMessage]
    bufferOffset = _serializer.string(obj.statusMessage, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SaveMapResponse
    let len;
    let data = new SaveMapResponse(null);
    // Deserialize message field [statusMessage]
    data.statusMessage = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.statusMessage);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'open3d_slam_msgs/SaveMapResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9e836a97d829a00e348178b9b373d448';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string statusMessage
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SaveMapResponse(null);
    if (msg.statusMessage !== undefined) {
      resolved.statusMessage = msg.statusMessage;
    }
    else {
      resolved.statusMessage = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: SaveMapRequest,
  Response: SaveMapResponse,
  md5sum() { return '9e836a97d829a00e348178b9b373d448'; },
  datatype() { return 'open3d_slam_msgs/SaveMap'; }
};
