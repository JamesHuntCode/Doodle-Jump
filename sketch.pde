Jumper player;
Bouncepad[] bouncepads = new Bouncepad[50];

void setup(){
  size(600, 800);
  
  // Initialize player icon
  player = new Jumper(width / 2, 0);
  
  // Setup bouncepads
  int offset = 150;
  for (int i = 0; i < bouncepads.length; i++) {
    bouncepads[i] = new Bouncepad(random(75, width - 50), offset);
    offset += 150;
  }
}

void draw() {
  background(255);
  
  // Draw player
  player.show();
  player.edges();
  player.update();
  
  if (player.fallsOffScreen()) {
    player.posY = 0;
  }
  
  // Draw boucepads
  for (int i = 0; i < bouncepads.length; i++) {
    bouncepads[i].show();
  }
  
  for (int i = 0; i < bouncepads.length; i++) {
    if (bouncepads[i].touches(player) && !(player.yVelocity < 0)) {
      player.bounce();
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      player.move(1);
    } else if (keyCode == RIGHT) {  
      player.move(2);
    }
  }
}