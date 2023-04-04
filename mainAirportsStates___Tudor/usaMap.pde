import processing.core.*;
import processing.data.*;
import java.util.ArrayList;
import java.util.HashSet;

class USAmap {
  PShape usa;
  PShape[] states;
  boolean screenActive = false;
  String selectedState = "";
  AirportsInStates airportsInStates;

  USAmap(AirportsInStates airports) {
    usa = loadShape("us.svg");
    states = usa.getChildren();
    airportsInStates = airports;
  }
  
  void draw() {
    background(255);
    shape(usa);
    if (screenActive) {
      displayStateScreen(selectedState);
    }
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
    for (String airport : uniqueAirports) {
      i++;
      text(i + ". " + airport, width/2, height/3 + i*30);
    }
    rect(20, 20, 100, 50);
  }


  void mouseClicked() {
    if (screenActive) {
      if (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) {
        screenActive = false;
      }
    } else {
      for (int i = 0; i < states.length; i++) {
        if (states[i].contains(mouseX, mouseY)) {
          selectedState = states[i].getName();
          screenActive = true;
          break;
        }
      }
    }
  }
}
