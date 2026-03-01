void setup(){
  size(500,500);
  background(145,224,255);
}

void draw(){
  println(mouseX + " : " + mouseY);
  
  //Body
  rectMode(CENTER);
  fill(150,75,0);
  rect(250,250,100,200);
  fill(255,223,0);
  rect(250,325,100,25);
  circle(250,325,25);
  
  //Legs
  fill(250,220,196);
  rectMode(CORNER);
  rect(200,350,50,150);
  rectMode(CORNER);
  rect(250,350,50,150);
  
  //Arms
  fill(250,220,196);
  rectMode(CORNERS);
  rect(200,350,150,150);
  rectMode(CORNER);
  rect(300,150,50,200);

  //Heads
  rectMode(CENTER);
  rect(250,100,100,100);
  fill(0);
  beginShape();
  vertex(300,125);
  vertex(200,125);
  vertex(200,150);
  vertex(250,200);
  vertex(300,150);
  endShape(CLOSE);
  fill(0,0,0);
  stroke(1);
  
  
  //eyes
  fill(255,255,255);
  rect(230,100,20,30);
  rect(270,100,20,30);
  fill(0,0,0);
  rect(265,100,10,30);
  rect(235,100,10,30); 
}
