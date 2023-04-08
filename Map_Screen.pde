class MapScreen {
  PShape usa;
  PShape[] states;
  String selectedState = "";
  int buttonSize = 200; // Diameter of button
  boolean DistancesBarChartActive = false;

  MapScreen() {
    usa = loadShape("us.svg");
    states = usa.getChildren();
  }

  void draw() {
    background(66, 224, 245); // set the background to light blue
    stroke(255);

    // Draw the USA map
    shape(usa, 100, 100); //move the map to a different position

    // Draw the 7 buttons
    int xMargin = 100;
    int yMargin = 100;
    int xSpacing = 1000;
    int ySpacing = (height - 2 * yMargin - 2 * buttonSize) / 3;
    drawButton(xMargin, yMargin, "Origin/Destination", color(255, 0, 0));
    drawButton(xMargin + buttonSize + xSpacing, yMargin, "Distance Leaderboard", color(0, 255, 0));
    drawButton(xMargin, yMargin + buttonSize + ySpacing, "Distances Bar Chart", color(255, 165, 0));
    drawButton(xMargin + buttonSize + xSpacing, yMargin + buttonSize + ySpacing, "General ETA", color(255, 255, 0));
    drawButton(xMargin, yMargin + 2 * buttonSize + 2 * ySpacing, "Cancelled Pie Chart", color(128, 0, 128));
    drawButton(xMargin + buttonSize + xSpacing, yMargin + 2 * buttonSize + 2 * ySpacing, "Airline Pie Chart", color(0, 0, 255));
    drawButton(width / 2, height - 50, "Diverted", color(0, 128, 0));

    // Display the name of the selected state at the top of the screen
    fill(0);
    textSize(40);
    textAlign(CENTER);
    text(selectedState, width / 2, 50);
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
  for (int i = 0; i < states.length; i++) {
    if (states[i].contains(mouseX - 100, mouseY - 100)) { // check if the mouse is inside the state shape
      selectedState = states[i].getName();
      break;
    }
  }
  
  int xMargin = 100;
  int yMargin = 100;
  int xSpacing = 1000;
  int ySpacing = (height - 2 * yMargin - 2 * buttonSize) / 3;

   // Check if the mouse is within a certain radius of each button center
  int buttonRadius = buttonSize / 2 + 20; // increase the radius by 20 pixels
  if (dist(mouseX, mouseY, xMargin + buttonSize/2, yMargin + buttonSize/4) < buttonRadius) {
    // "Origin/Destination" button pressed
    System.out.println("Origin/Destination button pressed");
  } else if (dist(mouseX, mouseY, xMargin + buttonSize + xSpacing + buttonSize/2, yMargin + buttonSize/4) < buttonRadius) {
    // "Distance Leaderboard" button pressed
    System.out.println("Distance Leaderboard button pressed");
    distancesBarChart = new DistancesBarChart();
  } else if (dist(mouseX, mouseY, xMargin + buttonSize/2, yMargin + buttonSize + ySpacing + buttonSize/4) < buttonRadius) {
    // "Distances Bar Chart" button pressed
    System.out.println("Distances Bar Chart button pressed");
  } else if (dist(mouseX, mouseY, xMargin + buttonSize + xSpacing + buttonSize/2, yMargin + buttonSize + ySpacing + buttonSize/4) < buttonRadius) {
    // "General ETA" button pressed
    System.out.println("General ETA button pressed");
  } else if (dist(mouseX, mouseY, xMargin + buttonSize/2, yMargin + 2*buttonSize + 2*ySpacing + buttonSize/4) < buttonRadius) {
    // "Cancelled Pie Chart" button pressed
    System.out.println("Cancelled Pie Chart button pressed");
  } else if (dist(mouseX, mouseY, xMargin + buttonSize + xSpacing + buttonSize/2, yMargin + 2*buttonSize + 2*ySpacing + buttonSize/4) < buttonRadius) {
    // "Airline Pie Chart" button pressed
    System.out.println("Airline Pie Chart button pressed");
  } else if (dist(mouseX, mouseY, width/2, height - 50) < buttonRadius) {
    // "Diverted" button pressed
    System.out.println("Diverted button pressed");
  }
 }
}
