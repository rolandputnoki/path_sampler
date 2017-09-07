//
// Created by osboxes on 11/02/17.
//

#include <ros/ros.h>
#include "std_msgs/String.h"
#include "geometry_msgs/PoseArray.h"
#include "robot_editor/Path.h"
#include "robot_editor/Config.h"
#include "path_sampler/SampledSection.h"
#include "path_sampler/SampledPath.h"
#include <visualization_msgs/Marker.h>
#include <tf/transform_broadcaster.h>


double arc_points_dist = 20;
double line_points_dist = 20;
int min_num_of_sample_points = 4;


double delta_s = 20;

int FORWARD = 1;
int BACKWARD = 0;

int SCALE = 100;



using namespace robot_editor;
using namespace path_sampler;

double degre_to_rad = M_PI/180;
//double rad_to_degree = 180/M_PI;

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

/*
void line_sampler(ConfigInterval c, geometry_msgs::PoseArray & pa){
    double line_length = sqrt((c.start.x - c.end.x)*(c.start.x - c.end.x) + (c.start.y - c.end.y)*(c.start.y - c.end.y));
    ROS_INFO("A szakasz hossza: %lf", line_length);

    unsigned int num_of_points = line_length/line_points_dist;
    if(num_of_points < min_num_of_sample_points) {
        num_of_points = min_num_of_sample_points;
    }

    double delta_x = (c.end.x - c.start.x)/num_of_points;
    double delta_y = (c.end.y - c.start.y)/num_of_points;
    double phi;
    //1. síknegyed
    if(c.start.x < c.end.x && c.start.y < c.end.y){
        double alfa =asin(fabs(c.end.y - c.start.y)/line_length);
        if(c.orientation == FORWARD){
            phi = alfa;
        } else {
            phi = 180*degre_to_rad + alfa;
        }
    }
        //2. síknegyed
    else if(c.start.x > c.end.x && c.start.y < c.end.y){
        double alfa =asin(fabs(c.end.y - c.start.y)/line_length);
        if(c.orientation == FORWARD){
            phi = 180*degre_to_rad - alfa;
        } else {
            phi = 180*degre_to_rad - alfa + 180*degre_to_rad;
        }
    }
        //3. síknegyed
    else if(c.start.x > c.end.x && c.start.y > c.end.y){
        double alfa =asin(fabs(c.end.y - c.start.y)/line_length);
        if(c.orientation == FORWARD){
            phi = 180*degre_to_rad + alfa;
        } else {
            phi = alfa;
        }
    }
        //4. síknegyed
    else if(c.start.x < c.end.x && c.start.y > c.end.y){
        double alfa =asin(fabs(c.end.y - c.start.y)/line_length);
        if(c.orientation == FORWARD){
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
        p.x = x/SCALE;
        p.y = y/SCALE;
        p.z = 0;
        sample_quat = toQuaternion(0,0,phi);
        sample_pose.position = p;
        sample_pose.orientation = sample_quat;
        pa.poses.push_back(sample_pose);
    }

}
*/

