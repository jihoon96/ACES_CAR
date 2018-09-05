#include <sl/Camera.hpp>
#include <opencv2/opencv.hpp>
#include <ros/ros.h>
#include "aces_car/intersection.h"

#define PI 3.141592654

using namespace sl;
using namespace cv;

cv::Mat slMat2cvMat(sl::Mat& input);
void print_distance(cv::Mat&, Point, float);
cv::Mat edge_detect(cv::Mat&);
bool GetIntersectPoint();

double pt1_lx;
double pt1_ly;
double pt2_lx;
double pt2_ly;
double pt1_rx;
double pt1_ry;
double pt2_rx;
double pt2_ry;

// intersection
double inter_x;
double inter_y;

// depth at intersection
float depth_value;

int main(int argc, char **argv) {

	ros::init(argc, argv, "lane_keeping");
	ros::NodeHandle nh;
	ros::Publisher intersection_pub = nh.advertise<aces_car::intersection>("intersection_msg",10);
	aces_car::intersection msg;

    // Create a ZED camera object
    Camera zed;

    // Set configuration parameters
    InitParameters init_params;
	//init_params.camera_resolution = RESOLUTION_VGA;
	init_params.camera_fps = 30;
    init_params.depth_mode = DEPTH_MODE_PERFORMANCE; // Use PERFORMANCE depth mode
    init_params.coordinate_units = UNIT_METER; // Use millimeter units (for depth measurements)

    // Open the camera
    ERROR_CODE err = zed.open(init_params);
    if (err != SUCCESS)
        exit(-1);

    // Set runtime parameters after opening the camera
    RuntimeParameters runtime_parameters;
    runtime_parameters.sensing_mode = SENSING_MODE_STANDARD; // Use STANDARD sensing mode

	Resolution image_size = zed.getResolution();
	int new_width = image_size.width / 2;
	int new_height = image_size.height / 2;

	sl::Mat image_zed(new_width, new_height, MAT_TYPE_8U_C4); 
	cv::Mat image_ocv = slMat2cvMat(image_zed);
	sl::Mat depth_zed(new_width, new_height, MAT_TYPE_32F_C1); 
	cv::Mat depth_ocv = slMat2cvMat(depth_zed);

//	char key = ' ';
	cv::Mat edge_image;
	while(ros::ok()){
	    // A new image is available if grab() returns SUCCESS
  	 	if (zed.grab(runtime_parameters) == SUCCESS) {
			const int64 start = getTickCount();
        	
			// Retrieve left image
        	zed.retrieveImage(image_zed, VIEW_LEFT, MEM_CPU, new_width, new_height);
        	// Retrieve depth map. Depth is aligned on the left image
        	zed.retrieveMeasure(depth_zed, MEASURE_DEPTH, MEM_CPU, new_width, new_height);

			edge_image = edge_detect(image_ocv);
	
			// depth
			depth_zed.getValue(new_width/2, new_height/2-20, &depth_value);
			ROS_INFO("x : %f, y : %f, depth : %f", inter_x, inter_y, depth_value);

			msg.x = inter_x;  
//			msg.x = pt2_ly - pt2_ry  // > 5 : right,  < 10 : left

			msg.depth = depth_value;
			intersection_pub.publish(msg);
	
//			Point dot(inter_x, inter_y);
//			print_distance(edge_image, dot, depth_value);

//			imshow("edge detection", edge_image);

//			double timeSec = (getTickCount() - start)/getTickFrequency();
			//printf("Time : %f\n", timeSec);

//			key = cv::waitKey(10);
    	}
	}

    // Close the camera
    zed.close();
    return 0;
}

/* Conversion fuction between s1::Mat and cv::Mat */
cv::Mat slMat2cvMat(sl::Mat& input){
		//Mapping between MAT_TYPE and CV_TYPE
		int cv_type = -1;
		switch(input.getDataType()){
				case MAT_TYPE_32F_C1 : cv_type = CV_32FC1; break;
				case MAT_TYPE_32F_C2 : cv_type = CV_32FC2; break;
				case MAT_TYPE_32F_C3 : cv_type = CV_32FC3; break;
				case MAT_TYPE_32F_C4 : cv_type = CV_32FC4; break;
				case MAT_TYPE_8U_C1 : cv_type = CV_8UC1; break;
				case MAT_TYPE_8U_C2 : cv_type = CV_8UC2; break;
				case MAT_TYPE_8U_C3 : cv_type = CV_8UC3; break;
				case MAT_TYPE_8U_C4 : cv_type = CV_8UC4; break;
				default : break;
		}

		// Since cv::Mat data requires a uchar* pointer, we get the uchar1 pointer from sl::Mat (getPtr<T>())
		// cv::Mat and sl::Mat will share a single memory structure
		return cv::Mat(input.getHeight(), input.getWidth(), cv_type, input.getPtr<sl::uchar1>(MEM_CPU));
}

