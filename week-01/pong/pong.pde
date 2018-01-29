//Fertility pong

//Had to make some adjustments that caused other problems
//When a ball colides with the paddle, it creates a new ball in that same position
//However, sometimes the duplicate balls would get stuck and would create way too many more balls 
//I had to make some adjustments to create the balls enough away from the paddles that this doesn't happen
//However, that causes the balls to occaisanlly move in the opposite way

Paddle p1;
Paddle p2;
Ball b;
int counterP1;
int counterP2;
boolean p1Up = false;
boolean p1Down = false;
boolean p2Up = false;
boolean p2Down = false;
PVector middle;
BallSystem bs;
color p1Red = color (120, 220, 250);
color p2Blue = color(250, 90, 70);

void setup() {
  size(1000, 700);
  noStroke();
  p1 = new Paddle (50, height/2 + 30, p1Red);
  p2 = new Paddle (width - 50, height/2 + 30, p2Blue);

  bs = new BallSystem();
  middle = new PVector(width/2, height/2);
  bs.addBall(middle);
}

void  draw() {
  background(255); 
  bs.run();


  textSize(40);
  fill(p1Red);
  text(counterP1, 200, 100);
  fill(p2Blue);
  text(counterP2, width - 200, 100);

  //LINE IN THE MIDDLE
  for (int i = 0; i < height/20; i ++) {
    fill(0);
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

  if ( counterP1 > 9) {
    bs.gameEnd(p1Red);
  }

  if ( counterP2 > 9) {
    bs.gameEnd(p2Blue);
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

//SPAWNING
//Need to keep the balls in an ArrayList
//When a ball collides with a paddle, it adds another to the ArrayList and makes it in the same direction as the other one
//when it leaves remove from arraylist 
//if arraylist length = 0, start add a new ball at the center 