class Pipe {
  int x = width*3/2;
  int y;
  int size = (int) bird.w*5/3;
  int gap;
  boolean addedScore = false;

  Pipe(int _gap) {
    gap = _gap;
    y = (int) random(height/10, height*9/10 - gap);
    topPipe.resize(size, 12*size);
    bottomPipe.resize(size, 12*size);
  }

  void show() { 
    imageMode(CORNER);
    image(topPipe, x, y - topPipe.height);
    image(bottomPipe, x, y + gap);
  }

  void update() {
    x -= speed;
    if (x + size < 0) {
      x = width;
      y = (int) random(height/10, height*9/10 - gap);
      speed+=0.5;
      addedScore = false;
      if(score%10 == 0 && gap > bird.jumpDistance*0.9 + bird.h) {
        gap--;
      }
    }
  }

  void checkDeath() {
    if (bird.x + bird.h/2 > x && bird.x - bird.h/2 < x + size) {
      if (bird.y - bird.h/2 < y || bird.y + bird.h/2 > y + gap) {
        bird.dead = true;
        showPopUp = true;
      } else if (!addedScore && x + size < bird.x) {
        addedScore = true;
        score++;
      }
    }
  }
}
