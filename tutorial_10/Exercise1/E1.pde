boolean shiftPress = false;
int currentX;
int currentY;
float currentZ;
int startMouseX;

void setup() {
  size(1000, 1000, P3D);
}

void draw() {
  println(mouseX, mouseY, currentZ);
  background(70);
  
  pushMatrix();
  if (shiftPress) {
    float delta = mouseX - startMouseX;
    currentZ = map(delta, -500, 500, -500, 500);
    translate(currentX, currentY, currentZ);
  } else {
    translate(mouseX, mouseY, 0);
  }
  sphere(250);
  popMatrix();
}

void keyPressed() {
  if (keyCode == SHIFT) {
    shiftPress = true;
    currentX = mouseX;
    currentY = mouseY;
    startMouseX = mouseX;
    currentZ = 0;
  }
}

void keyReleased() {
  if (shiftPress == true) {
    shiftPress = false;
  }
}
