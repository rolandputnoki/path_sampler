// Auto-generated. Do not edit!

// (in-package path_sampler.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');
let Polygon = require('./Polygon.js');

//-----------------------------------------------------------

class Robot {
  constructor() {
    this.minimumRadius = 0.0;
    this.wheelbase = 0.0;
    this.body = new Polygon();
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type Robot
    // Serialize message field [minimumRadius]
    bufferInfo = _serializer.float64(obj.minimumRadius, bufferInfo);
    // Serialize message field [wheelbase]
    bufferInfo = _serializer.float64(obj.wheelbase, bufferInfo);
    // Serialize message field [body]
    bufferInfo = Polygon.serialize(obj.body, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type Robot
    let tmp;
    let len;
    let data = new Robot();
    // Deserialize message field [minimumRadius]
    tmp = _deserializer.float64(buffer);
    data.minimumRadius = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [wheelbase]
    tmp = _deserializer.float64(buffer);
    data.wheelbase = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [body]
    tmp = Polygon.deserialize(buffer);
    data.body = tmp.data;
    buffer = tmp.buffer;
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'path_sampler/Robot';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a5b2ac8eecc8f975569b4a77146d1fa2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 minimumRadius
    float64 wheelbase
    Polygon body
    
    
    
    ================================================================================
    MSG: path_sampler/Polygon
    Point[] points
    
    
    ================================================================================
    MSG: path_sampler/Point
    float64 x
    float64 y
    
    
    `;
  }

};

module.exports = Robot;
