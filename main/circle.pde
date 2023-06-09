class Circle
{
  private Random rand = new Random();
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
  
  public void setBrightness(int brightness, HashSet<String> include)
  {
    if (include.contains("r"))
    {
      r = baseR + brightness;
    }
    if (include.contains("g"))
    {
      g = baseG + brightness;
    }
    if (include.contains("b"))
    {
      b = baseB + brightness;
    }
  }
  
  public void resetBrightness()
  {
    r = baseR;
    g = baseG;
    b = baseB;
  }
}
