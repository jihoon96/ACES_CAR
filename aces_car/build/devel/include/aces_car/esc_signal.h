// Generated by gencpp from file aces_car/esc_signal.msg
// DO NOT EDIT!


#ifndef ACES_CAR_MESSAGE_ESC_SIGNAL_H
#define ACES_CAR_MESSAGE_ESC_SIGNAL_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace aces_car
{
template <class ContainerAllocator>
struct esc_signal_
{
  typedef esc_signal_<ContainerAllocator> Type;

  esc_signal_()
    : steering(0)
    , motor(0)  {
    }
  esc_signal_(const ContainerAllocator& _alloc)
    : steering(0)
    , motor(0)  {
  (void)_alloc;
    }



   typedef int32_t _steering_type;
  _steering_type steering;

   typedef int32_t _motor_type;
  _motor_type motor;





  typedef boost::shared_ptr< ::aces_car::esc_signal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::aces_car::esc_signal_<ContainerAllocator> const> ConstPtr;

}; // struct esc_signal_

typedef ::aces_car::esc_signal_<std::allocator<void> > esc_signal;

typedef boost::shared_ptr< ::aces_car::esc_signal > esc_signalPtr;
typedef boost::shared_ptr< ::aces_car::esc_signal const> esc_signalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::aces_car::esc_signal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::aces_car::esc_signal_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace aces_car

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'aces_car': ['/home/nvidia/catkin_ws/src/aces_car/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::aces_car::esc_signal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::aces_car::esc_signal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::aces_car::esc_signal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::aces_car::esc_signal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::aces_car::esc_signal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::aces_car::esc_signal_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::aces_car::esc_signal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "34f05bd418b68e82fcbd05074fdcd9e0";
  }

  static const char* value(const ::aces_car::esc_signal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x34f05bd418b68e82ULL;
  static const uint64_t static_value2 = 0xfcbd05074fdcd9e0ULL;
};

template<class ContainerAllocator>
struct DataType< ::aces_car::esc_signal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "aces_car/esc_signal";
  }

  static const char* value(const ::aces_car::esc_signal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::aces_car::esc_signal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 steering\n\
int32 motor\n\
";
  }

  static const char* value(const ::aces_car::esc_signal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::aces_car::esc_signal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.steering);
      stream.next(m.motor);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct esc_signal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::aces_car::esc_signal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::aces_car::esc_signal_<ContainerAllocator>& v)
  {
    s << indent << "steering: ";
    Printer<int32_t>::stream(s, indent + "  ", v.steering);
    s << indent << "motor: ";
    Printer<int32_t>::stream(s, indent + "  ", v.motor);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ACES_CAR_MESSAGE_ESC_SIGNAL_H
