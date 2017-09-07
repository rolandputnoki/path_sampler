//
// Created by osboxes on 12/02/17.
//

#include "ros/ros.h"
#include "std_msgs/String.h"
#include "robot_editor/Path.h"

using namespace robot_editor;

int main(int argc, char **argv)
{
    ros::init(argc, argv, "simple_path");
    ros::NodeHandle n;
    ros::Publisher path_pub = n.advertise<Path>("path", 1000);
    ros::Rate loop_rate(1);
    Path simple;
    ConfigInterval egyenes1, egyenes2, koriv;


//Egyenes paraméterei
    Point start, end;
    start.x = 196;
    start.y = 232;
    end.x = 75;
    end.y = 58;
    egyenes1.start = start;
    egyenes1.end = end;
    egyenes1.configIntervalType = "TCI";
    egyenes1.orientation = true;
    simple.segments.push_back(egyenes1);

//Körív paraméterei
    Point center;
    center.x = 50;
    center.y = 20;
    koriv.center = center;
    koriv.arc_start = (M_PI - atan(30.0/10.0));
    koriv.delta = -M_PI/2;
    koriv.orientation = true;
    koriv.radius = sqrt(30.0*30.0 + 10.0*10.0);
    simple.segments.push_back(koriv);

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
