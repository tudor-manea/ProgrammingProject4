import processing.data.*; //<>//
import java.io.*;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Collections;

Table table;
PFont stdFont;
ArrayList<Integer> distances = new ArrayList<Integer>();
Integer[] distancesArray;
Integer[] topDistances;
Widget widget1;

void setup() {
  size(400, 400);
  stdFont = loadFont("Arial-Black-48.vlw");
  textFont(stdFont);
  widget1 = new Widget(100, 200, 100, 40,
    "Distances Leaderboard", color(250), stdFont);
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
  
  // Remove duplicates
  int uniqueCount = 1;
  for (int i = 1; i < distancesArray.length; i++) {
    if (!distancesArray[i].equals(distancesArray[i - 1])) {
      uniqueCount++;
    }
  }
  Integer[] uniqueDistancesArray = new Integer[uniqueCount];
  uniqueDistancesArray[0] = distancesArray[0];
  int j = 1;
  for (int i = 1; i < distancesArray.length; i++) {
    if (!distancesArray[i].equals(distancesArray[i - 1])) {
      uniqueDistancesArray[j] = distancesArray[i];
      j++;
    }
  }
  
  topDistances = Arrays.copyOfRange(uniqueDistancesArray, 0, 10);
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
