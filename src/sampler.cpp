//
// Created by osboxes on 11/02/17.
//

#include "ros/ros.h"
#include "std_msgs/String.h"
#include "path_sampler/Path.h"
#include "path_sampler/ConfigInterval.h"
#include "path_sampler/Config.h"
#include "path_sampler/Sampled_path.h"
#include <math.h>

using namespace path_sampler;


void line_sampler(ConfigInterval c, Sampled_path & sp){
    Config  conf;
    double line_length = sqrt((c.start.x - c.end.x)*(c.start.x - c.end.x) + (c.start.y - c.end.y)*(c.start.y - c.end.y));
    ROS_INFO("A szakasz hossza: %lf", line_length);
    unsigned int num_of_points = line_length/10;
    double delta_x = (c.end.x - c.start.x)/num_of_points;
    double delta_y = (c.end.y - c.start.y)/num_of_points;
    for(int i = 0; i <= num_of_points; i++){
        double x = c.start.x + i*delta_x;
        double y = c.start.y + i*delta_y;
        ROS_INFO("%d. pont x: %lf y: %lf", i+1,x,y);
        conf.x = x;
        conf.y = y;
        conf.phi = 0;
        sp.sample_points.push_back(conf);
    }
}

void arc_sampler(ConfigInterval c, Sampled_path & sp){
    Config conf;

    //Ha delta radiánban van
    double arc_length = fabsf(c.delta)*c.radius;

    /*
     //Ha delta fokban van
     double arc_length = fabsf(c.delta)*c.radius*M_PI/180;
    */
}

void pathCallback(const Path p)
{
    unsigned long len = p.segments.size();
    Sampled_path sample;
    Config conf;
    ROS_INFO("The lenght of path's segments array is %lu", len);
    for(int i = 0; i < len; i++){
        if(p.segments[i].configIntervalType == "TCI"){
            ROS_INFO("Ez egy szakasz");
            line_sampler(p.segments[i], sample);
            ROS_INFO("Az egyenest : %d pontra osztottuk", sample.sample_points.size());
        } else {
            arc_sampler(p.segments[i], sample);
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