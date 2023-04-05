DistancesBarChart distancesBarChart;
int screenSize = 1000; 

void setup() {
  size(1000, 1000);
  distancesBarChart = new DistancesBarChart();
  distancesBarChart.countDistances();
  distancesBarChart.graphDisplay();
  distancesBarChart.drawAxis();
}

void draw() {
  
}
