import processing.data.*;
import java.io.*;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Collections;
ScrollRect scrollRect;  // the vertical scroll bar
AvgTime avgTime;
float heightOfCanvas = 3000;
PShape usa;
PShape[] states;
PFont stdFont;
DistancesBarChart distancesBarChart;
boolean screenActive = false;
boolean airportsActive = false;
boolean barchart = false;
String selectedState = "";
String selectedAirport = "";
Table table;
String[]  ETAs;
String[] airp;
final int EVENT_ETABACK=1;
final int EVENT_ETAFORWARD=2;
final int EVENT_NULL=0;
final int EVENT_AIRPORTS = 4;
final int EVENT_BARCHART = 5;
final int screenSize = 1000;
Widget ETA, ETAForward, ETABack, Airports, Barchart;
int count=0;

void setup() {
  size(1000, 1000);
  usa = loadShape("us.svg");
  states = usa.getChildren();
  table = loadTable("flights_full.csv", "header");
  stdFont=loadFont("AgencyFB-Bold-30.vlw");
textFont(stdFont);
scrollRect = new ScrollRect();
avgTime = new AvgTime();

    ETA = new Widget(270, 80, 190, 40, "ETA", color(255, 0, 0), stdFont);
    ETABack = new Widget(200, 730, 125, 40, "Back", color(100), stdFont, EVENT_ETABACK);
    ETAForward = new Widget(325, 730, 125, 40, "Forward", color(100), stdFont, EVENT_ETAFORWARD);
   // Airports = new Widget(600, 200, 125, 40, "Airports", color(0, 479, 234), stdFont, EVENT_AIRPORTS);
    Barchart = new Widget(800, 100, 150, 40, "Flight Distance", color(0, 479, 234), stdFont, EVENT_BARCHART);
  if(screenActive){
    rect(200,100,250,630);
  }
 
}

void draw(){
  background(255);
  shape(usa);
  if (screenActive) {
    displayStateScreen(selectedState);
    fill(255);
    rect(200,100,250,630);
    ETA.draw();
    ETABack.draw();
    ETAForward.draw();
  //  Airports.draw();
    //avgTime.calculateAvg();
    Barchart.draw();
    for (int i=0; i<20; i++) {
   text(i+1 +". " + ETAs[count + i], 210, 150+i*30);  
}
    for (int i=0; i<airp.length; i++){
      text(airp[i],650, 250+i*30);
    }
     scene();
  scrollRect.display();
  scrollRect.update();
  rect (800, 150, 180, 850);
  }
   if(barchart){
  //background(0);
  distancesBarChart = new DistancesBarChart();
  distancesBarChart.countDistances();
  distancesBarChart.graphDisplay();
  distancesBarChart.drawAxis();
  println("working");
  rect(100,100,100,50);
  fill(0);
  textSize(34);
  text("Back", 140, 140);
 
  }
 
}

void scene() {
  pushMatrix();

  // reading scroll bar 
  float newYValue = scrollRect.scrollValue();  
  translate (0, newYValue);

  // The scene :
 
    
    
  stroke(255);  
  rect( 66, height/2, 
    110, 2100);
  ellipse(372, height-55, 
    260, 260);
  ellipse(472, height+855, 
    260, 260);

  fill(255, 2, 2); //red
  ellipse(372, heightOfCanvas-6, 
    6, 6);  
  text("End of virtual canvas", 380, heightOfCanvas-16);    
  fill(122); 
   //for (int i=1; i<avgTime.depTime.length-1; i++) {
    //text(avgTime.depTime[i], 820, height+i*30);
  //}
   //for (int i=1; i<avgTime.arrTime.length-1; i++) {
    //text(avgTime.arrTime[i], 880, height+i*30);
  //}
  popMatrix();
}

void displayStateScreen(String name) {
  background(200, -1100, 100);
  textSize(48);
  textAlign(CENTER, CENTER);
  text(name, width/2, height/2);
  rect(20, 20, 100, 50);
  textSize(34);
  fill(255);
  text("Back", 50, 50);
}
 void mousePressed() {
     int event;
  if (screenActive) {
    if (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) {
      screenActive = false;
    }
    else if(mouseX >800 && mouseX<950 && mouseY>100 && mouseY<140){
      barchart = true;
    }
else {event = ETABack.getEvent(mouseX,mouseY);
if(event== EVENT_ETABACK && count>20 ){
     count-=25;
    // OrgDestpagenum -=1;
   }

event = ETAForward.getEvent(mouseX,mouseY);
if(event==EVENT_ETAFORWARD){
   count+=25;
  // OrgDestpagenum +=1;
   }
   
  
  }
  scrollRect.mousePressedRect();
  }
   if(barchart == true) {
    if(mouseX>100 && mouseX<200 && mouseY>100 && mouseY<150){
      barchart=false;
     
    }
  }
  else {
    for(int i = 0; i < states.length; i++) {
      if(states[i].contains(mouseX, mouseY)) {
        selectedState = states[i].getName();
        screenActive = true;
        break;
      }
    }
     ArrayList<String> Dest = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedState, "ORIGIN_STATE_ABR")) {
    String FLDate = row.getString("DEST");
    Dest.add(FLDate);
  }
  ArrayList<String> ArrTime = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedState, "ORIGIN_STATE_ABR")) {
    String arrTime = row.getString("ARR_TIME");
    ArrTime.add(arrTime);
  }
   ETAs = new String[ArrTime.size()];
  ArrTime.toArray(ETAs);
  
  Arrays.sort(ETAs, new Comparator<String>() {
    public int compare(String s1, String s2) {
      return Integer.compare(s2.length(), s1.length());
    }
  });
  
  println(ArrTime);
  println(selectedState);
 // println(avgTime.Times);
  }
}
void mouseReleased() {
  scrollRect.mouseReleasedRect();
}
