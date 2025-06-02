PImage[] gif;
int numberOfFrames;
int f;

void setup() {
  
  numberOfFrames = 59;
  gif = new PImage[numberOfFrames];
  
    int i = 0;
  while ( i < numberOfFrames ) {
      gif[i] = loadImage("frame_"+i+"_delay-0.03s.gif");
    i = i + 1;
 }
 
 size(1000, 800, P2D);
 
}

void draw() {
  image(gif[f], 0, 0, width, height);
  println(frameCount);
  f = f + 1;
  if (f == numberOfFrames) f = 0;
}
