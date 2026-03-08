int maleCount   = 0;
int femaleCount = 0;
int bornAfter2003 = 0;

void setup() {
  size(300, 200);
  Table table = loadTable("T4q7.csv"); //load the table/data

  // since we start at 0, so row 1(0) and 2(1) are skipped
  for (int i = 2; i < table.getRowCount(); i++) {
    TableRow row = table.getRow(i);

    String gender      = row.getString(4).trim();  // store the string gender
    String birthYearStr = row.getString(5).trim(); // store the string year

    // count gender
    if (gender.equalsIgnoreCase("Male")) {
      maleCount++;
    } else if (gender.equalsIgnoreCase("Female")) {
      femaleCount++;
    }

    //Take the amount of people from after 2003 (2003 not in the count)
    if (!birthYearStr.isEmpty()) {
      int birthYear = Integer.parseInt(birthYearStr); //convert the string value to int 
      if (birthYear > 2003) {
        bornAfter2003++;
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
  text("Males : " + maleCount, 20, 100);
  text("Females : " + femaleCount, 20, 125);
  text("Born after 2003 : " + bornAfter2003, 20, 150);
}
