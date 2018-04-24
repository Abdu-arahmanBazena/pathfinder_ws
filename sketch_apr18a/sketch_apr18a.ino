#include <ros.h>
#include <path_finder/ard.h>
#include <ros/time.h>
#include <std_msgs/UInt16.h>
#include "Ultrasonic.h" 
#include <Wire.h> //I2C Arduino Library

#define address 0x1E //0011110b, I2C 7bit address of HMC5883

//#include <Servo.h> 

//Servo servo;

ros:: NodeHandle nh;

path_finder::ard ard_msg;


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
      stopMotors();  
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
  //Put the HMC5883 IC into the correct operating mode
  Wire.beginTransmission(address); //open communication with HMC5883
  Wire.write(0x02); //select mode register
  Wire.write(0x00); //continuous measurement mode
  Wire.endTransmission();

}

void loop() {
  const int analog_pin = A0;
  const int analog_pin1 = A1;
  seq++;
 
  int x,y,z; //triple axis data

  //Tell the HMC5883L where to begin reading data
  Wire.beginTransmission(address);
  Wire.write(0x03); //select register 3, X MSB register
  Wire.endTransmission();
  
  ard_msg.frame_id = "/sensors_data";
  ard_msg.stamp=nh.now();
  ard_msg.seq = seq;
  
  
  ard_msg.ult_right = getRangeUlt(8);
  
  ard_msg.ult_left = getRangeUlt(7);
  
  
  ard_msg.ir_right = getRange(analog_pin);
  ard_msg.ir_left = getRange(analog_pin1);
 Wire.requestFrom(address, 6);
  if(6<=Wire.available()){
    x = Wire.read()<<8; //X msb
    x |= Wire.read(); //X lsb
    z = Wire.read()<<8; //Z msb
    z |= Wire.read(); //Z lsb
    y = Wire.read()<<8; //Y msb
    y |= Wire.read(); //Y lsb
  }
  ard_msg.compass_x = x;
  ard_msg.compass_y = y;
  ard_msg.compass_z = z;
  ard_msg.servo_angle = 0;
  arduino.publish( &ard_msg );
  nh.spinOnce();
  

}
