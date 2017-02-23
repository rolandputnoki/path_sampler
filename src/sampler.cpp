//
// Created by osboxes on 11/02/17.
//

#include "ros/ros.h"
#include "std_msgs/String.h"
#include "robot_editor/Path.h"
#include "robot_editor/ConfigInterval.h"
#include "robot_editor/Config.h"
#include "path_sampler/Sampled_path.h"
#include <math.h>

#include <visualization_msgs/Marker.h>
#include <cmath>



using namespace robot_editor;
using namespace path_sampler;


void line_sampler(ConfigInterval c, Sampled_path & sp){
    Config  conf;
    double line_length = sqrt((c.start.x - c.end.x)*(c.start.x - c.end.x) + (c.start.y - c.end.y)*(c.start.y - c.end.y));
    ROS_INFO("A szakasz hossza: %lf", line_length);
    unsigned int num_of_points = line_length/10;
    double delta_x = (c.end.x - c.start.x)/num_of_points;
    double delta_y = (c.end.y - c.start.y)/num_of_points;
    double phi;
    //1. síknegyed
    if(c.start.x < c.end.x && c.start.y < c.end.y){
        double alfa =asin(fabs(c.end.y - c.start.y)/line_length)*180/M_PI;
        if(c.orientation != 0){
            phi = alfa;
        } else {
            phi = 180 + alfa;
        }
    }
        //2. síknegyed
    else if(c.start.x > c.end.x && c.start.y > c.end.y){
        double alfa =asin(fabs(c.end.y - c.start.y)/line_length)*180/M_PI;
        if(c.orientation != 0){
            phi = 180 - alfa;
        } else {
            phi = 180 - alfa + 180;
        }
    }
        //3. síknegyed
    else if(c.start.x > c.end.x && c.start.y > c.end.y){
        double alfa =asin(fabs(c.end.y - c.start.y)/line_length)*180/M_PI;
        if(c.orientation != 0){
            phi = 180 + alfa;
        } else {
            phi = alfa;
        }
    }
        //4. síknegyed
    else if(c.start.x < c.end.x && c.start.y > c.end.y){
        double alfa =asin(fabs(c.end.y - c.start.y)/line_length)*180/M_PI;
        if(c.orientation != 0){
            phi = 360 - alfa;
        } else {
            phi = 180 - alfa;
        }
    }


    ros::NodeHandle n2;
    ros::Publisher marker_pub = n2.advertise<visualization_msgs::Marker>("visualization_marker", 10);
    visualization_msgs::Marker points, line_strip, line_list;
    points.header.frame_id = line_strip.header.frame_id = line_list.header.frame_id = "/my_frame";
    points.header.stamp = line_strip.header.stamp = line_list.header.stamp = ros::Time::now();
    points.ns = line_strip.ns = line_list.ns = "points_and_lines";
    points.action = line_strip.action = line_list.action = visualization_msgs::Marker::ADD;
    points.pose.orientation.w = line_strip.pose.orientation.w = line_list.pose.orientation.w = 1.0;

    points.id = 0;
    points.type = visualization_msgs::Marker::POINTS;
    // POINTS markers use x and y scale for width/height respectively
    points.scale.x = 0.2;
    points.scale.y = 0.2;
    // Points are green
    points.color.g = 1.0;
    points.color.a = 1.0;



    for(int i = 0; i <= num_of_points; i++){
        double x = c.start.x + i*delta_x;
        double y = c.start.y + i*delta_y;
        ROS_INFO("%d. pont x: %lf y: %lf", i+1,x,y);
        conf.x = x;
        conf.y = y;
        conf.phi = phi;
        sp.sample_points.push_back(conf);

        geometry_msgs::Point p;
        p.x = x;
        p.y = y;
        p.z = 0;
        points.points.push_back(p);
    }
    geometry_msgs::Point p;
    p.x = 10;
    p.y = 10;
    p.z = 10;
    points.points.push_back(p);
    marker_pub.publish(points);
    ros::spin();
}

void arc_sampler(ConfigInterval c, Sampled_path & sp){
    Config conf;
    double circle_center_x = c.center.x;
    double circle_center_y = c.center.y;
    double radius = c.radius;
    int arc_resolution = 5;
    //Ha delta radiánban van
//    double arc_length = fabs(c.delta)*c.radius;
    double alfa = c.arc_start;    //x-tengellyel bezárt szög
    double delta_arc = fabs(c.delta)/arc_resolution;    //Lépésköz szögben
    double diff_from_start = 0;     //A körív kezdetétől mennyire vagyunk
    double delta_x;         //A körív adott pontjának x koordinátájának eltérése a kör kp.jának x koordinátájától
    double delta_y;         //A körív adott pontjának y koordinátájának eltérése a kör kp.jának y koordinátájától
    double phi;
    while(diff_from_start <= fabs(c.delta)){
        //1. síknegyed
        if(alfa <= 90){
            delta_y = sin(alfa)*radius;
            delta_x = cos(alfa)*radius;
            //Egy irányba néz az autó, ha óra mutatóval szemben előre halad, vagy ha óra mutatóval megegyezően tolat
            //és ugyanez fordítva is igaz
            if((c.delta > 0 && c.orientation != 0) || (c.delta < 0 && c.orientation == 0) ){
                phi = alfa + 90;
            } else{
                phi = alfa + 270;
            }
        }
        //2. síknegyed
        else if(alfa <= 180){
            delta_y = sin(180-alfa)*radius;
            delta_x = -cos(180-alfa)*radius;
            if((c.delta > 0 && c.orientation != 0) || (c.delta < 0 && c.orientation == 0) ){
                phi = alfa + 90;
            } else{
                phi = alfa - 90;
            }
        }
        //3. síknegyed
        else if(alfa <= 270){
            delta_y = -sin(270 - alfa)*radius;
            delta_x = -cos(270 - alfa)*radius;
            if((c.delta > 0 && c.orientation != 0) || (c.delta < 0 && c.orientation == 0) ){
                phi = alfa + 90;
            } else{
                phi = alfa - 90;
            }
        }
        //4. síknegyed
        else {
            delta_y = -sin(alfa - 270)*radius;
            delta_x = cos(alfa - 270)*radius;

            if((c.delta > 0 && c.orientation != 0) || (c.delta < 0 && c.orientation == 0) ){
                phi = alfa - 270;
            } else{
                phi = alfa - 90;
            }
        }
        conf.x = circle_center_x + delta_x;
        conf.y = circle_center_y + delta_y;
        conf.phi = phi;
        sp.sample_points.push_back(conf);
        diff_from_start += delta_arc;
        if(c.delta > 0){
            alfa += delta_arc;
            if(alfa > 360){
                alfa = alfa - 360;
            }
        } else {
            alfa -= delta_arc;
            if(alfa < 0){
                alfa = 360;
            }
        }
    }
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

    ros::NodeHandle n_publisher;
    ros::Publisher sampled_pub = n_publisher.advertise<Sampled_path>("sampled", 1000);
    sampled_pub.publish(sample);
    ros::spin();
}

int main(int argc, char **argv){
    ros::init(argc, argv, "sampler");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("path", 1000, pathCallback);
    ros::spin();
    return 0;
}