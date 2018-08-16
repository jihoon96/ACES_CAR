#include "ros/ros.h"
#include "esc_control/esc_signal.h"
#include <pigpio.h>
#include <iostream>

#define MOTOR_PIN 23
#define STEERING_PIN 18

#define PWM_RANGE 20000
#define PWM_FREQUENCY 40

#define DEFAULT_PWM 1200

void msgCallback(const esc_control::esc_signal msg)
{
	int steering = msg.steering;
	int motor = msg.motor;
	gpioPWM(STEERING_PIN, steering);
	gpioPWM(MOTOR_PIN, motor);
	ROS_INFO("steering : %d, motor : %d", steering, motor);
}


int main(int argc, char **argv)
{
	ros::init(argc, argv, "esc_control");
	ros::NodeHandle n;

	ros::Subscriber esc_signal_sub = n.subscribe("esc_signal_msg",10, msgCallback);

	// GPIO initialization
	gpioInitialise();

	// PWM set range
	gpioSetPWMrange(MOTOR_PIN, PWM_RANGE);
	gpioSetPWMrange(STEERING_PIN, PWM_RANGE);

	// PWM set freq.
	gpioSetPWMfrequency(MOTOR_PIN, PWM_FREQUENCY);
	gpioSetPWMfrequency(STEERING_PIN, PWM_FREQUENCY);

	gpioPWM(MOTOR_PIN, DEFAULT_PWM);
	gpioPWM(STEERING_PIN, DEFAULT_PWM);
	

	// LOOP
	ros::spin();

	return 0;
}
