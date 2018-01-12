class Bouncepad {
  float posX;
  float posY;
  float sideLength = 50;
  float velocity = 0;
  
  Bouncepad(float x, float y) {
    this.posX = x;
    this.posY = y;
  }
  
  void update() {
     this.posY += this.velocity;
  }
  
  void show() {
    ellipse(this.posX, this.posY, this.sideLength * 2, this.sideLength / 4);
  }
  
  boolean touches(Jumper player) {
     if (player.posY >= (this.posY - this.sideLength / 4) && player.posY <= (this.posY + this.sideLength / 4)) {
       if (player.posX >= (this.posX - this.sideLength) && player.posX <= (this.posX + this.sideLength)) {
         return true;
       } else {
         return false; 
       }
     } else {
       return false;
     }
  }
}