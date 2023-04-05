//class DistancesBarChart {
//  Table table;
//  ArrayList<Integer> distances = new ArrayList<>();
//  int[] distanceRanges = new int[6];

//  void countDistances() {
//    table = loadTable("flights_full.csv", "header");
//    for (TableRow row : table.rows()) {
//      int distance = row.getInt("DISTANCE");
//      distances.add(distance);
//      if (distance >= 5000) {
//        distanceRanges[5]++;
//      } else if (distance >= 4000) {
//        distanceRanges[4]++;
//      } else if (distance >= 3000) {
//        distanceRanges[3]++;
//      } else if (distance >= 2000) {
//        distanceRanges[2]++;
//      } else if (distance >= 1000) {
//        distanceRanges[1]++;
//      } else {
//        distanceRanges[0]++;
//      }
//    }  
//  }

//  void makeBars() {
//    int maxHeight = 600;
//    float barWidth = 100;
//    float barHeight = 50;
//    float x = 100;
//    float y = 400;
//    for (int i = 0; i < distanceRanges.length; i++) {
//      float barX = x + i * barWidth;
//      float barY = y - (maxHeight * distanceRanges[i] / distances.size());
//      rect(barX, barY, barWidth, barHeight);
//    }
//  }
  
//  void graphDisplay() {
//    background(255);
//    fill(0);
//    textSize(32);
//    textAlign(CENTER, CENTER);
//    text("Flight Distance Ranges", width/2, 50);
//    makeBars();
//  }
//}
