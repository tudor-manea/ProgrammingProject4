class DivertedAirlinePie {
  Table table;
  ArrayList<String> DIVairlinesList;
  ArrayList<Integer> DIVcancelledList;
  HashMap<String, Integer> DIVcancelledCounts;
  int[] DIVairlines;
  String[] DIVairlineCodes = {"AA", "AS", "B6", "DL", "F9", "G4", "HA", "NK", "UA", "WN"};

  void readDIV() {
    DIVairlinesList = new ArrayList<String>();
    DIVcancelledList = new ArrayList<Integer>();
    DIVcancelledCounts = new HashMap<String, Integer>();

    // Count cancelled flights per airline
    table = loadTable("flights_full.csv", "header");
    
    if (selectedState != ""){
    for (TableRow row : table.findRows(selectedState, "ORIGIN_STATE_ABR")) {
      String DIVairline = row.getString("MKT_CARRIER");
      int DIVcancelled = row.getInt("DIVERTED");
      DIVairlinesList.add(DIVairline);
      DIVcancelledList.add(DIVcancelled);
      DIVcancelledCounts.put(DIVairline, DIVcancelledCounts.getOrDefault(DIVairline, 0) + DIVcancelled);
    }
  }
else if (selectedState == ""){
      for (TableRow row : table.rows()) {
      String DIVairline = row.getString("MKT_CARRIER");
      int DIVcancelled = row.getInt("DIVERTED");
      DIVairlinesList.add(DIVairline);
      DIVcancelledList.add(DIVcancelled);
      DIVcancelledCounts.put(DIVairline, DIVcancelledCounts.getOrDefault(DIVairline, 0) + DIVcancelled);
    }
  }
    // Store cancelled flights per airline in an array
    int DIVairlinesSize = 0;
    for (int i = 0; i < DIVairlineCodes.length; i++) {
      int DIVcancelled = DIVcancelledCounts.getOrDefault(DIVairlineCodes[i], 0);
      if (DIVcancelled > 0) {
        DIVairlinesSize++;
      }
    }
    DIVairlines = new int[DIVairlinesSize];
    int j = 0;
    for (int i = 0; i < DIVairlineCodes.length; i++) {
      int DIVcancelled = DIVcancelledCounts.getOrDefault(DIVairlineCodes[i], 0);
      if (DIVcancelled > 0) {
        DIVairlines[j++] = DIVcancelled;
      }
    }
  }

  int[] DIVchartAngles() {
    int[] DIVangles = new int[10];
    readDIV();
    int totalDIV = 0;
    for (int DIVcancelled : DIVairlines) {
      totalDIV += DIVcancelled;
    }
    float angleSum = 0;
    for (int i = 0; i < DIVairlines.length; i++) {
      float angle = 360 * ((float)DIVairlines[i] / totalDIV);
      DIVangles[i] = (int)Math.floor(angle);
      angleSum += angle - DIVangles[i];
    }
    // Distribute rounding errors
    for (int i = 0; i < angleSum; i++) {
      DIVangles[i]++;
    }
    return DIVangles;
  }

  void drawChart(float diameter, int[] DIVangles) {
    float lastAngle = 0;
    for (int i = 0; i < DIVangles.length; i++) {
      float currentAngle = lastAngle + radians(DIVangles[i]);
      fill(getRandomColor());
      arc(width/2, height/2, diameter, diameter, lastAngle, currentAngle, PIE);
      float x = width/2 + (diameter/2 + 20) * cos(lastAngle + radians(DIVangles[i]/2));
      float y = height/2 + (diameter/2 + 20) * sin(lastAngle + radians(DIVangles[i]/2));
      textAlign(CENTER, CENTER);
      textSize(20);
      fill(0);
      text(DIVairlineCodes[i], x, y);
      // write the number of flights of each carrier on top of the chart
      textSize(16);
      String DIVflights = String.valueOf(DIVairlines[i]);
      float fWidth = textWidth(DIVflights);
      float fx = width/2 + (diameter/2 + 50) * cos(lastAngle + radians(DIVangles[i]/2));
      float fy = height/2 + (diameter/2 + 50) * sin(lastAngle + radians(DIVangles[i]/2));
      fill(255);
      rectMode(CENTER);
      rect(fx + 3, fy, fWidth+10, 20);
      fill(0);
      text(DIVflights, fx + 3, fy);
      lastAngle = currentAngle;
      
      fill(255, 0, 0);
      rect(50, 50, 100, 50, 10);
      fill(255);
      textAlign(CENTER, CENTER);
      textSize(20);
      text("Back", 50, 45);
      
    }
  }

  void drawLegend() {
    textSize(30); // increase text size for title
    textAlign(CENTER);
    fill(0);
    text("DIVERTED Flights per Airline in "+stateName, width/2, 50); // add title
    textSize(20);
    textAlign(RIGHT, TOP);
    fill(0);
    text("Carrier Codes:", width - 20, 80); // move the title down
    for (int i = 0; i < DIVairlineCodes.length; i++) {
      String airlineName = getAirlineName(DIVairlineCodes[i]);
      text(DIVairlineCodes[i] + " - " + airlineName, width - 20, 120+20*i); // increase the y-coordinate to avoid overlap
    }
  }

  String getAirlineName(String code) {
    switch(code) {
    case "AA":
      return "American Airlines";
    case "AS":
      return "Alaska Airlines";
    case "B6":
      return "JetBlue Airways";
    case "DL":
      return "Delta Air Lines";
    case "F9":
      return "Frontier Airlines";
    case "G4":
      return "Allegiant Air";
    case "HA":
      return "Hawaiian Airlines";
    case "NK":
      return "Spirit Airlines";
    case "UA":
      return "United Airlines";
    case "WN":
      return "Southwest Airlines";
    default:
      return "";
    }
  }

  int getRandomColor() {
    return color(random(255), random(255), random(255));
  }
  
  void mousePressed(){
  // Check if the Back button was clicked
  if (mouseX >= 10 && mouseX <= 100 && mouseY >= 20 && mouseY <= 70) {
    DivertedAirlinePie = false; 
    StateScreenActive = false;
    MapScreenActive = true;
    println("back button pressed");
  }
}
}
  
