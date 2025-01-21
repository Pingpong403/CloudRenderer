class Circle
{
  private int size;
  /* Base color determines true color, while r, g, and b represent
     changing color. */
  private int baseR;
  private int baseG;
  private int baseB;
  private int r;
  private int g;
  private int b;
  private int a = 150;
  private int x;
  private int y;
  
  public Circle()
  {
    size = rand.nextInt(70, 200);
    baseR = rand.nextInt(240, 255);
    baseG = rand.nextInt(215, 240);
    baseB = rand.nextInt(180, 210);
    x = rand.nextInt(1000);
    y = rand.nextInt(700);
    darken();
    r = baseR;
    g = baseG;
    b = baseB;
  }
  
  // Helper function. Gets the circles to the darkness I want.
  private void darken()
  {
    int DARK = 150;
    
    baseR -= DARK;
    baseG -= DARK;
    baseB -= DARK;
  }
  
  public int getR()
  {
    return r;
  }
  
  public int getG()
  {
    return g;
  }
  
  public int getB()
  {
    return b;
  }
  
  public int getA()
  {
    return a;
  }
  
  public int getX()
  {
    return x;
  }
  
  public int getY()
  {
    return y;
  }
  
  public int getSize()
  {
    return size;
  }
  
  public float computeDistance()
  {
    /* Uses the pythagorean theorem to get the distance between the mouse
       and the circle. */
    return sqrt(pow(x - mouseX, 2) + pow(y - mouseY , 2));
  }
  
  public float computeDistance(Position sourcePos)
  {
    /* Uses the pythagorean theorem to get the distance between the source
       and the circle's edge. */
    return sqrt(pow(x - sourcePos.getX(), 2) + pow(y - sourcePos.getY() , 2)) - size / 2;
  }
  
  public void setBrightness(float brightness, Color c)
  {
    float ratio = brightness / MAX_BRIGHTNESS;
    r = baseR + (int)(ratio * c.getR());
    g = baseG + (int)(ratio * c.getG());
    b = baseB + (int)(ratio * c.getB());
  }
  
  public void resetBrightness()
  {
    r = baseR;
    g = baseG;
    b = baseB;
  }
}
