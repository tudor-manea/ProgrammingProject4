import processing.data.*;
import java.io.*;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Collections;

Table table;
ArrayList<Integer> distances = new ArrayList<Integer>();
Integer[] distancesArray;
Integer[] topDistances;

void setup() {
  size(400, 400);
  table = loadTable("flights_full.csv", "header");
  for (TableRow row : table.rows()) {
    int distance = row.getInt("DISTANCE");
    distances.add(distance);
  }
  
  distancesArray = new Integer[distances.size()];
  distances.toArray(distancesArray);
  
  Arrays.sort(distancesArray, new Comparator<Integer>() {
    public int compare(Integer n1, Integer n2) {
      return n2.compareTo(n1);
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