void line_sampler(ConfigInterval c, SampledPath & spa){
    double line_length = sqrt((c.start.x - c.end.x)*(c.start.x - c.end.x) + (c.start.y - c.end.y)*(c.start.y - c.end.y));
    ROS_INFO("A szakasz hossza: %lf", line_length);
    unsigned int num_of_points = line_length/line_points_dist;
    if(num_of_points < min_num_of_sample_points) {
        num_of_points = min_num_of_sample_points;
    }
    double delta_x = (c.end.x - c.start.x)/num_of_points;
    double delta_y = (c.end.y - c.start.y)/num_of_points;
    double delta_s_unit = sqrt(delta_x * delta_x + delta_y*delta_y);
    double phi;
    //1. síknegyed
    if(c.start.x < c.end.x && c.start.y < c.end.y){
        double alfa =asin(fabs(c.end.y - c.start.y)/line_length);
        if(c.orientation == FORWARD){
            phi = alfa;
        } else {
            phi = 180*degre_to_rad + alfa;
        }
    }
        //2. síknegyed
    else if(c.start.x > c.end.x && c.start.y < c.end.y){
        double alfa =asin(fabs(c.end.y - c.start.y)/line_length);
        if(c.orientation == FORWARD){
            phi = 180*degre_to_rad - alfa;
        } else {
            phi = 180*degre_to_rad - alfa + 180*degre_to_rad;
        }
    }
        //3. síknegyed
    else if(c.start.x > c.end.x && c.start.y > c.end.y){
        double alfa =asin(fabs(c.end.y - c.start.y)/line_length);
        if(c.orientation == FORWARD){
            phi = 180*degre_to_rad + alfa;
        } else {
            phi = alfa;
        }
    }
        //4. síknegyed
    else if(c.start.x < c.end.x && c.start.y > c.end.y){
        double alfa =asin(fabs(c.end.y - c.start.y)/line_length);
        if(c.orientation == FORWARD){
            phi = 360*degre_to_rad - alfa;
        } else {
            phi = 180*degre_to_rad - alfa;
        }
    }
    CurvaturePoint sample_p;
    for(int i = 0; i <= num_of_points; i++) {
        geometry_msgs::Pose sample_pose;
        geometry_msgs::Quaternion sample_quat;
        double x = c.start.x + i * delta_x;
        double y = c.start.y + i * delta_y;
//        ROS_INFO("%d. pont x: %lf y: %lf", i+1,x,y);
        geometry_msgs::Point p;
        p.x = x / SCALE;
        p.y = y / SCALE;
        p.z = 0;
        sample_quat = toQuaternion(0, 0, phi);
        sample_pose.position = p;
        sample_pose.orientation = sample_quat;
        spa.sections.back().sample_vectors.poses.push_back(sample_pose);
//        sp.sample_vectors.poses.push_back(sample_pose);
        sample_p.curvature = 0;
        double previous_delta_s;
        if(spa.sections.back().sample_points.empty()){
            previous_delta_s = 0;
        } else {
            previous_delta_s = spa.sections.back().sample_points.back().position;
        }
        if(i == 0){
            delta_s = 0;
        } else {
            delta_s = delta_s_unit;
        }
        sample_p.position =  previous_delta_s + delta_s;
        spa.sections.back().sample_points.push_back(sample_p);
//        sp.sample_points.push_back(sample_p);
    }

}
/*
void arc_sampler(ConfigInterval c, geometry_msgs::PoseArray & pa){
    double circle_center_x = c.center.x;
    double circle_center_y = c.center.y;
    double radius = c.radius;
    double alfa = c.arc_start;    //x-tengellyel bezárt szög
    double delta_arc;
    if(alfa < 0){
        alfa = alfa + 2*M_PI;
    }

    double arc_lenght = radius * fabs(c.delta);
    if(arc_lenght < min_num_of_sample_points*arc_points_dist){
        delta_arc = (arc_lenght/min_num_of_sample_points)/radius;
    } else {
        delta_arc = arc_points_dist/radius;
    }

    double diff_from_start = 0;     //A körív kezdetétől mennyire vagyunk
    double delta_x;         //A körív adott pontjának x koordinátájának eltérése a kör kp.jának x koordinátájától
    double delta_y;         //A körív adott pontjának y koordinátájának eltérése a kör kp.jának y koordinátájától
    double delta_s = radius * delta_arc;
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
            if((c.delta > 0 && c.orientation == FORWARD) || (c.delta < 0 && c.orientation == BACKWARD) ){
                phi = alfa + 90*degre_to_rad;
            } else{
                phi = alfa + 270*degre_to_rad;
            }
        }
        //2. síknegyed
        else if(alfa <= 180*degre_to_rad){
            delta_y = sin(180*degre_to_rad-alfa)*radius;
            delta_x = -cos(M_PI-alfa)*radius;
            if((c.delta > 0 && c.orientation == FORWARD) || (c.delta < 0 && c.orientation == BACKWARD) ){
                phi = alfa + 90*degre_to_rad;
            } else{
                phi = alfa - 90*degre_to_rad;
            }
        }
        //3. síknegyed
        else if(alfa <= 270*degre_to_rad){
            delta_y = -cos(270*degre_to_rad - alfa)*radius;
            delta_x = -sin(270*degre_to_rad - alfa)*radius;
            if((c.delta > 0 && c.orientation == FORWARD) || (c.delta < 0 && c.orientation == BACKWARD) ){
                phi = alfa + 90*degre_to_rad;
            } else{
                phi = alfa - 90*degre_to_rad;
            }
        }
        //4. síknegyed
        else {
            delta_y = -cos(alfa - 270*degre_to_rad)*radius;
            delta_x = sin(alfa - 270*degre_to_rad)*radius;

            if((c.delta > 0 && c.orientation == FORWARD) || (c.delta < 0 && c.orientation == BACKWARD) ){
                phi = alfa - 270*degre_to_rad;
            } else{
                phi = alfa - 90*degre_to_rad;
            }
        }
        geom_point.x = (circle_center_x + delta_x)/SCALE;
        geom_point.y = (circle_center_y + delta_y)/SCALE;
        geom_point.z = 0;
        geom_pose.position = geom_point;
        geom_pose.orientation = toQuaternion(0,0,phi);
        pa.poses.push_back(geom_pose);
        diff_from_start += delta_arc;
        if(c.delta > 0){
            alfa += delta_arc;
            if(alfa > 360*degre_to_rad){
                alfa = alfa - 360*degre_to_rad;
            }
        } else {
            alfa -= delta_arc;
            if(alfa < 0){
                alfa = alfa + 360*degre_to_rad;
            }
        }
    }
}
*/

