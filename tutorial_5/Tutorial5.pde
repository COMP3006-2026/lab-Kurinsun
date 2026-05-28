void level5(){
  background(70);
  int h = hour();
  int m = minute();
  int s = second();
  
  // Center of clock
  float cx = width / 2;
  float cy = height / 2;
  
  // Draw clock face
  fill(240);
  stroke(0);
  strokeWeight(3);
  circle(cx, cy, 300);
  
  // Draw the minutes line
  for (int i = 0; i < 60; i++) {
    float angle = map(i, 0, 60, 0, TWO_PI) - HALF_PI;
    float x1 = cx + cos(angle) * 138;
    float y1 = cy + sin(angle) * 138;
    float x2 = cx + cos(angle) * 145;
    float y2 = cy + sin(angle) * 145;
    stroke(100);
    strokeWeight(1);
    line(x1, y1, x2, y2);
  }
  
    // Draw the hours line
  for (int i = 0; i < 12; i++) {
    float angle = map(i, 0, 12, 0, TWO_PI) - HALF_PI;
    float x1 = cx + cos(angle) * 130;
    float y1 = cy + sin(angle) * 130;
    float x2 = cx + cos(angle) * 145;
    float y2 = cy + sin(angle) * 145;
    stroke(30);
    strokeWeight(3);
    line(x1, y1, x2, y2);
  }

  //hours moving (slowlym instead of instan jump)
  float hourAngle = map(h % 12 + m / 60.0, 0, 12, 0, TWO_PI) - HALF_PI;
  float hx = cx + cos(hourAngle) * 70;
  float hy = cy + sin(hourAngle) * 70;
  stroke(30);
  strokeWeight(6);
  line(cx, cy, hx, hy);

  //minutes move (same as hours)
  float minAngle = map(m + s / 60.0, 0, 60, 0, TWO_PI) - HALF_PI;
  float mx = cx + cos(minAngle) * 100;
  float my = cy + sin(minAngle) * 100;
  stroke(30);
  strokeWeight(4);
  line(cx, cy, mx, my);

  //seconds move (...)
  float secAngle = map(s, 0, 60, 0, TWO_PI) - HALF_PI;
  float sx = cx + cos(secAngle) * 120;
  float sy = cy + sin(secAngle) * 120;
  stroke(0);
  strokeWeight(1);
  line(cx, cy, sx, sy);
}
