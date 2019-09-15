/*
Code by Michelle Vossen
Creative Programming Challenge 1
 */

import processing.pdf.*;
boolean raw;
int i;

void setup() {
  size(594, 841, P3D);
  stroke(0, 50);
}

void draw() {
  if (raw) {
    beginRaw(PDF, "challenge1_frame####.pdf");
  }
  // Reset frame; fill and rect are neccessary to export the file to pdf
  //fill(15, 15, 125);
  fill(#E5D3E0);
  rect(0, 0, width, height);

  // This loop determines the camera angle
  for (i = 0; i < 200; i++) {
    pushMatrix();
    camera(mouseX, mouseY, 220, 0, 0, 0, 0, 1, 0);
    
    // This loop determines the position, rotation and the shapes itself
    for (i = 0; i < 200; i++) {
      translate(noise(width) + 2, noise(height) + 5, noise(50));
      rotateX(PI/6 + sin(mouseX/(i+1)));
      rotateY(PI/3 + sin(i));

      /* Note: these elements are twodimensional, and they glitch 
      because they are drawn in the same place on the z-axis. 
      I really like this effect, so I decided to keep it. The fill 
      for element 2 makes the colours tremble, so it looks more alive 
      both as a poster and when moving in processing. You can turn off
      one or two elements to see what happens! */
      
      // Element 1
      fill(#FFC927, 50);
      strokeWeight(4);
      ellipse(0, 0, 100, 120);

      // Element 2
      fill(random(20, 60), random(0, 30), random(70, 125));    
      ellipse(0, 0, 60, 120);

      // Element 3
      fill(#A6C1A9, 80);
      strokeWeight(5);
      stroke(#FDFFB2, 100);    
      ellipse(0, 0, 60, 125);
      
      // Element 4
      fill(#D9FAD4, 50);
      noStroke();
      rect(0, 0, 50, 10);
    }
    popMatrix();
  }
  if (raw) {
    raw = false;
    endRaw();
    exit();
  }
}

// Press "r" to make a poster!
void keyPressed() {
  if (key == 'r') {
    raw = true;
  }
}