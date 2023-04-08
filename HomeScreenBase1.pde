MapScreen mapScreen;
DistancesBarChart distancesBarChart;
boolean MapScreenActive = true;
boolean DistancesBarChartActive = false;

void setup() {
  size(1400, 760);
  ellipseMode(CENTER);
  mapScreen = new MapScreen();
}

void draw() {
  if (MapScreenActive = true){
  mapScreen.draw();
  }
}

void mousePressed() {
  mapScreen.mousePressed();
}
