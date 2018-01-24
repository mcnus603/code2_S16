class Paddle {

  float x; 
  float y;
  float w = 20;
  float h = 100;

  Paddle (float _x, float _y) {
    y = _y;
    x = _x;
  }

  void display () {
    fill (255);
    rect(x, y, w, h);
  }

  void moveUp() {
    y -= 5;
  }

  void moveDown() {
    y += 5;
  }
}