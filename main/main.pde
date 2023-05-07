import java.util.Random;
import java.util.HashSet;
import java.util.LinkedList;

// CONSTANTS
int NUM_CIRC = 150;
int MAX_DISTANCE = 300;
int MAX_BRIGHTNESS = 200;
double SLOPE = (double)MAX_BRIGHTNESS / (double)MAX_DISTANCE;

LinkedList<Button> BUTTONS = new LinkedList<Button>();

HashSet<String> WHITE_SETTING = new HashSet<String>();
HashSet<String> RED_SETTING = new HashSet<String>();
HashSet<String> YELLOW_SETTING = new HashSet<String>();
HashSet<String> BLUE_SETTING = new HashSet<String>();
HashSet<String> CURRENT_COLOR = WHITE_SETTING;

// Circles.
Circle[] circles = new Circle[NUM_CIRC];

void setup()
{
  // Set up the screen size.
  size(1000, 700);
  
  // Set up the buttons.
  BUTTONS.add(new Button(20, 20, "White"));
  BUTTONS.add(new Button(20, 80, "Red"));
  BUTTONS.add(new Button(20, 140, "Yellow"));
  BUTTONS.add(new Button(20, 200, "Blue"));
  
  // Set up the color settings.
  WHITE_SETTING.add("r");
  WHITE_SETTING.add("g");
  WHITE_SETTING.add("b");
  RED_SETTING.add("r");
  YELLOW_SETTING.add("r");
  YELLOW_SETTING.add("g");
  BLUE_SETTING.add("b");
  
  // Set up the circles.
  for (int i = 0; i < NUM_CIRC; i++)
  {
    circles[i] = new Circle();
  }
}

void draw()
{
  // Black background.
  background(0);
  
  // Render circles.
  for (Circle c : circles)
  {
    stroke(0, 0, 0, 0);
    float distance = c.computeDistance();
    // Each circle's color gets brighter if within MAX_DISTANCE, up to MAX_BRIGHTNESS.
    if (distance < MAX_DISTANCE)
    {
      c.setBrightness((int)(MAX_BRIGHTNESS - SLOPE * distance), CURRENT_COLOR);
    }
    else
    {
      c.resetBrightness();
    }
    fill(c.getR(), c.getG(), c.getB(), c.getA());
    ellipse(c.getX(), c.getY(), c.getSize(), c.getSize());
  }
  
  // Display buttons last.
  for (Button button : BUTTONS)
  {
    button.display();
  }
  
  if (mousePressed)
  {
    // Buttons area.
    if (mouseX >= 20 && mouseX <= 110)
    {
      // White button.
      if (mouseY >= 20 && mouseY <= 60)
      {
        CURRENT_COLOR = WHITE_SETTING;
      }
      // Red button.
      else if (mouseY >= 80 && mouseY <= 120)
      {
        CURRENT_COLOR = RED_SETTING;
      }
      // Yellow button.
      else if (mouseY >= 140 && mouseY <= 180)
      {
        CURRENT_COLOR = YELLOW_SETTING;
      }
      // Blue button.
      else if (mouseY >= 200 && mouseY <= 240)
      {
        CURRENT_COLOR = BLUE_SETTING;
      }
    }
  }
}
