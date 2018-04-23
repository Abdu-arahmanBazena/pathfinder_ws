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

void moveForward()
{
  digitalWrite(10 , LOW);
  digitalWrite(11 , HIGH);
  
  digitalWrite(12 , LOW);
  digitalWrite(13 , HIGH);
  
}


void stopMotors()
{
  digitalWrite(10 , LOW);
  digitalWrite(11 , LOW);
  
  digitalWrite(12 , LOW);
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
