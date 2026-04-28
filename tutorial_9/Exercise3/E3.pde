import shapes3d.*;
import shapes3d.contour.*;
import shapes3d.org.apache.commons.math.*;
import shapes3d.org.apache.commons.math.geometry.*;
import shapes3d.path.*;
import shapes3d.utils.*;
import peasy.*;
PeasyCam camera;

Tube shape;

void setup(){
  size(1000,1000, P3D);
  camera = new PeasyCam(this,100);
  
  Path path = new Linear(new PVector(0, 0, -5), new PVector(0, 0, 5), 1);
  Oval hexagon = new Oval(10, 50);
  shape = new Tube(path, hexagon);
  shape.fill(0);
  shape.stroke(0);
}

void draw(){
  background(70);
  fill(255,0,0);
  noStroke();
  //main body
  box(100,20,50);
  
  //the hood
  pushMatrix();
  translate(0,-17.5,0);
  box(55,15,50);
  popMatrix();
    
  //tires
  pushMatrix();
  translate(25,10,25);
  shape.draw(g);
  translate(-50,0,0);
  shape.draw(g);
  translate(0,0,-50);
  shape.draw(g);
  translate(50,0,0);
  shape.draw(g);
  popMatrix();
  
  //lights
  pushMatrix();
  fill(0);
  translate(47.6,-3,15);
  box(5);
  translate(0,0,-30);
  box(5);
  popMatrix();
  
  //front view
  pushMatrix();
  translate(27.5,-17.5,0);
  box(1,10,40);
  popMatrix();
}
