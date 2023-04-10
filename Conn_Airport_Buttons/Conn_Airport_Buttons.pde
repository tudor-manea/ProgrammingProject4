AirportsInStates airports;


/// Fix State Buttons 
// Fix State Back Button


USAmap map;
InboundOutbound_AP Conn_AP_WIG;
InboundOutboundByState Conn_State_WIG;

void setup() {
  
  fullScreen();
  stdFont = loadFont("AvenirNext-Regular-30.vlw");
  textFont(stdFont);
  airports = new AirportsInStates("flights_full.csv");
  
    map = new USAmap(airports);
    Conn_AP_WIG = new InboundOutbound_AP(); 
    Conn_State_WIG = new InboundOutboundByState();
    
    OutboundBack    = new Widget(50, 660, 160, 40, "Back", color(100), stdFont, EVENT_BACK);
    OutboundForward = new Widget(210, 660, 160, 40, "Forward", color(100), stdFont, EVENT_FORWARD);
    
    InboundBack    = new Widget(380, 660, 160, 40, "Back", color(100), stdFont, EVENT_BACK);
    InboundForward = new Widget(540, 660, 160, 40, "Forward", color(100), stdFont, EVENT_FORWARD);
    

    OutboundBack2    = new Widget(80, 660, 230, 40, "Back", color(100), stdFont, EVENT_BACK);
    OutboundForward2 = new Widget(300, 660, 230, 40, "Forward", color(100), stdFont, EVENT_FORWARD);
    
    InboundBack2    = new Widget(600, 660, 230, 40, "Back", color(100), stdFont, EVENT_BACK);
    InboundForward2 = new Widget(830, 660, 230, 40, "Forward", color(100), stdFont, EVENT_FORWARD);
    
}

void draw() {
  map.draw();
}

void mousePressed() {
  map.mousePressed();
  Conn_AP_WIG.mousePressed();
  Conn_State_WIG.mousePressed();
}
