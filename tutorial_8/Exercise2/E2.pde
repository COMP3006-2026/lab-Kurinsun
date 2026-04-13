void setup() {
size(500,500,P3D);
fill(70);
}

void draw() {
background(70);

pushMatrix();
translate(100,0,0);
lights();
popMatrix();

translate(width/2,height/2,0);
rotateX(map(mouseY, 0, -width, -PI, PI));
rotateY(map(mouseX, 0, height, -PI, PI));

//strokeWeight(1);
fill(70);
//stroke(255);
noStroke();
sphere(75);





//--------------------------------------------------------------------------------------
//Exercise 2
stroke(255);
//fill(255);
noFill();
beginShape();
  for (int i = 0; i < 5; i++) {
    float angle = TWO_PI / 5 * i - HALF_PI; 
    float x = cos(angle) * 150;
    float y = sin(angle) * 150;
    vertex(x, y, 0);
  }
endShape(CLOSE);


}
