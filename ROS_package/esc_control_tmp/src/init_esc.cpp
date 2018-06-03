#include <ros/ros.h>
#include "esc_control/control_val.h"
#include <iostream>

int main(int argc, char **argv)
{
		ros::init(argc, argv, "init_esc");

		ros::NodeHandle n;

		ros::Publisher init_val = n.advertise<esc_control::control_val>("init_esc",1);

		ros::Rate loop_rate(2);

		int count = 0;
		while (ros::ok())
		{
				esc_control::control_val init;
				init.steering = 1200;
				init.motor = 1200;
				init_val.publish(init);

				loop_rate.sleep();
		}
	return 0;
}
