import peasy.*;
PeasyCam cams;
boolean loop = true;

float time = 0;
float distance = 2000;

int flyStatus = 0;
int flyTime = 1000;
boolean arrived = true;

void setup() {
  size(1000, 1000, P3D);
  cams = new PeasyCam(this, 2000);
  noStroke();
}

void draw() {
  loops();
  background(0);
  lights();

  // the earth
  fill(0, 63, 255);
  sphere(500);

  // the moon
  float angle = radians(time * 50);
  float moonX = cos(angle) * distance;
  float moonZ = sin(angle) * distance;
  pushMatrix();
  translate(moonX, 0, moonZ);
  fill(200);
  sphere(50);
  popMatrix();

  // The flying rocket
  float rocketX, rocketZ;
  if(!arrived){
    flyStatus++;
    if(flyStatus >= flyTime){
      flyStatus = flyTime;
      arrived = true;
    }
    
    float t = (float)flyStatus/flyTime;
    float ease = 0.5 - 0.5 * cos(PI * t);
    rocketX = lerp(0, moonX, ease);
    rocketZ = lerp(0, moonZ,ease);
  } else {
    rocketX = moonX;
    rocketZ = moonZ;
  }

  //Rocket
  pushMatrix();
  translate(rocketX, 0, rocketZ);
  float angleToMoon = atan2(moonZ - rocketZ, moonX - rocketX);
  rotateY(angleToMoon);
  fill(200);
  box(4, 4, 12);
  popMatrix();

  time += 0.005;
}

//Fun Function, though it's kinda glitcy, it still works
void loops(){
  if(loop == true){
    loop();
  } else if (loop == false){
     noLoop(); 
  }
}

void keyPressed() {
  if(key == 'r' || key == 'R'){
    flyStatus = 0;
    arrived = false;
  }
  
  if(key == ' '){
    loop = !loop;
    redraw();
  }
}

void mouseDragged() {
  redraw();
}

void mouseWheel() {
  redraw();
}
