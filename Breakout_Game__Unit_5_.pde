int mode;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER= 3;
final int GAMEWIN = 4;
//Color
color red = #DE1919;
color blue = #1944DE;
color goal = #DB6A31;
color yellow = #DBA531;
color ball = #68C69E;
color red2 = #FA0011;
color green = #02BC09;
color purple = #9A00D3;
color nightsky = #354264;

//Player
float px, py, d, x2, y2, d2, x3, y3, d3, x4, y4, d4, x5, y5, d5;

//Ball
float ballx, bally, balld;
float vx, vy;
float ax, ay;

//score
int points;
int score = 0;
int p1score = 0;
int life = 3;

//Keyboard
boolean wKey, aKey, sKey, dKey, upKey, downKey, leftKey, rightKey;

//Brick Variables
int[] x;
int[] y;
boolean[] alive;
int brickd;
int n;
int tempx, tempy;


void setup() {
  size(1000, 800, P2D);
  
  

  px = 500;
  py = 700;
  d = 50;
  
  //ballx = 500;
  //bally = 400;
  //balld = 20;

  //ball setup
 
    ballx = width/2;
    bally = height/2;
    balld = 20;

    vx = 20;
    vy = 20;
    
    
    // set up array of bricks
    brickd = 50;
    n = 36;
    x = new int[n];
    y = new int[n];
    alive = new boolean[n];
    tempx = 100;
    tempy = 100;
    
    int i = 0;
    while (i < n) {
      x[i] = tempx;
      y[i] = tempy;
      alive[i] = true;
      tempx = tempx + 100;
     if (tempx == width) {
       tempx = 100;
       tempy = tempy + 100;
      }
      i = i + 1;
  }
}

  void draw() {

    if (mode == INTRO) {
      intro();
    } else if (mode == GAME) {
      game();
    } else if (mode == PAUSE) {
      pause();
    } else if (mode == GAMEWIN) {
      gameWin();
    } else if ( mode == GAMEOVER) {
      gameOver();
    } else {
      println("Error, mode is" + mode);
    }
    px = constrain(px, 25, 975);
  }
