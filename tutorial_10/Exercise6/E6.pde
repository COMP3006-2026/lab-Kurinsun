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

float aimation = 0;
float carRotate = 0;
int carTransparacny = 255;

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

  aimation += 0.01;
  updateAnimations();

  for (int i = 0; i < 5; i++) {
    color drawColour;
    if (i == selectedCar) {
      drawColour = brightenColour(carColour[i]);
    } else {
      drawColour = carColour[i];
    }
    drawCar(i, drawColour);
  }
}

void updateAnimations() {
  // Car 1
  carX[0] = cos(aimation) * 300;
  carY[0] = sin(aimation) * 300;

  // Car 2
  carZ[1] = cos(aimation) * 300;
  carY[1] = sin(aimation) * 300;
  carRotate += 0.05;

  // Car 3
  carX[2] = cos(aimation + PI) * 300;
  carY[2] = sin(aimation + PI) * 300;
  carSize[2] = map(sin(aimation + PI), -1, 1, 1.0, 4.0);

  // Car 4
  carX[3] = cos(aimation + HALF_PI) * 300;
  carY[3] = sin(aimation + HALF_PI) * 300;
  carTransparacny = (int) map(sin(aimation + HALF_PI), -1, 1, 0, 255);

  // Car 5
  carX[4] = cos(aimation * 1.5) * 300;
  carY[4] = sin(aimation * 1.5) * 300;
  carZ[4] = sin(aimation * 0.5) * 200;
}

void drawCar(int index, color Colour) {
  pushMatrix();
  translate(carX[index], carY[index], carZ[index]);
  scale(carSize[index]);
  
  if (index == 1) {
    rotateY(carRotate);
  }

  if (index == 3) {
    Colour = color(red(Colour), green(Colour), blue(Colour), carTransparacny);
  }

  // body
  fill(Colour);
  noStroke();
  box(100, 20, 50);

  // hood
  fill(Colour);
  pushMatrix();
  translate(0, -17.5, 0);
  box(55, 15, 50);
  popMatrix();

  // screen
  fill(0);
  pushMatrix();
  translate(27.5, -17.5, 0);
  box(1, 10, 40);
  popMatrix();

  // headlight
  fill(255, 255, 180);
  pushMatrix();
  translate(47.6, -3, 15);
  box(5);
  translate(0, 0, -30);
  box(5);
  popMatrix();

  shape.fill(30);
  shape.stroke(30);

  // tires
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

color brightenColour(color c) {
  float r = min(red(c) + 100, 255);
  float g = min(green(c) + 100, 255);
  float b = min(blue(c)  + 100, 255);
  return color(r, g, b);
}
