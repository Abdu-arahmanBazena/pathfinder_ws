#include <ros.h>
#include <path_finder/ard.h>
#include <ros/time.h>
#include <std_msgs/UInt16.h>
#include "Ultrasonic.h" 
#include <Wire.h> //I2C Arduino Library
#include <Arduino.h>
#include <HMC5883L_Simple.h>

//#include <Servo.h> 

//Servo servo;

ros:: NodeHandle nh;

path_finder::ard ard_msg;
// Create a compass
HMC5883L_Simple Compass;

void actionCallBack( const std_msgs::UInt16& cmd_msg){

    if(cmd_msg.data == 1)
    {
      //turn left
      turnLeft();
      //stopMotors();
      
    }
    else if(cmd_msg.data == 2)
    {
      //teurn right 
      turnRight();
      //stopMotors();  
    }
    else if(cmd_msg.data == 3)
    {
      moveReverse();
    }
    else if(cmd_msg.data == 4)
    {
       moveForward();
    }
    else
    {
      //stop
      stopMotors();
    }
    
  
  //servo.write(cmd_msg.data); //set servo angle, should be from 0-180  
 // digitalWrite(13);  //toggle led  
}

ros::Subscriber<std_msgs::UInt16> sub("/cmd_vel_action", actionCallBack);

ros::Publisher arduino("/arduino_readings", &ard_msg);



int seq;



//setup start
void setup() {
  pinMode(10 , OUTPUT);
  pinMode(13 , OUTPUT);
  
  pinMode(11 , OUTPUT);
  pinMode(12 , OUTPUT);
  seq =0;
  nh.getHardware()->setBaud(115200);
  //ros serial node setup and init 
  nh.initNode();
  //inform the rest of the system about this node
  nh.advertise(arduino);
  nh.subscribe(sub);
  //compass code 
  Wire.begin();
  Compass.SetDeclination(3, 4, 'E');
  Compass.SetSamplingMode(COMPASS_SINGLE);
  Compass.SetScale(COMPASS_SCALE_130);
  Compass.SetOrientation(COMPASS_HORIZONTAL_X_NORTH);

}

void loop() {
  const int analog_pin = A0;
  const int analog_pin1 = A1;
  seq++;

  ard_msg.frame_id = "/sensors_data";
  ard_msg.stamp=nh.now();
  ard_msg.seq = seq;
  
  
  ard_msg.ult_right = getRangeUlt(8);
  
  ard_msg.ult_left = getRangeUlt(7);
  
  
  ard_msg.ir_right = getRange(analog_pin);
  ard_msg.ir_left = getRange(analog_pin1);
 
  ard_msg.compass_x = Compass.GetHeadingDegrees();
  ard_msg.compass_y = 0;
  ard_msg.compass_z = 0;
  ard_msg.servo_angle = 0;
  arduino.publish( &ard_msg );
  nh.spinOnce();
  

}
