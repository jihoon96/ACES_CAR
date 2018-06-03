#include <iostream>
#include "ros/ros.h"
#include <signal.h>
#include <termios.h>
#include "esc_control/depth.h"
#include "esc_control/control_val.h"

using namespace std;

void chatterCallback(const esc_control::depth msg);

int main(int argc, char **argv){
		ros::init(argc, argv, "Control");
		ros::NodeHandle n;
		ros::Publisher control_p;
		control_p = n.advertise<esc_control::control_val>("control_val",3);
		ros::Subscriber sub_depth = n.subscribe("depth_info", 3, chatterCallback);
		ros::spin();

		return 0;
}
		
void chatterCallback(const esc_control::depth msg)
{
		float depth = msg.depth;
		int control;
		if( depth > 2 )
			control = 45;
		else if( depth > 1 )
			control = 0;
		else
			control = -50;
		esc_control::control_val tmp;
		tmp.motor = control;
		tmp.steering = 0;
		control_p.publish(tmp);
}
