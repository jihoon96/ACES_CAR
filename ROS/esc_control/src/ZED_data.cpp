#include <ros/ros.h>
#include <signal.h>
#include <termios.h>
#include <iostream>
#include "esc_control/control_val.h"

#define KEYCODE_R 0x43
#define KEYCODE_L 0x44
#define KEYCODE_U 0x41
#define KEYCODE_D 0x42
#define KEYCODE_Q 0x71

class TeleopCar
{
	public:
		TeleopCar();
		void keyLoop();

	private:
		ros::NodeHandle nh_;
		double motor_, steering_;
		ros::Publisher esc_control_pub_;
};

TeleopCar::TeleopCar():
	motor_(0),
	steering_(0)
{
	esc_control_pub_ = nh_.advertise<esc_control::control_val>("keyboard_input", 3);
}

int kfd = 0;
struct termios cooked, raw;

void quit(int sig)
{
	(void)sig;
	tcsetattr(kfd, TCSANOW, &cooked);
	ros::shutdown();
	exit(0);
}

int main(int argc, char** argv)
{
	ros::init(argc, argv, "teleop_car");
	TeleopCar teleop_car;

	signal(SIGINT, quit);

	teleop_car.keyLoop();

	return(0);
}

void TeleopCar::keyLoop()
{
	char c;
	bool dirty=false;

	// get the console in raw mode
	tcgetattr(kfd, &cooked);
	memcpy(&raw, &cooked, sizeof(struct termios));
	raw.c_lflag &=~ (ICANON | ECHO);
	// Setting a new line, then end of file
	raw.c_cc[VEOL] = 1;
	raw.c_cc[VEOF] = 2;
	tcsetattr(kfd, TCSANOW, &raw);

	puts("Reading from keyboard");
	puts("-------------------------------");
	puts("Use arrow keys to move the Car.");

	for(;;)
	{
		// get the next event from the keyboard
		if(read(kfd, &c, 1) < 0)
		{
			perror("read():");
			exit(-1);
		}

		steering_=motor_=0;
		ROS_DEBUG("value: 0x%02X\n", c);

		switch(c)
		{
			case KEYCODE_L:
				ROS_DEBUG("LEFT");
				steering_ = -300;
				dirty = true;
				break;
			case KEYCODE_R:
				ROS_DEBUG("RIGHT");
				steering_ = 300;
				dirty = true;
				break;
			case KEYCODE_U:
				ROS_DEBUG("UP");
				motor_ = 45;
				dirty = true;
				break;
			case KEYCODE_D:
				ROS_DEBUG("DOWN");
				motor_ = -50;
				dirty = true;
				break;
		}

		// message declare
		esc_control::control_val a;
		a.steering = steering_;
		a.motor = motor_;
		if(dirty == true)
		{
			esc_control_pub_.publish(a);
			dirty=false;
		}
	}
	return;
}
