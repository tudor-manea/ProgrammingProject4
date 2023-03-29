PShape usa;
PShape[] states;
boolean screenActive = false;
String selectedState = "";

void setup() {
  size(1000, 1000);
  usa = loadShape("us.svg");
  states = usa.getChildren();
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
  text(name, width/2, height/2);
  rect(20, 20, 100, 50);
}

void mousePressed() {
  if (screenActive) {
    if (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) {
      screenActive = false;
    }
  } else {
    for(int i = 0; i < states.length; i++) {
      if(states[i].contains(mouseX, mouseY)) {
        selectedState = states[i].getName();
        screenActive = true;
        break;
      }
    }
  }
}