void arc_sampler(ConfigInterval c, SampledPath & spa){
    double circle_center_x = c.center.x;
    double circle_center_y = c.center.y;
    double radius = c.radius;
    double alfa = c.arc_start;    //x-tengellyel bezárt szög
    double delta_arc;

    double arc_lenght = radius * fabs(c.delta);
    if(arc_lenght < min_num_of_sample_points*arc_points_dist){
        delta_arc = (arc_lenght/min_num_of_sample_points)/radius;
    } else {
        delta_arc = arc_points_dist/radius;
    }
    double delta_s = delta_arc * radius;
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
            if((c.delta > 0 && c.orientation == FORWARD) || (c.delta < 0 && c.orientation == BACKWARD) ){
                phi = alfa + 90*degre_to_rad;
            } else{
                phi = alfa + 270*degre_to_rad;
            }
        }
            //2. síknegyed
        else if(alfa <= 180*degre_to_rad){
            delta_y = sin(180*degre_to_rad-alfa)*radius;
            delta_x = -cos(M_PI-alfa)*radius;
            if((c.delta > 0 && c.orientation == FORWARD) || (c.delta < 0 && c.orientation == BACKWARD) ){
                phi = alfa + 90*degre_to_rad;
            } else{
                phi = alfa - 90*degre_to_rad;
            }
        }
            //3. síknegyed
        else if(alfa <= 270*degre_to_rad){
            delta_y = -cos(270*degre_to_rad - alfa)*radius;
            delta_x = -sin(270*degre_to_rad - alfa)*radius;
            if((c.delta > 0 && c.orientation == FORWARD) || (c.delta < 0 && c.orientation == BACKWARD) ){
                phi = alfa + 90*degre_to_rad;
            } else{
                phi = alfa - 90*degre_to_rad;
            }
        }
            //4. síknegyed
        else {
            delta_y = -cos(alfa - 270*degre_to_rad)*radius;
            delta_x = sin(alfa - 270*degre_to_rad)*radius;

            if((c.delta > 0 && c.orientation == FORWARD) || (c.delta < 0 && c.orientation == BACKWARD) ){
                phi = alfa - 270*degre_to_rad;
            } else{
                phi = alfa - 90*degre_to_rad;
            }
        }
        geom_point.x = (circle_center_x + delta_x)/SCALE;
        geom_point.y = (circle_center_y + delta_y)/SCALE;
        geom_point.z = 0;
        geom_pose.position = geom_point;
        geom_pose.orientation = toQuaternion(0,0,phi);
        CurvaturePoint sample_p;
        if(c.delta > 0){
            sample_p.curvature = 1/radius;
        } else {
            sample_p.curvature = -1/radius;
        }

        double previous_delta_s;
        if(spa.sections.back().sample_points.empty()){
            previous_delta_s = 0;
        } else {
            previous_delta_s = spa.sections.back().sample_points.back().position;
        }
        if(diff_from_start == 0){
            delta_s = 0;
        } else {
            delta_s = delta_arc * radius;
        }
        sample_p.position =  previous_delta_s + delta_s;
        spa.sections.back().sample_vectors.poses.push_back(geom_pose);
        spa.sections.back().sample_points.push_back(sample_p);
