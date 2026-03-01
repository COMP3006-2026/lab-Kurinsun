void setup() {
  size(600, 600);
}
void draw() {
    // Easy method to find Coord
  println(mouseX + " : " + mouseY);
  
  background(30);
  drawViolin();
}
void drawViolin() {
  
  //the tuner
  fill(20, 10, 5);
  stroke(10);
  strokeWeight(1);
  rectMode(CENTER);
  rect(282, 55, 18, 3, 2);
  rect(282, 70, 18, 3, 2);
  rect(318, 55, 18, 3, 2);
  rect(318, 70, 18, 3, 2);
  
  //the end tail
  fill(160, 85, 15); 
  stroke(100, 55, 10);
  circle(300,30, 20);
  rect(300, 35, 10, 40);
  rect(300, 35, 40, 10);
  
  // the long tail
  fill(160, 85, 15);
  stroke(100, 55, 10);
  strokeWeight(1.5);
  beginShape();
  vertex(286, 40);
  bezierVertex(286, 105, 283, 135, 280, 155);
  vertex(320, 155);
  bezierVertex(317, 135, 314, 105, 314, 40);
  endShape(CLOSE);
  
  // main body
  fill(180, 95, 18);
  stroke(100, 55, 8);
  strokeWeight(1.5);
  beginShape();
  vertex(300, 155);
  bezierVertex(255, 155, 218, 175, 218, 210);
  bezierVertex(218, 245, 240, 265, 252, 280);
  bezierVertex(264, 295, 264, 315, 252, 330);
  bezierVertex(240, 345, 205, 360, 205, 400);
  bezierVertex(205, 440, 240, 465, 300, 470);
  bezierVertex(360, 465, 395, 440, 395, 400);
  bezierVertex(395, 360, 360, 345, 348, 330);
  bezierVertex(336, 315, 336, 295, 348, 280);
  bezierVertex(360, 265, 382, 245,   382, 210);
  bezierVertex(382, 175, 345, 155, 300, 155);
  endShape(CLOSE);
  
// left f-hole 
  noFill();
  stroke(25, 12, 3);
  strokeWeight(2);
  bezier(270, 265,  273, 295,  267, 330,  270, 360);
  bezier(270, 265,  270, 256,  278, 253,  282, 259);
  bezier(270, 360,  270, 369,  260, 372,  256, 365);
  // right f-hole
  noFill();
  stroke(25, 12, 3);
  strokeWeight(2);
  bezier(330, 265,  327, 295,  333, 330,  330, 360);
  bezier(330, 265,  330, 256,  322, 253,  318, 259);
  bezier(330, 360,  330, 369,  340, 372,  344, 365);
  
  // the string holder
  fill(200, 160, 80);
  stroke(120, 90, 30);
  strokeWeight(1);
  rectMode(CENTER);
  rect(300, 295, 30, 6, 1);
  rect(290, 300, 5, 5);
  rect(310, 300, 5, 5);
  
  // the strings
  stroke(220, 210, 150);
  strokeWeight(1);
  line(290, 292, 298, 14);
  line(297, 292, 299, 14);
  line(303, 292, 300, 14);
  line(310, 292, 301, 14);
  
  //tail piece
  fill(20, 10, 5);
  stroke(10, 5, 2);
  strokeWeight(1);
  beginShape();
  vertex(278, 307);
  bezierVertex(272, 345,  275, 390,  285, 413);
  bezierVertex(292,  421, 308,  421,  315, 413);
  bezierVertex(325, 390, 328, 345,   322, 307);
  endShape(CLOSE);
  
  // chinrest
  fill(20, 10, 5);
  stroke(10, 5, 2);
  strokeWeight(1);
  beginShape();
  vertex(245, 460);
  bezierVertex(230, 455, 228, 440, 240, 433);
  bezierVertex(250, 427, 262, 425, 270, 430);
  bezierVertex(278, 435, 282, 437, 285, 433);
  bezierVertex(292,  425, 315, 423, 325, 430);
  bezierVertex(335, 437, 335, 453, 324, 466);
  bezierVertex(310,480, 258, 467, 245, 460);
  endShape(CLOSE);
}
