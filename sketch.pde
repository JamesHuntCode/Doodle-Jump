Jumper player;

void setup(){
  size(600, 800);
  player = new Jumper(width / 2, height / 2);
}

void draw() {
  background(51);
  player.show();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      if (!(player.posX - (player.size * 1.5) < 0)) {
       player.move(1);
      }
    } else if (keyCode == RIGHT) {
      if (!(player.posX + (player.size * 1.5) > width)) {
        player.move(2);
      }
    }
  }
}