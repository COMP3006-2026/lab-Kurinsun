void setup() {
  size(600, 600);
}
void draw() {
  background(20);
  drawPattern();
}
void drawPattern() {
  pushMatrix();
  translate(width / 2, height / 2);

  float s = map(mouseX, 0, width, 10, 280);
  float petalFreq = map(mouseY, 0, height, 1, 10);

  strokeWeight(1);
  noFill();
  for (int j = 0; j < 720; j++) {
    float angle = radians(j * 0.5);
    float r = s * sin(petalFreq * angle);
    float x = r * cos(angle);
    float y = r * sin(angle);
    stroke(map(sin(angle), -1, 1, 80,  255), map(cos(angle * 2), -1, 1, 50,  180), 
           map(sin(angle * 3), -1, 1, 150, 255));
    point(x, y);
  }

  int starPoints = (int) map(mouseY, 0, height, 3, 12);
  float outerR = s * 0.9;
  float innerR = s * 0.4;
  strokeWeight(1.5);
  noFill();
  beginShape();
  for (int i = 0; i <= 720; i++) {
    float angle = radians(i * 0.5);
    float r = map(sin(starPoints * angle), -1, 1, innerR, outerR);
    float x = r * cos(angle);
    float y = r * sin(angle);
    stroke(map(cos(angle),  -1, 1, 100, 255), map(sin(angle * 2), -1, 1, 80,  220), 
           map(cos(angle * 3 + 1), -1, 1, 150, 255));
    vertex(x, y);
  }
  endShape(CLOSE);

  float spiral = map(mouseY, 0, height, 20, 80);
  strokeWeight(1);
  beginShape();
  for (float t = 0; t < TWO_PI * 20; t += 0.02) {
    float R = s * 0.6;
    float r = s * 0.2;
    float d = spiral;
    float x = (R - r) * cos(t) + d * cos((R - r) / r * t);
    float y = (R - r) * sin(t) - d * sin((R - r) / r * t);
    stroke(map(cos(t), -1, 1, 0, 100), map(sin(t * 2), -1, 1, 150, 255), 
           map(cos(t * 0.5), -1, 1, 180, 255));
    vertex(x, y);
  }
  endShape(CLOSE);
  popMatrix();
}
