class Bouncepad {
  float posX;
  float posY;
  float velocity = 0;
  
  Bouncepad(float x, float y) {
    this.posX = x;
    this.posY = y;
  }
  
  void update() {
     this.posY += this.velocity;
  }
  
  void show() {
    
  }
}