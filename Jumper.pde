class Jumper {
  float posX;
  float posY;
  float size = 20;
  
  float upthrust = 20;
  float gravity = 2;
  float trim = 0.9;
  float xVelocity = 0;
  float yVelocity = 0;
  
  Jumper(float x, float y) {
    this.posX = x;
    this.posY = y;
  }
  
  void update() {
    this.posY += this.yVelocity;
    this.yVelocity *= this.trim;
    
    if (this.posY == 0) {
      this.yVelocity = 0;
    }
  }
  
  void show() {
    stroke(255);
    ellipse(this.posX, this.posY, this.size, this.size);
  }
  
  void move(int direction) {
    if (direction == 1) { 
      // Move left
      this.posX -= this.size;
    } else { 
      // Move right
      this.posX += this.size;
    }
  }
  
  void bounce() {
    this.yVelocity += this.upthrust;
  }
}