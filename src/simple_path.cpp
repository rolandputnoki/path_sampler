//
// Created by osboxes on 12/02/17.
//

#include "ros/ros.h"
#include "std_msgs/String.h"
#include "path_sampler/Path.h"
#include "path_sampler/Point.h"
#include "path_sampler/ConfigInterval.h"



using namespace path_sampler;

int main(int argc, char **argv)
{
    ros::init(argc, argv, "simple_path");
    ros::NodeHandle n;
    ros::Publisher path_pub = n.advertise<Path>("path", 1000);
    ros::Rate loop_rate(1);
    Path simple;
    ConfigInterval egyenes1, egyenes2, koriv;
    Point start, end;
    start.x = 650;
    start.y = 100;
    end.x = 270;
    end.y = 55;
    egyenes1.start = start;
    egyenes1.end = end;
    egyenes1.configIntervalType = "TCI";
    simple.segments.push_back(egyenes1);
    int count = 0;
    while (ros::ok())
    {

        path_pub.publish(simple);
        ros::spinOnce();
        loop_rate.sleep();
        ++count;
    }
    return 0;
}
