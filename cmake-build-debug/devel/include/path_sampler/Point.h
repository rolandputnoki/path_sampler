// Generated by gencpp from file path_sampler/Point.msg
// DO NOT EDIT!


#ifndef PATH_SAMPLER_MESSAGE_POINT_H
#define PATH_SAMPLER_MESSAGE_POINT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace path_sampler
{
template <class ContainerAllocator>
struct Point_
{
  typedef Point_<ContainerAllocator> Type;

  Point_()
    : x(0.0)
    , y(0.0)  {
    }
  Point_(const ContainerAllocator& _alloc)
    : x(0.0)
    , y(0.0)  {
  (void)_alloc;
    }



   typedef double _x_type;
  _x_type x;

   typedef double _y_type;
  _y_type y;




  typedef boost::shared_ptr< ::path_sampler::Point_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::path_sampler::Point_<ContainerAllocator> const> ConstPtr;

}; // struct Point_

typedef ::path_sampler::Point_<std::allocator<void> > Point;

typedef boost::shared_ptr< ::path_sampler::Point > PointPtr;
typedef boost::shared_ptr< ::path_sampler::Point const> PointConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::path_sampler::Point_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::path_sampler::Point_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace path_sampler

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'path_sampler': ['/home/osboxes/catkin_ws/src/path_sampler/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::path_sampler::Point_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::path_sampler::Point_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::path_sampler::Point_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::path_sampler::Point_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::path_sampler::Point_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::path_sampler::Point_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::path_sampler::Point_<ContainerAllocator> >
{
  static const char* value()
  {
    return "209f516d3eb691f0663e25cb750d67c1";
  }

  static const char* value(const ::path_sampler::Point_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x209f516d3eb691f0ULL;
  static const uint64_t static_value2 = 0x663e25cb750d67c1ULL;
};

template<class ContainerAllocator>
struct DataType< ::path_sampler::Point_<ContainerAllocator> >
{
  static const char* value()
  {
    return "path_sampler/Point";
  }

  static const char* value(const ::path_sampler::Point_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::path_sampler::Point_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 x\n\
float64 y\n\
\n\
";
  }

  static const char* value(const ::path_sampler::Point_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::path_sampler::Point_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct Point_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::path_sampler::Point_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::path_sampler::Point_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<double>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<double>::stream(s, indent + "  ", v.y);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PATH_SAMPLER_MESSAGE_POINT_H
