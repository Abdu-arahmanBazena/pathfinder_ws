#include <ros.h>
#include <path_finder/ard.h>
#include <ros/time.h>
#include <std_msgs/UInt16MultiArray.h>
#include "Ultrasonic.h" 
#include <Servo.h> 

Servo servo;

ros:: NodeHandle nh;

path_finder::ard ard_msg;

int servo_angle = 0;
void actionCallBack( const std_msgs::UInt16MultiArray& cmd_msg){

     servo_angle = cmd_msg.data[0];
     servo.write(servo_angle);
    //servo angle write 
    if(cmd_msg.data[1] == 1)
    {
      //turn left
      turnLeft();
      //stopMotors();
      
    }
    else if(cmd_msg.data[1] == 2)
    {
      //teurn right 
      turnRight();
      //stopMotors();  
    }
    else if(cmd_msg.data[1] == 3)
    {
      moveReverse();
    }
    else if(cmd_msg.data[1] == 4)
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

ros::Subscriber<std_msgs::UInt16MultiArray> sub("/cmd_vel_action", actionCallBack);

ros::Publisher arduino("/arduino_readings", &ard_msg);



//int seq;



//setup start
void setup() {
  pinMode(10 , OUTPUT);
  pinMode(13 , OUTPUT);
  
  pinMode(11 , OUTPUT);
  pinMode(12 , OUTPUT);
  //seq =0;
  servo.attach(4);
  
  nh.getHardware()->setBaud(115200);
  //ros serial node setup and init 
  nh.initNode();
  //inform the rest of the system about this node
  nh.advertise(arduino);
  nh.subscribe(sub);

}

void loop() {
 
  
  ard_msg.ult_right = getRangeUlt(8);
  
  ard_msg.ult_left = getRangeUlt(7);
  delay(2.5);
  
  ard_msg.ir_right = getRange(A0);
  ard_msg.ir_left = getRange(A1);
 
  ard_msg.compass_x = 0;
  ard_msg.compass_y = 0;
  ard_msg.compass_z = 0;
  ard_msg.servo_angle = servo_angle;
  arduino.publish( &ard_msg );
  nh.spinOnce();
  

}
