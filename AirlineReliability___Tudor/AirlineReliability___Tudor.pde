import java.util.Arrays;
// Average difference between CRS flight times and actual flight times for each airline represented as a bar graph
class AirlineReliability {
  Table table;
  ArrayList<Integer> depTimeList = new ArrayList<>();
  ArrayList<Integer> arrTimeList = new ArrayList<>();
  ArrayList<Integer> crsDepTimeList = new ArrayList<>();
  ArrayList<Integer> crsArrTimeList = new ArrayList<>();
  float[] averageDifference;
  ArrayList<String> airlinesList;
  int[] wrongTimesArray;
  float barWidth = 40;
  float barHeight = 300;
  float x = 0;
  float y = 0;
  int maxHeight = height - 50;
  float logBase = log(500);
  float flightsPerPixel = logBase / maxHeight;
  Integer[] depArray, arrArray, crsDepArray, crsArrArray;
  String[] airlineCodes = {"AA", "AS", "B6", "DL", "F9", "G4", "HA", "NK", "UA", "WN"};

  void readAverageDifference() {
    table = loadTable("flights_full.csv", "header");
    for (TableRow row : table.rows()) {
      int depTime = row.getInt("DEP_TIME");
      int arrTime = row.getInt("ARR_TIME");
      int crsDepTime = row.getInt("CRS_DEP_TIME");
      int crsArrTime = row.getInt("CRS_ARR_TIME");
      depTimeList.add(depTime);
      arrTimeList.add(arrTime);
      crsDepTimeList.add(crsDepTime);
      crsArrTimeList.add(crsArrTime);
    }
    depArray = new Integer[depTimeList.size()];
    arrArray = new Integer[arrTimeList.size()];
    crsDepArray = new Integer[crsDepTimeList.size()];
    crsArrArray = new Integer[crsArrTimeList.size()];
    depTimeList.toArray(depArray);
    arrTimeList.toArray(arrArray);
    crsDepTimeList.toArray(crsDepArray);
    crsArrTimeList.toArray(crsArrArray);
  }

  void standardiseArrays() {
    readAverageDifference();
    wrongTimesArray = new int[depTimeList.size()];
    int[] wrongCrsTimesArray = new int[crsArrTimeList.size()];
    int count = 0;
    // first standardise the actual times
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

    for (int i = 0; i < crsDepArray.length; i++) {
      int crsDepHour = crsDepArray[i] / 100;
      int crsDepMin = crsDepArray[i] % 100;
      int crsArrHour = crsArrArray[i] / 100;
      int crsArrMin = crsArrArray[i] % 100;

      int diffHour = crsArrHour - crsDepHour;
      int diffMin = crsArrMin - crsDepMin;

      if (diffMin < 0) {
        diffHour--;
        diffMin += 60;
      }
      if (diffHour < 0) {
        diffHour += 24;
      }

      int diff = diffHour * 60 + diffMin;
      wrongCrsTimesArray[i] = diff;
    }

    int[] timesArray = new int[count];
    int[] crsTimesArray = new int[count];
    int j = 0;
    for (int i = 0; i < wrongTimesArray.length; i++) {
      if (wrongTimesArray[i] != 0) {
        timesArray[j] = wrongTimesArray[i];
        crsTimesArray[j] = wrongCrsTimesArray[i];
        j++;
      }
    }
    // differences in times array
    int[] differencesArray = new int[timesArray.length];
    int difference = 0;
    for (int i = 0; i < timesArray.length; i++) {
      difference = timesArray[i] - crsTimesArray[i];
      if (difference < 0) {
        difference = Math.abs(difference);
      }
      differencesArray[i] = difference;
    }
  }



  // first load all airlines into an array, compare that array to wrongTimesArray,
  // if wrongTimesArray[i] == 0 remove the value at flights[i].
  // Make arrays for each airline with all of the time differences,
  // make a final array with size 10 which has the average difference in time for each airline.
  void airlineTimes() {
    standardiseArrays();

    // Step 1: Create 2D ArrayList to store time differences for each airline
    ArrayList<ArrayList<Integer>> airlineTimeDiffs = new ArrayList<ArrayList<Integer>>();
    for (int i = 0; i < 10; i++) {
      airlineTimeDiffs.add(new ArrayList<Integer>());
    }

    // Step 2: Loop through each flight and add time difference to corresponding airline's inner ArrayList
    for (int i = 0; i < table.getRowCount(); i++) {
      String airline = table.getString(i, "MKT_CARRIER");
      int airlineIndex = Arrays.asList(airlineCodes).indexOf(airline);

      int timeDiff = wrongTimesArray[i] - (arrArray[i] - depArray[i]);
      if (timeDiff != 0) {
        airlineTimeDiffs.get(airlineIndex).add(timeDiff);
      }
    }

    // Step 4: Create array to store average time difference for each airline
    averageDifference = new float[10];

    // Step 5: Loop through 2D ArrayList and calculate average time difference for each airline
    for (int i = 0; i < airlineTimeDiffs.size(); i++) {
      ArrayList<Integer> timeDiffs = airlineTimeDiffs.get(i);
      int numFlights = timeDiffs.size();

      if (numFlights > 0) {
        int sum = 0;
        for (int j = 0; j < numFlights; j++) {
          sum += timeDiffs.get(j);
        }
        averageDifference[i] = Math.abs((float) sum / numFlights);
      }
    }

    // Step 6: Print the average time difference for each airline
    for (int i = 0; i < airlineCodes.length; i++) {
      System.out.println(airlineCodes[i] + ": " + averageDifference[i]);
    }
  }

  void makeBars() {
    rectMode(CORNER);
    stroke(0);
    for (int i = 0; i < averageDifference.length; i++) {
      fill(0, 100, 200);
      float barX = 1.5 * i * barWidth + barWidth;
      float barHeight = (log(averageDifference[i]) / flightsPerPixel);
      float barY = maxHeight - barHeight;
      rect(barX, barY, barWidth, barHeight);
      println(barX + " " + (maxHeight - barHeight) + " " + barWidth + " " + barHeight + " " + averageDifference[i]);
      textAlign(CENTER);
      fill(0);
      text(airlineCodes[i], barX + 20, barY + 30 + barHeight);
      fill(0);
      text(averageDifference[i], barX + barWidth/2, barY - 20);
    }
  }

  void drawLegend() {
    textSize(20);
    textAlign(RIGHT, TOP);
    fill(0);
    textSize(20);
    textAlign(RIGHT, TOP);
    fill(0);
    // draw the title
    text("Carrier Codes:", width - 20, 0);
    for (int i = 0; i < airlineCodes.length; i++) {
      text(airlineCodes[i] + " - " + getAirlineName(airlineCodes[i]), width - 20, 30+20*i);
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

  void graphDisplay() {
    background(255);
    fill(0);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("Flight Reliability", width/2, 50);
    textSize(16);
    textAlign(CENTER, TOP);
    text("Average Difference in Minutes between Expected Flight Times and Actual Flight Times", width/2, 100);
    makeBars();
    drawAxis();
    drawLegend();
  }



  void drawAxis() {
    stroke(0);
    int maxX = 2 * (int)barWidth;
    strokeWeight(2);
    line(20, maxHeight - logBase / flightsPerPixel, 20, maxHeight);  // Y axis
    line(20, maxHeight, 1000 - 230, maxHeight);  // X axis
  }
}


AirlineReliability reliability;

void setup() {
  size(1000, 1000);
  reliability = new AirlineReliability();
  reliability.airlineTimes();
  reliability.graphDisplay();
}
