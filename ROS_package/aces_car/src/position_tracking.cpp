#include <ros/ros.h>
#include "aces_car/esc_signal.h"
#include <sl_zed/Camera.hpp>

using namespace std;
using namespace sl;

int main(int argc, char **argv)
{
	ros::init(argc, argv, "ZED_position_tracking");
	ros::NodeHandle nh;
	ros::Publisher esc_signal_pub = nh.advertise<aces_car::esc_signal>("esc_signal_msg", 10);

//	ros::Rate loop_rate(10);

	aces_car::esc_signal msg;

	Camera zed;

	InitParameters init_params;
	init_params.camera_resolution = RESOLUTION_HD720;
	init_params.coordinate_system = COORDINATE_SYSTEM_RIGHT_HANDED_Y_UP;
	init_params.coordinate_units = UNIT_METER;

	ERROR_CODE err = zed.open(init_params);
	if(err != SUCCESS)
		exit(1);

	TrackingParameters tracking_parameters;
	err = zed.enableTracking(tracking_parameters);
	if(err != SUCCESS)
		exit(-1);

	Pose zed_pose;

	while(ros::ok())
	{
		if(zed.grab() == SUCCESS){
			zed.getPosition(zed_pose, REFERENCE_FRAME_WORLD);
		}
		msg.steering = 1200-400*zed_pose.getTranslation().tx;
		msg.motor = 1240;
		esc_signal_pub.publish(msg);
		ROS_INFO("send msg = %.3f", msg.steering);
//		loop_rate.sleep();
	}

	zed.disableTracking();
	zed.close();
	return 0;
}
