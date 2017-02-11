// Auto-generated. Do not edit!

// (in-package path_sampler.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');
let Polygon = require('./Polygon.js');
let Field = require('./Field.js');

//-----------------------------------------------------------

class Environment {
  constructor() {
    this.obstacles = [];
    this.field = new Field();
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type Environment
    // Serialize the length for message field [obstacles]
    bufferInfo = _serializer.uint32(obj.obstacles.length, bufferInfo);
    // Serialize message field [obstacles]
    obj.obstacles.forEach((val) => {
      bufferInfo = Polygon.serialize(val, bufferInfo);
    });
    // Serialize message field [field]
    bufferInfo = Field.serialize(obj.field, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type Environment
    let tmp;
    let len;
    let data = new Environment();
    // Deserialize array length for message field [obstacles]
    tmp = _deserializer.uint32(buffer);
    len = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [obstacles]
    data.obstacles = new Array(len);
    for (let i = 0; i < len; ++i) {
      tmp = Polygon.deserialize(buffer);
      data.obstacles[i] = tmp.data;
      buffer = tmp.buffer;
    }
    // Deserialize message field [field]
    tmp = Field.deserialize(buffer);
    data.field = tmp.data;
    buffer = tmp.buffer;
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'path_sampler/Environment';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3cc57c194042ef7c4a4244da00e50495';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Polygon[] obstacles
    Field field
    
    ================================================================================
    MSG: path_sampler/Polygon
    Point[] points
    
    
    ================================================================================
    MSG: path_sampler/Point
    float64 x
    float64 y
    
    
    ================================================================================
    MSG: path_sampler/Field
    float64 width
    float64 height
    
    
    `;
  }

};

module.exports = Environment;
