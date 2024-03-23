// Auto-generated. Do not edit!

// (in-package ainstein_radar_drivers.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class WayvAirStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.board_temp = null;
      this.tx_temps = null;
      this.pm_temp = null;
      this.voltage = null;
      this.power = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('board_temp')) {
        this.board_temp = initObj.board_temp
      }
      else {
        this.board_temp = 0.0;
      }
      if (initObj.hasOwnProperty('tx_temps')) {
        this.tx_temps = initObj.tx_temps
      }
      else {
        this.tx_temps = [];
      }
      if (initObj.hasOwnProperty('pm_temp')) {
        this.pm_temp = initObj.pm_temp
      }
      else {
        this.pm_temp = 0.0;
      }
      if (initObj.hasOwnProperty('voltage')) {
        this.voltage = initObj.voltage
      }
      else {
        this.voltage = 0.0;
      }
      if (initObj.hasOwnProperty('power')) {
        this.power = initObj.power
      }
      else {
        this.power = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WayvAirStatus
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [board_temp]
    bufferOffset = _serializer.float32(obj.board_temp, buffer, bufferOffset);
    // Serialize message field [tx_temps]
    bufferOffset = _arraySerializer.float32(obj.tx_temps, buffer, bufferOffset, null);
    // Serialize message field [pm_temp]
    bufferOffset = _serializer.float32(obj.pm_temp, buffer, bufferOffset);
    // Serialize message field [voltage]
    bufferOffset = _serializer.float32(obj.voltage, buffer, bufferOffset);
    // Serialize message field [power]
    bufferOffset = _serializer.float32(obj.power, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WayvAirStatus
    let len;
    let data = new WayvAirStatus(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [board_temp]
    data.board_temp = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [tx_temps]
    data.tx_temps = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [pm_temp]
    data.pm_temp = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [voltage]
    data.voltage = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [power]
    data.power = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 4 * object.tx_temps.length;
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ainstein_radar_drivers/WayvAirStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fb442fd5018b46ec3791154842d3c373';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message describes the Wayv Air radar device status.
    
    std_msgs/Header header
    float32 board_temp     # Board temperature, *C
    float32[] tx_temps     # Tx temperatures, *C
    float32 pm_temp        # PM temperature, *C
    float32 voltage        # Voltage, V
    float32 power          # Power, mW
    
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
    const resolved = new WayvAirStatus(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.board_temp !== undefined) {
      resolved.board_temp = msg.board_temp;
    }
    else {
      resolved.board_temp = 0.0
    }

    if (msg.tx_temps !== undefined) {
      resolved.tx_temps = msg.tx_temps;
    }
    else {
      resolved.tx_temps = []
    }

    if (msg.pm_temp !== undefined) {
      resolved.pm_temp = msg.pm_temp;
    }
    else {
      resolved.pm_temp = 0.0
    }

    if (msg.voltage !== undefined) {
      resolved.voltage = msg.voltage;
    }
    else {
      resolved.voltage = 0.0
    }

    if (msg.power !== undefined) {
      resolved.power = msg.power;
    }
    else {
      resolved.power = 0.0
    }

    return resolved;
    }
};

module.exports = WayvAirStatus;
