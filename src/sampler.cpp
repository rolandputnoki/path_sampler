//
// Created by osboxes on 11/02/17.
//

#include "ros/ros.h"
#include "std_msgs/String.h"
#include "path_sampler/Path.h"



void pathCallback(const path_sampler::Path p)
{
    int len = sizeof(p.segments);
    ROS_INFO("The lenght of path's segments array is %d", len);
    for(int i = 0; i < len; i++){
        if(p.segments[i].configIntervalType == "TCI"){
            ROS_INFO("Ez egy szakasz");
        } else {
            ROS_INFO("Ez egy koriv");
        }
    }
}

int main(int argc, char **argv){
    ros::init(argc, argv, "sampler");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("path", 1000, pathCallback);
    ros::spin();
    return 0;
}