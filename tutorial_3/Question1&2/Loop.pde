
void daLoop() {
  background(255);
  colours();

  for (int i = 0; i < towerCount; i++) {
    int currentX = x1 + i * (range + 30);
    shape1(currentX, y1);

    if (i < towerCount - 1) {
      shape2(currentX);
    }
  }
}


void colours() {
  fill(c1, c2, c3);
  stroke(c1, c2, c3);
}

void shape1(int sx, int sy) {
  int x2 = sx + 15;
  int y2 = sy - 40;

  beginShape();
  vertex(sx, sy);
  vertex(x2, y2);
  vertex(x2 + 15, y2 - 90);
  vertex(x2 + 30, y2);
  vertex(sx + 60, sy);
  endShape(CLOSE);

  x3 = sx + 45;
  y3 = y2;
}

void shape2(int sx) {
  rectMode(CORNER);
  rect(sx + 45, y3, range, 40);
}
