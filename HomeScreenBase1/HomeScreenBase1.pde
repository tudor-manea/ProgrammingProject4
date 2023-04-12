MapScreen mapScreen;
DistancesBarChart distancesBarChart;
PieChart pieChart;
CancelledPerAirlinePie pie;
DivertedAirlinePie DivPie;
StateScreen stateScreen;
BusiestAirport busiest;
boolean MapScreenActive = true;
boolean DistancesBarChartActive = false;
boolean AirlinesPieChartAcitve = false;
boolean CancelledAirlinePie = false; 
boolean DivertedAirlinePie = false; 
boolean StateScreenActive = false;
boolean BusiestAirportScreen = false;
String selectedState = "";
String stateName = "USA"; 

void setup() {
  size(1400, 840);
  ellipseMode(CENTER);
  mapScreen = new MapScreen();
  distancesBarChart = new DistancesBarChart();
  stateScreen = new StateScreen();
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
    int[] angles = DivPie.DIVchartAngles();
    DivPie.drawChart(500, angles);
    DivPie.drawLegend();
  }
  if (StateScreenActive){
    stateScreen.draw();
  }
  if (BusiestAirportScreen){
    busiest = new BusiestAirport();
    busiest.readAirports();
  }
}

void mousePressed() {
   if (MapScreenActive){
    mapScreen.mousePressed();
   }
   else if(StateScreenActive){
    stateScreen.mousePressed();
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

  
  
