import java.util.Random;
import java.util.LinkedList;

private Random rand = new Random();

int startCustomR = rand.nextInt(0, 255);
int startCustomG = rand.nextInt(0, 255);
int startCustomB = rand.nextInt(0, 255);

Slider sliderR = new Slider(new Position(900, 670), 200, (float)startCustomR / 255);
Slider sliderG = new Slider(new Position(940, 670), 200, (float)startCustomG / 255);
Slider sliderB = new Slider(new Position(980, 670), 200, (float)startCustomB / 255);
Slider dummySlider = new Slider(new Position(), 0, 0);

Slider selectedSlider = dummySlider;
boolean sliderPicked = false;

Color custom = new Color(startCustomR, startCustomG, startCustomB);

Color rainbow = new Color(255, 0, 0);

// CUSTOM MOUSE CLICKING TOOL
boolean mouseChoose = false;
void mouseReleased() {
  mouseChoose = true;
  // set to false at the end of drawing phase
}

// CONSTANTS
int NUM_CIRC = 150;
int MAX_DISTANCE = 200;
int MAX_BRIGHTNESS = 200;
double SLOPE = (double)MAX_BRIGHTNESS / (double)MAX_DISTANCE;

Button WHITE_BUTTON = new Button(new Position(20, 20), "White", new Color(255, 255, 255));
Button RED_BUTTON = new Button(new Position(20, 80), "Red", new Color(255, 0, 0));
Button YELLOW_BUTTON = new Button(new Position(20, 140), "Yellow", new Color(255, 255, 0));
Button BLUE_BUTTON = new Button(new Position(20, 200), "Blue", new Color(0, 0, 255));
Button PURPLE_BUTTON = new Button(new Position(20, 260), "Purple", new Color(255, 0, 255));
Button BLACK_BUTTON = new Button(new Position(20, 320), "Black", new Color(-255, -255, -255));

Button RAINBOW_BUTTON = new Button(new Position(20, 380), "Rnbw", rainbow);
Button CUSTOM_BUTTOM = new Button(new Position(20, 440), "Custom", custom);


Button showHideButton = new Button(new Position(20, 660), "<", new Color(128, 128, 128), 20, 20);
boolean showButtons = true;

LinkedList<Button> buttons = new LinkedList<Button>();
Color currentColor = WHITE_BUTTON.getColor();

// Circles.
Circle[] circles = new Circle[NUM_CIRC];

// Source.
Source source = new Source(new Position(500, 350), new Trajectory(10, 2.0));

void setup()
{
  // Set up the screen size.
  size(1000, 700);
  
  // Set up the buttons.
  buttons.add(WHITE_BUTTON);
  buttons.add(RED_BUTTON);
  buttons.add(YELLOW_BUTTON);
  buttons.add(BLUE_BUTTON);
  buttons.add(PURPLE_BUTTON);
  buttons.add(BLACK_BUTTON);
  
  buttons.add(RAINBOW_BUTTON);
  buttons.add(CUSTOM_BUTTOM);
  
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
    c.resetBrightness();
    float distance = c.computeDistance(source.getPos());
    // Each circle's color gets brighter if within MAX_DISTANCE, up to MAX_BRIGHTNESS.
    if (distance < MAX_DISTANCE)
    {
      c.setBrightness((float)(MAX_BRIGHTNESS - SLOPE * distance), currentColor);
    }
    fill(c.getR(), c.getG(), c.getB(), c.getA());
    ellipse(c.getX(), c.getY(), c.getSize(), c.getSize());
  }
  
  // Display GUI last.
  if (showButtons)
  {
    for (Button button : buttons)
    {
      button.display();
    }
    sliderR.display();
    sliderG.display();
    sliderB.display();
  }
  showHideButton.display();
  
  if (mousePressed)
  {
    for (Button b : buttons)
    {
      if (b.isMouseWithin())
      {
        b.press();
      }
      else
      {
        b.unpress();
      }
    }
    if (showHideButton.isMouseWithin())
    {
      showHideButton.press();
    }
    else
    {
      showHideButton.unpress();
    }
    
    if (showButtons && !sliderPicked) {
      if (sliderR.isMouseWithin())
      {
        selectedSlider = sliderR;
      }
      else if (sliderG.isMouseWithin())
      {
        selectedSlider = sliderG;
      }
      else if (sliderB.isMouseWithin())
      {
        selectedSlider = sliderB;
      }
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
  
  if (mouseChoose)
  {
    if (showButtons)
    {
      for (Button b : buttons)
      {
        if (b.isMouseWithin())
        {
          currentColor = b.getColor();
          b.unpress();
        }
      }
      selectedSlider = dummySlider;
      sliderPicked = false;
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
