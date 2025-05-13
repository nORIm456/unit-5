import processing.sound.*;
//mode variables
int mode;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER= 3;
//Color
color red = #DE1919;
color blue = #1944DE;
color goal = #DB6A31;
color yellow = #DBA531;
color ball = #68C69E;
color red2 = #FA0011;
color green = #02BC09;
color purple = #9A00D3;

//Player
float x, y, d, x2, y2, d2, x3, y3, d3, x4, y4, d4, x5, y5, d5;

//Ball
float ballx, bally, balld;
float vx, vy;
float ax, ay;

//score
int points;
int p1score = 0 ;

//Keyboard
boolean wKey, aKey, sKey, dKey, upKey, downKey, leftKey, rightKey;

SoundFile fail, success, music;
void setup() {
  fail = new SoundFile(this, "FAILURE.wav");
  success = new SoundFile(this, "SUCCESS.wav");
  music = new SoundFile(this, "MUSIC.mp3");
  size(800, 600, P2D);
  x = width/2;
  y = height/2;
  d = 50;

  x2 = width/2;
  y2 = height/2;
  d2 = 50;
  
  x3 = width/2;
  y3 = height/2;
  d3 = 150;
  
  x4 = width/2;
  y4 = height/2;
  d4 = 100;
  
  x5 = width/2;
  y5 = height/2;
  d5 = 200;
  
  //ball setup
  ballx = width/2;
  bally = height/2;
  balld = 20;

  vx = -6;
  vy = 8;
  
  music.loop();
}

void draw() {
  
  if(mode == INTRO) {
   intro();
  }else if (mode == GAME) {
    game();
  }else if (mode == PAUSE) {
    pause();
  }else if ( mode == GAMEOVER) {
    gameOver();
  } else {
    println("Error, mode is" + mode);
  }
}
   
