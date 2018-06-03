#include <ros/ros.h>
#include "esc_control/esc_signal.h"
#include <pigpio.h>

#define MOTOR_PIN 16
#define PWM_RANGE 20000
#define PWM_FREQUENCY 40

int main(int argc, char **argv)
{
	ros::init(argc, argv, "car_motor");
	ros::NodeHandle nh;
	ros::Subscriber steering_sub = nh.subscribe("esc_signal_msg", 10, msgCallback);

	gpioInitialise();
	gpioSetPWMrang(MOTOR_PIN, PWM_RANGE);
	gpioSetPWMfrequency(MOTOR_PIN, PWM_FREQUENCY);

	ros::spin();

	return 0;
}

void msgCallback(const esc_control::esc_signal::ConstPtr& msg)
{
	ROS_INFO("recieve msg = %d", msg->stamp.sec);
	ROS_INFO("recieve msg = %d", msg->stamp.nsec);
	ROS_INFO("recieve msg motor = %d", msg->motor);
	gpioPWM(MOTOR_PIN, msg->motor);
}
