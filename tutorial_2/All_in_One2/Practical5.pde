PersonObj p1, p2, p3, p4;
boolean q1Ready = false;

void setupQ1() {
  //Person 1
  p1 = new PersonObj(100, 110, random(200), random(200), color(250, 220, 196), color(150, 75, 0), color(255, 223, 0));

  //Person 2
  p2 = new PersonObj(206, 110, random(200), random(200), color(255, 200, 160), color(30, 80, 180), color(220, 30, 30));
  p2.moveVertical(3);

  //Person3
  p3 = new PersonObj(311, 110, random(200), random(200), color(210, 170, 130), color(30, 140, 60), color(240, 240, 240));

  //Person 4
  p4 = new PersonObj(422, 140, random(200), random(200), color(240, 200, 170), color(120, 40, 160), color(255, 220, 0));
  p4.moveHorizontal(4);

  q1Ready = true;
}

void ScreenQ1() {
  if (!q1Ready) setupQ1();

  background(50);

  p1.update(); p1.drawPerson();
  p2.update(); p2.drawPerson();
  p3.update(); p3.drawPerson();
  p4.update(); p4.drawPerson();

  backButton();
}
