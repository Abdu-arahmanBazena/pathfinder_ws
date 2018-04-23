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

