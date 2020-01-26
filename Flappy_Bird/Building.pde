class Building {
  int x = (int) random(width);
  int h = (int) random(height/2, height*2/3);
  int w = (int) random(width/8, width/3);
  color col = color(random(100, 150));

  void show() {
    fill(col);
    rect(x, height - h, w, h);
  }

  void update() {
    if (x > -w ) {
      x-=speed*0.8;
    } else {
      x = width + (int) random(width/2);
      h = (int) random(height*2/3);
      w = (int) random(width/8, width/3);
      col = color(random(100, 150));
    }
  }
}
