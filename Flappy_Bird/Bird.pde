class Bird {
  int x = width/4;
  int y = (int) height/2;
  int w = (int) height/12;
  int h = (w*9)/14;
  float yVel = 0;
  boolean dead = false;
  int jumpHeight = height/80;
  int jumpDistance = 0;

  Bird() {
    float velocity = -jumpHeight;

    while (velocity < 0) {
      jumpDistance -= velocity;
      velocity+= gravity;
    }
  }

  void show() {
    pushMatrix();
    translate(x, y);
    rotate(yVel*PI/160);
    imageMode(CENTER);
    image(birdImg, 0, 0, w, h);
    popMatrix();
  }

  void update() {
    if (!dead) {
      y += yVel;
      yVel+=gravity;
      checkDeath();
    } else if (y < height - height/20) {
      y += yVel;
      yVel+=gravity;
    } else {
      y = height - height/20;
    }
  }

  void checkDeath() {
    if (y >= height-height/20) {
      y = height-height/20;
      showPopUp = true;
      dead = true;
    }
  }

  void jump() {
    yVel = -jumpHeight;
  }
}
