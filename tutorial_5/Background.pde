void level0(){
  background(0);
  textAlign(CENTER);
  fontT = createFont("Minecraft.ttf", 256);
  textFont(fontT);

  textSize(50);
  text("Welcome to Tutorial 5", 360, 140 + floatY);

  if(frameCount % 60 < 30){
    textSize(20);
    text("-Press to Start-", 360, 220);
  }

  if(mousePressed == true || keyPressed == true){
    lvl = 1;
  }
}
