class Bouncepad {
  float posX;
  float posY;
  float sideLength = 50;
  float velocity = 0;
  float movementOffset = 1.1;
  float movementEase = 0.9;
  
  Bouncepad(float x, float y) {
    this.posX = x;
    this.posY = y;
  }
  
  void update() {
     this.posY += this.velocity;
     this.velocity *= this.movementEase;
  }
  
  void show() {
    fill(0, 255, 0);
    stroke(165, 42, 42);
    strokeWeight(2);
    ellipse(this.posX, this.posY, this.sideLength * 2.5, this.sideLength / 2);
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
}