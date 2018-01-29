class Paddle {

  float x; 
  float y;
  float w = 20;
  float h = 100;
  color c;

  Paddle (float _x, float _y, color _c) {
    y = _y;
    x = _x;
    c = _c;
  }

  void display () {
    fill (c);
    rect(x, y, w, h);
  }

  void moveUp() {
    y -= 8;
  }
  void moveDown() {
    y += 8;
  }
}