class Slider
{
  private Position pos;
  private int h;
  private float ratio;
  
  public Slider()
  {
    pos = new Position();
    h = 200;
    ratio = 0;
  }
  
  public Slider(Position pos, int h)
  {
    this.pos = pos;
    this.h = h;
    ratio = 0;
  }
  
  public Slider(Position pos, int h, float ratio)
  {
    this.pos = pos;
    this.h = h;
    this.ratio = ratio;
  }
  
  public Position getPosition() { return pos; }
  public int getHeight() { return h; }
  public float getRatio() { return ratio; }
  
  //public void setPosition(Position pos) { this.pos = pos; }
  //public void setHeight(int h) { this.h = h; }
  //public void setRatio(float ratio) { this.ratio = ratio; }
  
  public boolean isMouseWithin()
  {
    // rect(pos.getX(), pos.getY() - h * ratio, 20, 40);
    return mouseX > pos.getX() - 10 &&
           mouseX < pos.getX() + 10 &&
           mouseY > pos.getY() - h * ratio - 20 &&
           mouseY < pos.getY() - h * ratio + 20;
  }
  
  public void calcRatio() {
    float diff = pos.getY() - mouseY;
    if (diff > h)
    {
      ratio = 1;
    }
    else if (diff < 0)
    {
      ratio = 0;
    }
    else
    {
      ratio = diff / h;
    }
  }
  
  public void display()
  {
    // draw slide track
    stroke(255);
    line(pos.getX(), pos.getY(), pos.getX(), pos.getY() - h);
    
    // draw tick marks
    for (float i = 0; floatHelper(i, 100) || i < 100.0; i+=0.01)
    {
      float percentage = i / 100.0;
      if (floatHelper(i % 25, 0))
      {
        line(pos.getX() - 7, pos.getY() - h * percentage, pos.getX() + 7, pos.getY() - h * percentage);
      }
      else if (floatHelper(i % (25.0 / 2.0), 0))
      {
        line(pos.getX() - 4, pos.getY() - h * percentage, pos.getX() + 4, pos.getY() - h * percentage);
      }
      else if (floatHelper(i % (25.0 / 4.0), 0))
      {
        line(pos.getX() - 1, pos.getY() - h * percentage, pos.getX() + 1, pos.getY() - h * percentage);
      }
    }
    
    // draw slider knob
    rectMode(CENTER);
    stroke(128);
    strokeWeight(1);
    fill(255);
    rect(pos.getX(), pos.getY() - h * ratio, 20, 40);
    fill(200);
    rect(pos.getX(), pos.getY() - h * ratio, 20, 40 * 0.75);
    fill(145);
    rect(pos.getX(), pos.getY() - h * ratio, 20, 40 * 0.5);
    fill(85);
    rect(pos.getX(), pos.getY() - h * ratio, 20, 40 * 0.25);
  }
}

boolean floatHelper(float value, float compare)
{
  return value <= compare + 0.01 && value >= compare - 0.01;
}
