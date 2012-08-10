/* Multiple LED Blinking program
  Amit Saha

*/  

// constants won't change. Used here to
// set pin numbers:
const int numPins = 3;
const int ledPin [] =  {11,12,13};      // the number of the LED pins

int interval = 100;           // interval at which to blink (milliseconds)

void setup() {
  // Iterate over each of the pins and set them as output
  for(int i=0;i<numPins;i++)
    pinMode(ledPin[i], OUTPUT);
}

/* Loop until death */
void loop()
{
  for(int i=0;i<numPins;i++)
  {
    digitalWrite(ledPin[i],HIGH);
    delay(interval);
    digitalWrite(ledPin[i],LOW);
    delay(interval);
  }
}

