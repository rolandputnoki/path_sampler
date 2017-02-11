// Auto-generated. Do not edit!

// (in-package path_sampler.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');
let Point = require('./Point.js');

//-----------------------------------------------------------

class ConfigInterval {
  constructor() {
    this.start = new Point();
    this.end = new Point();
    this.center = new Point();
    this.radius = 0.0;
    this.arc_start = 0.0;
    this.delta = 0.0;
    this.direction = false;
    this.orientation = false;
    this.configIntervalType = '';
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type ConfigInterval
    // Serialize message field [start]
    bufferInfo = Point.serialize(obj.start, bufferInfo);
    // Serialize message field [end]
    bufferInfo = Point.serialize(obj.end, bufferInfo);
    // Serialize message field [center]
    bufferInfo = Point.serialize(obj.center, bufferInfo);
    // Serialize message field [radius]
    bufferInfo = _serializer.float64(obj.radius, bufferInfo);
    // Serialize message field [arc_start]
    bufferInfo = _serializer.float64(obj.arc_start, bufferInfo);
    // Serialize message field [delta]
    bufferInfo = _serializer.float64(obj.delta, bufferInfo);
    // Serialize message field [direction]
    bufferInfo = _serializer.bool(obj.direction, bufferInfo);
    // Serialize message field [orientation]
    bufferInfo = _serializer.bool(obj.orientation, bufferInfo);
    // Serialize message field [configIntervalType]
    bufferInfo = _serializer.string(obj.configIntervalType, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type ConfigInterval
    let tmp;
    let len;
    let data = new ConfigInterval();
    // Deserialize message field [start]
    tmp = Point.deserialize(buffer);
    data.start = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [end]
    tmp = Point.deserialize(buffer);
    data.end = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [center]
    tmp = Point.deserialize(buffer);
    data.center = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [radius]
    tmp = _deserializer.float64(buffer);
    data.radius = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [arc_start]
    tmp = _deserializer.float64(buffer);
    data.arc_start = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [delta]
    tmp = _deserializer.float64(buffer);
    data.delta = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [direction]
    tmp = _deserializer.bool(buffer);
    data.direction = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [orientation]
    tmp = _deserializer.bool(buffer);
    data.orientation = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [configIntervalType]
    tmp = _deserializer.string(buffer);
    data.configIntervalType = tmp.data;
    buffer = tmp.buffer;
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'path_sampler/ConfigInterval';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6c9b1aa4ea92907adaadbfb9e168e621';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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

module.exports = ConfigInterval;
