class Cloud {
  int size = (int) random(width/10, width/6);
  int x = (int) random(width);
  int y = (int) random(height/2);

  void show() {
    imageMode(CENTER);
    image(cloudImg, x, y, size, size/88*50);
  }

  void update() {
    if (x > -size) {
      if (!bird.dead && started) {
        x -= speed*5/4;
      } else {
        x -= speed/4;
      }
    } else {
      size = (int) random(width/6);
      x = (int) width + width/6;
      y = (int) random(height/2);
    }
  }
}
