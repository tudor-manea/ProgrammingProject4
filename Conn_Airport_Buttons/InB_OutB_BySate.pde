import processing.core.*;
import processing.data.*;
import java.util.ArrayList;
import java.util.HashSet;

class InboundOutboundByState {
  //PShape usa;
  //PShape[] states;
  //
  boolean screenActive = false;
  //String selectedState = "";
  //AirportsInStates airportsInStates;

  //USAmap(AirportsInStates airports) {
  //  usa = loadShape("us.svg");
  //  states = usa.getChildren();
  //  airportsInStates = airports;
  //}

  void draw() {
  //background(100);
  //shape(usa);
  //if (screenActive) {
  //  displayStateScreen();
    
    fill(200);
    rect(80,120,450,540);
    rect(600,120,450,540);



  OutboundBack2.draw();
  OutboundForward2.draw();
  InboundBack2.draw();
  InboundForward2.draw();
  textFont(stdFont);
  textSize(15);
      pushStyle();
     textSize(29);
    text(selectedState+" Inbound/Outbound Flights.", 150, 35);
    popStyle();
    pushStyle();   ///
  
    pushStyle();
   textSize(23);
   text( "Page " +Outboundpagenum2+ ":   Outbound Flights." , 90, 145);
   text("_____________________________________", 87, 149);
   text( "Page " +Inboundpagenum2+ ":   Inbound Flights." , 610, 145);
   text("_____________________________________", 607, 149);
  
   popStyle();
  for (int i = 0; i < 24; i++) {
    text( OriginArray1[Outboundcount2 + i] + ",", 90, 170+i*20);
    text( OrgCityArray1[ Outboundcount2 +i], 135, 170+i*20);
    text( "---->", 283, 170+i*20);
    text( DestArray1[ Outboundcount2 +i]+ ",", 320, 170+i*20);
    text( DestCityArray1[Outboundcount2 + i], 360, 170+i*20);
    
    text( OriginArray22[Inboundcount2 + i] + ",", 610, 170+i*20);
    text( OrgCityArray22[ Inboundcount2 +i], 655, 170+i*20);
    text( "---->", 803, 170+i*20);
    text( DestArray22[ Inboundcount2 +i]+ ",", 840, 170+i*20);
    text( DestCityArray22[Inboundcount2 + i], 880, 170+i*20);
        } // for 
        
    //fill(255);

     // }  // if   

  }
  
//  void displayStateScreen() {
//  background(100);
//  //textSize(48);
//  //textAlign(CENTER, CENTER);
//  //text(name, width/2, height/2);
//  rect(20, 20, 100, 50);
//}




void mousePressed() {
       int event;

  //if (screenActive) {
    if (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) {
      //screenActive = false;
      Outboundpagenum2 = 1; Inboundpagenum2 = 1;
      Outboundcount2 = 0;  Inboundcount2 = 0;
          Outboundpagenum = 1; Inboundpagenum = 1;
           Outboundcount = 0;  Inboundcount = 0;
    }
//else {
   event = OutboundBack2.getEvent(mouseX,mouseY);
if(event== EVENT_BACK && Outboundcount2>23 && Outboundpagenum2>1 ){
     Outboundcount2-=24;
     Outboundpagenum2 -=1;
   }

    event = OutboundForward2.getEvent(mouseX,mouseY);
if(event==EVENT_FORWARD){
   Outboundcount2+=24;
   Outboundpagenum2 +=1;
   }
  
    event = InboundBack2.getEvent(mouseX,mouseY);
if(event== EVENT_BACK && Inboundcount2>23 && Inboundpagenum2>1 ){
     Inboundcount2-=24;
     Inboundpagenum2 -=1;
   }

    event = InboundForward2.getEvent(mouseX,mouseY);
if(event==EVENT_FORWARD){
   Inboundcount2+=24;
   Inboundpagenum2 +=1;
   }
  
   else {
    for(int i = 0; i < states.length; i++) {
      if(states[i].contains(mouseX, mouseY)) {
        selectedState = states[i].getName();
        screenActive = true;
        break;
      }
    }
    
   ArrayList<String> Dest1 = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedState, "ORIGIN_STATE_ABR")) {
    String DestData = row.getString("DEST");
    Dest1.add(DestData);
  }
  DestArray1 = new String[Dest1.size()];
  Dest1.toArray(DestArray1);

   ArrayList<String> Origin1 = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedState, "ORIGIN_STATE_ABR")) {
    String ORIGINData1 = row.getString("ORIGIN");
    Origin1.add(ORIGINData1);
  }
  OriginArray1 = new String[Origin1.size()];
  Origin1.toArray(OriginArray1);

   ArrayList<String> OriginCity1 = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedState, "ORIGIN_STATE_ABR")) {
    String ORIGINCITYData1 = row.getString("ORIGIN_CITY_NAME");
    OriginCity1.add(ORIGINCITYData1);
  }
  OrgCityArray1 = new String[OriginCity1.size()];
  OriginCity1.toArray(OrgCityArray1);

     ArrayList<String> DestCity1 = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedState, "ORIGIN_STATE_ABR")) {
    String DestCITYData1 = row.getString("DEST_CITY_NAME");
    DestCity1.add(DestCITYData1);
  }
  DestCityArray1 = new String[DestCity1.size()];
  DestCity1.toArray(DestCityArray1);
 //////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
     ArrayList<String> Dest22 = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedState, "DEST_STATE_ABR")) {
    String DestData22 = row.getString("DEST");
    Dest22.add(DestData22);
  }
  DestArray22 = new String[Dest22.size()];
  Dest22.toArray(DestArray22);

   ArrayList<String> Origin22 = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedState, "DEST_STATE_ABR")) {
    String ORIGINData22 = row.getString("ORIGIN");
    Origin22.add(ORIGINData22);
  }
  OriginArray22 = new String[Origin22.size()];
  Origin22.toArray(OriginArray22);

   ArrayList<String> OriginCity22 = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedState, "DEST_STATE_ABR")) {
    String ORIGINCITYData22 = row.getString("ORIGIN_CITY_NAME");
    OriginCity22.add(ORIGINCITYData22);
  }
  OrgCityArray22 = new String[OriginCity22.size()];
  OriginCity22.toArray(OrgCityArray22);

     ArrayList<String> DestCity22 = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedState, "DEST_STATE_ABR")) {
    String DestCITYData22 = row.getString("DEST_CITY_NAME");
    DestCity22.add(DestCITYData22);
  }
  DestCityArray22 = new String[DestCity22.size()];
  DestCity22.toArray(DestCityArray22);
    }
}
}
