// Auto-generated. Do not edit!

// (in-package path_sampler.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');

//-----------------------------------------------------------

class Config {
  constructor() {
    this.x = 0.0;
    this.y = 0.0;
    this.phi = 0.0;
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type Config
    // Serialize message field [x]
    bufferInfo = _serializer.float64(obj.x, bufferInfo);
    // Serialize message field [y]
    bufferInfo = _serializer.float64(obj.y, bufferInfo);
    // Serialize message field [phi]
    bufferInfo = _serializer.float64(obj.phi, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type Config
    let tmp;
    let len;
    let data = new Config();
    // Deserialize message field [x]
    tmp = _deserializer.float64(buffer);
    data.x = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [y]
    tmp = _deserializer.float64(buffer);
    data.y = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [phi]
    tmp = _deserializer.float64(buffer);
    data.phi = tmp.data;
    buffer = tmp.buffer;
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'path_sampler/Config';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b85eb561fe43defc969d836014a828f5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 x
    float64 y
    float64 phi
    
    
    `;
  }

};

module.exports = Config;
