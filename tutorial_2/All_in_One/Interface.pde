boolean button1 = false;
boolean button2 = false;
boolean button3 = false;

int flashTimer1 = 0;
int flashTimer2 = 0;
int flashTimer3 = 0;

int Screen = 0;

void Text(){
  fill(0,0,0);
  textSize(32);
}

void setup(){
  size(500,300);
}

void draw() {
  //Easy method to find Coord
  println(mouseX + " : " + mouseY);
  
  // Screen Check
    if (Screen == 0) {
      mainMenu();
    } else if (Screen == 1) {
      Screen1();
    } else if (Screen == 2) {
      Screen2();
    } else if (Screen == 3) {
      Screen3();
    }
  
  rectMode(CENTER);
  drawButtons();
}

void mainMenu() {
  rectMode(CORNER);
  noStroke();
  
  if (mouseX > 100-37.5 && mouseX < 100+37.5 && 
      mouseY > 50-25 && mouseY < 50+25) {
    background(0);
    fill(70);
    rect(0, 0, width, height/3);
    Text();
    text("Practical 1", 220, 50);
  }
  else if (mouseX > 100-37.5 && mouseX < 100+37.5 && 
           mouseY > 150-25 && mouseY < 150+25) {
    background(0);
    fill(70);
    rect(0, height/3, width, height/3);
    Text();
    text("Practical 2 + 3", 220, 150);
  }
  else if(mouseX > 100-37.5 && mouseX < 100+37.5 && 
          mouseY > 250-25 && mouseY < 250+25){
    background(0);
    fill(70);
    rect(0, 2*height/3, width, height/3);
    Text();
    text("Practical 4 + 5", 220, 250);
  } else {
    background(0,0,0);
    textSize(32);
    text("Choose Your", 300, 75);
    text("~~~Practical", 300, 105);
    
    textSize(10);
    text("Made with Tiredness", 370, 245);
    text("-Jessen", 425, 260);
  }
}

void backButton() {
  rectMode(CENTER);
  fill(200);
  rect(30, 20, 30, 15);
  
  fill(0);
  textSize(10);
  text("Back", 19, 25);
}

void drawButtons() {
  //buttons
  strokeWeight(1);
  stroke(0,0,0);
  rectMode(CENTER);
  
  // Update timers
  if (flashTimer1 > 0)
  flashTimer1 --;
  if (flashTimer2 > 0) 
  flashTimer2 --;
  if (flashTimer3 > 0) 
  flashTimer3 --;
  
  //Button Timer
  if(Screen == 0){
    if (flashTimer1 > 0) {
      fill(80);
    } else {
      fill(150);
    }
    rect(100, 50, 75, 50);
    
    if (flashTimer2 > 0) {
      fill(80);
    } else {
      fill(150);
    }
    rect(100, 150, 75, 50);
    
    if (flashTimer3 > 0) {
      fill(80);
    } else {
      fill(150);
    }
    rect(100, 250, 75, 50);
  }
}

void mousePressed() {
  if (Screen == 0) {
    if (mouseX > 100-37.5 && mouseX < 100+37.5 && 
        mouseY > 50-25 && mouseY < 50+25) {
      Screen = 1;
    }
    
    if (mouseX > 100-37.5 && mouseX < 100+37.5 && 
        mouseY > 150-25 && mouseY < 150+25) {
      flashTimer2 = 10;
      Screen = 2;
    }
    
    if (mouseX > 100-37.5 && mouseX < 100+37.5 && 
        mouseY > 250-25 && mouseY < 250+25) {
      flashTimer3 = 10;
      Screen = 3;
    }
  }
  
  if (Screen != 0) {
    // Back button area (30,20,30,15) in CORNER mode
    if (mouseX > 14 && mouseX < 46 && mouseY > 11 && mouseY < 28) {
      Screen = 0; // Go back to main menu
    }
  }
  
  
  //Button for question 2and3
  //first button 109,209
  if (mouseX > 72 && mouseX < 147 && mouseY > 185 && mouseY < 234) {
      gray = true;
  //second button 410,210
  } else if (mouseX > 371 && mouseX < 447 && mouseY > 185 && mouseY < 234) {
      gray = false;
  }
  
  if(mouseX > 222 && mouseX < 297 && mouseY > 185 && mouseY < 234){
   loop = !loop;
   redraw();
  }
}
