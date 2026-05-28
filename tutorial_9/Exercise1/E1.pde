boolean pause = false;

void setup(){
  size(1280,720,P3D);
  randomSeed(0);
}

void draw(){
background(70);
lights();

for(int i = 0; i < 10; i++){
    float size = random(50, 100);
    int randShap = (int) random(2);
  
    if(randShap == 0){
    pushMatrix();
    translate(random(0, width), random(0, height), 0);
    sphere(size);
    popMatrix();
    } else {
    pushMatrix();
    translate(random(0, width), random(0, height), 0);
    box(size);
    popMatrix();
    }
  }
  
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
