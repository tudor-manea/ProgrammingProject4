import processing.core.*;
import processing.data.*;
import java.util.ArrayList;
import java.util.HashSet;

class Inbound {
  //PShape usa;
  //PShape[] states;
  boolean screenActive = false;
  String selectedState = "";
  //AirportsInStates airportsInStates;

  //USAmap(AirportsInStates airports) {
  //  usa = loadShape("us.svg");
  //  states = usa.getChildren();
  //  airportsInStates = airports;
  //}

  void draw() {
  background(100);
  shape(usa);
  if (screenActive) {
    displayStateScreen();
    
    fill(200);
    rect(80,120,450,540);
    rect(600,120,450,540);

  //OriginsHeader.draw();
  //DestHeader.draw();
  OutboundBack.draw();
  OutboundForward.draw();
  InboundBack.draw();
  InboundForward.draw();
  textFont(stdFont);
  textSize(15);
    pushStyle();
   textSize(23);
   text( "Page " +Outboundpagenum+ ":   Outbound Flights." , 90, 145);
   text("_____________________________________", 87, 149);
   text( "Page " +Inboundpagenum+ ":   Inbound Flights." , 610, 145);
   text("_____________________________________", 607, 149);
  
   popStyle();
  for (int i = 0; i < 25; i++) {
    text( OriginArray[Outboundcount + i] + ",", 90, 170+i*20);
    text( OrgCityArray[ Outboundcount +i], 135, 170+i*20);
    text( "---->", 283, 170+i*20);
    text( DestArray[ Outboundcount +i]+ ",", 320, 170+i*20);
    text( DestCityArray[Outboundcount + i], 360, 170+i*20);
    
    text( OriginArray2[Inboundcount + i] + ",", 610, 170+i*20);
    text( OrgCityArray2[ Inboundcount +i], 655, 170+i*20);
    text( "---->", 803, 170+i*20);
    text( DestArray2[ Inboundcount +i]+ ",", 840, 170+i*20);
    text( DestCityArray2[Inboundcount + i], 880, 170+i*20);
        } // for 
        
    //fill(255);

      }  // if   

  }
  
  void displayStateScreen() {
  background(100);
  //textSize(48);
  //textAlign(CENTER, CENTER);
  //text(name, width/2, height/2);
  rect(20, 20, 100, 50);
}




void mousePressed() {
       int event;

  if (screenActive) {
    if (mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 70) {
      screenActive = false;
      Outboundpagenum = 1; Inboundpagenum = 1;
      Outboundcount = 0;  Inboundcount = 0;
    }
else {
   event = OutboundBack.getEvent(mouseX,mouseY);
if(event== EVENT_BACK && Outboundcount>24 && Outboundpagenum>1 ){
     Outboundcount-=25;
     Outboundpagenum -=1;
   }

    event = OutboundForward.getEvent(mouseX,mouseY);
if(event==EVENT_FORWARD){
   Outboundcount+=25;
   Outboundpagenum +=1;
   }
  }
    event = InboundBack.getEvent(mouseX,mouseY);
if(event== EVENT_BACK && Inboundcount>24 && Inboundpagenum>1 ){
     Inboundcount-=25;
     Inboundpagenum -=1;
   }

    event = InboundForward.getEvent(mouseX,mouseY);
if(event==EVENT_FORWARD){
   Inboundcount+=25;
   Inboundpagenum +=1;
   }
  
  } else {
    for(int i = 0; i < states.length; i++) {
      if(states[i].contains(mouseX, mouseY)) {
        selectedState = states[i].getName();
        screenActive = true;
        break;
      }
    }
    
   ArrayList<String> Dest = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedState, "ORIGIN_STATE_ABR")) {
    String DestData = row.getString("DEST");
    Dest.add(DestData);
  }
  DestArray = new String[Dest.size()];
  Dest.toArray(DestArray);

   ArrayList<String> Origin = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedState, "ORIGIN_STATE_ABR")) {
    String ORIGINData = row.getString("ORIGIN");
    Origin.add(ORIGINData);
  }
  OriginArray = new String[Origin.size()];
  Origin.toArray(OriginArray);

   ArrayList<String> OriginCity = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedState, "ORIGIN_STATE_ABR")) {
    String ORIGINCITYData = row.getString("ORIGIN_CITY_NAME");
    OriginCity.add(ORIGINCITYData);
  }
  OrgCityArray = new String[OriginCity.size()];
  OriginCity.toArray(OrgCityArray);

     ArrayList<String> DestCity = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedState, "ORIGIN_STATE_ABR")) {
    String DestCITYData = row.getString("DEST_CITY_NAME");
    DestCity.add(DestCITYData);
  }
  DestCityArray = new String[DestCity.size()];
  DestCity.toArray(DestCityArray);
 //////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
     ArrayList<String> Dest2 = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedState, "DEST_STATE_ABR")) {
    String DestData2 = row.getString("DEST");
    Dest2.add(DestData2);
  }
  DestArray2 = new String[Dest2.size()];
  Dest2.toArray(DestArray2);

   ArrayList<String> Origin2 = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedState, "DEST_STATE_ABR")) {
    String ORIGINData2 = row.getString("ORIGIN");
    Origin2.add(ORIGINData2);
  }
  OriginArray2 = new String[Origin2.size()];
  Origin2.toArray(OriginArray2);

   ArrayList<String> OriginCity2 = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedState, "DEST_STATE_ABR")) {
    String ORIGINCITYData2 = row.getString("ORIGIN_CITY_NAME");
    OriginCity2.add(ORIGINCITYData2);
  }
  OrgCityArray2 = new String[OriginCity2.size()];
  OriginCity2.toArray(OrgCityArray2);

     ArrayList<String> DestCity2 = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedState, "DEST_STATE_ABR")) {
    String DestCITYData2 = row.getString("DEST_CITY_NAME");
    DestCity2.add(DestCITYData2);
  }
  DestCityArray2 = new String[DestCity2.size()];
  DestCity2.toArray(DestCityArray2);
  
  }
}
}
