//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.Map;

//class BusiestAirport {
//  Table table;
//  ArrayList<String> airportList = new ArrayList<>();
//  HashMap<String, Integer> airportCountMap = new HashMap<>();

//  void readAirports() {
//    table = loadTable("flights_full.csv", "header");
//    for (TableRow row : table.rows()) {
//      String origin = row.getString("ORIGIN");
//      String dest = row.getString("DEST");
//      airportList.add(origin);
//      airportList.add(dest);
//    }

//    String[] airportArray = new String[airportList.size()];
//    airportList.toArray(airportArray);

//    countAirports(airportArray);
//    printAirportCounts();
//    makeLeaderboard();
//  }

//  void countAirports(String[] airportArray) {
//    for (String airport : airportArray) {
//      if (airportCountMap.containsKey(airport)) {
//        int count = airportCountMap.get(airport);
//        airportCountMap.put(airport, count + 1);
//      } else {
//        airportCountMap.put(airport, 1);
//      }
//    }
//  }

//  void printAirportCounts() {
//    // Sort the HashMap by value in descending order
//    airportCountMap.entrySet().stream()
//      .sorted(Map.Entry.<String, Integer>comparingByValue().reversed())
//      .forEach(entry -> System.out.println("Airport: " + entry.getKey() + ", Count: " + entry.getValue()));
//  }

//  void makeLeaderboard() {
//    // Set up the leaderboard rectangle
//    int rectWidth = 400;
//    int rectHeight = 600;
//    int rectX = (width - rectWidth) / 2;
//    int rectY = (height - rectHeight) / 2;
//    fill(255);
//    rect(rectX, rectY, rectWidth, rectHeight);

//    // Set up the title text
//    textAlign(CENTER, TOP);
//    textSize(36);
//    fill(0);
//    text("Busiest Airports", rectX + rectWidth / 2, rectY + 20);

//    // Sort the airport count map by value in descending order
//    ArrayList<Map.Entry<String, Integer>> sortedEntries = new ArrayList<>(airportCountMap.entrySet());
//    sortedEntries.sort(Map.Entry.<String, Integer>comparingByValue().reversed());

//    // Display the top 10 airports in the leaderboard
//    textAlign(CENTER, TOP);
//    textSize(24);
//    int numAirports = Math.min(sortedEntries.size(), 10); // Get the smaller of 10 and the size of the sorted entries
//    for (int i = 0; i < numAirports; i++) {
//      Map.Entry<String, Integer> entry = sortedEntries.get(i);
//      String airport = entry.getKey();
//      int count = entry.getValue();
//      float textY = rectY + 80 + i * 50; // Compute the y-coordinate for the text
//      text(airport + " - " + count + " flights", rectX + rectWidth / 2, textY);
//    }
//  }
//}

//BusiestAirport busiest;

//void setup() {
//  size(1000, 1000);
//  busiest = new BusiestAirport();
//  busiest.readAirports();
//}
