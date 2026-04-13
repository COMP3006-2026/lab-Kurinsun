import peasy.*;
PeasyCam cams;

float time = 0;
float distance = 120;

void setup() {
  size(500, 500, P3D);
  noiseSeed(0);
  cams = new PeasyCam(this, 250);
  noStroke();
}

void draw() {
  background(0);
  lights();

  //The Earth
  fill(0, 63, 255);
  sphere(50);
  
  //The Moon
  pushMatrix();
  float angle = radians(time * 50);
  float x = cos(angle) * distance;
  float z = sin(angle) * distance;
  translate(x, 0, z);
  
  fill(200, 200, 220);
  sphere(5);
  popMatrix();
  
  time += 0.005;
}
