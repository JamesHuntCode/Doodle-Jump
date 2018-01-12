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
    rect(this.posX, this.posY, this.sideLength * 2, this.sideLength / 4);
  }
  
  void touches(Jumper player) {
     
  }
}