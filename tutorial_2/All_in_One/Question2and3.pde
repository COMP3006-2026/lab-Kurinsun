boolean gray = true;
boolean loop = true;

void drawrandom(){
  background(255);
  
  rectMode(CORNER);
  noStroke();
  
  
  
  int cols;
  int rows;
  int squareSize = 20;
  
  rows = height / squareSize;
  cols = width / squareSize;
  
  if(gray != true){
  //For Loop
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i * squareSize;
      int y = j * squareSize;
      
      float Red = random(0, 256);
      float Green = random (0, 256);
      float Blue = random(0, 256);
      fill(Red, Green, Blue);
      rect(x, y, squareSize, squareSize);
    }
  }
}  
  
  if(gray == true){
  //While loop
  int i = 0;
    while (i < cols) {
      int j = 0;
      while (j < rows) {
        int x = i * squareSize;
        int y = j * squareSize;
        
        float gray = random(0, 256);
        fill(gray);
        rect(x, y, squareSize, squareSize);
        
        j++;
      }
      i++;
    }
  }
}



void Screen2() {
  if(loop == true){
    loop();
  } else if(loop == false) {
    noLoop();
  }
  
  drawrandom();
  backButton();
  
  rectMode(CENTER);
  
  textSize(25);
  fill(70);
  rect(110, 210, 75, 50);
  rect(410, 210, 75, 50);
  rect(260, 210, 75, 50);
  fill(0); 
  textSize(18);
  text("Gray", 92, 215);
  textSize(18);
  text("Colour", 385, 215);
  textSize(18);
  text("Pause", 238, 215);
}
