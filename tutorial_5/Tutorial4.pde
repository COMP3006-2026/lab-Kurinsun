void level4() {
  background(90);
  textAlign(LEFT);

  // Box 1
  fill(255);
  textSize(15);
  text("Line 1:", 100, 41);
  stroke(200);
  fill(50);
  rectMode(CORNER);
  rect(100, 46, 520, 45);
  fill(255);
  textSize(fontSize);
  String line1Display;
  if (frameCount % 30 < 15 && currentLine == 0) {
    line1Display = lines[0] + "|";
  } else {
    line1Display = lines[0];
  }
  text(line1Display, 108, 82);

  //box 2 
  fill(255);
  textSize(15);
  text("Line 2:", 100, 161);
  stroke(200);
  fill(50);
  rect(100, 166, 520, 45);
  fill(255);
  textSize(fontSize);
  String line2Display;
  if (frameCount % 30 < 15 && currentLine == 1) {
    line2Display = lines[1] + "|";
  } else {
    line2Display = lines[1];
  }
  text(line2Display, 108, 202);

  // box 3
  fill(255);
  textSize(15);
  text("Line 3:", 100, 281);
  stroke(200);
  fill(50);
  rect(100, 286, 520, 45);
  fill(255);
  textSize(fontSize);
  String line3Display;
  if (frameCount % 30 < 15 && currentLine == 2) {
    line3Display = lines[2] + "|";
  } else {
    line3Display = lines[2];
  }
  text(line3Display, 108, 322);
}

void handleEditorKey() {
  if (currentLine > 2) { //if all the box is full, stop accepting input
    return;
  }
  if (key == ENTER || key == RETURN) {
    if (currentLine < 2) { //go to next line if we're not at box 3
      currentLine++;
    }

  } else if (key == BACKSPACE) { //for deletion
    if (lines[currentLine].length() > 0) {
      lines[currentLine] = lines[currentLine].substring(0, lines[currentLine].length() - 1);
    } else if (currentLine > 0) { //if it's already empty go to previous box
      currentLine--;
    }

  } else if (key != CODED) { //calculation to see the amount of input that can fit in the box
    //calculate the pixel
    textSize(fontSize);
    String candidate = lines[currentLine] + key; //store char into one whole string
    if (textWidth(candidate) > lineMaxWidth) { //check if the string pixel size is still in the box
      if (currentLine < 2) { //if not go to next line
        currentLine++;
        lines[currentLine] += key;
      }
    } else {
      lines[currentLine] = candidate;
    }
  }
}
