void drawrandom(){
  background(255);
  
  rectMode(CORNER);
  noStroke();
  
  int cols;
  int rows;
  int squareSize = 20;
  
  rows = height / squareSize;
  cols = width / squareSize;
  
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

void Screen2() {
  
  
  drawrandom();
  backButton();
}
