import processing.sound.*;

//colours
color white = #FFFFFF;
color black = #000000;
color aqua = #2083AF;
color magenta = #AF207B;
color green = #769B50;

//Player variables
float x, y, d, player1x, player1y, player1d, player2x, player2y, player2d;
float x2, y2, d2;
color b = #3F9B9D;

//ball variables
float ballx, bally, balld;
float vx, vy;
float ax, ay;

//score
int points;
int p1score;

//Keyboard variables

boolean wKey, aKey, sKey, dKey, upKey, downKey, leftKey, rightKey;

SoundFile fail, success, music;

void setup() {
  //loading assets
  fail = new SoundFile(this, "FAILURE.wav");
  success = new SoundFile(this, "SUCCESS.wav");
  music = new SoundFile(this, "MUSIC.mp3");
  size(600, 600, P2D);
  x = width/2;
  y = height/2;
  d = 100;

  x2 = width/2;
  y2 = height/2;
  d2 = 100;
  //ball setup
  ballx = width/2;
  bally = height/2;
  balld = 50;

  vx = -6;
  vy = 8;
  
  music.loop();
  music.amp(0.2);
  //music.pan( );
}

void draw() {
  background(white);

  //player 1
  strokeWeight(5);
  stroke(black);
  fill(aqua);
  circle( x, y, d);



  //movement
  if (wKey) y = y - 5;
  if (sKey) y = y + 5;
  if (aKey) x = x - 5;
  if (dKey) x = x + 5;

  strokeWeight(5);
  stroke(black);
  fill(magenta);
  circle( x2, y2, d2);

  if (upKey) y2 = y2 - 5;
  if (downKey) y2 = y2 + 5;
  if (leftKey) x2 = x2 - 5;
  if (rightKey) x2 = x2 + 5;

  strokeWeight(5);
  fill(b);
  stroke(0);
  circle(ballx, bally, balld);

  strokeWeight(5);
  fill(green);
  stroke(0);
  circle(300, 600, 200);


  //movement
  ballx = ballx + vx;
  bally = bally + vy;

  if (bally <= 25) { //top
    vy = vy * -1;
    bally = 25;
  }
  if (bally >= height) {
    vy = vy * -1;
    bally = height;
  }
  if (ballx <= 25) {
    vx = vx * -1;
    ballx = 25;
  }
  if (ballx >= width) {
    vx = vx * -1;
    ballx = width;
  }

  if (dist(x, y, ballx, bally) <= d/2 + balld/2) {
    vx = (ballx - x)/5;
    vy = (bally - y)/5;
    fail.play();
  }
  if (dist(x2, y2, ballx, bally) <= d2/2 + balld/2) {
    vx = (ballx - x2)/5;
    vy = (bally - y2)/5;
  }
  if (dist(width/2, height/2, ballx, bally) <= 100 + balld/2) {
    p1score = p1score + 1;
  }
}

void keyPressed() {

  if (key == 'w') wKey = true;
  if (key == 's') sKey = true;
  if (key == 'a') aKey = true;
  if (key == 'd') dKey = true;

  if (keyCode == UP) upKey = true;
  if (keyCode == DOWN) downKey = true;
  if (keyCode == RIGHT) rightKey = true;
  if (keyCode == LEFT) leftKey = true;
}
void keyReleased() {

  if (key == 'w') wKey = false;
  if (key == 's') sKey = false;
  if (key == 'a') aKey = false;
  if (key == 'd') dKey = false;

  if (keyCode == UP) upKey = false;
  if (keyCode == DOWN) downKey = false;
  if (keyCode == RIGHT) rightKey = false;
  if (keyCode == LEFT) leftKey = false;
}

void mouseReleased() {
  fail.play();
}
