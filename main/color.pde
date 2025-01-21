class Color
{
  private int r;
  private int g;
  private int b;
  private int a;
  
  public Color()
  {
    r = g = b = a = 0;
  }
  
  public Color(Color c)
  {
    r = c.getR();
    g = c.getG();
    b = c.getB();
    a = c.getA();
  }
  
  public Color(int r, int g, int b)
  {
    this.r = r;
    this.g = g;
    this.b = b;
    a = 255;
  }
  
  public Color(int r, int g, int b, int a)
  {
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = a;
  }
  
  public int getR() { return r; }
  public int getG() { return g; }
  public int getB() { return b; }
  public int getA() { return a; }
  
  public void setR(int r) { this.r = r; }
  public void setG(int g) { this.g = g; }
  public void setB(int b) { this.b = b; }
  public void setA(int a) { this.a = a; }
  
  public void setFill  () { fill(r, g, b, a);   }
  public void setStroke() { stroke(r, g, b, a); }
  public void setFill  (int a) { fill(r, g, b, a);   }
  public void setStroke(int a) { stroke(r, g, b, a); }
  
  public void addR(int amt) { r += amt; }
  public void addG(int amt) { g += amt; }
  public void addB(int amt) { b += amt; }
}
