/* Flex sensor + LED 
/* Analog Input
* Demonstrates analog input by reading an analog sensor on analog
* pin 0 and turning on and off a light emitting diode(LED) connected to
  digital pin 13.
* The amount of time the LED will be on and off depends on the value obtained by
* analogRead().
* Created by David Cuartielles
* Modified 16 Jun 2009
* By Tom Igoe
* http://arduino.cc/en/Tutorial/AnalogInput
* Modified 16 July, 2011
* By Amit Saha
* Current code was tested with a Flex sensor
*/
int sensorPin = 0; /*Flex sensor pin */
int ledPin = 13; /* LED pin*/

void setup() {
  pinMode(ledPin, OUTPUT);
}

void loop() {
  
  int loop=1;
  float sensorValues=0.0,delaytime;
  for(loop=1;loop <=10 ;loop++)
  {
     sensorValues = sensorValues + analogRead(sensorPin);
  }
      
  //Use the average as a delay value
  delaytime = sensorValues/10;
  
  digitalWrite(ledPin, HIGH);
  delay(delaytime);
  digitalWrite(ledPin, LOW);
  
delay(delaytime);
}


