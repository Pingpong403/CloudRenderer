// CUSTOM RAINBOW SHIFTER
void cycleRainbow(Color c, int amt)
{
  // This version uses a simple Color class
  int r = c.getR();
  int g = c.getG();
  int b = c.getB();
  
  /*
  6 cases:
    1) red     -> yellow  (r 255    g < 255  b 0     )
    2) yellow  -> green   (r <= 255 g 255    b 0     )
    3) green   -> cyan    (r 0      g 255    b < 255 )
    4) cyan    -> blue    (r 0      g <= 255 b 255   )
    5) blue    -> magenta (r < 255  g 0      b 255   )
    6) magenta -> red     (r 255    g 0      b <= 255)
  */
  
  if (r > 0 && b == 0)
  {
    if (g < 255)
    {
      // red to yellow
      c.addG(amt);
    }
    else
    {
      // yellow to green
      c.addR(-amt);
    }
  }
  else if (g > 0 && r == 0)
  {
    if (b < 255)
    {
      // green to cyan
      c.addB(amt);
    }
    else
    {
      // cyan to blue
      c.addG(-amt);
    }
  }
  else if (b > 0 && g == 0)
  {
    if (r < 255)
    {
      // blue to magenta
      c.addR(amt);
    }
    else
    {
      // magenta to red
      c.addB(-amt);
    }
  }
  
  if (r > 255) { c.setR(255); }
  else if (r < 0) { c.setR(0); }
  if (g > 255) { c.setG(255); }
  else if (g < 0) { c.setG(0); }
  if (b > 255) { c.setB(255); }
  else if (b < 0) { c.setB(0); }
}
