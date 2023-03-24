import processing.data.*;
import java.io.*;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Collections;
Table table;
String[]  ETAs;
PFont stdFont;
Widget ETA;
int count=0;

void setup() {
  background(255);
  table = loadTable("flights_full.csv", "header");

  stdFont=loadFont("AgencyFB-Bold-30.vlw");
textFont(stdFont);

   

    ETA=new Widget(270, 80, 190, 40, "ETA", color(255, 0, 0), stdFont);

    size(800, 800);

    rect(200,100,250,630);


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
  println(MKT_Carrier_FL_NUM);
  //Origin = new ArrayList;
  ArrayList<String> Origin = new ArrayList<String>();
  for (TableRow row : table.rows()) {
    String origin = row.getString("ORIGIN");
    Origin.add(origin);
  }
  
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
   ETAs = new String[ArrTime.size()];
  ArrTime.toArray(ETAs);
  
  Arrays.sort(ETAs, new Comparator<String>() {
    public int compare(String s1, String s2) {
      return Integer.compare(s2.length(), s1.length());
    }
  });
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
}
  void draw(){
background(255);
fill(255);
rect(200,100,250,630);

ETA.draw();
for (int i=0; i<20; i++) {
  text(i+1 +". " + ETAs[count + i], 210, 150+i*30);
  
  
}
}
void mousePressed(){
  if (mousePressed) {
    count+=20;
  }
}
