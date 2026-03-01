int t2flashTimer1 = 0;
int t2flashTimer2 = 0;
int t2Screen = 0;

void setup() {
  size(500, 300);
}

void draw() {
  println(mouseX + " : " + mouseY);

  if (t2Screen == 0) {
    t2MainMenu();
  } else if (t2Screen == 1) {
    ScreenQ1();
  } else if (t2Screen == 2) {
    ScreenChallenge();
  }

  rectMode(CENTER);
  t2DrawButtons();
}

void t2MainMenu() {
  rectMode(CORNER);
  noStroke();

  if (mouseX > 56-21 && mouseX < 56+21 && mouseY > 75-13  && mouseY < 75+13) {
    background(0);
    fill(70);
    rect(0, 0, width, height/2);
    fill(0);
    textSize(35);
    text("Practical 5", 156, 70);
  }
  else if (mouseX > 56-21 && mouseX < 56+21 && mouseY > 225-13 && mouseY < 225+13) {
    background(0);
    fill(70);
    rect(0, height/2, width, height/2);
    fill(0);
    textSize(35);
    text("Practical 6", 156, 220);
  }
  else {
    background(0);
    fill(255);
    textSize(20);
    text("Choose Between", 300, 103);
    text("Practical 5 or 6", 300, 130);
  }
}

void backButton() {
  rectMode(CENTER);
  fill(200);
  rect(30, 20, 30, 15);
  fill(0);
  textSize(10);
  textAlign(LEFT);
  text("Back", 19, 25);
}

void t2DrawButtons() {
  strokeWeight(1);
  stroke(0);
  rectMode(CENTER);

  if (t2flashTimer1 > 0) t2flashTimer1--;
  if (t2flashTimer2 > 0) t2flashTimer2--;

  if (t2Screen == 0) {
    fill(t2flashTimer1 > 0 ? 80 : 150);
    rect(56, 75, 42, 25);

    fill(t2flashTimer2 > 0 ? 80 : 150);
    rect(56, 225, 42, 25);
  }
}

void mousePressed() {

  if (t2Screen == 0) {
    if (mouseX > 56-21 && mouseX < 56+21 &&
        mouseY > 75-13  && mouseY < 75+13) {
      t2flashTimer1 = 10;
      t2Screen = 1;
    }
    if (mouseX > 56-21 && mouseX < 56+21 &&
        mouseY > 225-13 && mouseY < 225+13) {
      t2flashTimer2 = 10;
      t2Screen = 2;
    }
  }

  if (t2Screen != 0) {
    if (mouseX > 14 && mouseX < 46 && mouseY > 11 && mouseY < 28) {
      t2Screen = 0;
    }
  }
}
