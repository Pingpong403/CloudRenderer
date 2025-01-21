import java.util.Random;
import java.util.LinkedList;

// CUSTOM MOUSE CLICKING TOOL
boolean mouseChoose = false;
void mouseReleased() {
  mouseChoose = true;
  // set to false at the end of drawing phase
}

// Set up random
private Random rand = new Random();

// Set up sliders
int startCustomR = rand.nextInt(0, 255);
int startCustomG = rand.nextInt(0, 255);
int startCustomB = rand.nextInt(0, 255);

Slider sliderR = new Slider(new Position(900, 670), 200, (float)startCustomR / 255);
Slider sliderG = new Slider(new Position(940, 670), 200, (float)startCustomG / 255);
Slider sliderB = new Slider(new Position(980, 670), 200, (float)startCustomB / 255);
Slider dummySlider = new Slider(new Position(), 0, 0);

Slider selectedSlider = dummySlider; // so selectedSlider always points to a slider
boolean sliderPicked = false;

// Set up special colors
Color custom = new Color(startCustomR, startCustomG, startCustomB);
Color rainbow = new Color(255, 0, 0);

// CONSTANTS
int NUM_CIRC = 150;
int MAX_DISTANCE = 200;
int MAX_BRIGHTNESS = 200;
double SLOPE = (double)MAX_BRIGHTNESS / (double)MAX_DISTANCE;

// Buttons and settings
Button whiteButton = new Button(new Position(20, 20), "White", new Color(255, 255, 255));
Button redButton = new Button(new Position(20, 80), "Red", new Color(255, 0, 0));
Button yellowButton = new Button(new Position(20, 140), "Yellow", new Color(255, 255, 0));
Button blueButton = new Button(new Position(20, 200), "Blue", new Color(0, 0, 255));
Button purpleButton = new Button(new Position(20, 260), "Purple", new Color(255, 0, 255));
Button blackButton = new Button(new Position(20, 320), "Black", new Color(-255, -255, -255));
Button rainbowButton = new Button(new Position(20, 380), "Rnbw", rainbow);
Button customButton = new Button(new Position(20, 440), "Custom", custom);

Button showHideButton = new Button(new Position(20, 660), "<", new Color(128, 128, 128), 20, 20);
boolean showButtons = true;

Button toggleSourceButton = new Button(new Position(890, 20), "Mouse", new Color(150, 150, 150), 90, 40);
boolean followSource = true;

LinkedList<Button> colorButtons = new LinkedList<Button>();

Color currentColor = whiteButton.getColor();

// Circles.
Circle[] circles = new Circle[NUM_CIRC];

// Source.
Source source = new Source(new Position(500, 350), new Trajectory(10, 2.0));

