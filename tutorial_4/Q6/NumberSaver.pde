PrintWriter output;
String currentInput = "";
boolean isFloat = false;
String lastWritten = "";

void setup() {
  size(500, 250);
  output = createWriter("Output.txt");
}

void draw() {
  background(240);
  fill(30);
  textSize(14);
  textAlign(LEFT);
  text("Type a number. SPACE to save, ENTER to finish.", 20, 50);
  text("Note: Use '.' for float value", 20, 75);

  fill(0, 80, 180);
  textSize(22);
  text("Input: " + currentInput , 20, 110);

  if (!lastWritten.isEmpty()) {
    fill(0, 140, 60);
    textSize(14);
    text("Last saved: " + lastWritten, 20, 160);
  }
}

void keyPressed() {
  if (key == ' ') {
    if (currentInput.length() == 0 || currentInput.equals(".")) { //safe meassure space or dot is pressed but no int is present
      return; //return nothing
    }
    String formatted = formatNumber(currentInput, isFloat); //goes through formatting
    output.println(formatted);
    lastWritten = formatted;
    currentInput = ""; //clears the input box
    isFloat = false; //reset the float status

  } else if (key == ENTER || key == RETURN) { //flush if press enter
    if (currentInput.length() > 0 && !currentInput.equals(".")) {
      output.println(formatNumber(currentInput, isFloat));
    }
    output.flush();
    output.close();
    exit();

  } else if (key == BACKSPACE) { //for the deleting button
    if (currentInput.length() > 0) {
      char removed = currentInput.charAt(currentInput.length() - 1);
      if (removed == '.') {
        isFloat = false;
      }
      currentInput = currentInput.substring(0, currentInput.length() - 1);
    }
    
  } else if (key == '.' && !isFloat && currentInput.length() > 0) { // to detect the comma input
    isFloat = true;
    currentInput += '.';

  } else if (key >= '0' && key <= '9') { //to detect the number input
    currentInput += key;
  }
}

String formatNumber(String input, boolean isFloat) { //the format to print either int or float
  if (isFloat) { //for float
    int dotIndex = input.indexOf('.'); //finds the dot location
    String left = input.substring(0, dotIndex); //separate the left
    String right = input.substring(dotIndex + 1); //from the right of the dot

    if (left.length() > 6) {
      left = left.substring(0, 6); //if the left have more than 6 digit, only take the first 6
    }
    if (right.length() > 4) {
      right = right.substring(0, 4); //same goes here but for 4 digits
    }

    while (right.length() < 4) {
      right += "0"; //add 0 for the decimals
    }
    
    return left + "." + right;

  } else {
    if (input.length() > 10) {
      input = input.substring(0, 10); //for int
    }
    
    return input;
  }
}
