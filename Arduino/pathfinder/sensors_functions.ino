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
int getdirection()
{
    Adafruit_HMC5883_Unified mag = Adafruit_HMC5883_Unified(12345);
    mag.begin()
    sensors_event_t event; 
    mag.getEvent(&event);
    float heading = atan2(event.magnetic.y, event.magnetic.x);
    float declinationAngle = 0.22;
    heading += declinationAngle;
    // Correct for when signs are reversed.
    if(heading < 0)
      heading += 2*PI;
    
    // Check for wrap due to addition of declination.
    if(heading > 2*PI)
      heading -= 2*PI;
   
    // Convert radians to degrees for readability.
    float headingDegrees = heading * 180/M_PI; 
    return headingDegrees;
}

