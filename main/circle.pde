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
  
  public void setBrightness(float brightness, Color c)
  {
    float ratio = brightness / MAX_BRIGHTNESS;
    currentC.setR(baseC.getR() + (int)(ratio * c.getR()));
    currentC.setG(baseC.getG() + (int)(ratio * c.getG()));
    currentC.setB(baseC.getB() + (int)(ratio * c.getB()));
  }
  
  public void resetBrightness()
  {
    currentC.setR(baseC.getR());
    currentC.setG(baseC.getG());
    currentC.setB(baseC.getB());
  }
}
