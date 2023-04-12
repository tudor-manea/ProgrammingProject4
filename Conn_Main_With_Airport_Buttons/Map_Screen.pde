class MapScreen {
  PShape usa;
  PShape[] states;

  int buttonSize = 200; // Diameter of button

  MapScreen() {
    usa = loadShape("us.svg");
    states = usa.getChildren();
  }

  void draw() {
    background(66, 224, 245); // set the background to light blue
    //background(0);
    stroke(255);

    // Draw the USA map
    usa.disableStyle();
    // Set our own coloring
    fill(255);
    stroke(0);
    shape(usa, 150, 100); //move the map to a different position

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

    if (stateName == "USA") {
      fill(0);
      textSize(40);
      textAlign(CENTER);
      text("Select state or don't to keep date for all USA states", width / 2, 50);
    }
    if (stateName != "USA") {
      fill(0);
      textSize(40);
      textAlign(CENTER);
      text(stateName, width / 2, 50);
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
    for (int i = 0; i < states.length; i++) {
      if (states[i].contains(mouseX - 150, mouseY - 100)) { // check if the mouse is inside the state shape
        selectedState = states[i].getName();
        //System.out.println(selectedState);
        switch(selectedState) {
        case "AL":
          stateName = "Alabama";
          break;
        case "AK":
          stateName = "Alaska";
          break;
        case "AZ":
          stateName = "Arizona";
          break;
        case "AR":
          stateName = "Arkansas";
          break;
        case "CA":
          stateName = "California";
          break;
        case "CO":
          stateName = "Colorado";
          break;
        case "CT":
          stateName = "Connecticut";
          break;
        case "DE":
          stateName = "Delaware";
          break;
        case "FL":
          stateName = "Florida";
          break;
        case "GA":
          stateName = "Georgia";
          break;
        case "HI":
          stateName = "Hawaii";
          break;
        case "ID":
          stateName = "Idaho";
          break;
        case "IL":
          stateName = "Illinois";
          break;
        case "IN":
          stateName = "Indiana";
          break;
        case "IA":
          stateName = "Iowa";
          break;
        case "KS":
          stateName = "Kansas";
          break;
        case "KY":
          stateName = "Kentucky";
          break;
        case "LA":
          stateName = "Louisiana";
          break;
        case "ME":
          stateName = "Maine";
          break;
        case "MD":
          stateName = "Maryland";
          break;
        case "MA":
          stateName = "Massachusetts";
          break;
        case "MI":
          stateName = "Michigan";
          break;
        case "MN":
          stateName = "Minnesota";
          break;
        case "MS":
          stateName = "Mississippi";
          break;
        case "MO":
          stateName = "Missouri";
          break;
        case "MT":
          stateName = "Montana";
          break;
        case "NE":
          stateName = "Nebraska";
          break;
        case "NV":
          stateName = "Nevada";
          break;
        case "NH":
          stateName = "New Hampshire";
          break;
        case "NJ":
          stateName = "New Jersey";
          break;
        case "NM":
          stateName = "New Mexico";
          break;
        case "NY":
          stateName = "New York";
          break;
        case "NC":
          stateName = "North Carolina";
          break;
        case "ND":
          stateName = "North Dakota";
          break;
        case "OH":
          stateName = "Ohio";
          break;
        case "OK":
          stateName = "Oklahoma";
          break;
        case "OR":
          stateName = "Oregon";
          break;
        case "PA":
          stateName = "Pennsylvania";
          break;
        case "RI":
          stateName = "Rhode Island";
          break;
        case "SC":
          stateName = "South Carolina";
          break;
        case "SD":
          stateName = "South Dakota";
          break;
        case "TN":
          stateName = "Tennessee";
          break;
        case "TX":
          stateName = "Texas";
          break;
        case "UT":
          stateName = "Utah";
          break;
        case "VT":
          stateName = "Vermont";
          break;
        case "VA":
          stateName = "Virginia";
          break;
        case "WA":
          stateName = "Washington";
          break;
        case "WI":
          stateName = "Wisconsin";
          break;
        case "WY":
          stateName = "Wyoming";
          break;
        }
      }
    }
    if (selectedState != "") {
      StateScreenActive =true;
      MapScreenActive = false;
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
      MapScreenActive = false;
      System.out.println("Busiest Airport button pressed");
    } else if (dist(mouseX, mouseY, xMargin + buttonSize + xSpacing + buttonSize/2, yMargin + buttonSize/4) < buttonRadius) {
      // "Distance Leaderboard" button pressed
      System.out.println("Distance Leaderboard button pressed");
    } else if (dist(mouseX, mouseY, xMargin + buttonSize/2, yMargin + buttonSize + ySpacing + buttonSize/4) < buttonRadius) {
      // "Distances Bar Chart" button pressed
      DistancesBarChartActive = true;
      MapScreenActive = false;
      System.out.println("Distances Bar Chart button pressed");
    } else if (dist(mouseX, mouseY, xMargin + buttonSize + xSpacing + buttonSize/2, yMargin + buttonSize + ySpacing + buttonSize/4) < buttonRadius) {
      // "General ETA" button pressed
      System.out.println("General ETA button pressed");
    } else if (dist(mouseX, mouseY, xMargin + buttonSize/2, yMargin + 2*buttonSize + 2*ySpacing + buttonSize/4) < buttonRadius) {
      // "Cancelled Pie Chart" button pressed
      CancelledAirlinePie = true;
      MapScreenActive = false;
      System.out.println("Cancelled Pie Chart button pressed");
    } else if (dist(mouseX, mouseY, xMargin + buttonSize + xSpacing + buttonSize/2, yMargin + 2*buttonSize + 2*ySpacing + buttonSize/4) < buttonRadius) {
      // "Airline Pie Chart" button pressed
      AirlinesPieChartAcitve =true;
      MapScreenActive = false;
      System.out.println("Airline Pie Chart button pressed");
    } else if (dist(mouseX, mouseY, width/2, height - 50) < buttonRadius) {
      // "Diverted" button pressed
      DivertedAirlinePie = true;
      MapScreenActive = false;
      System.out.println("Diverted Pie button pressed");
    }
  }
}
