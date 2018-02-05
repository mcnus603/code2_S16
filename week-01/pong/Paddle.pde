class Paddle {

  PVector pos;
  float x; 
  float y;
  float w = 20;
  float h = 100;
  color c;

  Paddle (PVector start, color _c) {
    pos = new PVector (start.x, start.y);
    c = _c;
  }

  void display () {
    fill (c);
    rect(pos.x, pos.y, w, h);
    x = pos.x;
    y = pos.y;
  }

  void moveUp() {
    pos.y -= 5;
  }
  void moveDown() {
    pos.y += 5;
  }
}