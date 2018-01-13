class Jumper {
  float posX;
  float posY;
  float size = 25;
  
  float upthrust = -60;
  float sideSwing = 10;
  float gravity = 1.2;
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
    this.yVelocity += this.gravity;
    
    this.posX += this.xVelocity;
    this.xVelocity *= this.trim;
  }
  
  void show() {
    fill(0, 255, 0);
    noStroke();
    ellipse(this.posX, this.posY, this.size, this.size);
  }
  
  void move(int direction) {
    if (direction == 1) { 
      // Move left
      this.xVelocity -= this.sideSwing;
    } else { 
      // Move right
      this.xVelocity += this.sideSwing;
    }
  }
  
  void edges() {
    if (this.posX + this.size > width) {
      this.posX = this.size;
    } else if (this.posX - this.size < 0) {
      this.posX = width - this.size;
    }
  }
  
  void bounce() {
    this.yVelocity += this.upthrust;
  }
  
  boolean fallsOffScreen() {
    return(this.posY >= height);
  }
}