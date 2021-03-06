/*
 * servo1: servo1.pde
 
 * Servo control from the Serial port
 *
 * Slower, faster, Center and Stop a Servo with a LED Blinky
 * Created: 1 June, 2011, Amit Saha (http://echorand.me)
 * Adapted from http://principialabs.com/arduino-serial-servo-control/
 */

/** Adjust these values for your servo and setup, if necessary **/
int servoPin     =  2;    // control pin for servo motor
int minPulse     =  500;  // minimum servo position
int maxPulse     =  3000; // maximum servo position
int turnRate     =  10;  // servo turn rate increment (larger value, faster rate)
int refreshTime  =  20;   // time (ms) between pulses (50Hz)

int OFF=0; // This variable will be used to get/set the status of the servo

/** The Arduino will calculate these values for you **/
int centerServo;         // center servo position
int pulseWidth;          // servo pulse width
int moveServo;           // raw user input
long lastPulse   = 0;    // recorded time (ms) of the last pulse

/* LED setup*/
int ledPin=13;


void setup() {
  pinMode(ledPin, OUTPUT); // LED Blink
  pinMode(servoPin, OUTPUT);  // Set servo pin as an output pin
  centerServo = maxPulse - ((maxPulse - minPulse)/2);
  pulseWidth = 0;   
  Serial.begin(9600);
  Serial.println("      Arduino Serial Servo Control");
  Serial.println("Keys:'(s)lower' or '(f)aster', spacebar to center and o to stop");
  Serial.println();
  
  moveServo = 60;
}

void loop() {
  // wait for serial input
  if (Serial.available() > 0) {
    // read the incoming byte:
    moveServo = Serial.read();
    
    // ASCII 's' is 115, ASCII 'f' is 102, 'o' is 111, 'spacebar' is 32
    if (moveServo == 115) { pulseWidth = pulseWidth - turnRate; OFF=0;} //slower
    if (moveServo == 102) { pulseWidth = pulseWidth + turnRate;OFF=0; } //faster
    if (moveServo == 32) { pulseWidth = centerServo; OFF=0;} //center
    if (moveServo == 111) { OFF= 1;} //STOP

    // limit the servo pulse at min and max
    if (pulseWidth > maxPulse) { pulseWidth = maxPulse; }  
    if (pulseWidth < minPulse) { pulseWidth = minPulse; } 

  }

  // pulse the servo every 20 ms (refreshTime) with current pulseWidth
  // this will hold the servo's position if unchanged, or move it if changed
  if (OFF == 0)
  {
    /* Turn ON the LED*/
    digitalWrite(ledPin,HIGH);
    
    if (millis() - lastPulse >= refreshTime) {
      digitalWrite(servoPin, HIGH);   // start the pulse
      delayMicroseconds(pulseWidth);  // pulse width
      digitalWrite(servoPin, LOW);    // stop the pulse
      lastPulse = millis();           // save the time of the last pulse    
    } 
  }
  else
  {  
     /* Turn OFF the LED*/
    digitalWrite(ledPin,LOW);

    //Stop the servo    
    digitalWrite(servoPin, LOW);
  }
}
