Jumper player;
Bouncepad[] bouncepads = new Bouncepad[50];

void setup(){
  size(600, 800);
  
  // Initialize player icon
  player = new Jumper(width / 2, height / 2);
  
  // Setup bouncepads
  int offsetValue = -175;
  int offset = height;
  for (int i = 0; i < bouncepads.length; i++) {
    bouncepads[i] = new Bouncepad(random(75, width - 50), offset);
    offset += offsetValue;
  }
}

void draw() {
  background(#E0E0E0);
  
  // Draw player
  player.show();
  player.edges();
  player.update();
  
  if (player.fallsOffScreen()) {
    player.posY = height / 2;
  }
  
  // Dynamically adjust map
  if (player.posY < height / 3) {
    for (int i = 0; i < bouncepads.length; i++) {
      bouncepads[i].moveDown();
    }
  }
  
  // Draw boucepads
  for (int i = 0; i < bouncepads.length; i++) {
    bouncepads[i].show();
    bouncepads[i].update();
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