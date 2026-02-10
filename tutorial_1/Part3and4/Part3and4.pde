void setup(){
  size(500,500);
  background(145,224,255);
}

void draw(){
  //Body
  rectMode(CENTER);
  fill(150,75,0);
  rect(250,250,100,200);
  
  //Legs
  fill(250,220,196);
  rectMode(CORNER);
  rect(200,350,50,150);
  rectMode(CORNER);
  rect(250,350,50,150);
  
  //Arms
  rectMode(CORNERS);
  rect(200,350,150,150);
  rectMode(CORNER);
  rect(300,150,50,200);

  //Heads
  rectMode(CENTER);
  rect(250,100,100,100);
  
  //Face
  //eyebrow
  
  
  //eyes
  fill(255,255,255);
  rect(230,100,20,30);
  rect(270,100,20,30);
  fill(0,0,0);
  rect(265,100,10,30);
  rect(235,100,10,30); 
  
  //mask
  triangle(250,200,175,125,325,125);
  fill(145,224,255);
  noStroke();
  rect(326,125,50,50);
  rect(175,125,50,50);
  fill(0,0,0);

  stroke(1);
    //Body Accecoris
  fill(255,223,0);
  rect(250,250,100,50);
  circle(250,250,75);
}
