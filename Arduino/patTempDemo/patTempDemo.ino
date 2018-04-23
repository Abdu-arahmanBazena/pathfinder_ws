#include "Ultrasonic.h" 
#include <Servo.h>
Servo myservo;  // create servo object to control a servo
int IR_LEFT = 0; 
int IR_RIGHT = 0; 
int seq; 
int pos = 0;    // variable to store the servo position

void setup() {
  Serial.begin(9600);
  myservo.attach(9);  // attaches the servo on pin 9 to the servo object
  pinMode(10 , OUTPUT);
  pinMode(13 , OUTPUT);
  
  pinMode(11 , OUTPUT);
  pinMode(12 , OUTPUT);
  seq =10;
}

void loop() {
  // put your main code here, to run repeatedly:
  float ir_right = getRange(0);
  float ir_left = getRange(1);
  if(seq == 0)
  {
    IR_LEFT = ir_left;
    IR_RIGHT= ir_right;
    turnLeft();
    seq = 100;
  }
  delay(250);
  float ult_left = getRangeUlt(7);
  delay(250);
  float ult_right = getRangeUlt(8);
  if(ir_right > IR_RIGHT + 10 || ir_left > IR_LEFT+10)
  {
    avoidDrop();
  }
  if(ult_left <= 80 || ult_right <= 80)
  {
    avoidObs();
  }
  
  

}
















float getRange(int pin_num){
    int sample;
    // Get data
    sample = analogRead(pin_num)/4;
    // if the ADC reading is too low, 
    //   then we are really far away from anything
    if(sample < 10)
    {
       return 254;     // max range
    }
    else 
    {
       sample =1309/(sample-3);
    } 
    // Magic numbers to get cm
   
    return sample; //convert to meters
}


float getRangeUlt( int pin)
{
  Ultrasonic ultrasonic;
  return ultrasonic.UltrasonicRangerRead(pin);  
}


void moveServo(int pos)
{
   myservo.write(pos);  
}
void moveForward()
{
  digitalWrite(10 , LOW);
  digitalWrite(11 , HIGH);
  
  digitalWrite(12 , LOW);
  digitalWrite(13 , HIGH);
  
}
void moveBack()
{
   digitalWrite(10 , HIGH);
  digitalWrite(11 , LOW);
  
  digitalWrite(12 , HIGH);
  digitalWrite(13 , LOW);  
}
void turnRight()
{
    digitalWrite(10 , LOW);
    digitalWrite(11 , HIGH);
    
    digitalWrite(13 , LOW);
    digitalWrite(12 , LOW);
 
   
}
void turnLeft()
{
    digitalWrite(10 , LOW);
    digitalWrite(11 , LOW);
    
    digitalWrite(13 , HIGH);
    digitalWrite(12 , LOW); 
    delay(2.5); 
}
void avoidObs()
{
  
}
void avoidDrop()
{
  
}
