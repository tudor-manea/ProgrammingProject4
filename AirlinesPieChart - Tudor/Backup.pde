//import java.util.ArrayList;

//class PieChart {
//  Table table;
//  ArrayList<String> airlinesList = new ArrayList<String>();
//  // AA, AS, B6, DL, F9, G4, HA, NK, UA, WN;
//  int[] airlines = new int[10];
//  String[] airlineCodes = {"AA", "AS", "B6", "DL", "F9", "G4", "HA", "NK", "UA", "WN"};

//  void readAirlines() {
//    table = loadTable("flights_full.csv", "header");
//    for (TableRow row : table.rows()) {
//      String airline = row.getString("MKT_CARRIER");
//      airlinesList.add(airline);
//    }
//  }

//  int[] chartAngles() {
//    readAirlines();
//    int totalFlights = airlinesList.size();
//    for (String airline : airlinesList) {
//      for (int i = 0; i < airlineCodes.length; i++) {
//        if (airline.equals(airlineCodes[i])) {
//          airlines[i]++;
//          break;
//        }
//      }
//    }
//    int[] angles = new int[10];
//    for (int i = 0; i < 10; i++) {
//      angles[i] = Math.round(360 * (float)airlines[i] / totalFlights);
//    }
//    return angles;
//  }

//  void drawChart(float diameter, int[] angles) {
//    float lastAngle = 0;
//    for (int i = 0; i < angles.length; i++) {
//      float currentAngle = lastAngle + radians(angles[i]);
//      fill(getRandomColor());
//      arc(width/2, height/2, diameter, diameter, lastAngle, currentAngle, PIE);
//      float x = width/2 + (diameter/2 + 20) * cos(lastAngle + radians(angles[i]/2));
//      float y = height/2 + (diameter/2 + 20) * sin(lastAngle + radians(angles[i]/2));
//      textAlign(CENTER, CENTER);
//      textSize(20);
//      fill(0);
//      text(airlineCodes[i], x, y);
//      lastAngle = currentAngle;
//    }
//  }
  
//  void drawLegend() {
//    textSize(20);
//    textAlign(RIGHT, TOP);
//    fill(0);
//    for (int i = 0; i < airlineCodes.length; i++) {
//      text(airlineCodes[i] + " - " + getAirlineName(airlineCodes[i]), width - 20, 20*i);
//    }
//  }
  
//  String getAirlineName(String code) {
//    switch(code) {
//      case "AA":
//        return "American Airlines";
//      case "AS":
//        return "Alaska Airlines";
//      case "B6":
//        return "JetBlue Airways";
//      case "DL":
//        return "Delta Air Lines";
//      case "F9":
//        return "Frontier Airlines";
//      case "G4":
//        return "Allegiant Air";
//      case "HA":
//        return "Hawaiian Airlines";
//      case "NK":
//        return "Spirit Airlines";
//      case "UA":
//        return "United Airlines";
//      case "WN":
//        return "Southwest Airlines";
//      default:
//        return "";
//    }
//  }
  
//  int getRandomColor() {
//    return color(random(255), random(255), random(255));
//  }
//}

//PieChart pieChart;

//void setup() {
//  size(1000, 1000);
//  background(254,251,234);
//  pieChart = new PieChart();
//  int[] angles = pieChart.chartAngles();
//  pieChart.drawChart(600, angles);
//  pieChart.drawLegend();
//}

//void draw() {
//}
