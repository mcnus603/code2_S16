function setup() {
  // put setup code here
  createCanvas(window.innerWidth, window.innerHeight);
}

function draw() {
  // put drawing code here


  background(255);
  translate(mouseX, mouseY);
  rotate(sin(frameCount * .03)* TWO_PI);
  textSize(20);
  textAlign(CENTER);
  text("Sarah", 0, 0);
 

}