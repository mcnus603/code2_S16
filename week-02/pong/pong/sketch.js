
//For spawning game, should probably collision check in ball
//then ball reverse function
//Convert exerything to PVector 




var p1Red;
var p2Blue;

var rightPaddle; 
var LeftPaddle; 

var p1;
var p2;

var p1Up = false;
var p1Down = false;
var p2Up = false;
var p2Down = false;

var counterP2;
var counterP1;
var positive = 1;
var negative = -1;

var rightPaddleCollision;
var leftPaddleCollision;

var b;
var s = 15;

var middle;
var collision;

//SETUP
function setup() {
	createCanvas(1000, 700);
	noStroke();
	counterP2 = 0;
	counterP1 = 0;

	ball = new Ball ();

	p1Red = color ('rgb(120, 220, 250)');
	p2Blue = color('rgb(250, 90, 70)');

	leftPaddle = createVector(50, height/2 +30);
	rightPaddle = createVector(width - 50, height/2, +30);

	p1 = new Paddle(leftPaddle, p1Red);
	p2 = new Paddle(rightPaddle, p2Blue);

	middle = createVector(width/2, height/2);
	var i = int(random(1));
	if (i == 0) {
		i = -1;
	} else if (i == 1) {
		i = 1;
	}
}
//DRAW
function draw() {
	console.log(collision);
	background(255); 
	rectMode(CORNER);
	fill(p2Blue);
	rect(0, 0, width/2, height);
	fill(p1Red);
	rect( width/2, 0, width/2, height);

//for however balls are in the array, loop through and check collisions 
checkCollision(b, p1);
checkCollision(b, p2);

textSize(40);
fill(p1Red);
text(str(counterP1), 200, 100);
fill(p2Blue);
text(str(counterP2), width - 200, 100);

if (p1Up) {
	p1.moveUp();
}
if (p2Up) {
	p2.moveUp();
}
if (p1Down) {
	p1.moveDown();
}
if (p2Down) {
	p2.moveDown();
}

p1.display();
p2.display();	


if (counterP1 > 9) {
	var s = "PLAYER 1";
	endGame(s);
}
if (counterP2 > 9) {
	var s = "PLAYER 2";
	endGame(s);
}

}

function checkCollision(ball, paddle) {
	if (ball.pos.x > paddle.pos.x && ball.pos.x < paddle.pos.x + paddle.width ||
		ball.pos.y > paddle.pos.y && ball.pos.y + paddle.height) {
		ball.vel.x *= -1;
}
}

//Paddle Class
function Paddle(num) {
	this.pos = createVector(0,0);
	this.vel = createVector(0,5);
	this.w = 20;
	this.h = 100;

	this.display = function (color) {
		fill(color);
		rect(this.pos.x, this.pos.y, this.w, this.h);
	}
	this.update = function() {
		
	}

	this.moveUp = function() {
		if (pos.y > 0) {
			pos.y -= 5;	
		}
	}
	this.moveDown = function() {
		if (pos.y < height - h) {
			pos.y += 5;	
		}
	}
}


//Ball Class
function Ball(){
	this.pos = createVector(width/2, height/2);
	this.vel = createVector(0, random(-5, 5));

	var r = random();

	if(r < 0.5) {
		this.vel.x = random(1, 5);
	} else {
		this.vel.x = random(-5, -1);
	}

	this.update = function () {
		if (this.pos.x < this.s/2 || this.pos.x > width - this.s/2) {
			this.vel.x *= -1;
		}
		if (this.pos.y < this.s/2 || this.pos.y > height - this.s/2) {
			this.vel.y *= -1;
		}

		this.pos.add(this.vel);
	}

	this.display = function() {
		noStroke();
		fill(255);
		fill(map(this.x, width, 0, 255, 0), map(this.x, 0, width, 200, 44), map(this.x, 0, width, 255, 0));
		rect(this.pos.x, this.pos.y, this.s, this.s);
	}

// this.display(){
// 	noStroke();
// 	rectMode(CENTER);
// 	rect(this.x, this.y, s, s);
// 	this.x += this.dx;
// 	this.y += this.dy;

// 	if (this.x < 0) {
// 		counterP2++;
// 		this.x = width/2;
// 		this.y = height/2;
// 		this.dx = -this.dx;  
// 		this.dy = random(1,-1);
// 	}

// 	if (this.x > width) {
// 		counterP2++;
// 		this.x = width/2;
// 		this.y = height/2;
// 		this.dx = -this.dx;  
// 		this.dy = random(2,-2);
// 	}

// 	if (this.y < 0 || this.y > height) {
// 		this.dy *= -1;
// 		this.y += this.dy;
// 	} else { 
// 		this.y += this.dy;
// 	}	
}


	//Ball System Class
	

	function keyPressed() {
		if (key === 'W') {
			p1Up = true;
		}
		if (key === 'S') {
			p1Down = true;
		}
		if (keyCode === UP_ARROW) {
			p2Up = true;
		}
		if (keyCode === DOWN_ARROW) {
			p2Down = true;
		}
	}

	function keyReleased() {
		if (key === 'W') {
			p1Up = false;
		}
		if (key === 'S') {
			p1Down = false;
		}

		if (keyCode === UP_ARROW) {
			p2Up = false;
		}
		if (keyCode === DOWN_ARROW) {
			p2Down = false;
		}
	}

	function endGame (s) {
		rectMode(CENTER);
		fill(255);
		rect(width/2, height/2, 400, 300);
		fill(0);
		textSize(24);
		textAlign(CENTER);
		text(s + " IS THE WINNER", width/2, height/2)
	}











