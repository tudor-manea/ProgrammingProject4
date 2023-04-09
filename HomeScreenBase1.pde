MapScreen mapScreen;
DistancesBarChart distancesBarChart;
PieChart pieChart;
boolean MapScreenActive = true;
boolean DistancesBarChartActive = false;
boolean AirlinesPieChartAcitve = false;


void setup() {
  size(1400, 840);
  ellipseMode(CENTER);
  mapScreen = new MapScreen();
  distancesBarChart = new DistancesBarChart();
}

void draw() {
  
  if (MapScreenActive){
  mapScreen.draw();
  }
  if (DistancesBarChartActive){
  distancesBarChart = new DistancesBarChart();
  distancesBarChart.countDistances();
  distancesBarChart.graphDisplay();
  distancesBarChart.drawAxis();
  }
  if (AirlinesPieChartAcitve){
    background(254,251,234);
  pieChart = new PieChart();
  int[] angles = pieChart.chartAngles();
  pieChart.drawChart(600, angles);
  pieChart.drawLegend();
  }
  
}

void mousePressed() {
   if (MapScreenActive){
    mapScreen.mousePressed();
   }
   else if (DistancesBarChartActive){
     distancesBarChart.mousePressed();
   }
   else if (AirlinesPieChartAcitve){
    pieChart.mousePressed();
    }
}
