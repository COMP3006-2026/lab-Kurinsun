//text Tutor 4 and 5
String[] shapeData;
String[] lines = {"", "", ""};
int currentLine = 0;
int lineMaxWidth = 500;
int fontSize = 30;

//text
PFont fontT;
float floatY = 0;
float floatSpeed = 0.05;

//level
int lvl = 0;

//character
float x, y;
float speed = 5;
float halfW, halfH;
int charType = 0;
float squareX, squareY;
float circleX, circleY;
char squareFacing = 'U';
char circleFacing = 'U';

//to track the last key pressed, stack
int[] keyStack = new int[2]; // due to limitation, I can't force all 4 keys to be pressed
int stackSize  = 0; // in the end only 2 will be registered

// drag
boolean draggingSquare = false;
boolean draggingCircle = false;
float dragOffsetX, dragOffsetY;

void setup(){
  size(720, 360);
  squareX = width/3;      // square starts left side
  circleX = width/3 * 2;  // circle starts right side
  squareY = height/2;
  circleY = height/2;
}

void draw(){
  println(mouseX + " : " + mouseY);
  floatY = sin(frameCount * floatSpeed) * 5;
  background(70);

if (stackSize > 0) {
    int activeKey = keyStack[stackSize - 1];

    if (charType == 0) {
      // Move square
      if (activeKey == UP)    { squareY -= speed; squareFacing = 'U'; }
      if (activeKey == DOWN)  { squareY += speed; squareFacing = 'D'; }
      if (activeKey == LEFT)  { squareX -= speed; squareFacing = 'L'; }
      if (activeKey == RIGHT) { squareX += speed; squareFacing = 'R'; }
    } else {
      // Move circle
      if (activeKey == UP)    { circleY -= speed; circleFacing = 'U'; }
      if (activeKey == DOWN)  { circleY += speed; circleFacing = 'D'; }
      if (activeKey == LEFT)  { circleX -= speed; circleFacing = 'L'; }
      if (activeKey == RIGHT) { circleX += speed; circleFacing = 'R'; }
    }
  }

  // Boundary for square
  if (squareFacing == 'L' || squareFacing == 'R') { 
    halfW = 50; halfH = 40; 
  } else { 
    halfW = 40; halfH = 50; 
  }
  
  squareX = constrain(squareX, halfW, width - halfW);
  squareY = constrain(squareY, halfH, height - halfH);

  // Boundary for circle
  circleX = constrain(circleX, 40, width - 40);
  circleY = constrain(circleY, 40, height - 40);

  if (lvl == 0){
    level0();
  } else if (lvl == 1){
    level1();
  } else if (lvl == 2){
    level2();
  } else if (lvl == 3){
    level3();
  } else if (lvl == 4){
    level4();
  } else if (lvl == 5) {
    level5();
  }
  
  backButton();
  
  textAlign(CENTER);
}

void keyPressed() {
  // for Tutorial 4, handle editor keys
  if (lvl == 4) {
    handleEditorKey();
    return; 
  }

  if (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT) {
    boolean alreadyIn = false; //check if the key is inside
    for (int i = 0; i < stackSize; i++) { //loop to find
      if (keyStack[i] == keyCode) {
        alreadyIn = true;
        break; //if found break the loop
      }
    }
    if (!alreadyIn) { //if it's not inside
      keyStack[stackSize] = keyCode;  //add it to the stack
      stackSize++;
    }
  }
}

void keyReleased() {
  if (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT) {
    for (int i = 0; i < stackSize; i++) {//search for the key
      if (keyStack[i] == keyCode) { 
        for (int j = i; j < stackSize - 1; j++) {
          keyStack[j] = keyStack[j + 1]; //shift the stack
        }
        stackSize--;
        break; //break the loop
      }
    }
  }
}

void backButton() {
  if (lvl >= 2) {
    // Square box
    fill(255);
    stroke(0);
    strokeWeight(1);
    rectMode(CENTER);
    rect(38, 26, 45, 25);

    // Back text
    fill(0);
    textAlign(LEFT);
    textSize(15);
    text(" Back", 15, 30);
  }
}

void mouseDragged() {
  if (lvl == 2) {
    if (draggingSquare) {
      // Move square to mouse position minus the offset
      squareX = constrain(mouseX - dragOffsetX, 50, width - 50);
      squareY = constrain(mouseY - dragOffsetY, 50, height - 50);
    }
    if (draggingCircle) {
      // Move circle to mouse position minus the offset
      circleX = constrain(mouseX - dragOffsetX, 40, width - 40);
      circleY = constrain(mouseY - dragOffsetY, 40, height - 40);
    }
  }
}

void mouseReleased() {
  // Stop dragging when mouse is released
  draggingSquare = false;
  draggingCircle = false;
}

void mousePressed() {
  // Back button — check first and return so nothing else fires
  if (lvl >= 2 && mouseX > 10 && mouseX < 70 && mouseY > 10 && mouseY < 40) {
    lvl = 1;
    return;  // stop here, don't process anything else
  }
  
  // Tutorial select
  if (lvl == 1) {
    if (isHover(width/4 - 10,  260, 100, 30)) { lvl = 2; }
    if (isHover(width/4 + 140, 260, 80,  30)) { lvl = 3; }
    if (isHover(width/4 + 270, 260, 80,  30)) { lvl = 4; }
    if (isHover(width/4 + 400, 260, 80,  30)) { lvl = 5; }
  }
  
  // for Tutorial2
  if (lvl == 2) {
    if (mouseX > squareX - 50 && mouseX < squareX + 50 && mouseY > squareY - 50 && mouseY < squareY + 50) {
      charType = 0;
      draggingSquare = true;
      dragOffsetX = mouseX - squareX;  // how far from center we clicked
      dragOffsetY = mouseY - squareY;
    }
    if (dist(mouseX, mouseY, circleX, circleY) < 40) {
      charType = 1;
      draggingCircle = true;
      dragOffsetX = mouseX - circleX;
      dragOffsetY = mouseY - circleY;
    }
  }
}