void setup()
{
  // Set up the screen size
  size(1000, 700);
  
  // Set up the color buttons
  colorButtons.add(whiteButton);
  colorButtons.add(redButton);
  colorButtons.add(yellowButton);
  colorButtons.add(blueButton);
  colorButtons.add(purpleButton);
  colorButtons.add(blackButton);
  colorButtons.add(rainbowButton);
  colorButtons.add(customButton);
  
  // Set up the circles
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
    c.resetBrightness();
    float distance = followSource? c.computeDistance(source.getPos()) :
                                   c.computeDistance();
    // Each circle's color gets brighter if within MAX_DISTANCE, up to MAX_BRIGHTNESS.
    if (distance < MAX_DISTANCE)
    {
      c.setBrightness((float)(MAX_BRIGHTNESS - SLOPE * distance), currentColor);
    }
    c.getColor().setFill();
    circle(c.getPosition().getX(), c.getPosition().getY(), c.getSize());
  }
  
  // Display GUI on top of circles
  
  // Display color buttons and sliders, misc buttons, and show/hide button
  if (showButtons)
  {
    for (Button button : colorButtons)
    {
      button.display();
    }
    sliderR.display();
    sliderG.display();
    sliderB.display();
    
    toggleSourceButton.display();
  }
  showHideButton.display();
  
  // Handle mouse depressions
  if (mousePressed)
  {
    for (Button b : colorButtons)
    {
      if (b.isMouseWithin()) b.press();
      else b.unpress();
    }
    if (toggleSourceButton.isMouseWithin()) toggleSourceButton.press();
    else toggleSourceButton.unpress();
    if (showHideButton.isMouseWithin()) showHideButton.press();
    else showHideButton.unpress();
    
    if (showButtons && !sliderPicked) {
      if      (sliderR.isMouseWithin()) selectedSlider = sliderR;
      else if (sliderG.isMouseWithin()) selectedSlider = sliderG;
      else if (sliderB.isMouseWithin()) selectedSlider = sliderB;
      sliderPicked = true;
    }
    else if (sliderPicked)
    {
      if (selectedSlider == sliderR)
      {
        sliderR.calcRatio();
        custom.setR((int)(255.0 * sliderR.getRatio()));
      }
      if (selectedSlider == sliderG)
      {
        sliderG.calcRatio();
        custom.setG((int)(255.0 * sliderG.getRatio()));
      }
      if (selectedSlider == sliderB)
      {
        sliderB.calcRatio();
        custom.setB((int)(255.0 * sliderB.getRatio()));
      }
    }
  }
  
  // Handle mouse click releases
  if (mouseChoose)
  {
    if (showButtons)
    {
      for (Button b : colorButtons)
      {
        if (b.isMouseWithin())
        {
          currentColor = b.getColor();
          b.unpress();
        }
      }
      selectedSlider = dummySlider;
      sliderPicked = false;
      
      if (toggleSourceButton.isMouseWithin())
      {
        if (toggleSourceButton.getText() == "Mouse")
        {
          followSource = false;
          toggleSourceButton.setText("Source");
          toggleSourceButton.unpress();
        }
        else if (toggleSourceButton.getText() == "Source")
        {
          followSource = true;
          toggleSourceButton.setText("Mouse");
          toggleSourceButton.unpress();
        }
      }
    }
    if (showHideButton.isMouseWithin())
    {
      if (showHideButton.getText() == "<")
      {
        showButtons = false;
        showHideButton.setText(">");
        showHideButton.unpress();
      }
      else if (showHideButton.getText() == ">")
      {
        showButtons = true;
        showHideButton.setText("<");
        showHideButton.unpress();
      }
    }
  }
  
  // source
  source.update();
  if (source.getPos().getX() < 0    && !source.getTrajectory().isGoingRight() ||
      source.getPos().getX() > 1000 &&  source.getTrajectory().isGoingRight())
  {
    source.bounce(true);
  }
  if (source.getPos().getY() < 0   && !source.getTrajectory().isGoingDown() ||
      source.getPos().getY() > 700 &&  source.getTrajectory().isGoingDown())
  {
    source.bounce(false);
  }
  
  // DEBUG
  if (key == ' ')
  {
    // show pos and t
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text(currentColor.getR(), 500, 350);
    text(currentColor.getG(), 500, 380);
    text(currentColor.getB(), 500, 410);
    text(mouseY, 500, 450);
    text(sliderR.getPosition().getY() - sliderR.getHeight(), 500, 480);
    text(sliderR.getPosition().getY(), 500, 510);
    text(sliderR.getPosition().getY() - mouseY, 500, 540);
    
    source.visualize();
    
    // show directions
    fill(255, 0, 0);
    textAlign(RIGHT);
    text(source.getTrajectory().isGoingRight() ? "Right" : "Left", 1000, 30);
    text(!source.getTrajectory().isGoingDown() ? "Up" : "Down", 1000, 60);
    
    // show help
    fill(255, 0, 255);
    textAlign(CENTER);
    text("Press any key to exit debug", 500, 650);
  }
  
  cycleRainbow(rainbow, 20);
  mouseChoose = false;
}
