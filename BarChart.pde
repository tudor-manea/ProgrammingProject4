class DistancesBarChart {
  Table table;
  ArrayList<Integer> distances = new ArrayList<Integer>();
  int[] distanceRanges = new int[6];
  float barWidth = 70;
  float barHeight = 50;
  float x = 0;
  float y = 0;
  int maxHeight = screenSize - 100;
  float logBase = log(500000);
  float flightsPerPixel = logBase / maxHeight;

  
  
  void countDistances() {
    table = loadTable("flights_full.csv", "header");
    for (TableRow row : table.findRows(selectedState, "ORIGIN_STATE_ABR")) {
      Integer distance = row.getInt("DISTANCE");
      distances.add(distance);
      if (distance >= 5000) {
        distanceRanges[5]++;
      } else if (distance >= 4000) {
        distanceRanges[4]++;
      } else if (distance >= 3000) {
        distanceRanges[3]++;
      } else if (distance >= 2000) {
        distanceRanges[2]++;
      } else if (distance >= 1000) {
        distanceRanges[1]++;
      } else {
        distanceRanges[0]++;
      }
    }  
  }

  void makeBars() {
    stroke(0);
    for (int i = 0; i < distanceRanges.length; i++) {
      fill(0, 100, 200);
      float barX = 2 * i * barWidth + barWidth;
      float barHeight = (log(distanceRanges[i]) / flightsPerPixel);
      float barY = maxHeight - barHeight;      
      rect(barX, barY, barWidth, barHeight);
      println(barX + " " + (maxHeight - barHeight) + " " + barWidth + " " + barHeight + " " + distanceRanges[i]); 
      textAlign(CENTER);
      fill(0);
      text(getRangeTitle(i), barX + 20, barY + 30 + barHeight);
      text(distanceRanges[i], barX + barWidth/2,  -20);
      fill(255);
      text(distanceRanges[i], barX + barWidth/2, barY + 30);
    }
  }
  
  void graphDisplay() {
    background(255);
    fill(0);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("Flight Distance Range (Y axis is logorithmic)", width/2, 50);
    textSize(16);
    textAlign(CENTER, TOP);
    text("Number of flights within range on bar", width/2, y + barHeight + 50);
    textAlign(RIGHT, CENTER);
    text("Amount of Flights", x - 20, y - maxHeight/2);
    makeBars();
  }
  
  String getRangeTitle(int index) {
    switch (index) {
      case 0:
        return "0-999";
      case 1:
        return "1000-1999";
      case 2:
        return "2000-2999";
      case 3:
        return "3000-3999";
      case 4:
        return "4000-4999";
      case 5:
        return "5000+";
      default:
        return "";
    }
  }
  
  void drawAxis() {
    stroke(0);
    strokeWeight(2);
    line(20, 0, 20, maxHeight);  // X axis
    line(20, maxHeight, screenSize - 100, maxHeight);  // Y axis
  }
}
