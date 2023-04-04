AirportsInStates airports;
USAmap map;

void setup() {
  size(1000, 700);
  airports = new AirportsInStates("flights_full.csv");
  map = new USAmap(airports); // Pass the instance of AirportsInStates to the constructor
}

void draw() {
  map.draw();
}

void mouseClicked() {
  map.mouseClicked();
}
