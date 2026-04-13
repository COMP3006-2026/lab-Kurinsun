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

translate(250,250,0);
rotateX(map(mouseY, 0, -width, -PI, PI));
rotateY(map(mouseX, 0, height, -PI, PI));

//strokeWeight(1);
fill(70);
//stroke(255);
noStroke();
sphere(75);

stroke(255);
strokeWeight(5);
line(0,0,-250,0,0,250);
}
