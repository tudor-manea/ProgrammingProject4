import processing.data.*;
import java.io.*;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Collections;

Table table;
ArrayList<String> distances = new ArrayList<String>();
String[] distancesArray;
String[] topDistances;

void setup() {
  size(400, 400);
  table = loadTable("flights_full.csv", "header");
  for (TableRow row : table.rows()) {
    String distance = row.getString("DISTANCE");
    distances.add(distance);
  }
  
  distancesArray = new String[distances.size()];
  distances.toArray(distancesArray);
  
  Arrays.sort(distancesArray, new Comparator<String>() {
    public int compare(String s1, String s2) {
      return Integer.compare(s2.length(), s1.length());
    }
  });
  

  topDistances = Arrays.copyOfRange(distancesArray, 0, 10);
}

void draw() {
  background(255);
  fill(0);
  textSize(20);
  text("Top Distances", 10, 30);
  textSize(16);
  for (int i = 0; i < topDistances.length; i++) {
    text(i+1 + ". " + topDistances[i], 10, 60+i*20);
  }
}
