class AverageTimeGraph {
  Table table;
  ArrayList<Integer> depTimeList = new ArrayList<>();
  ArrayList<Integer> arrTimeList = new ArrayList<>();
  int[] ranges = new int[5]; // array to store counts of flight times in each hour range
  int[] timesArray;
  float barWidth = 70;
  float barHeight = 50;
  float x = 0;
  float y = 0;
  int maxHeight = height - 50;
  float logBase = log(500000);
  float flightsPerPixel = logBase / maxHeight;

  void calculateTimes() {
    table = loadTable("flights_full.csv", "header");
    for (TableRow row : table.rows()) {
      int depTime = row.getInt("DEP_TIME");
      int arrTime = row.getInt("ARR_TIME");
      depTimeList.add(depTime);
      arrTimeList.add(arrTime);
    }

    Integer[] depArray = new Integer[depTimeList.size()];
    Integer[] arrArray = new Integer[arrTimeList.size()];
    depTimeList.toArray(depArray);
    arrTimeList.toArray(arrArray);

    int count = 0;
    int[] wrongTimesArray = new int[depTimeList.size()];
    for (int i = 0; i < depArray.length; i++) {
      int depHour = depArray[i] / 100;
      int depMin = depArray[i] % 100;
      int arrHour = arrArray[i] / 100;
      int arrMin = arrArray[i] % 100;

      int diffHour = arrHour - depHour;
      int diffMin = arrMin - depMin;

      if (diffMin < 0) {
        diffHour--;
        diffMin += 60;
      }
      if (diffHour < 0) {
        diffHour += 24;
      }

      int diff = diffHour * 60 + diffMin;
      wrongTimesArray[i] = diff;

      if (diff != 0) {
        count++;
      }
    }

    timesArray = new int[count];
    int j = 0;
    for (int i = 0; i < wrongTimesArray.length; i++) {
      if (wrongTimesArray[i] != 0) {
        timesArray[j] = wrongTimesArray[i];
        j++;
      }
    }
  }

  void sortFlightTimes() {
    calculateTimes();
    for (int time : timesArray) {
      int hours = time / 60; // get the number of hours in the flight time

      if (hours < 1) {
        ranges[0]++; // increment the count for the 0-1 hour range
      } else if (hours < 2) {
        ranges[1]++; // increment the count for the 1-2 hour range
      } else if (hours < 3) {
        ranges[2]++; // increment the count for the 2-3 hour range
      } else if (hours < 4) {
        ranges[3]++; // increment the count for the 3-4 hour range
      } else {
        ranges[4]++; // increment the count for the 4+ hour range
      }
    }

    // print out the counts for each hour range
    System.out.println("0-1hrs: " + ranges[0]);
    System.out.println("1-2hrs: " + ranges[1]);
    System.out.println("2-3hrs: " + ranges[2]);
    System.out.println("3-4hrs: " + ranges[3]);
    System.out.println("4+hrs: " + ranges[4]);
  }

  void makeBars() {
    rectMode(CORNER);
    stroke(0);
    for (int i = 0; i < ranges.length; i++) {
      fill(0, 100, 200);
      float barX = 2 * i * barWidth + barWidth;
      float barHeight = (log(ranges[i]) / flightsPerPixel) - 200;
      float barY = maxHeight - barHeight;
      rect(barX, barY, barWidth, barHeight);
      println(barX + " " + (maxHeight - barHeight) + " " + barWidth + " " + barHeight + " " + ranges[i]);
      textAlign(CENTER);
      fill(0);
      text(getRangeTitle(i), barX + 35, barY + 30 + barHeight);
      text(ranges[i], barX + barWidth/2, -20);
      fill(255);
      text(ranges[i], barX + barWidth/2, barY + 30);
    }
  }

  void graphDisplay() {
    background(255);
    fill(0);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("Flight Time Ranges in Hours", width/2, 50);
    textSize(16);
    textAlign(CENTER, TOP);
    text("Number of Flights within Hour Range", width/2, y + barHeight + 50);
    textAlign(RIGHT, CENTER);
    text("Amount of Flights", x - 20, y - maxHeight/2);
    makeBars();
  }

  String getRangeTitle(int index) {
    switch (index) {
    case 0:
      return "0-1hrs";
    case 1:
      return "1-2hrs";
    case 2:
      return "2-3hrs";
    case 3:
      return "3-4hrs";
    case 4:
      return "4+hrs";
    default:
      return "";
    }
  }

  void drawAxis() {
    stroke(0);
    strokeWeight(2);
    line(20, 170, 20, maxHeight);  // Y axis
    line(20, maxHeight, 1000 - 230, maxHeight);  // X axis
  }
}


AverageTimeGraph time;

void setup() {
  size(1000,1000);
  time = new AverageTimeGraph();
  time.sortFlightTimes();
  time.graphDisplay();
  time.drawAxis();
}

void draw() {
}
