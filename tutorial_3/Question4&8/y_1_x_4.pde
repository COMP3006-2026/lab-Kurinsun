void setup() {
  size(600, 600);
  background(255);
  drawAxes();
  drawCurve();
}

void drawAxes() {
  stroke(0);
  strokeWeight(2);
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
}

void drawCurve() {
  stroke(0, 0, 255);
  strokeWeight(2);
  noFill();

  beginShape();
  for (float x = -5; x <= 5; x += 0.01) {
    float y = 1 - pow(x, 4);

    float sx = map(x, -4, 4, 0, width);
    float sy = map(y, -4, 4, height, 0);

    vertex(sx, sy);
  }
  
  
  endShape();
}
