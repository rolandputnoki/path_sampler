//
// Created by osboxes on 11/02/17.
//

#include <ros/ros.h>
#include "std_msgs/String.h"
#include "geometry_msgs/PoseArray.h"
#include "robot_editor/Path.h"
#include "robot_editor/Config.h"
#include "path_sampler/Sampled_path.h"
#include <visualization_msgs/Marker.h>
#include <tf/transform_broadcaster.h>


double arc_points_dist = 10;
double line_points_dist = 10;

using namespace robot_editor;
using namespace path_sampler;

double degre_to_rad = M_PI/180;
double rad_to_degree = 180/M_PI;

//y_rot, x_rot és z_Rot radiánban adandó meg
geometry_msgs::Quaternion toQuaternion(double y_rot, double x_rot, double z_rot)
{
    geometry_msgs::Quaternion q;
    double t0 = std::cos(z_rot * 0.5);
    double t1 = std::sin(z_rot * 0.5);
    double t2 = std::cos(x_rot * 0.5);
    double t3 = std::sin(x_rot * 0.5);
    double t4 = std::cos(y_rot * 0.5);
    double t5 = std::sin(y_rot * 0.5);

    q.w = t0 * t2 * t4 + t1 * t3 * t5;
    q.x = t0 * t3 * t4 - t1 * t2 * t5;
    q.y = t0 * t2 * t5 + t1 * t3 * t4;
    q.z = t1 * t2 * t4 - t0 * t3 * t5;
    return q;
}

void line_sampler(ConfigInterval c, geometry_msgs::PoseArray & pa){
    double line_length = sqrt((c.start.x - c.end.x)*(c.start.x - c.end.x) + (c.start.y - c.end.y)*(c.start.y - c.end.y));
    ROS_INFO("A szakasz hossza: %lf", line_length);
    unsigned int num_of_points = line_length/line_points_dist;
    double delta_x = (c.end.x - c.start.x)/num_of_points;
    double delta_y = (c.end.y - c.start.y)/num_of_points;
    double phi;
    //1. síknegyed
    if(c.start.x < c.end.x && c.start.y < c.end.y){
        double alfa =asin(fabs(c.end.y - c.start.y)/line_length);
        if(!c.orientation){
            phi = alfa;
        } else {
            phi = 180*degre_to_rad + alfa;
        }
    }
        //2. síknegyed
    else if(c.start.x > c.end.x && c.start.y > c.end.y){
        double alfa =asin(fabs(c.end.y - c.start.y)/line_length);
        if(!c.orientation){
            phi = 180*degre_to_rad - alfa;
        } else {
            phi = 180*degre_to_rad - alfa + 180*degre_to_rad;
        }
    }
        //3. síknegyed
    else if(c.start.x > c.end.x && c.start.y > c.end.y){
        double alfa =asin(fabs(c.end.y - c.start.y)/line_length);
        if(!c.orientation){
            phi = 180*degre_to_rad + alfa;
        } else {
            phi = alfa;
        }
    }
        //4. síknegyed
    else if(c.start.x < c.end.x && c.start.y > c.end.y){
        double alfa =asin(fabs(c.end.y - c.start.y)/line_length);
        if(!c.orientation){
            phi = 360*degre_to_rad - alfa;
        } else {
            phi = 180*degre_to_rad - alfa;
        }
    }

    for(int i = 0; i <= num_of_points; i++){
        geometry_msgs::Pose sample_pose;
        geometry_msgs::Quaternion sample_quat;
        double x = c.start.x + i*delta_x;
        double y = c.start.y + i*delta_y;
//        ROS_INFO("%d. pont x: %lf y: %lf", i+1,x,y);
        geometry_msgs::Point p;
        p.x = x;
        p.y = y;
        p.z = 0;
        sample_quat = toQuaternion(0,0,phi);
        sample_pose.position = p;
        sample_pose.orientation = sample_quat;
        pa.poses.push_back(sample_pose);
    }

}


