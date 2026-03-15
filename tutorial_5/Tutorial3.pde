void level3(){
  shapeData = loadStrings("data.txt");
  
  for (int i = 0; i < shapeData.length; i++) {
    String row = trim(shapeData[i]);

    if (row.length() == 0) continue;
    
    String[] parts = split(row, ' ');
    String shapeName = parts[0];
    
    String[] params = split(parts[1], ',');
    float x = float(params[0]);
    float y = float(params[1]);
    float h = float(params[2]);
    float w = float(params[3]);
    
    strokeWeight(2);
    fill(0);
    
    if (shapeName.equals("ellipse")) {
      stroke(255, 0, 0);
      ellipse(x + 50, y, h, w); //+ 50 so that the shape can be visible, deleting it will show the original position straight from the .txt file

    } else if (shapeName.equals("line")) {
      stroke(0, 255, 0);
      noFill();
      line(x , y, h, w); //they don't overlap so yeah :D

    } else if (shapeName.equals("rect")) {
      stroke(0, 0, 255);
      rect(x + 250, y, h, w); //same reason for the circle
    }
  }
}
