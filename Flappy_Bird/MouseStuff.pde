void touchStarted() {
  if (!started) {
    started = true;
    bird.jump();
    speed = 10;
  } else if (bird.dead) {
    for (int i = 0; i < buildings.length; i++) {
      buildings[i] = new Building();
    }
    showPopUp = false;
    started = false;
    bird = new Bird();
    score = 0;
    pipes = new ArrayList<Pipe>();
    pipes.add(new Pipe(pipeGap));
  } else if (!bird.dead) {
    bird.jump();
  }
}
