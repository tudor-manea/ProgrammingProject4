//class AverageTimeGraph {
//  Table table;
//  ArrayList<Integer> depTimeList = new ArrayList<>();
//  ArrayList<Integer> arrTimeList = new ArrayList<>();
//  int[] timesArray;

//  void calculateTimes() {
//    table = loadTable("flights_full.csv", "header");
//    for (TableRow row : table.rows()) {
//      int depTime = row.getInt("DEP_TIME");
//      int arrTime = row.getInt("ARR_TIME");
//      depTimeList.add(depTime);
//      arrTimeList.add(arrTime);
//    }
    
//    Integer[] depArray = new Integer[depTimeList.size()];
//    Integer[] arrArray = new Integer[arrTimeList.size()];
//    depTimeList.toArray(depArray);
//    arrTimeList.toArray(arrArray);

//    int count = 0;
//    int[] wrongTimesArray = new int[depTimeList.size()];
//    for (int i = 0; i < depArray.length; i++) {
//      int depHour = depArray[i] / 100;
//      int depMin = depArray[i] % 100;
//      int arrHour = arrArray[i] / 100;
//      int arrMin = arrArray[i] % 100;

//      int diffHour = arrHour - depHour;
//      int diffMin = arrMin - depMin;

//      if (diffMin < 0) {
//        diffHour--;
//        diffMin += 60;
//      }
//      if (diffHour < 0) {
//        diffHour += 24;
//      }

//      int diff = diffHour * 60 + diffMin;
//      wrongTimesArray[i] = diff;

//      if (diff != 0) {
//        count++;
//      }
//    }

//    timesArray = new int[count];
//    int j = 0;
//    for (int i = 0; i < wrongTimesArray.length; i++) {
//      if (wrongTimesArray[i] != 0) {
//        timesArray[j] = wrongTimesArray[i];
//        j++;
//      }
//    }
//  } 
  
//  void sortFlightTimes() {
//      calculateTimes();
//      int[] ranges = new int[24]; // array to store counts of flight times in each hour range
//      for (int time : timesArray) {
//          int hours = time / 60; // get the number of hours in the flight time
//          if (hours < 24) { // make sure it's within the range of hours we're counting
//              ranges[hours]++; // increment the count for the appropriate range
//          }
//      }
  
//      // print out the counts for each hour range
//      for (int i = 0; i < 24; i++) {
//          System.out.printf("%d-%dhrs: %d\n", i, i+1, ranges[i]);
//      }
//  }

//}

//AverageTimeGraph time;

//void setup() {
//  time = new AverageTimeGraph();
//  time.calculateTimes();
//  time.sortFlightTimes();
//}
