import processing.core.*;
import processing.data.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.ArrayList;

class USAmap {


  AirportsInStates airportsInStates;
       ////////////////

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
    if (AirportIN_OUT){
      displayAirportIN_OUT();
    }
    if (State_IN_OUT){
      displayState_IN_OUT();
    }
  }
  
    void displayDefaultScreen(){
    background(100);
    shape(usa);
    
    }
    
  void displayAirportIN_OUT(){
    background(100);
    rect(20, 20, 100, 50);
    
       pushStyle();
       Conn_AP_WIG.draw();
       popStyle();
  }
  
  void displayState_IN_OUT(){
    background(100);
    rect(20, 20, 100, 50);
    
       pushStyle();
       Conn_State_WIG.draw();
       popStyle();
  }
  

  void displayStateScreen(String name) {
    //usa = null;
    //states = null;
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
      int n = 20;
      airportWidgets.clear(); /////////////////////////////////////////////

    for (String airport : uniqueAirports) {
        if(i==13){
          i=0;
          n+=125;
        }
        i++;
        Widget TestWidget  = new Widget(n, (i*60)+20  , 100, 50, airport, color(100), stdFont, EVENT_BACK);
        airportWidgets.add(TestWidget);/////////////////////////////////////////////
        TestWidget.draw();
      }
    rect(20, 20, 100, 50);
    StateSpecific_In_Out = new Widget(540, 660, 450, 45, selectedState+" Inbound/Outbound Flights.", color(100), stdFont, EVENT_SSIO);
    StateSpecific_In_Out.draw();
  }


  void mousePressed() {
    int event;
      if (StatescreenActive) {
    if (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) {
      StatescreenActive = false;
      State_IN_OUT = false;
      DefaultScreen = true;
      }

      for (Widget TestWidget : airportWidgets) {
            event = TestWidget.getEvent(mouseX,mouseY);
      if(event== EVENT_BACK ){
           AirportIN_OUT = true;
           DefaultScreen = false;
           StatescreenActive = false;
            selectedAirport = TestWidget.label;
         }
      }
          event = StateSpecific_In_Out.getEvent(mouseX,mouseY);
          if(event==EVENT_SSIO){
             State_IN_OUT = true;
             AirportIN_OUT = false;
              DefaultScreen = false;
              StatescreenActive = false;
             }
    } 
   if (AirportIN_OUT) {
    if (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) {
        AirportIN_OUT = false;
        DefaultScreen = false;
        StatescreenActive = true;
      }
    }
    
    if(State_IN_OUT){
      if (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) {
        println("xxxx");
        StatescreenActive = true;
        State_IN_OUT = false;
        AirportIN_OUT = false;
        DefaultScreen = false;
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
