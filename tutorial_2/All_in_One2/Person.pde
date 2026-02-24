class PersonObj {

  float x, y;
  float totalWidth, totalHeight;
  color skinColor, bodyColor, beltColor;
  float speedX, speedY;

  PersonObj(float x, float y, float totalWidth, float totalHeight, color skinColor, color bodyColor, color beltColor) {
    this.x           = x;
    this.y           = y;
    this.totalWidth  = totalWidth;
    this.totalHeight = totalHeight;
    this.skinColor   = skinColor;
    this.bodyColor   = bodyColor;
    this.beltColor   = beltColor;
    this.speedX      = 0;
    this.speedY      = 0;
  }

  void moveHorizontal(float speed) {
    speedX = speed;
    speedY = 0;
  }

  void moveVertical(float speed) {
    speedY = speed;
    speedX = 0;
  }

  void update() {
    x += speedX;
    y += speedY;

    float halfW = totalWidth  / 2;
    float halfH = totalHeight / 2;

    if (x - halfW < 0) { 
      x = halfW; speedX *= -1; 
    }
    if (x + halfW > width) { 
      x = width - halfW; 
      speedX *= -1; 
    }
    if (y - halfH < 0) { 
      y = halfH; 
      speedY *= -1; 
    }
    if (y + halfH > height) { 
      y = height - halfH; 
      speedY *= -1; 
    }
  }

  void drawPerson() {
    //Part Sizes
    float bodyWidth  = totalWidth  * 0.667;
    float bodyHeight = totalHeight * 0.571;
    float headSize   = totalWidth  * 0.667;
    float legWidth   = totalWidth  * 0.333;
    float legHeight  = totalHeight * 0.429;
    float armWidth   = totalWidth  * 0.333;
    float armHeight  = totalHeight * 0.571;

    //Anchor Points
    float bodyTop    = y - bodyHeight / 2;
    float bodyBottom = y + bodyHeight / 2;
    float bodyLeft   = x - bodyWidth  / 2;
    float bodyRight  = x + bodyWidth  / 2;
    float headY      = bodyTop - headSize / 2;
    float beltY      = y + bodyHeight * 0.375;

    stroke(0);
    strokeWeight(1);

    //Body
    rectMode(CENTER);
    fill(bodyColor);
    rect(x, y, bodyWidth, bodyHeight);

    // Belt
    fill(beltColor);
    rect(x, beltY, bodyWidth, bodyHeight * 0.125);
    circle(x, beltY, headSize * 0.25);

    //Legs
    fill(skinColor);
    rectMode(CORNER);
    rect(bodyLeft,            bodyBottom, legWidth, legHeight); // left leg
    rect(bodyLeft + legWidth, bodyBottom, legWidth, legHeight); // right leg

    //Left Arm
    fill(skinColor);
    rectMode(CORNERS);
    rect(bodyLeft - armWidth, bodyTop, bodyLeft, bodyTop + armHeight);

    //Right Arm
    rectMode(CORNER);
    rect(bodyRight, bodyTop, armWidth, armHeight);

    // Head
    rectMode(CENTER);
    fill(skinColor);
    rect(x, headY, headSize, headSize);

    //Mask
    fill(0);
    beginShape();
    vertex(x + headSize/2, headY + headSize/4);
    vertex(x - headSize/2, headY + headSize/4);
    vertex(x - headSize/2, headY + headSize/2);
    vertex(x, headY + headSize);
    vertex(x + headSize/2, headY + headSize/2);
    endShape(CLOSE);

    //Eyes
    rectMode(CENTER);
    fill(255);
    rect(x - headSize/5, headY, headSize/5,  headSize * 0.3); // left white
    rect(x + headSize/5, headY, headSize/5,  headSize * 0.3); // right white
    fill(0);
    rect(x - headSize/5  + headSize/20, headY, headSize/10, headSize * 0.3); // left pupil
    rect(x + headSize/10 + headSize/20, headY, headSize/10, headSize * 0.3); // right pupil
  }
}
