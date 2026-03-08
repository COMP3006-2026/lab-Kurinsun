int male   = 0;
int female = 0;
int bornAbove2003 = 0;

void setup() {
  size(300, 200);
  Table table = loadTable("T4q7.csv"); //load the table/data

  // since we start at 0, so row 1(0) and 2(1) are skipped
  for (int i = 2; i < table.getRowCount(); i++) {
    TableRow row = table.getRow(i);

    String gender      = row.getString(4).trim();  // store the string gender
    String birthYearString = row.getString(5).trim(); // store the string year

    // count gender
    if (gender.equalsIgnoreCase("Male")) {
      male++;
    } else if (gender.equalsIgnoreCase("Female")) {
      female++;
    }

    //Take the amount of people from after 2003 (2003 not in the count)
    if (!birthYearString.isEmpty()) {
      int birthYear = Integer.parseInt(birthYearString); //convert the string value to int 
      if (birthYear > 2003) {
        bornAbove2003++;
      }
    }
  }
}

void draw() {
  //println(mouseX + " : " + mouseY);
  background(255);
  fill(0);
  textSize(30);
  textAlign(LEFT);
  text("RESULTS", 20, 65);
  textSize(14);
  text("Males : " + male, 20, 100);
  text("Females : " + female, 20, 125);
  text("Born after 2003 : " + bornAbove2003, 20, 150);
}
