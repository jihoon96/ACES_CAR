#include <ros/ros.h>
#include "aces_car/intersection.h"
#include "aces_car/esc_signal.h"

#define default_motor 1255
int steering = 1200;
int motor = 1200;

void msgCallback(const aces_car::intersection::ConstPtr& msg)
{
	double x = msg->x;
	float depth = msg->depth;
//	printf("x : %.3f, depth : %.3f", x, depth);

	if( depth > 4 ){
		if(x > 335){
			steering = 1260;
			motor = default_motor;
		}else if(x < 305 ){
			steering = 1140;
			motor = default_motor;
		}else{
			motor = default_motor;
			steering = 1200;
		}
	}else if( std::isnan(depth) ){
		motor = default_motor;	
	}else{
		steering = 1200;
		motor = 1150;
	}
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "direction_process");
	ros::NodeHandle nh;
	ros::Publisher esc_signal_pub = nh.advertise<aces_car::esc_signal>("esc_signal_msg",10);
	ros::Subscriber intersection_sub = nh.subscribe("intersection_msg",10,msgCallback);

	aces_car::esc_signal msg;

	ros::Rate loop_rate(1);

	while(ros::ok()){
		msg.motor = motor;
		msg.steering = steering;
		esc_signal_pub.publish(msg);
		ROS_INFO("steering: %d, motor: %d", steering, motor);		
		ros::spinOnce();
		loop_rate.sleep();
	}

}
