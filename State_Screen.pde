class StateScreen {

  PShape usa2;
  PShape state;
  PShape alabama;
  PShape alaska;
  PShape arizona;
  PShape arkansas;
  PShape california;
  PShape colorado;
  PShape connecticut;
  PShape delaware;
  PShape florida;
  PShape georgia;
  PShape hawaii;
  PShape idaho;
  PShape illinois;
  PShape indiana;
  PShape iowa;
  PShape kansas;
  PShape kentucky;
  PShape louisiana;
  PShape maine;
  PShape maryland;
  PShape massachusetts;
  PShape michigan;
  PShape minnesota;
  PShape mississippi;
  PShape missouri;
  PShape montana;
  PShape nebraska;
  PShape nevada;
  PShape newhampshire;
  PShape newjersey;
  PShape newmexico;
  PShape newyork;
  PShape northcarolina;
  PShape northdakota;
  PShape ohio;
  PShape oklahoma;
  PShape oregon;
  PShape pennsylvania;
  PShape rhodeisland;
  PShape southcarolina;
  PShape southdakota;
  PShape tennessee;
  PShape texas;
  PShape utah;
  PShape vermont;
  PShape virginia;
  PShape washington;
  PShape westvirginia;
  PShape wisconsin;
  PShape wyoming;

  
  int buttonSize = 200; // Diameter of button

  StateScreen() {
  usa2 = loadShape("usa-wikipedia.svg");
  }

  void draw() {
    background(0,255,230); // set the background to light blue
    stroke(255);
    // Draw the 7 buttons
    int xMargin = 100;
    int yMargin = 100;
    int xSpacing = 1000;
    int ySpacing = (height - 2 * yMargin - 2 * buttonSize) / 3;
    drawButton(xMargin, yMargin, "Busiest Airport", color(255, 0, 0));
    drawButton(xMargin + buttonSize + xSpacing, yMargin, "Distance Leaderboard", color(0, 255, 0));
    drawButton(xMargin, yMargin + buttonSize + ySpacing, "Distances Bar Chart", color(255, 165, 0));
    drawButton(xMargin + buttonSize + xSpacing, yMargin + buttonSize + ySpacing, "General ETA", color(245, 230, 0));
    drawButton(xMargin, yMargin + 2 * buttonSize + 2 * ySpacing, "Cancelled Pie Chart", color(128, 0, 128));
    drawButton(xMargin + buttonSize + xSpacing, yMargin + 2 * buttonSize + 2 * ySpacing, "Airline Pie Chart", color(0, 0, 255));
    drawButton(width / 2, height - 100, "Diverted Pie", color(0, 128, 0));
    // Display the name of the selected state at the top of the screen
    if (stateName != "USA"){
    fill(0);
    textSize(40);
    textAlign(CENTER);
    text(stateName, width / 2, 50);
    // Add a red "Back" button in the top right corner
    fill(255, 0, 0);
    rect(width/2 -300 , 40, 100, 50, 10);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(20);
    text("Back", width/2 -300,40);
    
    //Add black rectangle around map 
    fill(0);
    rect(width/2 +270 , height-150, 300, 250);
    //scale map
    float scaleFactor = 0.3; // Adjust as needed
    // Draw the map and state
    push();
    scale(scaleFactor);
    translate(2500, 1800);
    state = usa2.getChild(selectedState);
    fill(255);
    shape(usa2, 0, 0);
    usa2.disableStyle();
    fill(0, 51, 102);
    noStroke();
    shape(state, 0, 0);
    pop();
    }
  }

  void drawButton(int x, int y, String label, color buttonColor) {
    fill(buttonColor);
    rectMode(CENTER);
    rect(x, y, buttonSize, buttonSize / 2);
    fill(255);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(label, x, y);
  }

  void mousePressed() {
  
   // Check if the Back button was clicked
  if (mouseX >= width/2 - 400 && mouseX <= width/2 -200 && mouseY >= 40 && mouseY <= 80) {
    StateScreenActive = false;
    MapScreenActive = true;
    println("back button pressed");
  }
  int xMargin = 100;
  int yMargin = 100;
  int xSpacing = 1000;
  int ySpacing = (height - 2 * yMargin - 2 * buttonSize) / 3;
  
   // Check if the mouse is within a certain radius of each button center
  int buttonRadius = buttonSize / 2 + 20; // increase the radius by 20 pixels
  if (dist(mouseX, mouseY, xMargin + buttonSize/2, yMargin + buttonSize/4) < buttonRadius) {
    // "Busiest Airport" button pressed
    BusiestAirportScreen = true;
    StateScreenActive = false;
    System.out.println("Busiest Airport button pressed");
  } else if (dist(mouseX, mouseY, xMargin + buttonSize + xSpacing + buttonSize/2, yMargin + buttonSize/4) < buttonRadius) {
    // "Distance Leaderboard" button pressed
    System.out.println("Distance Leaderboard button pressed");
  } else if (dist(mouseX, mouseY, xMargin + buttonSize/2, yMargin + buttonSize + ySpacing + buttonSize/4) < buttonRadius) {
    // "Distances Bar Chart" button pressed
     DistancesBarChartActive = true;
     StateScreenActive = false;
    System.out.println("Distances Bar Chart button pressed");
  } else if (dist(mouseX, mouseY, xMargin + buttonSize + xSpacing + buttonSize/2, yMargin + buttonSize + ySpacing + buttonSize/4) < buttonRadius) {
    // "General ETA" button pressed
    System.out.println("General ETA button pressed");
  } else if (dist(mouseX, mouseY, xMargin + buttonSize/2, yMargin + 2*buttonSize + 2*ySpacing + buttonSize/4) < buttonRadius) {
    // "Cancelled Pie Chart" button pressed
    CancelledAirlinePie = true;
    StateScreenActive = false;
    System.out.println("Cancelled Pie Chart button pressed");
  } else if (dist(mouseX, mouseY, xMargin + buttonSize + xSpacing + buttonSize/2, yMargin + 2*buttonSize + 2*ySpacing + buttonSize/4) < buttonRadius) {
    // "Airline Pie Chart" button pressed
    AirlinesPieChartAcitve =true;
    StateScreenActive = false;
    System.out.println("Airline Pie Chart button pressed");
  } else if (dist(mouseX, mouseY, width/2, height - 50) < buttonRadius) {
    // "Diverted" button pressed
    DivertedAirlinePie = true;
    StateScreenActive = false;
    System.out.println("Diverted Pie button pressed");
  }
 }
 
 
}
