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

class WayvAirConfiguration {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.fw_ver = null;
      this.sbl_ver = null;
      this.id_485 = null;
      this.baud_485 = null;
      this.server_ip = null;
      this.server_port = null;
      this.wifi_name = null;
      this.wifi_pwd = null;
      this.con_wifi_name = null;
      this.con_wifi_pwd = null;
      this.dev_id = null;
      this.wifi_mode = null;
      this.sys_mode = null;
      this.radio_switch = null;
      this.radio_time = null;
      this.radar_conf = null;
      this.radar_config_len = null;
    }
    else {
      if (initObj.hasOwnProperty('fw_ver')) {
        this.fw_ver = initObj.fw_ver
      }
      else {
        this.fw_ver = '';
      }
      if (initObj.hasOwnProperty('sbl_ver')) {
        this.sbl_ver = initObj.sbl_ver
      }
      else {
        this.sbl_ver = '';
      }
      if (initObj.hasOwnProperty('id_485')) {
        this.id_485 = initObj.id_485
      }
      else {
        this.id_485 = 0;
      }
      if (initObj.hasOwnProperty('baud_485')) {
        this.baud_485 = initObj.baud_485
      }
      else {
        this.baud_485 = 0;
      }
      if (initObj.hasOwnProperty('server_ip')) {
        this.server_ip = initObj.server_ip
      }
      else {
        this.server_ip = '';
      }
      if (initObj.hasOwnProperty('server_port')) {
        this.server_port = initObj.server_port
      }
      else {
        this.server_port = 0;
      }
      if (initObj.hasOwnProperty('wifi_name')) {
        this.wifi_name = initObj.wifi_name
      }
      else {
        this.wifi_name = '';
      }
      if (initObj.hasOwnProperty('wifi_pwd')) {
        this.wifi_pwd = initObj.wifi_pwd
      }
      else {
        this.wifi_pwd = '';
      }
      if (initObj.hasOwnProperty('con_wifi_name')) {
        this.con_wifi_name = initObj.con_wifi_name
      }
      else {
        this.con_wifi_name = '';
      }
      if (initObj.hasOwnProperty('con_wifi_pwd')) {
        this.con_wifi_pwd = initObj.con_wifi_pwd
      }
      else {
        this.con_wifi_pwd = '';
      }
      if (initObj.hasOwnProperty('dev_id')) {
        this.dev_id = initObj.dev_id
      }
      else {
        this.dev_id = '';
      }
      if (initObj.hasOwnProperty('wifi_mode')) {
        this.wifi_mode = initObj.wifi_mode
      }
      else {
        this.wifi_mode = 0;
      }
      if (initObj.hasOwnProperty('sys_mode')) {
        this.sys_mode = initObj.sys_mode
      }
      else {
        this.sys_mode = 0;
      }
      if (initObj.hasOwnProperty('radio_switch')) {
        this.radio_switch = initObj.radio_switch
      }
      else {
        this.radio_switch = 0;
      }
      if (initObj.hasOwnProperty('radio_time')) {
        this.radio_time = initObj.radio_time
      }
      else {
        this.radio_time = 0;
      }
      if (initObj.hasOwnProperty('radar_conf')) {
        this.radar_conf = initObj.radar_conf
      }
      else {
        this.radar_conf = [];
      }
      if (initObj.hasOwnProperty('radar_config_len')) {
        this.radar_config_len = initObj.radar_config_len
      }
      else {
        this.radar_config_len = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WayvAirConfiguration
    // Serialize message field [fw_ver]
    bufferOffset = _serializer.string(obj.fw_ver, buffer, bufferOffset);
    // Serialize message field [sbl_ver]
    bufferOffset = _serializer.string(obj.sbl_ver, buffer, bufferOffset);
    // Serialize message field [id_485]
    bufferOffset = _serializer.uint16(obj.id_485, buffer, bufferOffset);
    // Serialize message field [baud_485]
    bufferOffset = _serializer.uint32(obj.baud_485, buffer, bufferOffset);
    // Serialize message field [server_ip]
    bufferOffset = _serializer.string(obj.server_ip, buffer, bufferOffset);
    // Serialize message field [server_port]
    bufferOffset = _serializer.uint16(obj.server_port, buffer, bufferOffset);
    // Serialize message field [wifi_name]
    bufferOffset = _serializer.string(obj.wifi_name, buffer, bufferOffset);
    // Serialize message field [wifi_pwd]
    bufferOffset = _serializer.string(obj.wifi_pwd, buffer, bufferOffset);
    // Serialize message field [con_wifi_name]
    bufferOffset = _serializer.string(obj.con_wifi_name, buffer, bufferOffset);
    // Serialize message field [con_wifi_pwd]
    bufferOffset = _serializer.string(obj.con_wifi_pwd, buffer, bufferOffset);
    // Serialize message field [dev_id]
    bufferOffset = _serializer.string(obj.dev_id, buffer, bufferOffset);
    // Serialize message field [wifi_mode]
    bufferOffset = _serializer.uint16(obj.wifi_mode, buffer, bufferOffset);
    // Serialize message field [sys_mode]
    bufferOffset = _serializer.uint16(obj.sys_mode, buffer, bufferOffset);
    // Serialize message field [radio_switch]
    bufferOffset = _serializer.uint16(obj.radio_switch, buffer, bufferOffset);
    // Serialize message field [radio_time]
    bufferOffset = _serializer.uint16(obj.radio_time, buffer, bufferOffset);
    // Serialize message field [radar_conf]
    bufferOffset = _arraySerializer.string(obj.radar_conf, buffer, bufferOffset, null);
    // Serialize message field [radar_config_len]
    bufferOffset = _serializer.uint16(obj.radar_config_len, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WayvAirConfiguration
    let len;
    let data = new WayvAirConfiguration(null);
    // Deserialize message field [fw_ver]
    data.fw_ver = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [sbl_ver]
    data.sbl_ver = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [id_485]
    data.id_485 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [baud_485]
    data.baud_485 = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [server_ip]
    data.server_ip = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [server_port]
    data.server_port = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [wifi_name]
    data.wifi_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [wifi_pwd]
    data.wifi_pwd = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [con_wifi_name]
    data.con_wifi_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [con_wifi_pwd]
    data.con_wifi_pwd = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [dev_id]
    data.dev_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [wifi_mode]
    data.wifi_mode = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [sys_mode]
    data.sys_mode = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [radio_switch]
    data.radio_switch = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [radio_time]
    data.radio_time = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [radar_conf]
    data.radar_conf = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [radar_config_len]
    data.radar_config_len = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.fw_ver);
    length += _getByteLength(object.sbl_ver);
    length += _getByteLength(object.server_ip);
    length += _getByteLength(object.wifi_name);
    length += _getByteLength(object.wifi_pwd);
    length += _getByteLength(object.con_wifi_name);
    length += _getByteLength(object.con_wifi_pwd);
    length += _getByteLength(object.dev_id);
    object.radar_conf.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 54;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ainstein_radar_drivers/WayvAirConfiguration';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '697324bcda4e9dd0d2b06e834f223a42';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message describes the Wayv Air radar configuration parameters.
    string fw_ver           # Firmware Version
    string sbl_ver          # Bootloader Version
    uint16 id_485           # 485 ID / Radar Comm ID
    uint32 baud_485         # Serial Baud Rate
    string server_ip        # Server IP address for Station Mode
    uint16 server_port      # Server Port for Station Mode
    string wifi_name        # WAYV (AP) broadcast Wifi Name
    string wifi_pwd         # WAYV (AP) Broadcast Wifi Password
    string con_wifi_name    # Station Mode Wifi Name
    string con_wifi_pwd     # Station Mode Wifi Password
    string dev_id           # Device Serial ID
    uint16 wifi_mode        # AP mode (0) or Station mode(1)
    uint16 sys_mode         # WAYV Operating Mode - Normal(0) - TLV(2) - TLV_Wifi(4)
    uint16 radio_switch     # Radio Inactive (0) - Radio Inactive (1)
    uint16 radio_time       #
    string[] radar_conf       # Radar Configuration String
    uint16 radar_config_len # Number of Radar Config Entries
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new WayvAirConfiguration(null);
    if (msg.fw_ver !== undefined) {
      resolved.fw_ver = msg.fw_ver;
    }
    else {
      resolved.fw_ver = ''
    }

    if (msg.sbl_ver !== undefined) {
      resolved.sbl_ver = msg.sbl_ver;
    }
    else {
      resolved.sbl_ver = ''
    }

    if (msg.id_485 !== undefined) {
      resolved.id_485 = msg.id_485;
    }
    else {
      resolved.id_485 = 0
    }

    if (msg.baud_485 !== undefined) {
      resolved.baud_485 = msg.baud_485;
    }
    else {
      resolved.baud_485 = 0
    }

    if (msg.server_ip !== undefined) {
      resolved.server_ip = msg.server_ip;
    }
    else {
      resolved.server_ip = ''
    }

    if (msg.server_port !== undefined) {
      resolved.server_port = msg.server_port;
    }
    else {
      resolved.server_port = 0
    }

    if (msg.wifi_name !== undefined) {
      resolved.wifi_name = msg.wifi_name;
    }
    else {
      resolved.wifi_name = ''
    }

    if (msg.wifi_pwd !== undefined) {
      resolved.wifi_pwd = msg.wifi_pwd;
    }
    else {
      resolved.wifi_pwd = ''
    }

    if (msg.con_wifi_name !== undefined) {
      resolved.con_wifi_name = msg.con_wifi_name;
    }
    else {
      resolved.con_wifi_name = ''
    }

    if (msg.con_wifi_pwd !== undefined) {
      resolved.con_wifi_pwd = msg.con_wifi_pwd;
    }
    else {
      resolved.con_wifi_pwd = ''
    }

    if (msg.dev_id !== undefined) {
      resolved.dev_id = msg.dev_id;
    }
    else {
      resolved.dev_id = ''
    }

    if (msg.wifi_mode !== undefined) {
      resolved.wifi_mode = msg.wifi_mode;
    }
    else {
      resolved.wifi_mode = 0
    }

    if (msg.sys_mode !== undefined) {
      resolved.sys_mode = msg.sys_mode;
    }
    else {
      resolved.sys_mode = 0
    }

    if (msg.radio_switch !== undefined) {
      resolved.radio_switch = msg.radio_switch;
    }
    else {
      resolved.radio_switch = 0
    }

    if (msg.radio_time !== undefined) {
      resolved.radio_time = msg.radio_time;
    }
    else {
      resolved.radio_time = 0
    }

    if (msg.radar_conf !== undefined) {
      resolved.radar_conf = msg.radar_conf;
    }
    else {
      resolved.radar_conf = []
    }

    if (msg.radar_config_len !== undefined) {
      resolved.radar_config_len = msg.radar_config_len;
    }
    else {
      resolved.radar_config_len = 0
    }

    return resolved;
    }
};

module.exports = WayvAirConfiguration;
