import shapes3d.*;
import shapes3d.contour.*;
import shapes3d.org.apache.commons.math.*;
import shapes3d.org.apache.commons.math.geometry.*;
import shapes3d.path.*;
import shapes3d.utils.*;
import peasy.*;

PeasyCam camera;
Tube shape;

float[] carX = {0,-200,200,200,-200};
float[] carY = {0,-100,-100,100,100};
float[] carZ = {0, 50, 100, -50, -100};
float[] carSize = { 1, 1.25, 1.5, 0.75, 0.5};
color[] carColour = {
  color(220, 50, 50),
  color( 50, 130,220),
  color( 50, 200, 80),
  color(220, 160, 30),
  color(160, 50, 220)
};

int selectedCar = -1;
float dragSetX = 0;
float dragSetY = 0;
boolean dragging = false;
float currentMY = 0;

void setup() {
  size(1000, 1000, P3D);
  camera = new PeasyCam(this, 600);
  
  Path path = new Linear(new PVector(0, 0, -5), new PVector(0, 0, 5), 1);
  Oval hexagon = new Oval(10, 50);
  shape = new Tube(path, hexagon);
  shape.fill(30);
  shape.stroke(30);
}

void draw() {
  background(70);
  lights();
  for (int i = 0; i < 5; i++) {
    color drawColour;
    if (i == selectedCar) {
      drawColour = brightenColour(carColour[i]);
    } else {
      drawColour = carColour[i];
    }
    drawCar(carX[i], carY[i], carZ[i], carSize[i], drawColour);
  }
}

void mousePressed() {
  int picked = pickCar(mouseX, mouseY);
  if (picked == selectedCar) {
    selectedCar = -1;
    dragging = false;
  } else {
    selectedCar = picked;
    
    if (selectedCar >= 0) {
      dragSetX = carX[selectedCar] - mouseX;
      dragSetY = carY[selectedCar] - mouseY;
      dragging = true;

      currentMY = mouseY;
    }
  }
  
}

void mouseDragged() {
  if (dragging && selectedCar >= 0) {
    camera.setActive(false);

    if (keyPressed && keyCode == SHIFT) {
      float Ycoords = currentMY - mouseY;
      carZ[selectedCar] += Ycoords * 2;
    } else {
      carX[selectedCar] = mouseX + dragSetX;
      carY[selectedCar] = mouseY + dragSetY;
    }
  }

  currentMY = mouseY;
}

void mouseReleased() {
  dragging = false;
  camera.setActive(true);
}

int pickCar(int mx, int my) {
  background(0);
  noLights();
  for (int i = 0; i < 5; i++) {
    drawCarFlat(carX[i], carY[i], carZ[i], carSize[i], color(i + 1, 0, 0));
  }
  
  loadPixels();
  color c = pixels[my * width + mx];
  int r = (int) red(c);
  if (r >= 1 && r<= 5) {
    return r - 1;
  }
  return -1;
}

void drawCarFlat(float xLoc, float yLoc, float zLoc, float size, color flatCol) {
  pushMatrix();
  translate(xLoc, yLoc, zLoc);
  scale(size);
  fill(flatCol);
  noStroke();
  
  //body
  box(100, 20, 50);
  
  //hood
  pushMatrix();
  translate(0, -17.5, 0);
  box(55, 15, 50);
  popMatrix();
  
  //screen
  pushMatrix();
  translate(27.5, -17.5, 0);
  box(1, 10, 40);
  popMatrix();
  
  //headlight
  pushMatrix();
  translate(47.6, -3, 15);
  box(5); 
  translate(0, 0, -30);
  box(5); 
  popMatrix();
  
  //tires
  pushMatrix();
  translate(25, 10, 25);
  shape.draw(g);
  translate(-50, 0, 0);
  shape.draw(g);
  translate(0, 0, -50);
  shape.draw(g);
  translate(50, 0, 0);
  shape.draw(g);
  popMatrix();
  
  popMatrix();
}

void drawCar(float xLoc, float yLoc, float zLoc, float size, color Colour) {
  pushMatrix();
  translate(xLoc, yLoc, zLoc);
  scale(size);
  
  //body
  fill(Colour);
  noStroke();
  box(100, 20, 50);
  
  //hood
  fill(Colour);
  pushMatrix();
  translate(0, -17.5, 0);
  box(55, 15, 50);
  popMatrix();
  
  //Screen
  fill(0);
  pushMatrix();
  translate(27.5, -17.5, 0);
  box(1, 10, 40);
  popMatrix();
  
  //headlight
  fill(255, 255, 180);
  pushMatrix();
  translate(47.6, -3, 15);
  box(5);
  translate(0, 0, -30);
  box(5);
  popMatrix();
  
  shape.fill(30);
  shape.stroke(30);
  
  //tires
  pushMatrix();
  translate(25, 10, 25);
  shape.draw(g);
  translate(-50, 0, 0);
  shape.draw(g);
  translate(0, 0, -50);
  shape.draw(g);
  translate(50, 0, 0);
  shape.draw(g);
  popMatrix();
  
  popMatrix();
}

color brightenColour(color c) {
  float r = min(red(c) + 100, 255);
  float g = min(green(c) + 100, 255);
  float b = min(blue(c)  + 100, 255);
  
  return color(r, g, b);
}
