class Ball {
  PVector pos;
  PVector vel;
  float angle;
  float speed = 6;
  int s = 20;
  color c;
  int frames;

  //Tried a trail on the ball but everytime the ball would collide 
  //it would glitch and for a second draw a rectangle in the top left corner
  //float mx [] = new float[s - 10];
  //float my [] = new float[s - 10];

  Ball(PVector start, int i) {
    frames = 0;
    pos = new PVector (start.x, start.y);
    vel = new PVector(0, 0);
    angle = random(0, PI/4);
    vel.x = cos(angle) * speed * i;
    vel.y = sin(angle) * speed * 1;
  }


  void display() {
    frames++;
    //if (frames > 5) {
    //  for (int i = 1; i < mx.length; i ++) {
    //    mx[i-1] = mx[i];
    //    my[i-1] = my[i];
    //  }
    //  mx[mx.length - 1] = pos.x;
    //  my[my.length -1] = pos.y;

      //for (int i = 0; i < mx.length; i ++) {
      //  fill(map(pos.x, width, 0, 251, 20), 44, map(pos.x, 0, width, 251, 20));
      //  rect(mx[i], my[i], s, s);
      //}
    //}
//



    fill(map(pos.x, width, 0, 255, 0), map(pos.x, 0, width, 200, 44), map(pos.x, 0, width, 255, 0));
    rect(pos.x, pos.y, s, s);
  }

  void update() {
    //VERTICAL BOUNDARY
    if (pos.y < s/2 || pos.y > height - s/2) {
      vel.y *= -1;
    }
    //IF GOES OUT OF  BOUNDS POINT
    if ( pos.x < 0 ) {
      counterP2++;
    }
    if ( pos.x > width + s) {
      counterP1 ++;
    }
    pos.add(vel);
  }

  //CHECK COLLISION OF BALLS AND PADDLES
  boolean collided() {
    //LEFT PADDLE 
    if (pos.x > p1.x && pos.x < (p1.x + p1.w) && pos.y > p1.y && pos.y < (p1.y +p1.h)) {
      leftPaddleCollision = true;
      return true;
      //RIGHT PADDLE
    } else if ((pos.x + s) > p2.x && (pos.x + s) < (p2.x + p2.w) && pos.y > p2.y && pos.y < (p2.y +p2.h)) {
      rightPaddleCollision = true;
      return true;
    } else {
      rightPaddleCollision = false;
      leftPaddleCollision = false;
      return false;
    }
  }
  void changeDirections () {

    vel.x *= -1;
    vel.y *= -1;

    if (pos.x <width/2) {
      bs.addBall(pos, positive);
    } else if (pos.x > width/2) {
      bs.addBall(pos, negative);
    }
  }

  boolean isOut () {
    if (pos.x < 0 || pos.x > width + s) {
      return true;
    } else {
      return false;
    }
  }
}