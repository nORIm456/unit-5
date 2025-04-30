color b = #3F9B9D;

float ballx, bally, balld;
float vx, vy;
float ax, ay;

void setup() {
  size(600, 600 , P2D);
  ballx = width/2;
  bally = height/2;
  balld = 50;
  
  vx = -4;
  vy = 5;
  
  ax = 0;
  ay = 2;
  
}

void draw() {
  strokeWeight(5);
  fill(b);
  stroke(0);
  circle(ballx, bally, balld);
  
  //movement
  ballx = ballx + vx;
  bally = bally + vy;
  
  //gravity
  vx = vx + ax;
  vy = vy + ay;
  
  //bouncing ball
  if(bally <= 25) { //top
  vy = vy * -0.9;
  bally = 25;
  }
  if(bally >= height) {
    vy = vy * -0.9;
    bally = height;
  }
  if(ballx <= 25) {
    vx = vx * -0.9;
    ballx = 25;
    }
  if(ballx >= width) {
    vx = vx * -0.9;
    ballx = width;
  }
}
