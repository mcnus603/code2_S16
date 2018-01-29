class BallSystem {
  ArrayList <Ball> balls;
  float x;
  float y;


  BallSystem () {
    balls = new ArrayList<Ball>();
  }

  void addBall(PVector origin) {
    balls.add(new Ball(origin));
  }



  void run() {
    if (balls.size() == 0) {
      balls.add(new Ball(middle));
    }

    for (int i = balls.size() - 1; i >=0; i--) {
      Ball b = balls.get(i);
      
      if (b.collided()) {
        b.changeDirections();
        //Ideally spawn here
      }
      if (b.isOut()) {
        balls.remove(i);
      }
      b.display();
      b.update();
      
    }
  }
  
  void gameEnd(color c) {
   for (int i = balls.size() - 1; i >= 0; i--) {
    balls.remove(i);
    rectMode(CENTER);
    fill(c);
    rect(width/2, height/2, 400, 300);
    fill(255);
    textSize(24);
    textAlign(CENTER);
    text("WE HAVE A WINNER", width/2, height/2);
   }
  }
}