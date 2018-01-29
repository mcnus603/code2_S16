class Ball {

  PVector pos;
  PVector vel;
  PVector left;
  PVector right;
  float angle;
  float speed = 5;
  float s = 15;
  color c;



  Ball(PVector start) {

    pos = new PVector (start.x, start.y);
    vel = new PVector(0, 0);
    left = new PVector (p1.x + p1.w, p1.y);
    right = new PVector(p2.x, p2.y);

    angle = random(0, PI/4);
    vel.x = cos(angle) * speed;
    vel.y = sin(angle) * speed;

    //c = color (random(255), random(255), random(255));
  }


  void display() {

    fill(map(pos.x, width, 0, 251, 20), 44, map(pos.x, 0, width, 251, 20));
    
    rect(pos.x, pos.y, s, s);
  }

  void update() {
    left.x = p1.x + p1.w + 20;
    left.y = p1.y - 20;
    right.x = p2.x - 20;
    right.y = p2.y - 20;

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
      return true;

      //RIGHT PADDLE
    } else if ((pos.x + s) > p2.x && (pos.x + s) < (p2.x + p2.w) && pos.y > p2.y && pos.y < (p2.y +p2.h)) {

      
      return true;
    } else {
      return false;
    }
  }
  void changeDirections () {
    vel.x *= -1;
    vel.y *= -1;
    
    if (pos.x > width/2) {
      bs.addBall(right);
    } else {
      bs.addBall(left);
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