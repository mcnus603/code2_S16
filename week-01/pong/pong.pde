//Fertility pong
Paddle p1;
Paddle p2;
Ball b;
int counterP1;
int counterP2;
int positive = 1;
int negative = -1;

boolean p1Up = false;
boolean p1Down = false;
boolean p2Up = false;
boolean p2Down = false;

boolean rightPaddleCollision;
boolean leftPaddleCollision;

PVector middle;

PVector leftPaddle;
PVector rightPaddle;

BallSystem bs;
color p1Red = color (120, 220, 250);
color p2Blue = color(250, 90, 70);


void setup() {
  size(1000, 700);
  noStroke();
  smooth(16);
  leftPaddle = new PVector(50, height/2 + 30);
  rightPaddle = new PVector (width - 50, height/2 + 30);

  p1 = new Paddle (leftPaddle, p1Red);
  p2 = new Paddle (rightPaddle, p2Blue);


  bs = new BallSystem();
  middle = new PVector(width/2, height/2);
  int i = int(random(1));
  if (i == 0) {
    i = -1;
  } else if (i == 1) {
    i = 1;
  }
  bs.addBall(middle, i);
}

void  draw() {
  background(255); 
  fill(p2Blue);
  rectMode(CORNER);
  rect(0, 0, width/2, height);
  fill(p1Red);
  rect( width/2, 0, width/2, height); 
  bs.run();

  textSize(40);
  fill(p1Red);
  text(counterP1, 200, 100);
  fill(p2Blue);
  text(counterP2, width - 200, 100);

  p1.display();
  p2.display();

  if (p1Up == true  && p1.y > 0) {
    p1.moveUp();
  }
  if (p2Up == true && p2.y > 0) {
    p2.moveUp();
  }
  if (p1Down == true && p1.y < height - p1.h) {
    p1.moveDown();
  }
  if (p2Down == true && p2.y < (height - p2.h)) {
    p2.moveDown();
  }

  if ( counterP1 > 9) {
    String s = "PLAYER 1";
    bs.gameEnd(s);
  }

  if ( counterP2 > 9) {
    String s = "PLAYER 2";
    bs.gameEnd(s);
  }
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      p2Up = true;
    }
    if (keyCode == DOWN) {
      p2Down = true;
    }
  }
  if (key == 'w') {
    p1Up = true;
  }
  if (key == 's') {
    p1Down = true;
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      p2Up = false;
    }
    if (keyCode == DOWN) {
      p2Down = false;
    }
  }

  if (key == 'w') {
    p1Up = false;
  }

  if (key == 's') {
    p1Down = false;
  }
}