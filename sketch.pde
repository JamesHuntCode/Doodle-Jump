Jumper player;
int playerScore = 0;
ArrayList<Bouncepad> bouncepads = new ArrayList<Bouncepad>();

void setup(){
  // Draw canvas
  size(600, 800);
  
  // Initialize player icon
  player = new Jumper(width / 2, height / 2);
  
  // Setup initial amount of bouncepads
  int offsetValue = -175;
  int offset = height;
  
  for (int i = 0; i < 50; i++) {
    bouncepads.add(new Bouncepad(random(75, width -75), offset, false));
    offset += offsetValue;
  }
}

void draw() {
  background(#E0E0E0);
  
  // Draw player's score (top left of screen)
  stroke(0);
  fill(0);
  textSize(15);
  text("Your Score: " + playerScore, 5, 15);
  noFill();
  noStroke();
  
  // Draw player
  player.show();
  player.edges();
  player.update();
  
  if (player.fallsOffScreen()) {
    player.posY = height / 2;
  }
  
  // Dynamically adjust map
  if (player.posY < height / 3) {
    for (int i = 0; i < bouncepads.size(); i++) {
      Bouncepad currentBouncepad = bouncepads.get(i);
      currentBouncepad.moveDown();
    }
  }
  
  // Draw boucepads
  for (int i = 0; i < bouncepads.size(); i++) {
    Bouncepad currentBouncepad = bouncepads.get(i);
    currentBouncepad.show();
    currentBouncepad.update();
  }
  
  for (int i = 0; i < bouncepads.size(); i++) {
    // Check for user landing on jump pads
    Bouncepad currentBouncepad = bouncepads.get(i);
    if (currentBouncepad.touches(player) && !(player.yVelocity < 0)) {
      player.bounce();
      
      // Add to user score
      if (currentBouncepad.active) {
        playerScore += 100;
      }
      
      currentBouncepad.active = false;
    }
    
    if (currentBouncepad.isOffScreen()) {
      bouncepads.remove(i);
      
      // Dynamically add more platforms
      boolean movementStatus = (random(0, 100) > 75);
      bouncepads.add(new Bouncepad(random(75, width - 75), bouncepads.get(bouncepads.size() - 1).posY - 150, movementStatus));
    }
    
    // Keep moving platforms on the screen
    if (currentBouncepad.moves) {
      currentBouncepad.edges();
    }
  }
}

// Handle player movement requests
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      player.move(1);
    } else if (keyCode == RIGHT) {  
      player.move(2);
    }
  }
}