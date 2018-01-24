Paddle p1;
Paddle p2;
Ball b;

boolean p1Up = false;
boolean p1Down = false;
boolean p2Up = false;
boolean p2Down = false;

void setup() {
  size(1000, 700);
  p1 = new Paddle (50, height/2 + 30);
  p2 = new Paddle (width - 50, height/2 + 30);
  b = new Ball();
}

void  draw() {
  background(0); 
  b.display();
  b.update();

  for (int i = 0; i < height/20; i ++) {
    fill(255);
    rect( width/2 - 3, i * 35, 6, 16);
  }

  p1.display();
  p2.display();

  if (p1Up == true  && p1.y > 0) {
    p1.moveUp();
  }
  if (p2Up == true && p2.y > 0) {
    p2.moveUp();
  }
  if (p1Down == true && p1.y < (height - p1.h)) {
    p1.moveDown();
  }
  if (p2Down == true && p2.y < (height - p2.h)) {
    p2.moveDown();
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


void checkCollision(float x1, float y1, float x2, float y2, float c) {
  if (dist(x1, y1, x2, y2) < c) {
    b.changeDirection();
  }
}