Bird bird;
boolean started = false;
ArrayList<Pipe> pipes = new ArrayList<Pipe>();
int score = 0;
boolean showPopUp = false;
int highScore = 0;
float gravity;
int pipeGap;
PImage grassImg;
PImage cloudImg;
PImage topPipe;
PImage bottomPipe;
PImage birdImg;
float speed = 10;
Cloud[] clouds;
Building[] buildings;
Grass[] grass;

void setup() {
  cloudImg = loadImage("Cloud.png");
  topPipe = loadImage("TopPipe.png");
  bottomPipe = loadImage("BottomPipe.png");
  birdImg = loadImage("FlappyBirdImg.png");
  grassImg = loadImage("Grass.png");
  orientation(PORTRAIT);
  frameRate(60);
  textAlign(CENTER);
  clouds = new Cloud[(int) width/300];
  buildings = new Building[(int) width/250];
  grass = new Grass[(int) width/330];  
  for (int i = 0; i < grass.length; i++) {
    grass[i] = new Grass();
  }
  noStroke();

  fullScreen();
  gravity = height/1000;
  bird = new Bird();
  grassImg.resize(bird.w, bird.w);
  pipeGap = bird.h*2 + (int) (bird.jumpDistance*1.5);
  pipes.add(new Pipe(pipeGap));
  
  for (int i = 0; i < buildings.length; i++) {
    buildings[i] = new Building();
  }
  for (int i = 0; i < clouds.length; i++) {
    clouds[i] = new Cloud();
  }
}

void draw() {
  background(100, 180, 255);
  for (int i = 0; i < clouds.length; i++) {
    clouds[i].show();
    clouds[i].update();
  }

  for (int i = 0; i < buildings.length; i++) {
    buildings[i].show();
    if (!bird.dead && started) {
      buildings[i].update();
    }
  }

  fill(0, 220, 60);
  rect(0, height*19/20, width, height/10);

  for (int i = 0; i < grass.length; i++) {
    grass[i].show();
    grass[i].update();
  }

  if (started) {
    bird.update();
  }
  bird.show();

  for (int i = 0; i < pipes.size(); i++) {
    pipes.get(i).show();
    if (!bird.dead && started) {
      pipes.get(i).update();
      pipes.get(i).checkDeath();
    }
  }

  fill(255, 200);
  textSize(height/10);
  text(score, width/2, height/10);

  if (score > highScore) {
    highScore = score;
  }
  if (showPopUp) {
    fill(50, 200);
    rect(width/2 - 7*width/16, height/2 - height/6, 7*width/8, height/3, min(width, height)/20);
    fill(255, 200);
    textSize(height/22);
    text("Score : " + score + "\nHigh Score : " + highScore, width/2, height/2 - height/12);
    if (highScore == score) {
      fill(50, 200, 50);
      text("NEW BEST!!!!", width/2, height/2 + height/14);
    } else if (highScore - score <= 5) {
      fill(200, 150, 50);
      text("Almost New Best!!!", width/2, height/2 + height/14);
    }
  }
}
