void Screen1() {

  
  background(70);
  
  rectMode(CENTER);
    
    fill(0);
    textSize(32);
    text("Practical 1", 180, 50);
    textSize(20);
    text("Pick a Button", 195, 80);
  
  if (mouseX > 32 && mouseX < 132 && mouseY > 150 && mouseY < 200) {
    stroke(1);
    fill(255, 0, 0);
  } else {
    fill(150);
  }
  rect(82, 175, 100, 50);
  
  if (mouseX > 200 && mouseX < 300 && mouseY > 150 && mouseY < 200) {
    stroke(1);
    fill(0, 255, 0);
  } else {
    fill(150);
  }
  rect(250, 175, 100, 50);
  
  if (mouseX > 370 && mouseX < 470 && mouseY > 150 && mouseY < 200) {
    stroke(1);
    fill(0, 0, 255);
  } else {
    fill(150);
  }
  rect(420, 175, 100, 50);
  

  backButton();
}
