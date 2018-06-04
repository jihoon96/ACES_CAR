// Auto-generated. Do not edit!

// (in-package aces_car.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class esc_signal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.steering = null;
      this.motor = null;
    }
    else {
      if (initObj.hasOwnProperty('steering')) {
        this.steering = initObj.steering
      }
      else {
        this.steering = 0;
      }
      if (initObj.hasOwnProperty('motor')) {
        this.motor = initObj.motor
      }
      else {
        this.motor = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type esc_signal
    // Serialize message field [steering]
    bufferOffset = _serializer.int32(obj.steering, buffer, bufferOffset);
    // Serialize message field [motor]
    bufferOffset = _serializer.int32(obj.motor, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type esc_signal
    let len;
    let data = new esc_signal(null);
    // Deserialize message field [steering]
    data.steering = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [motor]
    data.motor = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'aces_car/esc_signal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '34f05bd418b68e82fcbd05074fdcd9e0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 steering
    int32 motor
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new esc_signal(null);
    if (msg.steering !== undefined) {
      resolved.steering = msg.steering;
    }
    else {
      resolved.steering = 0
    }

    if (msg.motor !== undefined) {
      resolved.motor = msg.motor;
    }
    else {
      resolved.motor = 0
    }

    return resolved;
    }
};

module.exports = esc_signal;
