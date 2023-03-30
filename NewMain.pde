PShape usa;
PShape[] states;
boolean screenActive = false;
String selectedState = "";
Table table;

void setup() {
  size(1000, 1000);
  usa = loadShape("us.svg");
  states = usa.getChildren();
  table = loadTable("flights_full.csv", "header");
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
     ArrayList<String> FL_Date = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedState, "ORIGIN_STATE_ABR")) {
    String FLDate = row.getString("DEST");
    FL_Date.add(FLDate);
  }
  println(FL_Date);
  println(selectedState);
  }
}
