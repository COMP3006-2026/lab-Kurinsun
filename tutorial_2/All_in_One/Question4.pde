float personWidth  = 50;
float personHeight = 150;

void Screen3() {
  background(90);

  fill(255);
  textSize(22);
  text("Practical 4 - Use Button To Resize it", 105, 33);

  drawHuman(250, 155, personWidth, personHeight);

  rectMode(CENTER);
  stroke(0);
  strokeWeight(1);
  textSize(10);

  fill(60, 150, 60);
  rect(82, 225, 80, 25);
  fill(255); textSize(11);
  text("+ Width", 65, 230);
  fill(160, 50, 50);
  rect(82, 255, 80, 25);
  fill(255);
  text("- Width", 65, 260);

  fill(50, 100, 190);
  rect(250, 225, 80, 25);
  fill(255);
  text("+ Height", 235, 230);

  fill(170, 90, 30);
  rect(250, 255, 80, 25);
  fill(255);
  text("- Height", 235, 260);

  fill(90);
  rect(418, 240, 80, 40);
  fill(255); 
  textSize(11);
  text("Reset", 407, 245);

  
  backButton();
}

void drawHuman(float x, float y, float totalWidth, float totalHeight) {
  //Part Sizes
  float bodyWidth = totalWidth  * 0.667;
  float bodyHeight = totalHeight * 0.571;
  float headSize = totalWidth  * 0.667;
  float legWidth = totalWidth  * 0.333;
  float legHeight = totalHeight * 0.429;
  float armWidth = totalWidth  * 0.333;
  float armHeight = totalHeight * 0.571;

  //Achor Points
  float bodyTop = y - bodyHeight / 2;
  float bodyBottom = y + bodyHeight / 2; 
  float bodyLeft = x - bodyWidth  / 2; 
  float bodyRight = x + bodyWidth  / 2;
  float headY = bodyTop - headSize / 2;
  float beltY = y + bodyHeight * 0.375;

  stroke(0);
  strokeWeight(1);

  //Body
  rectMode(CENTER);
  fill(150, 75, 0);
  rect(x, y, bodyWidth, bodyHeight);

  // Belt
  fill(255, 223, 0);
  rect(x, beltY, bodyWidth, bodyHeight * 0.125);
  circle(x, beltY, headSize * 0.25);

  //Legs
  fill(250, 220, 196);
  rectMode(CORNER);
  rect(bodyLeft,             bodyBottom, legWidth, legHeight); // left leg
  rect(bodyLeft + legWidth,  bodyBottom, legWidth, legHeight); // right leg

  //Arms
  //Left Arms
  fill(250, 220, 196);
  rectMode(CORNERS);
  rect(bodyLeft - armWidth, bodyTop, bodyLeft, bodyTop + armHeight);
  //Right Arms
  rectMode(CORNER);
  rect(bodyRight, bodyTop, armWidth, armHeight);

  rectMode(CENTER);
  fill(250, 220, 196);
  rect(x, headY, headSize, headSize);

  //Mask
  fill(0);
  beginShape();
  vertex(x + headSize/2, headY + headSize/4);
  vertex(x - headSize/2, headY + headSize/4);
  vertex(x - headSize/2, headY + headSize/2);
  vertex(x, headY + headSize);
  vertex(x + headSize/2, headY + headSize/2);
  endShape(CLOSE);

  //Eyes
  rectMode(CENTER);
  fill(255);
  rect(x - headSize/5, headY, headSize/5, headSize * 0.3); // left white
  rect(x + headSize/5, headY, headSize/5, headSize * 0.3); // right white

  fill(0);
  rect(x - headSize/5 + headSize/20, headY, headSize/10, headSize * 0.3); // left pupil
  rect(x + headSize/10 + headSize/20, headY, headSize/10, headSize * 0.3); // right pupil
}
