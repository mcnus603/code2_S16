class BallSystem {
  ArrayList <Ball> balls;


  BallSystem () {
    balls = new ArrayList<Ball>();
  }

  void addBall(PVector origin, int i) {
    balls.add(new Ball(origin, i));
  }

  void run() {
    if (balls.size() == 0) {
      int i = int(random(1));
      if (i == 0) {
        i = -1;
      } else if (i == 1) {
        i = 1;
      }
      balls.add(new Ball(middle, i));
    }

    for (int i = balls.size() - 1; i >=0; i--) {
      Ball b = balls.get(i);

      if (b.collided()) {
        if (b.frames > 40) {
          b.changeDirections();
          b.frames = 0;
        }
      }
      if (b.isOut()) {
        balls.remove(i);
      }
      b.display();
      b.update();
    }
  }

  void gameEnd(String s) {
    for (int i = balls.size() - 1; i >= 0; i--) {
      balls.remove(i);
      rectMode(CENTER);
      fill(255);
      rect(width/2, height/2, 400, 300);
      fill(0);
      textSize(24);
      textAlign(CENTER);
      text(s + " IS THE WINNER", width/2, height/2);
    }
  }
}