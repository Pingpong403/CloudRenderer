// CUSTOM RAINBOW SHIFTER
void cycleRainbow(Color c, int amt) {
  // IMPORTANT: assumes hue shifts evenly from r to g to b to r...
  
  // This version uses a simple Color class
  int r = c.getR();
  int g = c.getG();
  int b = c.getB();
  
  // if red is active
  if (r > 0) {
    // if blue is active too
    if (b > 0) {
      // color shifts from blue to red
      c.addB(-1 * amt);
      c.addR(amt);
    }
    else {
      // color shifts from red to green
      c.addR(-1 * amt);
      c.addG(amt);
    }
  }
  // if green is active
  else if (g > 0) {
    // color shifts from green to blue
    c.addG(-1 * amt);
    c.addB(amt);
  }
  else {
    // if only blue is active, shift from blue to red
    c.addB(-1 * amt);
    c.addR(amt);
  }
}
