void setup() {
  size(600, 600);
}

void draw() {
  //noLoop(); //just deactivate this and it will stop
  background(128);
  drawCircles();
}

void drawCircles() {
  noStroke();
  for (int i = 0; i <= 100; i++) {
    float x = random(width); 
    float y = random(height);
    float radius = random(5, 60);
    float gray = random(0, 255);

    fill(gray);
    circle(x, y, radius * 2);
  }
}
