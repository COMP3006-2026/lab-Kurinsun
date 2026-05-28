void drawOutlineText(String txt, float x, float y, int size, color col, color outCol, boolean hovered) {
  if (hovered) {
    textSize(size + 5);
    fill(outCol);
    text(txt, x - 2, y - 2);
    text(txt, x + 2, y - 2);
    text(txt, x - 2, y + 2);
    text(txt, x + 2, y + 2);
    fill(col);
    text(txt, x, y);
  } else {
    textSize(size);
    fill(col);
    text(txt, x, y);
  }
}

boolean isHover(float x, float y, float w, float h) {
  return mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2;
}

void level1(){
  background(70);
  textAlign(CENTER);

  drawOutlineText("Pick the Tutorial", 360, 150 + floatY, 50, color(255), color(0), false);

  drawOutlineText("Tutorial 1 & 2", width/4 - 10,  260, 20, color(255), color(0), isHover(width/4 - 10,  260, 100, 30));
  drawOutlineText("Tutorial 3",     width/4 + 140,  260, 20, color(255), color(0), isHover(width/4 + 140, 260, 80,  30));
  drawOutlineText("Tutorial 4",     width/4 + 270,  260, 20, color(255), color(0), isHover(width/4 + 270, 260, 80,  30));
  drawOutlineText("Tutorial 5",     width/4 + 400,  260, 20, color(255), color(0), isHover(width/4 + 400, 260, 80,  30));
}
