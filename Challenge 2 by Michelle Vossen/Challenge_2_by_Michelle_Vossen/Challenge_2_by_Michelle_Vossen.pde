/**
  Creative Programming Challenge 2 by Michelle Vossen
    ***
  A diptych mixed media artwork with interactive lights
    ***
  This is the right side of the diptych. The left side is the dress; I put a picture of it in the folder. Look at it do its magic in the video.
*/

import processing.serial.*;
Serial myPort;
int val;

// Colors
final int darkBlue = #111d53;
final int lightBlue = #a2a7b1;
final int red = #A21A1A;
final int darkRed = #6C3339;
final int camel = #987044;
final int darkCamel = #765736;
final int offWhite = #fafcf1;

float[] offset;
float[] offset2;

void setup() {
  size(800, 950);
  background(darkBlue);
  
  // For communication with Arduino; I commented it because when the Arduino is not connected, Processing goes haywire.
  //String portName = Serial.list()[0];
  //myPort = new Serial(this, portName, 9600);
  
  // These are two arrays of 800 random numbers between 0 and 7. I use these to create the irregular lines of all shapes in the illustration.
  offset = new float[width];
  for (int Xpos = 0; Xpos < offset.length; Xpos ++) {
    offset[Xpos] = random(7);
  }
  offset2 = new float[width];
  for (int Xpos = 0; Xpos < offset2.length; Xpos ++) {
    offset2[Xpos] = random(7);
  }
  println(offset);
  println(offset2);
}

void draw() {
  noStroke();
  fill(darkBlue);
  rect(0, 0, width, height);

  // Rays from the left. Move the cursor around the canvas to see the effect!
  pushMatrix();
  translate(-width/3, height/3);
  rotate(mouseY);
  float opacity = random(130, 150);
  stroke(lightBlue, opacity);
  strokeWeight(40);
  line(0, 0, 800, 950);
  popMatrix();

  pushMatrix();
  translate(-width/3, height/3);
  rotate(mouseX);
  stroke(lightBlue, opacity);
  strokeWeight(40);
  line(0, 0, 800, 950);
  popMatrix();

  pushMatrix();
  translate(-width/3, height/3);
  rotate(mouseX + mouseY);
  stroke(lightBlue, opacity);
  strokeWeight(40);
  line(0, 0, 800, 950);
  popMatrix();


  // Mountain back 
  fill(darkCamel);
  stroke(darkCamel);
  strokeWeight(10);
  beginShape();
  for (int Xpos = 0; Xpos < offset.length; Xpos += 5) {
    vertex(300 - Xpos, Xpos - offset[Xpos] + 300);
  }
  for (int Xpos = 0; Xpos < offset2.length; Xpos += 5) {
    vertex(300 + Xpos, 300 + Xpos - offset2[Xpos]);
  }
  vertex(5, 603);
  endShape();

  // Mountain back shadow
  fill(darkRed);
  stroke(darkRed);
  beginShape();  
  for (int Xpos = 0; Xpos < offset2.length; Xpos += 5) {
    vertex(300 + Xpos, 300 + Xpos - offset2[Xpos]);
  }
  vertex(355, 605);
  endShape();

  fill(camel);
  stroke(camel);
  beginShape();
  for (int Xpos = 0; Xpos < offset.length; Xpos += 3) {
    vertex(Xpos, 500 + offset[Xpos]);
  }
  vertex(800, 950);
  vertex(0, 950);
  endShape();

  // Mountain
  beginShape();
  for (int Xpos = 0; Xpos < offset.length; Xpos += 5) {
    vertex(600 - Xpos, Xpos - offset[Xpos] + 200);
  }
  for (int Xpos = 0; Xpos < offset2.length; Xpos += 5) {
    vertex(600 + Xpos, 200 + Xpos - offset2[Xpos]);
  }
  vertex(205, 603);
  endShape();

  // Mountain shadow
  fill(red);
  stroke(red);
  beginShape();
  for (int Xpos = 0; Xpos < offset2.length; Xpos += 5) {
    vertex(600 + Xpos, 200 + Xpos - offset2[Xpos]);
  }
  vertex(705, 605);
  endShape();

  // "Sand waves"
  fill(offWhite);
  stroke(offWhite);
  beginShape();
  for (int Xpos = 0; Xpos < offset.length; Xpos += 20) {
    vertex(Xpos, 750 + offset[Xpos]);
  }
  vertex(width + 40, 770);
  for (int Xpos = offset2.length - 1; Xpos > 0; Xpos -= 25) {
    vertex(Xpos, 750 - offset2[Xpos]);
  }
  vertex(0, 750);
  endShape();  


  beginShape();
  for (int Xpos = 0; Xpos < offset.length; Xpos += 30) {
    vertex(Xpos, 600 + offset[Xpos]);
  }
  vertex(width + 160, 670);
  for (int Xpos = offset2.length - 1; Xpos > 0; Xpos -= 30) {
    vertex(Xpos, 670 - offset2[Xpos]);
  }
  vertex(0, 670);
  endShape();


  beginShape();
  for (int Xpos = 0; Xpos < offset.length; Xpos += 5) {
    vertex(Xpos, 850 + offset[Xpos]);
  }
  vertex(width + 40, 850);
  for (int Xpos = offset2.length - 1; Xpos > 0; Xpos -= 5) {
    vertex(Xpos, 840 - offset2[Xpos]);
  }
  vertex(0, 840);
  endShape();  


  beginShape();
  for (int Xpos = 0; Xpos < offset.length; Xpos += 5) {
    vertex(Xpos, 850 + offset[Xpos]);
  }
  vertex(width + 40, 850);
  for (int Xpos = offset2.length - 1; Xpos > 0; Xpos -= 5) {
    vertex(Xpos, 840 - offset2[Xpos]);
  }
  vertex(0, 840);
  endShape();  


  beginShape();
  for (int Xpos = 0; Xpos < offset.length; Xpos += 10) {
    vertex(Xpos, 900 + offset[Xpos]);
  }
  vertex(width + 40, 950);
  vertex(0, 950);
  endShape();
}

// When you press 1, 2, 3 or 4, different parts of the dress light up. When you press 5, all LEDs fade in and out together.
void keyPressed() {
  if (key == '1' || key == '2' || key == '3' || key == '4' || key == '5') {
    // Sends the key pressed to the Arduino; I commented it because when the Arduino is not connected, Processing goes haywire.
    //myPort.write(key);
    println("it works!");
  }
}