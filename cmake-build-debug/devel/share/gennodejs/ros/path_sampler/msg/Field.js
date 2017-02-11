// Auto-generated. Do not edit!

// (in-package path_sampler.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');

//-----------------------------------------------------------

class Field {
  constructor() {
    this.width = 0.0;
    this.height = 0.0;
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type Field
    // Serialize message field [width]
    bufferInfo = _serializer.float64(obj.width, bufferInfo);
    // Serialize message field [height]
    bufferInfo = _serializer.float64(obj.height, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type Field
    let tmp;
    let len;
    let data = new Field();
    // Deserialize message field [width]
    tmp = _deserializer.float64(buffer);
    data.width = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [height]
    tmp = _deserializer.float64(buffer);
    data.height = tmp.data;
    buffer = tmp.buffer;
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'path_sampler/Field';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f86522e647336fb10b55359fe003f673';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 width
    float64 height
    
    
    `;
  }

};

module.exports = Field;
