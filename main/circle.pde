class Circle
{
  private int size;
  private Color baseC;
  private Color currentC;
  private Position pos;
  
  public Circle()
  {
    size = rand.nextInt(70, 200);
    baseC = new Color(rand.nextInt(90, 105), rand.nextInt(65, 90), rand.nextInt(30, 60));
    pos = new Position(rand.nextInt(1000), rand.nextInt(700));
    currentC = new Color(baseC.getR(), baseC.getG(), baseC.getB(), 150);
  }
  
  public Color getColor() { return currentC; }
  public Position getPosition() { return pos; }
  public int getSize() { return size; }
  
  public float computeDistance()
  {
    /* Uses the pythagorean theorem to get the distance between the mouse
       and the circle's edge. */
    return sqrt((pos.getX() - mouseX) * (pos.getX() - mouseX) +
                (pos.getY() - mouseY) * (pos.getY() - mouseY)) -
                 size / 2;
  }
  
  public float computeDistance(Position sourcePos)
  {
    /* Uses the pythagorean theorem to get the distance between the source
       and the circle's edge. */
    return sqrt((pos.getX() - sourcePos.getX()) * (pos.getX() - sourcePos.getX()) +
                (pos.getY() - sourcePos.getY()) * (pos.getY() - sourcePos.getY())) -
                 size / 2;
  }
  
  public void setBrightness(float distance, Color c)
  {
    float rInfluence = (float)c.getR() / 255;
    float gInfluence = (float)c.getG() / 255;
    float bInfluence = (float)c.getB() / 255;
    
    // x-axis: distance
    // y-axis: brightness
    float rSlope = (((float)baseC.getR() - maxBrightness) * rInfluence) / maxDistance;
    float gSlope = (((float)baseC.getG() - maxBrightness) * gInfluence) / maxDistance;
    float bSlope = (((float)baseC.getB() - maxBrightness) * bInfluence) / maxDistance;
    
    float rIntercept = (float)baseC.getR() + rInfluence * maxBrightness - rInfluence * baseC.getR();
    float gIntercept = (float)baseC.getG() + gInfluence * maxBrightness - gInfluence * baseC.getG();
    float bIntercept = (float)baseC.getB() + bInfluence * maxBrightness - bInfluence * baseC.getB();
    
    // y = mx + b
    currentC.setR((int)(rSlope * distance + rIntercept));
    currentC.setG((int)(gSlope * distance + gIntercept));
    currentC.setB((int)(bSlope * distance + bIntercept));
  }
  
  public void resetBrightness()
  {
    currentC.setR(baseC.getR());
    currentC.setG(baseC.getG());
    currentC.setB(baseC.getB());
  }
}
