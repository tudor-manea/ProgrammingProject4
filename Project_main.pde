import processing.data.*;
import java.io.*;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Collections;
final int EVENT_ORGDESTBACK=1;
final int EVENT_ORGDESTFORWARD=2;
final int EVENT_NULL=0;
Table table;
int OrgDestcount=0; 
int OrgDestpagenum=1;

PFont stdFont;
Widget OriginsHeader, DestHeader, OrgDestBack, OrgDestForward;
String[] OriginArray; String[] OrgCityArray; String[] DestArray; String[] DestCityArray; 

void setup() {

    table = loadTable("flights_full.csv", "header");
     
    stdFont=loadFont("AdelleSansDevanagari-Light-30.vlw");
    textFont(stdFont);

    OriginsHeader  = new Widget(80, 80, 230, 40, "Origins", color(100), stdFont,0);
    DestHeader     = new Widget(300, 80, 230, 40, "Destinations", color(100), stdFont,0);
    
    OrgDestBack    = new Widget(80, 660, 230, 40, "Back", color(100), stdFont, EVENT_ORGDESTBACK);
    OrgDestForward = new Widget(300, 660, 230, 40, "Forward", color(100), stdFont, EVENT_ORGDESTFORWARD);
    
    
    size(800, 800);
   
ArrayList<String> MKT_Carrier = new ArrayList<String>();
  for (TableRow row : table.rows()) {
    String mkt_carrier = row.getString("MKT_CARRIER");
    MKT_Carrier.add(mkt_carrier);
  }
  //FL_DATE = new ArrayList;
  ArrayList<String> FL_Date = new ArrayList<String>();
  for (TableRow row : table.rows()) {
    String FLDate = row.getString("FL_DATE");
    FL_Date.add(FLDate);
  }
  //MKT_Carrier = new ArrayList;
  //MKT_Carrier_FL_NUM = new ArrayList;
  ArrayList<String> MKT_Carrier_FL_NUM = new ArrayList<String>();
  for (TableRow row : table.rows()) {
    String mkt_carrierFLNUM = row.getString("MKT_CARRIER_FL_NUM");
    MKT_Carrier_FL_NUM.add(mkt_carrierFLNUM);
  }
 // println(MKT_Carrier_FL_NUM);
  //Origin = new ArrayList;
  ArrayList<String> Origin = new ArrayList<String>();
  for (TableRow row : table.rows()) {
    String origin = row.getString("ORIGIN");
    Origin.add(origin);
  }
  //println(Origin);
  //OriginCity = new ArrayList;
  ArrayList<String> OriginCity = new ArrayList<String>();
  for (TableRow row : table.rows()) {
    String originCity = row.getString("ORIGIN_CITY_NAME");
    OriginCity.add(originCity);
  }
  //OriginState = new ArrayList;
  ArrayList<String> OriginState = new ArrayList<String>();
  for (TableRow row : table.rows()) {
    String originState = row.getString("ORIGIN_STATE_ABR");
    OriginState.add(originState);
  }
  //OriginWAC = new ArrayList;
  ArrayList<String> OriginWAC = new ArrayList<String>();
  for (TableRow row : table.rows()) {
    String originWAC = row.getString("ORIGIN_WAC");
    OriginWAC.add(originWAC);
  }
  //DestCity = new ArrayList;
  ArrayList<String> Dest = new ArrayList<String>();
  for (TableRow row : table.rows()) {
    String destCity = row.getString("DEST");
    Dest.add(destCity);
  }
  //ArrayList Dest_State;
  ArrayList<String> Dest_State = new ArrayList<String>();
  for (TableRow row : table.rows()) {
    String dest_State = row.getString("DEST_STATE_ABR");
    Dest_State.add(dest_State);
  }
//ArrayList CityName;
ArrayList<String> DestCity = new ArrayList<String>();
  for (TableRow row : table.rows()) {
    String destCity = row.getString("DEST_CITY_NAME");
    DestCity.add(destCity);
  }
//ArrayList StateAbbr;
//ArrayList DESTWAC;
ArrayList<String> DestWAC = new ArrayList<String>();
  for (TableRow row : table.rows()) {
    String destWAC = row.getString("DEST_WAC");
    DestWAC.add(destWAC);
  }
//ArrayList CrsDepTime;
ArrayList<String> CrsDepTime = new ArrayList<String>();
  for (TableRow row : table.rows()) {
    String crsDepTime = row.getString("CRS_DEP_TIME");
    CrsDepTime.add(crsDepTime);
  }
//ArrayList DepTime;
ArrayList<String> DepTime = new ArrayList<String>();
  for (TableRow row : table.rows()) {
    String depTime = row.getString("DEP_TIME");
    DepTime.add(depTime);
  }
//ArrayList CRS_Arr_Time;
ArrayList<String> crsArrTime = new ArrayList<String>();
  for (TableRow row : table.rows()) {
    String crs_arr_time = row.getString("CRS_ARR_TIME");
    crsArrTime.add(crs_arr_time);
  }
//ArrayList ArrTime;
ArrayList<String> ArrTime = new ArrayList<String>();
  for (TableRow row : table.rows()) {
    String arrTime = row.getString("ARR_TIME");
    ArrTime.add(arrTime);
  }
//ArrayList Cancelled;
ArrayList<String> Cancelled = new ArrayList<String>();
  for (TableRow row : table.rows()) {
    String cancelled = row.getString("CANCELLED");
    Cancelled.add(cancelled);
  }
//ArrayList Diverted;
ArrayList<String> Diverted = new ArrayList<String>();
  for (TableRow row : table.rows()) {
    String diverted = row.getString("DIVERTED");
    Diverted.add(diverted);
  }
//ArrayList Distance;
ArrayList<String> Distance = new ArrayList<String>();
  for (TableRow row : table.rows()) {
    String distance = row.getString("DISTANCE");
    Distance.add(distance);
  }
  
  OriginArray = new String[Origin.size()];
  Origin.toArray(OriginArray);
   
  OrgCityArray = new String[Origin.size()];
  OriginCity.toArray(OrgCityArray);
  
  DestArray = new String[Origin.size()];
  Dest.toArray(DestArray);
  
  DestCityArray = new String[Origin.size()];
  DestCity.toArray(DestCityArray);
 

}
void draw(){
    background(255);
    fill(255);
    rect(80,120,450,540);

  OriginsHeader.draw();
  DestHeader.draw();
  OrgDestBack.draw();
  OrgDestForward.draw();
  textFont(stdFont);
  textSize(15);
    pushStyle();
   textSize(23);
  text( "Page " +OrgDestpagenum+ ":       Flight origins and destinations." , 90, 145);
  text("_____________________________________", 87, 149);
  
    popStyle();
  for (int i = 0; i < 25; i++) {
    text( OriginArray[OrgDestcount + i] + ",", 90, 170+i*20);
    text( OrgCityArray[ OrgDestcount +i], 130, 170+i*20);
    text( "---->", 283, 170+i*20);
    text( DestArray[ OrgDestcount +i]+ ",", 320, 170+i*20);
    text( DestCityArray[OrgDestcount + i], 360, 170+i*20);
    
  }
}

void mousePressed(){
int event;
event = OrgDestBack.getEvent(mouseX,mouseY);
if(event== EVENT_ORGDESTBACK && OrgDestcount>24 && OrgDestpagenum>1 ){
     OrgDestcount-=25;
     OrgDestpagenum -=1;
   }

event = OrgDestForward.getEvent(mouseX,mouseY);
if(event==EVENT_ORGDESTFORWARD){
   OrgDestcount+=25;
   OrgDestpagenum +=1;
   }
}
