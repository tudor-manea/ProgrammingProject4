MapScreen mapScreen;
DistancesBarChart distancesBarChart;
PieChart pieChart;
CancelledPerAirlinePie pie;
DivertedAirlinePie DivPie;
StateScreen stateScreen;
BusiestAirport busiest;
AirportsInStates airports; //////////////////////////////////////
AirportButtons airButtons; //////////////////////////////////////
InboundOutbound_AP Conn_AP_WIG; //////////////////////////////////////
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
  stdFont = loadFont("AvenirNext-Regular-30.vlw");
  textFont(stdFont);
  mapScreen = new MapScreen();
  distancesBarChart = new DistancesBarChart();
  stateScreen = new StateScreen();
  airports = new AirportsInStates("flights_full.csv");  //////////////////////////////////////
  //airButtons = new AirportButtons(airports);
  Conn_AP_WIG = new InboundOutbound_AP(); 
      
  //OutboundBack    = new Widget(50, 660, 160, 40, "Back", color(100), stdFont, EVENT_BACK);
  //OutboundForward = new Widget(210, 660, 160, 40, "Forward", color(100), stdFont, EVENT_FORWARD);  
  //InboundBack    = new Widget(380, 660, 160, 40, "Back", color(100), stdFont, EVENT_BACK);
  //InboundForward = new Widget(540, 660, 160, 40, "Forward", color(100), stdFont, EVENT_FORWARD);

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
    airButtons.draw(selectedState);
    
  }
  if (BusiestAirportScreen){
    busiest = new BusiestAirport();
    busiest.readAirports();
  }
    if (AirportIN_OUT){
      pushStyle();
       Conn_AP_WIG.draw();
       popStyle();
  }
  
}

void mousePressed() {
  int event;
   if (MapScreenActive){
    mapScreen.mousePressed();
   }
   else if(StateScreenActive){
     
        for (Widget TestWidget : airportWidgets) {
        event = TestWidget.getEvent(mouseX,mouseY);
      if(event== EVENT_BACK ){
           AirportIN_OUT = true;
           StateScreenActive = false;
           //DefaultScreen = false;
           //StatescreenActive = false;
           selectedAirport = TestWidget.label;
           
           
         }
      }
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

  
  
