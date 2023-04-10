MapScreen mapScreen;
DistancesBarChart distancesBarChart;
PieChart pieChart;
CancelledPerAirlinePie pie;
DivertedAirlinePie DivPie;
boolean MapScreenActive = true;
boolean DistancesBarChartActive = false;
boolean AirlinesPieChartAcitve = false;
boolean CancelledAirlinePie = false; 
boolean DivertedAirlinePie = false; 

void setup() {
  size(1400, 840);
  ellipseMode(CENTER);
  mapScreen = new MapScreen();
  distancesBarChart = new DistancesBarChart();
  pie = new CancelledPerAirlinePie();           // not sure if this line is required 
  DivPie = new DivertedAirlinePie();
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
  if (CancelledAirlinePie){
    background(254, 251, 234);
    pie = new CancelledPerAirlinePie();
    int[] angles = pie.chartAngles();
    pie.drawChart(500, angles);
    pie.drawLegend();
  }
  if (DivertedAirlinePie){ 
    background(254, 251, 234);
    DivPie = new DivertedAirlinePie();
    int[] angles = pie.chartAngles();
    pie.drawChart(500, angles);
    pie.drawLegend();
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
    else if (CancelledAirlinePie){
    pie.mousePressed();
    }
    else if (DivertedAirlinePie){
    DivPie.mousePressed();
    }
}

  
  
