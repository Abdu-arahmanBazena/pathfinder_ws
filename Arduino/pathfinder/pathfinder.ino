#include <ros.h>
#include <path_finder/ard.h>
#include <ros/time.h>
#include "Ultrasonic.h" 
#include <Wire.h> //I2C Arduino Library
//#include <Adafruit_HMC5883_U.h>
//#include <Servo.h> 

//Servo servo;

ros:: NodeHandle nh;

path_finder::ard ard_msg;


/*void servo_cb( const std_msgs::UInt16& cmd_msg){
  servo.write(cmd_msg.data); //set servo angle, should be from 0-180  
 // digitalWrite(13);  //toggle led  
}*/

//ros::Subscriber<std_msgs::UInt16> sub("/servo", servo_cb);

ros::Publisher arduino("/arduino_readings", &ard_msg);

const int analog_pin = A0;
const int analog_pin1 = A1;

int seq;



//setup start
void setup() {
  seq =0;
  //ros serial node setup and init 
  nh.initNode();
  //inform the rest of the system about this node
  nh.advertise(arduino);

  //compass code 


}

void loop() {
 
  seq++;
 
  
  ard_msg.frame_id = "/sensors_data";
  ard_msg.stamp=nh.now();
  ard_msg.seq = seq;
  
  
  ard_msg.ult_right = getRangeUlt(8);
  delay(250);
  ard_msg.ult_left = getRangeUlt(7);
  
  
  ard_msg.ir_right = getRange(analog_pin);
  ard_msg.ir_left = getRange(analog_pin1);
 
  
  ard_msg.compass_x = 0;
  ard_msg.compass_y = 0;
  ard_msg.compass_z = 0;
  ard_msg.servo_angle = 0;
  arduino.publish( &ard_msg );
  nh.spinOnce();
  

}
