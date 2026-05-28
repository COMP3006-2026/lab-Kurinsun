void setup() {
  size(500, 500);
}

void draw() {
  //println(mouseX + " : " + mouseY);
  background(255);
  rectMode(CENTER);

  //All the Rectangle Center start at 0,0
  // Red Rectangle
  pushMatrix();
  translate(225, 225); //x+100,y+100
  //rotate(radians(45)); //For Question 3
  fill(220, 50, 50);
  rect(0, 0, 100, 100);
  popMatrix();



  // Green Rectangle
  //for(int i = 0; i <= 5; i++){ //loop for question 4
  //println("I = " + i);
  pushMatrix();
  translate(225, 375); //x+100,y
  //rotate(radians(45)); //For Question 3
  //scale(i * 0.5); //for question 4
  fill(60, 180, 60); //fill(60, 180, 60, 100); //colour opacity for question 4
  rect(0, 0, 100, 100);
  popMatrix();
  //} //loop closing bracket for question 4


  // Blue Rectangle
  pushMatrix();
  translate(375, 225); //x,y+100
  //rotate(radians(45)); //For Question 3
  fill(50, 100, 220);
  rect(0, 0, 100, 100);
  popMatrix();

  //this is not affected because the push and pop matrix that limits the translate only to themself
  //For Question 2
  // Gray Rectangle
  translate(375, 375); //x,y (stays, no change)
  //rotate(radians(45)); //For Question 3
  fill(150, 150, 150);
  rect(0, 0, 100, 100);
  
}
