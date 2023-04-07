import processing.core.*;
import processing.data.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.ArrayList;

class USAmap {

  
  PShape usa;
  PShape[] states;
  boolean StatescreenActive = false;
  boolean AirportScreen = false;
  boolean DefaultScreen = true; 
  String selectedState = "";
  AirportsInStates airportsInStates;
  ArrayList<Widget> airportWidgets;         ////////////////

  USAmap(AirportsInStates airports) {
    usa = loadShape("us.svg");
    states = usa.getChildren();
    airportsInStates = airports;
    airportWidgets = new ArrayList<Widget>();    ///////////////////
  }

  void draw() {
    
    if (DefaultScreen){
      displayDefaultScreen();
    
    }
    if (StatescreenActive) {
      displayStateScreen(selectedState);
    }
    
    if (AirportScreen){
      displayAirportScreen();
    }
  }
  
    void displayDefaultScreen(){
    background(100);
    shape(usa);
    }
  void displayAirportScreen(){
    background(100);
    rect(20, 20, 100, 50);
    //for (Widget TestWidget : airportWidgets) {
    //  TestWidget.draw();                      ////////////////////
    //HashSet<String> uniqueAirports = airportsInStates.getUniqueAirports(name);
    //    for (String airport : uniqueAirports) {
      
    // println(airport);
    //  }
  }
  

  void displayStateScreen(String name) {
    background(200, 100, 100);
    textSize(48);
    textAlign(CENTER, CENTER);
    text(name, width/2, height/4);
    textAlign(LEFT, TOP);
    textSize(24);
    String title = name + " airports";
    text(title, width/4, height/3);
    HashSet<String> uniqueAirports = airportsInStates.getUniqueAirports(name);
      int i = 0;
      int n = 850;
      airportWidgets.clear(); /////////////////////////////////////////////

    for (String airport : uniqueAirports) {
      
      if(i==16){
        i=0;
        n+=100;
      }
      
      i++;
      Widget TestWidget  = new Widget(n, -55 +i*60 , 85, 40, airport, color(100), stdFont, EVENT_BACK);
      airportWidgets.add(TestWidget);/////////////////////////////////////////////
      TestWidget.draw();
  
    }
    rect(20, 20, 100, 50);
  }


  void mousePressed() {
    int event;
      if (StatescreenActive) {
    if (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) {
      StatescreenActive = false;
      DefaultScreen = true;
      }
      
      for (Widget TestWidget : airportWidgets) {
            event = TestWidget.getEvent(mouseX,mouseY);
      if(event== EVENT_BACK ){
           AirportScreen = true;
           DefaultScreen = false;
         }
      }
      
    } 
      if (AirportScreen) {
    if (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) {
        AirportScreen = false;
        DefaultScreen = false;
        StatescreenActive = true;
      }
    }

         
  else {
    for(int i = 0; i < states.length; i++) {
      if(states[i].contains(mouseX, mouseY)) {
        selectedState = states[i].getName();
        StatescreenActive = true;
        break;
        }
      }
    }
 }
}


//     int event;
//    if (screenActive)  {
//      if (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) {
//        screenActive = false;
//      }
//    //if (AirportScreen)  {
//    //  if (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) {
//    //    AirportScreen = false;
//    //    screenActive = true;
//    //  }}
   
//   event = TestWidget.getEvent(mouseX,mouseY);
//if(event== EVENT_BACK ){
//     AirportScreen = true;
//   }
      
  
//    else {
//      for (int i = 0; i < states.length; i++) {
//        if (states[i].contains(mouseX, mouseY)) {
//          selectedState = states[i].getName();
//          screenActive = true;
//          break;
//        }
//      }
//    }
//  }
//  }
//  }
