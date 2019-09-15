/**
  Creative Programming Challenge 2 by Michelle Vossen
    ***
  A diptych mixed media artwork with interactive lights
    ***
  This has to be uploaded to the Arduino for the Processing file to do its magic
*/

// Set up all LED pins, grouped by color on the dress
int ledSun = 10;
int ledStripes1 = 9;
int ledStripes2 = 17;

int ledRays1 = 3;
int ledRays2 = 19;

int ledCamelLeft = 15;
int ledCamelRight = 6;
int ledCamelBottom = 18;

int ledFace = 5;
int ledBody = 11;

// Variables for case 5
int brightness = 0;
int fade = 5;

// For Serial.read
char val;

void setup() {
  //Starts communication with Processing
  Serial.begin(9600);

  // Set up all pins with the LEDs
  pinMode(ledSun, OUTPUT);
  pinMode(ledRays1, OUTPUT);
  pinMode(ledRays2, OUTPUT);
  pinMode(ledCamelLeft, OUTPUT);
  pinMode(ledCamelRight, OUTPUT);
  pinMode(ledCamelBottom, OUTPUT);
  pinMode(ledStripes1, OUTPUT);
  pinMode(ledStripes2, OUTPUT);
  pinMode(ledBody, OUTPUT);
  pinMode(ledFace, OUTPUT);
}

void loop() {
  //If data is available to read, it is stored and read in val
  while (Serial.available()) {
    val = Serial.read();
  }

  //When you press a button (1, 2, 3 or 4) in the Processing file, the LEDs in places with the same color light up. When you press 5, all LEDs fade in and out together.
  switch (val) {
    case '1':
      // Light up the sun, stripes and the face
      analogWrite(ledSun, 255);
      analogWrite(ledRays1, 0);
      analogWrite(ledRays2, 0);
      analogWrite(ledStripes1, 255);
      analogWrite(ledStripes2, 255);
      analogWrite(ledCamelLeft, 0);
      analogWrite(ledCamelRight, 0);
      analogWrite(ledCamelBottom, 0);
      analogWrite(ledBody, 0);
      analogWrite(ledFace, 0);
      break;
    case '2':
      // Light up the rays
      analogWrite(ledSun, 0);
      analogWrite(ledRays1, 255);
      analogWrite(ledRays2, 255);
      analogWrite(ledStripes1, 0);
      analogWrite(ledStripes2, 0);
      analogWrite(ledCamelLeft, 0);
      analogWrite(ledCamelRight, 0);
      analogWrite(ledCamelBottom, 0);
      analogWrite(ledBody, 0);
      analogWrite(ledFace, 0);
      break;
    case '3':
      // Light up the waves
      analogWrite(ledSun, 0);
      analogWrite(ledRays1, 0);
      analogWrite(ledRays2, 0);
      analogWrite(ledStripes1, 0);
      analogWrite(ledStripes2, 0);
      analogWrite(ledCamelLeft, 255);
      analogWrite(ledCamelRight, 255);
      analogWrite(ledCamelBottom, 255);
      analogWrite(ledBody, 0);
      analogWrite(ledFace, 0);
      break;
    case '4':
      // Light up the body
      analogWrite(ledSun, 0);
      analogWrite(ledRays1, 0);
      analogWrite(ledRays2, 0);
      analogWrite(ledStripes1, 0);
      analogWrite(ledStripes2, 0);
      analogWrite(ledCamelLeft, 0);
      analogWrite(ledCamelRight, 0);
      analogWrite(ledCamelBottom, 0);
      analogWrite(ledBody, 255);
      analogWrite(ledFace, 255);
      break;
    default:
      // Change the brightness
      brightness = brightness + fade;
      // Reverse the direction at the ends
      if (brightness <= 0 || brightness >= 255) {
        fade = -fade;
      }
      delay(30);

      // Let all elements fade
      analogWrite(ledSun, brightness);
      analogWrite(ledRays1, brightness);
      analogWrite(ledRays2, brightness);
      analogWrite(ledStripes1, brightness);
      analogWrite(ledStripes2, brightness);
      analogWrite(ledCamelLeft, brightness);
      analogWrite(ledCamelRight, brightness);
      analogWrite(ledCamelBottom, brightness);
      analogWrite(ledBody, brightness);
      analogWrite(ledFace, brightness);
      break;
  }
}
