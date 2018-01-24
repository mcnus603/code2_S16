class Ball {
  float x;
  float y;
  float dx;
  float dy;
  float s;

  Ball() {
    x = width/2;
    y = height/2;

    dy = 6;
    dx = 3; 
    s = 12;
  }


  void display() {
    fill(255);
    rect(x, y, s, s);
  }

  void update() {
    if (x < 0 || x > width + s) {
      x = width/2;
      y = height/2;
    } else {
      x += dx;
    } 

    if (y < 0 || y > height) {
      dy *= -1;
      y += dy;
    } else { 
      y += dy;
    }
  }

  void changeDirection () {
    dx *= -1;
    dy *= -1;
  }
}