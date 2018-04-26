// Auto-generated. Do not edit!

// (in-package path_finder.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ard {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ult_right = null;
      this.ult_left = null;
      this.ir_right = null;
      this.ir_left = null;
      this.compass_x = null;
      this.compass_y = null;
      this.compass_z = null;
      this.servo_angle = null;
    }
    else {
      if (initObj.hasOwnProperty('ult_right')) {
        this.ult_right = initObj.ult_right
      }
      else {
        this.ult_right = 0.0;
      }
      if (initObj.hasOwnProperty('ult_left')) {
        this.ult_left = initObj.ult_left
      }
      else {
        this.ult_left = 0.0;
      }
      if (initObj.hasOwnProperty('ir_right')) {
        this.ir_right = initObj.ir_right
      }
      else {
        this.ir_right = 0.0;
      }
      if (initObj.hasOwnProperty('ir_left')) {
        this.ir_left = initObj.ir_left
      }
      else {
        this.ir_left = 0.0;
      }
      if (initObj.hasOwnProperty('compass_x')) {
        this.compass_x = initObj.compass_x
      }
      else {
        this.compass_x = 0.0;
      }
      if (initObj.hasOwnProperty('compass_y')) {
        this.compass_y = initObj.compass_y
      }
      else {
        this.compass_y = 0.0;
      }
      if (initObj.hasOwnProperty('compass_z')) {
        this.compass_z = initObj.compass_z
      }
      else {
        this.compass_z = 0.0;
      }
      if (initObj.hasOwnProperty('servo_angle')) {
        this.servo_angle = initObj.servo_angle
      }
      else {
        this.servo_angle = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ard
    // Serialize message field [ult_right]
    bufferOffset = _serializer.float64(obj.ult_right, buffer, bufferOffset);
    // Serialize message field [ult_left]
    bufferOffset = _serializer.float64(obj.ult_left, buffer, bufferOffset);
    // Serialize message field [ir_right]
    bufferOffset = _serializer.float64(obj.ir_right, buffer, bufferOffset);
    // Serialize message field [ir_left]
    bufferOffset = _serializer.float64(obj.ir_left, buffer, bufferOffset);
    // Serialize message field [compass_x]
    bufferOffset = _serializer.float64(obj.compass_x, buffer, bufferOffset);
    // Serialize message field [compass_y]
    bufferOffset = _serializer.float64(obj.compass_y, buffer, bufferOffset);
    // Serialize message field [compass_z]
    bufferOffset = _serializer.float64(obj.compass_z, buffer, bufferOffset);
    // Serialize message field [servo_angle]
    bufferOffset = _serializer.uint64(obj.servo_angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ard
    let len;
    let data = new ard(null);
    // Deserialize message field [ult_right]
    data.ult_right = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ult_left]
    data.ult_left = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ir_right]
    data.ir_right = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ir_left]
    data.ir_left = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [compass_x]
    data.compass_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [compass_y]
    data.compass_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [compass_z]
    data.compass_z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [servo_angle]
    data.servo_angle = _deserializer.uint64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'path_finder/ard';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5ab222d10bef5cb8f3d8c151fb86bd8b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 ult_right
    float64 ult_left
    float64 ir_right
    float64 ir_left
    float64 compass_x
    float64 compass_y
    float64 compass_z
    uint64 servo_angle
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ard(null);
    if (msg.ult_right !== undefined) {
      resolved.ult_right = msg.ult_right;
    }
    else {
      resolved.ult_right = 0.0
    }

    if (msg.ult_left !== undefined) {
      resolved.ult_left = msg.ult_left;
    }
    else {
      resolved.ult_left = 0.0
    }

    if (msg.ir_right !== undefined) {
      resolved.ir_right = msg.ir_right;
    }
    else {
      resolved.ir_right = 0.0
    }

    if (msg.ir_left !== undefined) {
      resolved.ir_left = msg.ir_left;
    }
    else {
      resolved.ir_left = 0.0
    }

    if (msg.compass_x !== undefined) {
      resolved.compass_x = msg.compass_x;
    }
    else {
      resolved.compass_x = 0.0
    }

    if (msg.compass_y !== undefined) {
      resolved.compass_y = msg.compass_y;
    }
    else {
      resolved.compass_y = 0.0
    }

    if (msg.compass_z !== undefined) {
      resolved.compass_z = msg.compass_z;
    }
    else {
      resolved.compass_z = 0.0
    }

    if (msg.servo_angle !== undefined) {
      resolved.servo_angle = msg.servo_angle;
    }
    else {
      resolved.servo_angle = 0
    }

    return resolved;
    }
};

module.exports = ard;
