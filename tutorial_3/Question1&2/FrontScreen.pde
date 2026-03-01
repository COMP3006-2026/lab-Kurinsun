void askScreen() {
  background(90);
  String colourTick;
  String distanceTick;
  String locationTick;
  String towerTick;
  
  
  fill(255);
  textSize(15);
  text("Insert Colour Code (r,g,b):", 100, 40);
  stroke(200);
  fill(50);
  rectMode(CORNER);
  rect(100, 48, 300, 28);
  fill(255);
  textSize(14);
  if (frameCount % 30 < 15 && boxUsed == 0) {
    colourTick = colourInput + "|";
  } else {
    colourTick = colourInput;
  }
  text(colourTick, 108, 67);
  
  fill(255);
  textSize(15);
  text("Insert Distance between Towers:", 100, 100);
  stroke(200);
  fill(50);
  rect(100, 108, 300, 28);
  fill(255);
  textSize(14);
  if (frameCount % 30 < 15 && boxUsed == 1) {
    distanceTick = distanceInput + "|";
  } else {
    distanceTick = distanceInput;
  }
  text(distanceTick, 108, 127);
  
  fill(255);
  textSize(15);
  text("Insert Location (x,y):", 100, 160);
  stroke(200);
  fill(50);
  rect(100, 168, 300, 28);
  fill(255);
  textSize(14);
  if (frameCount % 30 < 15 && boxUsed == 2) {
    locationTick = locationInput + "|";
  } else {
    locationTick = locationInput;
  }
  text(locationTick, 108, 187);
  
  fill(255);
  textSize(15);
  text("Insert Amount of Towers:", 100, 220);
  stroke(200);
  fill(50);
  rect(100, 228, 300, 28);
  fill(255);
  textSize(14);
  if (frameCount % 30 < 15 && boxUsed == 3) {
    towerTick = towerInput + "|";
  } else {
    towerTick = towerInput;
  }
  text(towerTick, 108, 247);
}
