import processing.core.*;
import processing.data.*;
import java.util.ArrayList;
import java.util.HashSet;

class InboundOutbound_AP {
  
  boolean screenActive = false;

  void draw() {
    
    fill(200);
    rect(50,120,320,540);
    rect(380,120,320,540);

  OutboundBack.draw();
  OutboundForward.draw();
  InboundBack.draw();
  InboundForward.draw();
  textFont(stdFont);
  textSize(15);
  
    pushStyle();
     textSize(29);
    text(selectedAirport+", "+selectedState+" Information Board", 150, 35);
    popStyle();
    pushStyle();   ///
   textSize(23);
   text( "Page " +Outboundpagenum+ ":   Outbound Flights." , 60, 145);
   text("__________________________", 57, 149);
   text( "Page " +Inboundpagenum+ ":   Inbound Flights." , 390, 145);
   text("__________________________", 387, 149);
  
   popStyle();    ///
    for (int i = 0; i < 24; i++) {
    text( DestArray[ Outboundcount +i]+ ",", 70, 175+i*20);
    text( DestCityArray[Outboundcount + i], 110, 175+i*20);
    
    text( OriginArray2[Inboundcount + i] + ",", 400, 175+i*20);
    text( OrgCityArray2[ Inboundcount +i], 440, 175+i*20);
        } // for 

      }  // if   


void mousePressed() {
       int event;

   event = OutboundBack.getEvent(mouseX,mouseY);
if(event== EVENT_BACK && Outboundcount>23 && Outboundpagenum>1 ){
     Outboundcount-=24;
     Outboundpagenum -=1;
   }

    event = OutboundForward.getEvent(mouseX,mouseY);
if(event==EVENT_FORWARD){
   Outboundcount+=24;
   Outboundpagenum +=1;
   }
   
    event = InboundBack.getEvent(mouseX,mouseY);
if(event== EVENT_BACK && Inboundcount>23 && Inboundpagenum>1 ){
     Inboundcount-=24;
     Inboundpagenum -=1;
   }

    event = InboundForward.getEvent(mouseX,mouseY);
if(event==EVENT_FORWARD){
   Inboundcount+=24;
   Inboundpagenum +=1;
   }
    
   ArrayList<String> Dest = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedAirport, "ORIGIN")) {
    String DestData = row.getString("DEST");
    Dest.add(DestData);
  }
  DestArray = new String[Dest.size()];
  Dest.toArray(DestArray);

     ArrayList<String> DestCity = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedAirport, "ORIGIN")) {
    String DestCITYData = row.getString("DEST_CITY_NAME");
    DestCity.add(DestCITYData);
  }
  DestCityArray = new String[DestCity.size()];
  DestCity.toArray(DestCityArray);
 //////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////

   ArrayList<String> Origin2 = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedAirport, "DEST")) {
    String ORIGINData2 = row.getString("ORIGIN");
    Origin2.add(ORIGINData2);
  }
  OriginArray2 = new String[Origin2.size()];
  Origin2.toArray(OriginArray2);

   ArrayList<String> OriginCity2 = new ArrayList<String>();
  for (TableRow row : table.findRows(selectedAirport, "DEST")) {
    String ORIGINCITYData2 = row.getString("ORIGIN_CITY_NAME");
    OriginCity2.add(ORIGINCITYData2);
  }
  OrgCityArray2 = new String[OriginCity2.size()];
  OriginCity2.toArray(OrgCityArray2);

  }

}
