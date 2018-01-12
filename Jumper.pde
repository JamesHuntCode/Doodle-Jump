class Jumper {
  float posX;
  float posY;
  float size = 20;
  
  float upthrust = 100;
  float gravity = 1;
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