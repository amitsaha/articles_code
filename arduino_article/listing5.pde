/* Serial communication demo: +1*/

/* Server program*/

int number;

void setup() 
{ 
  // Open the serial connection, 9600 baud
  Serial.begin(9600);
 } 

void loop() 
{ 
  // Get the data "packet" 
  // Wait for some data to arrive  
  if (Serial.available()>1) {
      //operation=Serial.read();
      number=Serial.read();
     
      Serial.println(number + 1);      
    }  
    
}
