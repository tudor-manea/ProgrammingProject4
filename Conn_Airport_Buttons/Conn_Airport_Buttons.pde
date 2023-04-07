AirportsInStates airports;
USAmap map;
//Widget TestWidget;
void setup() {
  //size(1000, 700);
  fullScreen();
  stdFont = loadFont("AvenirNext-Regular-30.vlw");
  textFont(stdFont);
  airports = new AirportsInStates("flights_full.csv");
  map = new USAmap(airports); // Pass the instance of AirportsInStates to the constructor
  //TestWidget = new Widget();
}

void draw() {
  map.draw();
}

void mousePressed() {
  map.mousePressed();
}
