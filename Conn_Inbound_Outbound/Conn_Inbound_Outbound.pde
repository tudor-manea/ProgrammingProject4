
Inbound One;

void setup() {
    fullScreen();
    usa = loadShape("us.svg");
    states = usa.getChildren();
    table = loadTable("flights_full.csv", "header");
    stdFont=loadFont("AvenirNext-Regular-30.vlw");
    textFont(stdFont);
    
    One = new Inbound(); 
    
    OutboundBack    = new Widget(80, 660, 230, 40, "Back", color(100), stdFont, EVENT_BACK);
    OutboundForward = new Widget(300, 660, 230, 40, "Forward", color(100), stdFont, EVENT_FORWARD);
    
    InboundBack    = new Widget(600, 660, 230, 40, "Back", color(100), stdFont, EVENT_BACK);
    InboundForward = new Widget(830, 660, 230, 40, "Forward", color(100), stdFont, EVENT_FORWARD);

}

void draw() {
  One.draw();
}

void mousePressed() {
  One.mousePressed();
}
