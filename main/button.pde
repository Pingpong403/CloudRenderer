class Button
{
  private Position pos;
  private String text;
  private Color c;
  private int w = 90;
  private int h = 40;
  private boolean pressed = false;
  
  public Button(Position pos, String text, Color c)
  {
    this.pos = pos;
    this.text = text;
    this.c = c;
  }
  
  public Button(Position pos, String text, Color c, int w, int h)
  {
    this.pos = pos;
    this.text = text;
    this.c = c;
    this.w = w;
    this.h = h;
  }
  
  public String getText() { return text; }
  public Color getColor() { return c; }
  public boolean isPressed() { return pressed; }
  
  public void setText(String text) { this.text = text; }
  
  public boolean isMouseWithin()
  {
    return mouseX > pos.getX() && mouseX < pos.getX() + w &&
           mouseY > pos.getY() && mouseY < pos.getY() + h;
  }
  
  public void press  () { pressed = true;  }
  public void unpress() { pressed = false; }
  
  public void display()
  {
    c.setStroke(pressed ? 100 : 190);
    c.setFill(pressed ? 190 : 100);
    rect(pos.getX(), pos.getY(), w, h);
    c.setFill(255);
    textAlign(CENTER);
    textSize(h * 3 / 4);
    text(text, pos.getX() + (w / 2), pos.getY() + (h * 3 / 4));
  }
}
