import processing.core.*;
import processing.data.*;
import java.util.ArrayList;
import java.util.HashSet;

class InboundOutbound_AP {
  
  boolean screenActive = false;

  void draw() {
    
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
    
    //fill(200);
    //rect(50,120,320,540);
    //rect(380,120,320,540);

  //OutboundBack.draw();
  //OutboundForward.draw();
  //InboundBack.draw();
  //InboundForward.draw();
   background(66, 224, 245);
    rect(20, 20, 100, 50);
  textFont(stdFont);
  textSize(15);
  
    pushStyle();
     textSize(29);
    text(selectedAirport+", "+selectedState+" Arrivals and Departures.", width/2, 35);
    popStyle();
    pushStyle();   ///
   textSize(23);
   text( "Outbound Flights." , width/1.55, 145);
   text("__________________________", width/1.55, 149); 
   
   text( "Inbound Flights." , width/3.5, 145); 
   text("__________________________", width/3.5, 149); 
    
  
   popStyle();    ///
    for (int i = 0; i < 24; i++) {
      
          
    text( OriginArray2[Inboundcount + i] + ",", width/4.5, 175+i*20);
    text( OrgCityArray2[ Inboundcount +i], width/4 +55, 175+i*20);
    
    text( DestArray[ Outboundcount +i]+ ",", width/1.75+10, 175+i*20);
    text( DestCityArray[Outboundcount + i], width/1.65 + 50 , 175+i*20);

        } // for 

      }  // if   


void mousePressed() {
       //int event;
    if (mouseX >= 10 && mouseX <= 100 && mouseY >= 20 && mouseY <= 70) {
      AirportIN_OUT = false;
      StateScreenActive = true;
      //MapScreenActive = true;
      println("gnsrrnhsrnhsn");
    }

  }

}
