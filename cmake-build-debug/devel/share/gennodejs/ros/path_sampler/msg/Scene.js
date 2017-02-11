// Auto-generated. Do not edit!

// (in-package path_sampler.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');
let Robot = require('./Robot.js');
let Environment = require('./Environment.js');
let Config = require('./Config.js');

//-----------------------------------------------------------

class Scene {
  constructor() {
    this.robot = new Robot();
    this.environment = new Environment();
    this.start = new Config();
    this.goal = new Config();
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type Scene
    // Serialize message field [robot]
    bufferInfo = Robot.serialize(obj.robot, bufferInfo);
    // Serialize message field [environment]
    bufferInfo = Environment.serialize(obj.environment, bufferInfo);
    // Serialize message field [start]
    bufferInfo = Config.serialize(obj.start, bufferInfo);
    // Serialize message field [goal]
    bufferInfo = Config.serialize(obj.goal, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type Scene
    let tmp;
    let len;
    let data = new Scene();
    // Deserialize message field [robot]
    tmp = Robot.deserialize(buffer);
    data.robot = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [environment]
    tmp = Environment.deserialize(buffer);
    data.environment = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [start]
    tmp = Config.deserialize(buffer);
    data.start = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [goal]
    tmp = Config.deserialize(buffer);
    data.goal = tmp.data;
    buffer = tmp.buffer;
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'path_sampler/Scene';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'dd906ce2d92bdeca980b67425fdd61f5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Robot robot
    Environment environment
    Config start
    Config goal
    
    ================================================================================
    MSG: path_sampler/Robot
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
    
    
    ================================================================================
    MSG: path_sampler/Environment
    Polygon[] obstacles
    Field field
    
    ================================================================================
    MSG: path_sampler/Field
    float64 width
    float64 height
    
    
    ================================================================================
    MSG: path_sampler/Config
    float64 x
    float64 y
    float64 phi
    
    
    `;
  }

};

module.exports = Scene;
