import processing.core.*;
import processing.data.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.ArrayList;

class AirportButtons{
  
    AirportsInStates airportsInStates;
float R = random(255);
float G = random (255);
float B = random (255);
       ////////////////

  AirportButtons(AirportsInStates airports) {
    //usa = loadShape("us.svg");
    //states = usa.getChildren();
    airportsInStates = airports;
    airportWidgets = new ArrayList<Widget>();    ///////////////////
  }
  
  void draw(String name){
    
     HashSet<String> uniqueAirports = airportsInStates.getUniqueAirports(name);
      int i = 0;
      int n = 550;
      airportWidgets.clear(); /////////////////////////////////////////////

    for (String airport : uniqueAirports) {
        if(i==9){
          i=0;
          n+=150;
        }
        i++;
        Widget TestWidget  = new Widget( n, (i*60)+75  , 100, 50, airport, color(66, 197, 227), stdFont, EVENT_BACK);
        airportWidgets.add(TestWidget);/////////////////////////////////////////////
        TestWidget.draw();
      }
  }
  
}
