boolean pause = false;

void setup(){
  size(1280,720,P3D);
  randomSeed(0);
}

//Possible without a draw function, by copy paste the code here into void setup
//it'll run once and with this the pause button are not needed
void draw(){
background(70);
lights();

for(int i = 0; i < 10; i++){
    float size = random(50, 100);
    int randShap = (int) random(2);
  
    if(randShap == 0){
    pushMatrix();
    translate(random(0, width), random(0, height), 0);
    addons();
    sphere(size);
    popMatrix();
    } else {
    pushMatrix();
    translate(random(0, width), random(0, height), 0);
    addons();
    box(size);
    popMatrix();
    }
  }
  
  fill(255);
  textAlign(CENTER);
  textSize(100);
  text("Press Space Bar to Pause", 640, 360);
}

void keyPressed(){
  if(key == ' ' && pause == false){
    noLoop();
    pause = true;
  } else if(key == ' ' && pause == true){
    loop();
    pause = false;
  }
}

int Colours(){
  int randColr = (int) random(3);
  
  if(randColr == 0){
    return color(255, 0, 0);
  } else if(randColr == 1){
    return color(0,255,0);
  } else {
    return color(0,0,255);
  }
}

void addons(){
    int rand = (int) random(3);
  
    //3 Case possible, 4th case is noFill and noStroke which is just gone
    //changing the random to 4 and add another else, we can make it possible... but why?
    if(rand == 0){
      fill(Colours());
      noStroke();
    } else if( rand == 1){
      noFill();
      stroke(Colours());
    } else /*if (rand == 2)*/{
      fill(Colours());
      stroke(Colours());
    } /*else {
    //  noFill();
    //  noStroke();
    } */ 
    
}
