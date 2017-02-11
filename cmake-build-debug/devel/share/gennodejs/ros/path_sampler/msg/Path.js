// Auto-generated. Do not edit!

// (in-package path_sampler.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');
let ConfigInterval = require('./ConfigInterval.js');

//-----------------------------------------------------------

class Path {
  constructor() {
    this.segments = [];
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type Path
    // Serialize the length for message field [segments]
    bufferInfo = _serializer.uint32(obj.segments.length, bufferInfo);
    // Serialize message field [segments]
    obj.segments.forEach((val) => {
      bufferInfo = ConfigInterval.serialize(val, bufferInfo);
    });
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type Path
    let tmp;
    let len;
    let data = new Path();
    // Deserialize array length for message field [segments]
    tmp = _deserializer.uint32(buffer);
    len = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [segments]
    data.segments = new Array(len);
    for (let i = 0; i < len; ++i) {
      tmp = ConfigInterval.deserialize(buffer);
      data.segments[i] = tmp.data;
      buffer = tmp.buffer;
    }
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'path_sampler/Path';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e0da83884d8773075997c173656f81f7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ConfigInterval[] segments
    
    ================================================================================
    MSG: path_sampler/ConfigInterval
    Point start
    Point end
    Point center
    float64 radius
    float64 arc_start
    float64 delta
    bool direction
    bool orientation
    string configIntervalType  # TCI: szakasz, ACI: körív
    
    ================================================================================
    MSG: path_sampler/Point
    float64 x
    float64 y
    
    
    `;
  }

};

module.exports = Path;
