class Grass {
  int nextTime;
  int x = (int) random(width);
  int y = (int) random(height - height/15, height - height/40);
  boolean moving = true;
  
  void show() {
    image(grassImg, x, y);
  }
  
  void update() {
    if(millis() >= nextTime && !moving) {
      moving = true;
    } else if(millis() > nextTime) {
      if(x < 0) {
        nextTime = (int) random(1000, 3000) + millis();
        moving = false;
        x = width + width/20;
      } else {
        if(!bird.dead && started && moving) {
          x-=speed;
        }
      }
    }
  }
}
