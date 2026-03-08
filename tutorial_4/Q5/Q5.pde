void setup() {
  size(500, 500);
}

//Deleted the note for Question 1-4 since this one is gonna take more space
void draw() {
  //println(mouseX + " : " + mouseY);
  background(255);
  rectMode(CENTER);

  //All the Rectangle Center start at 0,0
  // ORIGINAL, Red Rectangle
  pushMatrix();
  translate(225, 225);
  fill(220, 50, 50, 75);
  rect(0, 0, 100, 100);
  popMatrix();
  
  //ROTATED, Red Rectangle
  pushMatrix();
  translate(225, 225);
  rotate(radians(45));
  fill(220, 50, 50);
  rect(0, 0, 100, 100);
  popMatrix();


  // ORIGINAL, Green Rectangle
  pushMatrix();
  translate(225, 375);
  fill(60, 180, 60, 75);
  rect(0, 0, 150, 100); //change shape so we can see the 90 degree turn
  popMatrix();

  //ROTATED, Green Recrangle
  pushMatrix();
  translate(225 - 75, 375 - 50);  // Change the Center to the top left
  rotate(radians(90));
  fill(60, 180, 60);
  rectMode(CORNER);
  rect(0, 0, 150, 100);
  rectMode(CENTER); // restore the rectMode to center again
  popMatrix();



  // Blue Rectangle
  pushMatrix();
  translate(375, 225);
  fill(50, 100, 220);
  rect(0, 0, 100, 100);
  popMatrix();

  // Grey Rectangle
  translate(375, 375);
  fill(150, 150, 150);
  rect(0, 0, 100, 100);
  
}
