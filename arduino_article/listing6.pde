/*Client for Serial communication*/

import processing.serial.*;

Serial myPort; // The serial port

// initial variables:
int i = 1; // counter
char inData;

void setup () {

size(400, 350); // window size

// List all the available serial ports
println(Serial.list());

// Pick up the first port, since I usually have just Arduino connected
// Please make sure the correct port is selected here
myPort = new Serial(this, Serial.list()[0], 9600);
myPort.clear();

// set inital background:

background(255); }

void draw () {

  myPort.write(4);
  //myPort.write(5);

  if (myPort.available() > 0) {
    inData = (char)myPort.read(); //Typecast it to the corresponding chracter for the
      // ASCII value
    serialEvent();
   }

}

void serialEvent () {
  System.out.println(inData);
}

