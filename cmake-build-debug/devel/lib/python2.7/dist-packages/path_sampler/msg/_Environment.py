# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from path_sampler/Environment.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import path_sampler.msg

class Environment(genpy.Message):
  _md5sum = "3cc57c194042ef7c4a4244da00e50495"
  _type = "path_sampler/Environment"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """Polygon[] obstacles
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

"""
  __slots__ = ['obstacles','field']
  _slot_types = ['path_sampler/Polygon[]','path_sampler/Field']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       obstacles,field

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Environment, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.obstacles is None:
        self.obstacles = []
      if self.field is None:
        self.field = path_sampler.msg.Field()
    else:
      self.obstacles = []
      self.field = path_sampler.msg.Field()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.obstacles)
      buff.write(_struct_I.pack(length))
      for val1 in self.obstacles:
        length = len(val1.points)
        buff.write(_struct_I.pack(length))
        for val2 in val1.points:
          _x = val2
          buff.write(_get_struct_2d().pack(_x.x, _x.y))
      _x = self
      buff.write(_get_struct_2d().pack(_x.field.width, _x.field.height))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.obstacles is None:
        self.obstacles = None
      if self.field is None:
        self.field = path_sampler.msg.Field()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.obstacles = []
      for i in range(0, length):
        val1 = path_sampler.msg.Polygon()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.points = []
        for i in range(0, length):
          val2 = path_sampler.msg.Point()
          _x = val2
          start = end
          end += 16
          (_x.x, _x.y,) = _get_struct_2d().unpack(str[start:end])
          val1.points.append(val2)
        self.obstacles.append(val1)
      _x = self
      start = end
      end += 16
      (_x.field.width, _x.field.height,) = _get_struct_2d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.obstacles)
      buff.write(_struct_I.pack(length))
      for val1 in self.obstacles:
        length = len(val1.points)
        buff.write(_struct_I.pack(length))
        for val2 in val1.points:
          _x = val2
          buff.write(_get_struct_2d().pack(_x.x, _x.y))
      _x = self
      buff.write(_get_struct_2d().pack(_x.field.width, _x.field.height))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.obstacles is None:
        self.obstacles = None
      if self.field is None:
        self.field = path_sampler.msg.Field()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.obstacles = []
      for i in range(0, length):
        val1 = path_sampler.msg.Polygon()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.points = []
        for i in range(0, length):
          val2 = path_sampler.msg.Point()
          _x = val2
          start = end
          end += 16
          (_x.x, _x.y,) = _get_struct_2d().unpack(str[start:end])
          val1.points.append(val2)
        self.obstacles.append(val1)
      _x = self
      start = end
      end += 16
      (_x.field.width, _x.field.height,) = _get_struct_2d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2d = None
def _get_struct_2d():
    global _struct_2d
    if _struct_2d is None:
        _struct_2d = struct.Struct("<2d")
    return _struct_2d