void arc_sampler(ConfigInterval c, geometry_msgs::PoseArray & pa){
    double circle_center_x = c.center.x;
    double circle_center_y = c.center.y;
    double radius = c.radius;
    double alfa = c.arc_start;    //x-tengellyel bezárt szög
    if(alfa < 0){
        alfa = alfa + 2*M_PI;
    }

    double arc_lenght = radius * fabs(c.delta);
    int arc_resolution = arc_lenght/arc_points_dist;
    double delta_arc = fabs(c.delta*180/M_PI)/arc_resolution;    //Lépésköz szögben

    double diff_from_start = 0;     //A körív kezdetétől mennyire vagyunk
    double delta_x;         //A körív adott pontjának x koordinátájának eltérése a kör kp.jának x koordinátájától
    double delta_y;         //A körív adott pontjának y koordinátájának eltérése a kör kp.jának y koordinátájától
    double phi;
    geometry_msgs::Point geom_point;
    geometry_msgs::Pose geom_pose;
    while(diff_from_start <= fabs(c.delta)){
        //1. síknegyed
        if(alfa <= 90*degre_to_rad){
            delta_y = sin(alfa)*radius;
            delta_x = cos(alfa)*radius;
            //Egy irányba néz az autó, ha óra mutatóval szemben előre halad, vagy ha óra mutatóval megegyezően tolat
            //és ugyanez fordítva is igaz
            if((c.delta > 0 && c.orientation != 1) || (c.delta < 0 && c.orientation == 1) ){
                phi = alfa + 90*degre_to_rad;
            } else{
                phi = alfa + 270*degre_to_rad;
            }
        }
        //2. síknegyed
        else if(alfa <= 180*degre_to_rad){
            delta_y = sin(180*degre_to_rad-alfa)*radius;
            delta_x = -cos(M_PI-alfa)*radius;
            if((c.delta > 0 && c.orientation != 1) || (c.delta < 0 && c.orientation == 1) ){
                phi = alfa + 90*degre_to_rad;
            } else{
                phi = alfa - 90*degre_to_rad;
            }
        }
        //3. síknegyed
        else if(alfa <= 270*degre_to_rad){
            delta_y = -cos(270*degre_to_rad - alfa)*radius;
            delta_x = -sin(270*degre_to_rad - alfa)*radius;
            if((c.delta > 0 && c.orientation != 1) || (c.delta < 0 && c.orientation == 1) ){
                phi = alfa + 90*degre_to_rad;
            } else{
                phi = alfa - 90*degre_to_rad;
            }
        }
        //4. síknegyed
        else {
            delta_y = -cos(alfa - 270*degre_to_rad)*radius;
            delta_x = sin(alfa - 270*degre_to_rad)*radius;

            if((c.delta > 0 && c.orientation != 1) || (c.delta < 0 && c.orientation == 1) ){
                phi = alfa - 270*degre_to_rad;
            } else{
                phi = alfa - 90*degre_to_rad;
            }
        }
        geom_point.x = circle_center_x + delta_x;
        geom_point.y = circle_center_y + delta_y;
        geom_point.z = 0;
        geom_pose.position = geom_point;
        geom_pose.orientation = toQuaternion(0,0,phi);
        pa.poses.push_back(geom_pose);
        diff_from_start += delta_arc*degre_to_rad;
        if(c.delta > 0){
            alfa += delta_arc*degre_to_rad;
            if(alfa > 360*degre_to_rad){
                alfa = alfa - 360*degre_to_rad;
            }
        } else {
            alfa -= delta_arc*degre_to_rad;
            if(alfa < 0){
                alfa = alfa + 360*degre_to_rad;
            }
        }
    }
}

void pathCallback(const Path p)
{
    unsigned long len = p.segments.size();
    Sampled_path sample;
    geometry_msgs::PoseArray pose_array;
//    ROS_INFO("The lenght of path's segments array is %lu", len);
    for(int i = 0; i < len; i++){

//        if(i == 5) {
            if (p.segments[i].configIntervalType == "TCI") {
//            ROS_INFO("Ez egy szakasz");
                line_sampler(p.segments[i], pose_array);
//            ROS_INFO("Az egyenest : %lu pontra osztottuk", sample.sample_points.size());
            } else {
                arc_sampler(p.segments[i], pose_array);
            }
//            ROS_INFO("Ez egy koriv");
// }
    }
    tf::TransformBroadcaster br;
    tf::Transform transform;
    transform.setOrigin( tf::Vector3(0,0, 0) );
    tf::Quaternion q;
    geometry_msgs::Quaternion temp = toQuaternion(0,0,0);
    q.setX(temp.x);
    q.setY(temp.y);
    q.setZ(temp.z);
    q.setW(temp.w);
    transform.setRotation(q);
    br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "my_frame"));
    ros::NodeHandle n2;
    ros::Publisher pose_pub = n2.advertise<geometry_msgs::PoseArray>("pose_array", 100);
    pose_array.header.frame_id = "/my_frame";
    pose_array.header.stamp = ros::Time::now();
    pose_pub.publish(pose_array);
    ros::spin();
}

int main(int argc, char **argv){
    ros::init(argc, argv, "sampler");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("path", 1000, pathCallback);
    ros::spin();
    return 0;
}