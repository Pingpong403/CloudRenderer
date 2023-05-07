class Button
{
  private int x;
  private int y;
  private String text;
  
  public Button(int x, int y, String text)
  {
    this.x = x;
    this.y = y;
    this.text = text;
  }
  
  public void display()
  {
    stroke(100);
    fill(200);
    rect(x, y, 90, 40);
    fill(0);
    textAlign(CENTER);
    textSize(30);
    text(text, x + 45, y + 30);
  }
}
