class Source
{
  private Position pos;
  private Trajectory t;
  
  public Source()
  {
    pos = new Position();
    t = new Trajectory();
  }
  
  public Source(Position pos, Trajectory t)
  {
    this.pos = pos;
    this.t = t;
  }
  
  // getters and setters
  public Position getPos() { return pos; }
  public Trajectory getTrajectory() { return t; }
  public void setPos(Position pos) { this.pos = pos; }
  public void setTrajectory(Trajectory t) { this.t = t; }
  
  // manipulation
  public void update()
  {
    pos.updatePosition(t);
  }
  
  public void bounce(boolean x)
  {
    if (x)
    {
      t.bounceX();
    }
    else
    {
      t.bounceY();
    }
  }
  
  public void visualize()
  {
    stroke(0, 0, 0);
    strokeWeight(1);
    fill(255, 255, 255);
    circle(pos.getX(), pos.getY(), 5);
    stroke(0, 128);
    strokeWeight(3);
    noFill();
    circle(pos.getX(), pos.getY(), maxDistance * 2);
  }
}
