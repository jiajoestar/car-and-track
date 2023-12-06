class Car {
  private float x;
  private float y;
  private color clr;
  private float theSize;
  private int score; // total number of times the car has won a race


  public Car(float xp, float yp, float size, color c) {
    theSize = size;
    setPosition(xp);
    y = yp;
    clr = c;
    score = 0;
  }

  public void display() {
    // offset to draw the wheels
    float wheelOffset = theSize / 4;
    rectMode(CENTER);
    // draw the chassis
    stroke(0);
    fill(clr);
    rect(x, y, theSize, theSize/2);
    fill(255);
    text(score, x, y);
    // draw the wheels
    fill(0);
    rect(x - wheelOffset, y - wheelOffset, wheelOffset, wheelOffset/2);
    rect(x + wheelOffset, y - wheelOffset, wheelOffset, wheelOffset/2);
    rect(x - wheelOffset, y + wheelOffset, wheelOffset, wheelOffset/2);
    rect(x + wheelOffset, y + wheelOffset, wheelOffset, wheelOffset/2);
  }

  public void move() {
    x = x + random(0, 10);
  }
  
  public float getPosition() {
    // return the X position of the front of the car
    return x + theSize/2;
  }
  
  public void setPosition(float newPos) {
    x = newPos - theSize/2;
  }
  
  public void increaseScore() {
    score = score + 1;
  }
  
}
