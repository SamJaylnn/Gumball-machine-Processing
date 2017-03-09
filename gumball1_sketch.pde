int rectAX, rectAY;      // Position of square A button
int rectBX, rectBY;      // Position of square B button
int rectH, rectW;
//int rectSize = 90;     // Diameter of rect

color rectColor;
color rectAOverColor;
color rectBOverColor;


boolean rectAOver = false;
boolean rectBOver = false;

GumballMachine gbm;

void setup() 
{
  size(800, 800) ;
  background(255) ;
  smooth() ;
  strokeWeight(3);
  strokeCap(ROUND);
  
  // load font
  PFont font;
  font = loadFont("BookAntiqua-48.vlw");
  textFont(font, 32);

  rectAX = 40;
  rectAY = 40;
  
  rectBX = 40;
  rectBY = 120;
  
  rectH = 60;
  rectW = 140;
  
  rectAOverColor = color(195);
  rectBOverColor = color(195);
  rectColor = color(255);
  
  gbm = new GumballMachine(5);
  // Only draw once
  //noLoop();
}

void draw() {
  fill(0);
  textSize(25);
  text("The Gumball Machine", 250, 60);
  PImage image = loadImage("gumball.jpg");
  image(image, (width-image.width)/2, (height-image.height)/2);  
  //runTest() ;
  
  update();
  
  if (rectAOver) {
    fill(rectAOverColor);
  } else {
    fill(rectColor);
    rectAOverColor = color(195);
  }
  stroke(85, 134, 234);
  rect(rectAX, rectAY, rectW, rectH);
  
  textSize(15);
  fill(85, 134, 234);
  text("Insert Quarter", rectAX + rectW / 2 - 50, rectAY + rectH / 2 + 5); 
  
  
  if (rectBOver) {
    fill(rectBOverColor);
  } else {
    fill(rectColor);
    rectBOverColor = color(195);
  }
  stroke(85, 134, 234);
  rect(rectBX, rectBY, rectW, rectH);
  
  fill(85, 134, 234);
  text("Turn Crank", rectBX + rectW / 2 - 50, rectBY + rectH / 2 + 5); 
  
  fill(85, 134, 234);
  text("Inventory: " + gbm.count + " gumballs", rectBX, rectBY + 200);
  fill(85, 134, 234);
  text("Machine is " + gbm.state, rectBX, rectBY + 250);
  
}


void update() {
  if ( overRect(rectAX, rectAY, rectW, rectH) ) {
    rectAOver = true;
    rectBOver = false;
  } else if ( overRect(rectBX, rectBY, rectW, rectH) ) {
    rectAOver = false;
    rectBOver = true;
  } else {
    rectAOver = rectBOver = false;
  }
}

void mousePressed() {
  if (rectAOver) {
    rectAOverColor = color(0);
    System.out.println(gbm);
    gbm.insertQuarter();
  }
  if (rectBOver) {
    rectBOverColor = color(0);
    System.out.println(gbm);
    gbm.turnCrank();
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}




public void runTest() {
  GumballMachine gumballMachine = new GumballMachine(5);
  System.out.println(gumballMachine);
  gumballMachine.insertQuarter();
  gumballMachine.turnCrank();
  System.out.println(gumballMachine);
  gumballMachine.insertQuarter();
  gumballMachine.turnCrank();
  gumballMachine.insertQuarter();
  gumballMachine.turnCrank();
  System.out.println(gumballMachine);
}