class Bouncepad {
  float posX;
  float posY;
  float sideLength = 50;
  
  // Movement engine
  float velocity = 0;
  float movementOffset = 1.1;
  float movementEase = 0.9;
  boolean active = true;
  
  // Extended movement engine (used if platform moves horizontally)
  boolean moves;
  float movementSpeed = random(-5, 5);
  float newSpeed = 3;
  
  Bouncepad(float x, float y, boolean moves) {
    this.posX = x;
    this.posY = y;
    this.moves = moves;
    
    // Adjust speeds if needed
    if (movementSpeed >= -1 && movementSpeed <= 1) {
      if (random(0, 2) == 1) {
        movementSpeed = -newSpeed;
      } else {
        movementSpeed = newSpeed;
      }
    }
  }
  
  void update() {
     this.posY += this.velocity;
     this.velocity *= this.movementEase;
     
     if (moves) {
       this.posX += this.movementSpeed;
     }
  }
  
  void show() {
    if (!moves) {
      // Green platform
      fill(0, 255, 0);
      stroke(0);
      strokeWeight(1);
      ellipse(this.posX, this.posY, this.sideLength * 2.5, this.sideLength / 3);
    } else {
      // Blue platform
      fill(0, 0, 255);
      stroke(0);
      strokeWeight(1);
      ellipse(this.posX, this.posY, this.sideLength * 2.5, this.sideLength / 3);
    }
  }
  
  boolean touches(Jumper player) {
     if (player.posY >= (this.posY - this.sideLength / 4) && player.posY <= (this.posY + this.sideLength / 4)) {
       if (player.posX >= (this.posX - this.sideLength * 1.5) && player.posX <= (this.posX + this.sideLength * 1.5)) {
         return true;
       } else {
         return false; 
       }
     } else {
       return false;
     }
  }
  
  void moveDown() {
    this.velocity += this.movementOffset;
  }
  
  boolean isOffScreen() {
    return ((this.posY - this.sideLength / 2) > height);
  }
  
  void edges() {
    if (this.posX - this.sideLength > width) {
      this.posX = -this.sideLength;
    } else if (this.posX + this.sideLength < 0) {
      this.posX = width + this.sideLength;
    }
  }
}