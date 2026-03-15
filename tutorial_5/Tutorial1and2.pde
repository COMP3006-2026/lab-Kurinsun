void level2() {
  background(70);
  
  rectMode(CENTER);
  noStroke();

  fill(255);
  if (squareFacing == 'U') {
    rect(squareX, squareY, 80, 100);
    fill(0); rect(squareX - 15, squareY - 20, 15, 25);
    fill(0); rect(squareX + 20, squareY - 20, 15, 25);

  } else if (squareFacing == 'D') {
    fill(255); rect(squareX, squareY, 80, 100);
    fill(0); rect(squareX - 15, squareY + 20, 15, 25);
    fill(0); rect(squareX + 20, squareY + 20, 15, 25);

  } else if (squareFacing == 'L') {
    fill(255); rect(squareX, squareY, 100, 80);
    fill(0); rect(squareX - 35, squareY - 10, 25, 15);
    fill(0); rect(squareX - 35, squareY + 13, 25, 15);

  } else if (squareFacing == 'R') {
    fill(255); rect(squareX, squareY, 100, 80);
    fill(0); rect(squareX + 35, squareY - 10, 25, 15);
    fill(0); rect(squareX + 35, squareY + 13, 25, 15);
  }

  fill(255);
  if (circleFacing == 'U') {
    circle(circleX, circleY, 80);
    fill(0); circle(circleX - 15, circleY - 15, 15);
    fill(0); circle(circleX + 15, circleY - 15, 15);

  } else if (circleFacing == 'D') {
    fill(255); circle(circleX, circleY, 80);
    fill(0); circle(circleX - 15, circleY + 15, 15);
    fill(0); circle(circleX + 15, circleY + 15, 15);

  } else if (circleFacing == 'L') {
    fill(255); circle(circleX, circleY, 80);
    fill(0); circle(circleX - 20, circleY - 10, 15);
    fill(0); circle(circleX - 20, circleY + 10, 15);

  } else if (circleFacing == 'R') {
    fill(255); circle(circleX, circleY, 80);
    fill(0); circle(circleX + 20, circleY - 10, 15);
    fill(0); circle(circleX + 20, circleY + 10, 15);
  }
}
