// Generated by gencpp from file path_sampler/Scene.msg
// DO NOT EDIT!


#ifndef PATH_SAMPLER_MESSAGE_SCENE_H
#define PATH_SAMPLER_MESSAGE_SCENE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <path_sampler/Robot.h>
#include <path_sampler/Environment.h>
#include <path_sampler/Config.h>
#include <path_sampler/Config.h>

namespace path_sampler
{
template <class ContainerAllocator>
struct Scene_
{
  typedef Scene_<ContainerAllocator> Type;

  Scene_()
    : robot()
    , environment()
    , start()
    , goal()  {
    }
  Scene_(const ContainerAllocator& _alloc)
    : robot(_alloc)
    , environment(_alloc)
    , start(_alloc)
    , goal(_alloc)  {
  (void)_alloc;
    }



   typedef  ::path_sampler::Robot_<ContainerAllocator>  _robot_type;
  _robot_type robot;

   typedef  ::path_sampler::Environment_<ContainerAllocator>  _environment_type;
  _environment_type environment;

   typedef  ::path_sampler::Config_<ContainerAllocator>  _start_type;
  _start_type start;

   typedef  ::path_sampler::Config_<ContainerAllocator>  _goal_type;
  _goal_type goal;




  typedef boost::shared_ptr< ::path_sampler::Scene_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::path_sampler::Scene_<ContainerAllocator> const> ConstPtr;

}; // struct Scene_

typedef ::path_sampler::Scene_<std::allocator<void> > Scene;

typedef boost::shared_ptr< ::path_sampler::Scene > ScenePtr;
typedef boost::shared_ptr< ::path_sampler::Scene const> SceneConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::path_sampler::Scene_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::path_sampler::Scene_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace path_sampler

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'path_sampler': ['/home/osboxes/catkin_ws/src/path_sampler/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::path_sampler::Scene_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::path_sampler::Scene_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::path_sampler::Scene_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::path_sampler::Scene_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::path_sampler::Scene_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::path_sampler::Scene_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::path_sampler::Scene_<ContainerAllocator> >
{
  static const char* value()
  {
    return "dd906ce2d92bdeca980b67425fdd61f5";
  }

  static const char* value(const ::path_sampler::Scene_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xdd906ce2d92bdecaULL;
  static const uint64_t static_value2 = 0x980b67425fdd61f5ULL;
};

template<class ContainerAllocator>
struct DataType< ::path_sampler::Scene_<ContainerAllocator> >
{
  static const char* value()
  {
    return "path_sampler/Scene";
  }

  static const char* value(const ::path_sampler::Scene_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::path_sampler::Scene_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Robot robot\n\
Environment environment\n\
Config start\n\
Config goal\n\
\n\
================================================================================\n\
MSG: path_sampler/Robot\n\
float64 minimumRadius\n\
float64 wheelbase\n\
Polygon body\n\
\n\
\n\
\n\
================================================================================\n\
MSG: path_sampler/Polygon\n\
Point[] points\n\
\n\
\n\
================================================================================\n\
MSG: path_sampler/Point\n\
float64 x\n\
float64 y\n\
\n\
\n\
================================================================================\n\
MSG: path_sampler/Environment\n\
Polygon[] obstacles\n\
Field field\n\
\n\
================================================================================\n\
MSG: path_sampler/Field\n\
float64 width\n\
float64 height\n\
\n\
\n\
================================================================================\n\
MSG: path_sampler/Config\n\
float64 x\n\
float64 y\n\
float64 phi\n\
\n\
";
  }

  static const char* value(const ::path_sampler::Scene_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::path_sampler::Scene_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.robot);
      stream.next(m.environment);
      stream.next(m.start);
      stream.next(m.goal);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct Scene_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::path_sampler::Scene_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::path_sampler::Scene_<ContainerAllocator>& v)
  {
    s << indent << "robot: ";
    s << std::endl;
    Printer< ::path_sampler::Robot_<ContainerAllocator> >::stream(s, indent + "  ", v.robot);
    s << indent << "environment: ";
    s << std::endl;
    Printer< ::path_sampler::Environment_<ContainerAllocator> >::stream(s, indent + "  ", v.environment);
    s << indent << "start: ";
    s << std::endl;
    Printer< ::path_sampler::Config_<ContainerAllocator> >::stream(s, indent + "  ", v.start);
    s << indent << "goal: ";
    s << std::endl;
    Printer< ::path_sampler::Config_<ContainerAllocator> >::stream(s, indent + "  ", v.goal);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PATH_SAMPLER_MESSAGE_SCENE_H
