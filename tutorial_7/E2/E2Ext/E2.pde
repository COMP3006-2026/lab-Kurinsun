PGraphics trails;

PImage[] earth = new PImage[240];
PImage moon;

int frame = 0;
float moonx = 0;
float moony = 0;
float angle = 0;
float dmoontoearth = 200;
float angularspeed = 0.025;

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

void draw(){
  background(0);
  moonx = sin(angle) * dmoontoearth + 250;
  moony = cos(angle) * dmoontoearth * 0.2 + 250;
  
  trails.beginDraw();
  trails.imageMode(CENTER);
  trails.image(moon,moonx,moony);
  trails.filter(BLUR,5);
  trails.endDraw();
  
  if(cos(angle) < 0){
    //MOON
    image(trails, 250 ,250);
    image(moon,moonx,moony);
    //EARTH
    image(earth[frame%240], 250,250);
  } else {
    //EARTH
    image(earth[frame%240], 250,250);
    //MOON
    image(trails, 250 ,250);
    image(moon,moonx,moony);
  }
  
  angle += angularspeed;
  frame++;
}
