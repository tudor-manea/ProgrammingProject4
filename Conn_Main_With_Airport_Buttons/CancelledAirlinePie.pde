class CancelledPerAirlinePie {
  Table table;
  ArrayList<String> airlinesList;
  ArrayList<Integer> cancelledList;
  HashMap<String, Integer> cancelledCounts;
  int[] airlines;
  String[] airlineCodes = {"AA", "AS", "B6", "DL", "F9", "G4", "HA", "NK", "UA", "WN"};

  void readCancelled() {
    airlinesList = new ArrayList<String>();
    cancelledList = new ArrayList<Integer>();
    cancelledCounts = new HashMap<String, Integer>();

    // Count cancelled flights per airline
    table = loadTable("flights_full.csv", "header");
    
    if (selectedState != ""){
    for (TableRow row : table.findRows(selectedState, "ORIGIN_STATE_ABR")) {
      String airline = row.getString("MKT_CARRIER");
      int cancelled = row.getInt("CANCELLED");
      airlinesList.add(airline);
      cancelledList.add(cancelled);
      cancelledCounts.put(airline, cancelledCounts.getOrDefault(airline, 0) + cancelled);
    }
  }
else if (selectedState == ""){
      for (TableRow row : table.rows()) {
      String airline = row.getString("MKT_CARRIER");
      int cancelled = row.getInt("CANCELLED");
      airlinesList.add(airline);
      cancelledList.add(cancelled);
      cancelledCounts.put(airline, cancelledCounts.getOrDefault(airline, 0) + cancelled);
    }
  }
    // Store cancelled flights per airline in an array
    int airlinesSize = 0;
    for (int i = 0; i < airlineCodes.length; i++) {
      int cancelled = cancelledCounts.getOrDefault(airlineCodes[i], 0);
      if (cancelled > 0) {
        airlinesSize++;
      }
    }
    airlines = new int[airlinesSize];
    int j = 0;
    for (int i = 0; i < airlineCodes.length; i++) {
      int cancelled = cancelledCounts.getOrDefault(airlineCodes[i], 0);
      if (cancelled > 0) {
        airlines[j++] = cancelled;
      }
    }
  }

  int[] chartAngles() {
    int[] angles = new int[10];
    readCancelled();
    int totalCancelled = 0;
    for (int cancelled : airlines) {
      totalCancelled += cancelled;
    }
    float angleSum = 0;
    for (int i = 0; i < airlines.length && i < angles.length; i++) {
      float angle = 360 * ((float)airlines[i] / totalCancelled);
      angles[i] = (int)Math.floor(angle);
      angleSum += angle - angles[i];
    }
    // Distribute rounding errors
    for (int i = 0; i < angleSum; i++) {
      angles[i]++;
    }
    return angles;
  }

  void drawChart(float diameter, int[] angles) {
    float lastAngle = 0;
    for (int i = 0; i < angles.length; i++) {
      float currentAngle = lastAngle + radians(angles[i]);
      fill(getRandomColor());
      arc(width/2, height/2, diameter, diameter, lastAngle, currentAngle, PIE);
      float x = width/2 + (diameter/2 + 20) * cos(lastAngle + radians(angles[i]/2));
      float y = height/2 + (diameter/2 + 20) * sin(lastAngle + radians(angles[i]/2));
      textAlign(CENTER, CENTER);
      textSize(20);
      fill(0);
      text(airlineCodes[i], x, y);
      // write the number of flights of each carrier on top of the chart
      textSize(16);
      String flights = String.valueOf(airlines[i]);
      float fWidth = textWidth(flights);
      float fx = width/2 + (diameter/2 + 50) * cos(lastAngle + radians(angles[i]/2));
      float fy = height/2 + (diameter/2 + 50) * sin(lastAngle + radians(angles[i]/2));
      fill(255);
      rectMode(CENTER);
      rect(fx + 3, fy, fWidth+10, 20);
      fill(0);
      text(flights, fx + 3, fy);
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
    text("Cancelled Flights per Airline in "+stateName, width/2, 50); // add title
    textSize(20);
    textAlign(RIGHT, TOP);
    fill(0);
    text("Carrier Codes:", width - 20, 80); // move the title down
    for (int i = 0; i < airlineCodes.length; i++) {
      String airlineName = getAirlineName(airlineCodes[i]);
      text(airlineCodes[i] + " - " + airlineName, width - 20, 120+20*i); // increase the y-coordinate to avoid overlap
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
    CancelledAirlinePie = false; 
    StateScreenActive = false;
    MapScreenActive = true;
    println("back button pressed");
  }
}
}
