import processing.data.*;
import java.io.*;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Collections;
PShape usa;
PShape[] states;
PFont stdFont;
boolean screenActive = false;
String selectedState = "";
Table table;
String[]  ETAs;
final int EVENT_ETABACK=1;
final int EVENT_ETAFORWARD=2;
final int EVENT_NULL=0;
Widget ETA, ETAForward, ETABack;
int count=0;

void setup() {
  size(1000, 1000);
  usa = loadShape("us.svg");
  states = usa.getChildren();
  table = loadTable("flights_full.csv", "header");
  stdFont=loadFont("AgencyFB-Bold-30.vlw");
textFont(stdFont);

    ETA=new Widget(270, 80, 190, 40, "ETA", color(255, 0, 0), stdFont);
    ETABack    = new Widget(200, 730, 125, 40, "Back", color(100), stdFont, EVENT_ETABACK);
    ETAForward = new Widget(325, 730, 125, 40, "Forward", color(100), stdFont, EVENT_ETAFORWARD);
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
    for (int i=0; i<20; i++) {
   text(i+1 +". " + ETAs[count + i], 210, 150+i*30);
  
  
}
  }
 
}

void displayStateScreen(String name) {
  background(200, -1100, 100);
  textSize(48);
  textAlign(CENTER, CENTER);
  text(name, width/2, height/2);
  rect(20, 20, 100, 50);
}

void mousePressed() {
     int event;
  if (screenActive) {
    if (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) {
      screenActive = false;
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
  }else {
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
  }
}
