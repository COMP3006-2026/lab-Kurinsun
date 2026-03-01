int x3, y3;
int range = 50;
int x1 = 55;
int y1 = 260;
float c1 = 0;
float c2 = 0;
float c3 = 0;

int screen = 0;
int boxUsed = 0;

String colourInput = "";
String distanceInput = "";
String locationInput = "";
int towerCount = 1;
String towerInput = "";

void setup() {
  size(600, 300);
}

void draw() {
  // Easy method to find Coord
  println(mouseX + " : " + mouseY);

  if (screen == 0) {
    askScreen();
  } else if (screen == 1) {
    daLoop();
  }
}


void keyPressed() {
  if (screen != 0) { 
    return; 
  }

  if (key == ENTER || key == RETURN) {

    // Field = 0, for colour
    if (boxUsed == 0 && colourInput.length() > 0) {
      String[] parts = split(colourInput, ',');
      if (parts.length >= 3) {
        c1 = constrain(float(trim(parts[0])), 0, 255);
        c2 = constrain(float(trim(parts[1])), 0, 255);
        c3 = constrain(float(trim(parts[2])), 0, 255);
      } else if (parts.length == 1) {
        c1 = c2 = c3 = constrain(float(trim(parts[0])), 0, 255); //to limit the input and to prepare if user input one single digit
      }
      boxUsed = 1;

    // Field = 1, for distances, basically the size of shape1
    } else if (boxUsed == 1 && distanceInput.length() > 0) {
      range = int(constrain(float(trim(distanceInput)), 1, 500));
      boxUsed = 2;

    // Field = 2, determine the location
    } else if (boxUsed == 2 && locationInput.length() > 0) {
      String[] parts = split(locationInput, ',');
      if (parts.length >= 2) {
        x1 = int(constrain(float(trim(parts[0])), 0, width));
        y1 = int(constrain(float(trim(parts[1])), 0, height));
      } else if (parts.length == 1) {
        x1 = int(constrain(float(trim(parts[0])), 0, width)); //limit and if only one value is input, then y will be default
      }
      boxUsed = 3;

    // Field = 3, number of tower
    } else if (boxUsed == 3 && towerInput.length() > 0) {
      towerCount = int(constrain(float(trim(towerInput)), 1, 100));
      boxUsed = 4;
      screen = 1;
    }

  } else if (key == BACKSPACE) { //to delete the string in the screen
    if (boxUsed == 0 && colourInput.length() > 0) {
      colourInput = colourInput.substring(0, colourInput.length() - 1);
    } else if (boxUsed == 1 && distanceInput.length() > 0) {
      distanceInput = distanceInput.substring(0, distanceInput.length() - 1);
    } else if (boxUsed == 2 && locationInput.length() > 0) {
      locationInput = locationInput.substring(0, locationInput.length() - 1);
    } else if (boxUsed == 3 && towerInput.length() > 0) {
      towerInput = towerInput.substring(0, towerInput.length() - 1);
    }

  } else if (key != CODED) {
    // limit the amount of key, only accept digits, coma and space
    if ("0123456789, ".indexOf(key) >= 0) {
      if (boxUsed == 0) { 
        colourInput += key; 
      }
      else if (boxUsed == 1 && "0123456789".indexOf(key) >= 0) { 
        distanceInput += key; 
      }
      else if (boxUsed == 2) { 
        locationInput += key; 
      }
      else if (boxUsed == 3 && "0123456789".indexOf(key) >= 0) { 
        towerInput += key; 
      }
    }
  }
}