//        sp.sample_vectors.poses.push_back(geom_pose);
//       sp.sample_points.push_back(sample_p);
        diff_from_start += delta_arc;
        if(c.delta > 0){
            alfa += delta_arc;
            if(alfa > 360*degre_to_rad){
                alfa = alfa - 360*degre_to_rad;
            }
        } else {
            alfa -= delta_arc;
            if(alfa < 0){
                alfa = alfa + 360*degre_to_rad;
            }
        }
    }
}

void pathCallback(const Path p)
{
    unsigned long len = p.segments.size();
    SampledSection sample;
    SampledPath s_path;
    s_path.sections.push_back(sample);
    geometry_msgs::PoseArray pose_array;
    int section_count = 1;
    for(int i = 0; i < len; i++){
        if(i > 0){
            if(p.segments[i].orientation != p.segments[i-1].orientation){
                section_count++;
                s_path.sections.push_back(sample);
            }
        }
            if (p.segments[i].configIntervalType == "TCI") {
                line_sampler(p.segments[i], s_path);
            } else {
                arc_sampler(p.segments[i], s_path);
            }
    }
    ROS_INFO("%d", section_count);
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
    int sections_number = s_path.sections.size();
    int j = 0;

    geometry_msgs::PoseArray Plotting;
    for(j = 0; j <sections_number; j++){
        size_t section_length = s_path.sections[j].sample_vectors.poses.size();
        for(size_t l = 0; l< section_length; l++){
            Plotting.poses.push_back(s_path.sections[j].sample_vectors.poses[l]);
        }
    }
    Plotting.header.frame_id = "/my_frame";
    Plotting.header.stamp = ros::Time::now();
    pose_pub.publish(Plotting);

    /*
    while(j < sections_number+1){
        sample = s_path.sections[j];
        sample.sample_vectors.header.frame_id = "/my_frame";
        sample.sample_vectors.header.stamp = ros::Time::now();
        pose_pub.publish(sample.sample_vectors);
        ros::Duration(4).sleep();
        j++;
    }
     */
    /*
    sample = s_path.sections.back();
    sample.sample_vectors.header.frame_id = "/my_frame";
    sample.sample_vectors.header.stamp = ros::Time::now();
    pose_pub.publish(sample.sample_vectors);
     */
    ros::Publisher sampled_path = n2.advertise<path_sampler::SampledPath>("Sampled_path", 100);
    sampled_path.publish(s_path);
    ros::spin();

}

int main(int argc, char **argv){
    ros::init(argc, argv, "sampler");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("path", 1000, pathCallback);
    ros::spin();
    return 0;
}