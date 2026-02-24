PersonObj[] people = new PersonObj[10];
boolean challengeReady = false;

void setupChallenge() {
  people[0] = new PersonObj(random(0,444), random(50,250),  44,  90, color(250,220,196), color(200,50,50),  color(255,220,0));
  people[1] = new PersonObj(random(56,444), random(50,250), 100, 210, color(210,170,130), color(50,100,200), color(255,50,50));
  people[2] = new PersonObj(random(56,444), random(50,250),  33,  65, color(240,200,160), color(80,160,80),  color(200,200,200));
  people[3] = new PersonObj(random(56,444), random(50,250),  83, 180, color(255,220,185), color(160,40,160), color(0,220,220));
  people[4] = new PersonObj(random(56,444), random(50,250),  56, 115, color(230,190,150), color(200,120,0),  color(100,255,100));
  people[5] = new PersonObj(random(56,444), random(50,250), 111, 230, color(255,210,180), color(30,130,130), color(255,180,0));
  people[6] = new PersonObj(random(56,444), random(50,250),  39,  78, color(245,215,185), color(180,60,30),  color(150,150,255));
  people[7] = new PersonObj(random(56,444), random(50,250),  72, 150, color(220,180,140), color(60,60,140),  color(255,100,100));
  people[8] = new PersonObj(random(56,444), random(50,250),  61, 125, color(235,195,155), color(100,180,50), color(255,200,50));
  people[9] = new PersonObj(random(56,444), random(50,250),  89, 190, color(250,215,180), color(140,30,100), color(50,200,255));

  for (int i = 0; i < people.length - 1; i++) {
    for (int j = 0; j < people.length - 1 - i; j++) {
      if (people[j].totalHeight > people[j+1].totalHeight) {
        PersonObj temp = people[j];
        people[j]      = people[j+1];
        people[j+1]    = temp;
      }
    }
  }

  for (int i = 0; i < people.length; i++) {
    float angle      = random(TWO_PI);
    float speed      = random(1.5, 3.0);
    people[i].speedX = cos(angle) * speed;
    people[i].speedY = sin(angle) * speed;
  }

  challengeReady = true;
}

void ScreenChallenge() {
  if (!challengeReady) setupChallenge();

  background(30);

  for (int i = 0; i < people.length; i++) {
    people[i].update();
    people[i].drawPerson();
  }

  backButton();
}
