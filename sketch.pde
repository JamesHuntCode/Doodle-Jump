Jumper player;
Bouncepad[] bouncepads = new Bouncepad[20];

void setup(){
  size(600, 800);
  
  // Initialize player icon
  player = new Jumper(width / 2, height / 2);
  
  // Setup bouncepads
  int offset = 100;
  for (int i = 0; i < bouncepads.length; i++) {
    bouncepads[i] = new Bouncepad(random(0, width - 100), offset);
    offset += 100;
  }
}

void draw() {
  background(51);
  
  // Draw player
  player.show();
  player.edges();
  player.update();
  
  if (player.fallsOffScreen()) {
    // Restart the game
  }
  
  // Draw boucepads
  for (int i = 0; i < bouncepads.length; i++) {
    bouncepads[i].show();
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