void print_distance(cv::Mat& image, Point dot, float depth_value){
		int c_radius = 1;
		int c_thickness = 2;
		
		int fontFace = FONT_HERSHEY_SIMPLEX;
		double fontscale = 0.4;
		int t_thickness = 1;
		//int dec, sign;
		//std::string t_depth = fcvt(depth_value, 2, &dec, &sign);
		char t_depth[10];
		sprintf(t_depth, "%.2fm", depth_value);

		putText(image, t_depth, Point(dot.x-17, dot.y+15), fontFace, fontscale, Scalar(0,0,255), t_thickness);
		circle(image, dot, c_radius, Scalar(0,0,255), c_thickness);

}

cv::Mat edge_detect(cv::Mat& image){
		cv::Mat contours_left, contours_right;
		cv::Mat gray_image, gray_left, gray_right;
		cvtColor(image, gray_image, CV_BGR2GRAY, 1);
		gray_left = gray_image(Rect(0, image.rows/3, image.cols/2, image.rows/3));
		gray_right = gray_image(Rect(image.cols/2, image.rows/3, image.cols/2, image.rows/3));
		
		Canny(gray_left, contours_left, (gray_left.rows+gray_left.cols)/8, (gray_left.rows+gray_left.cols)/8);
		Canny(gray_right, contours_right, (gray_right.rows+gray_right.cols)/8, (gray_right.rows+gray_right.cols)/8);
		
		std::vector<Vec2f> lines_left, lines_right;

		int houghVote = 200;
		while((lines_left.size() < 2 || lines_right.size() < 2) && houghVote > 0){
				HoughLines(contours_left, lines_left, 1, PI/180, houghVote);
				HoughLines(contours_right, lines_right, 1, PI/180, houghVote);
				houghVote -= 10;
		}

		cv::Mat result(image.rows, image.cols, CV_8U, Scalar(255));
		image.copyTo(result);

		std::vector<Vec2f>::const_iterator it_left = lines_left.begin();
		double rho_left, theta_left;
		int find_left = 0;
		while(it_left != lines_left.end()){
				rho_left = (*it_left)[0];
				theta_left = (*it_left)[1];

				if(theta_left > PI/6 && theta_left < PI/2){
						find_left = 1;
						break;
				}
				
				++it_left;
		}

		std::vector<Vec2f>::const_iterator it_right = lines_right.begin();
		double rho_right, theta_right;
		int find_right = 0;
		while(it_right != lines_right.end()){
				rho_right = (*it_right)[0];
				theta_right = (*it_right)[1];

				if(theta_right > PI/2 && theta_right < PI*5/6){
						find_right = 1;
						break;
				}
				
				++it_right;
		}

		if(find_left){
			double a_left = cos(theta_left), b_left = sin(theta_left);
			pt1_lx = rho_left/a_left;
			pt1_ly = result.rows/3;
			pt2_lx = 0;
			pt2_ly = rho_left/b_left + result.rows/3;
//			Point pt1_left(pt1_lx, pt1_ly);
//			Point pt2_left(pt2_lx, pt2_ly);
//			line(result, pt1_left, pt2_left, Scalar(0,0,255), 3);
		}

		if(find_right){
			double a_right = cos(theta_right), b_right = sin(theta_right);
			pt1_rx = result.cols/2 + rho_right/a_right;
			pt1_ry = result.rows/3;
			pt2_rx = result.cols;
			pt2_ry = result.rows/3 + rho_right/b_right - (result.cols/2)*a_right/b_right;
//			Point pt1_right(pt1_rx, pt1_ry);
//			Point pt2_right(pt2_rx, pt2_ry);
//			line(result, pt1_right, pt2_right, Scalar(0,0,255), 3);
		}

		GetIntersectPoint();
		//printf("%f, %f\n",inter_x, inter_y);
		//printf("%d, %d, %d, %d\n",pt1_lx,pt2_ly, pt1_rx, pt2_ry);
		
		return result;
}
bool GetIntersectPoint() 
{

	double m1;
    double m2;
   	double b1;
	double b2;

	m1 = (pt1_ly - pt2_ly) / (pt1_lx - pt2_lx);
	m2 = (pt1_ry - pt2_ry) / (pt1_rx - pt2_rx);
	b1 = (pt1_ly - m1*pt1_lx);
	b2 = (pt1_ry - m2*pt1_rx);

    inter_x = (b2-b1)/(m1-m2);
    inter_y = m1*(b2-b1)/(m1-m2)+b1;
														 
    return true;
}
