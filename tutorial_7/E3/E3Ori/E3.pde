PGraphics trails;

PImage[] earth = new PImage[240];
PImage moon;

int frame = 0;
float moonx = 0;
float moony = 0;
float angle = 0;
float dmoontoearth = 200;
float angularspeed = 0.025;

float t = 0.0;
float RocketSpeed = 0;
boolean arrived = false;
float rx, ry;

void setup(){
  size(500,500);
  for (int i=0; i<240; i++){
    earth[i] = loadImage("earth/" + i + ".gif");
  }
  moon = loadImage("moon-icon.png");
  moon.resize(50,50);
  frameRate(15);
  
  trails = createGraphics(width, height);
  trails.beginDraw();
  trails.background(0,0,0,0);
  trails.endDraw();
  
  imageMode(CENTER);
  smooth();
}

void rocketMove(){
  if (!arrived) {
    RocketSpeed = 0.015 * sin(t * PI);
    if (RocketSpeed < 0.001) RocketSpeed = 0.01;
    t += RocketSpeed;
    if (t >= 1.0) {
      t = 1.0;
      arrived = true;
    }
  }

  if (arrived) {
    rx = moonx;
    ry = moony;
  } else {
    rx = lerp(250, moonx, t);
    ry = lerp(250, moony, t);
  }

}

void draw(){
  background(0);
  
  image(earth[frame%240], 250, 250);
  frame++;
  moonx = sin(angle) * dmoontoearth + 250;
  moony = cos(angle) * dmoontoearth + 250;
  
  trails.beginDraw();
  trails.imageMode(CENTER);
  trails.image(moon,moonx,moony);
  trails.filter(BLUR,5);
  trails.endDraw();
  
  image(trails, 250 ,250);
  image(moon, moonx, moony);
  angle += angularspeed;

  rocketMove();
  float rocketAngle = atan2(moony - 250, moonx - 250) + HALF_PI;
  Rocket(rx, ry, rocketAngle); 
}

void Rocket(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);

  fill(200, 200, 200);
  stroke(120);
  strokeWeight(1);
  rectMode(CENTER);
  rect(0, 5, 16, 24);

  fill(220, 80, 80);
  noStroke();
  triangle(-8, -7, 8, -7, 0, -22);

  fill(100, 180, 255);
  stroke(80);
  strokeWeight(1);
  ellipse(0, 2, 8, 8);
  
  if (!arrived) {
    fill(255, 150 + int(random(-30, 30)), 0);
    noStroke();
    triangle(-5, 17, 5, 17, 0, 26 + int(random(5)));
  }

  popMatrix();
}
