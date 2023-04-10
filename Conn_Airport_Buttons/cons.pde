final int EVENT_BACK=1;
final int EVENT_FORWARD=2;
final int EVENT_SSIO=3;
final int EVENT_NULL=0;
Widget TestWidget;
PFont stdFont;

  PShape usa;
  PShape[] states;
  boolean StatescreenActive = false;
  boolean AirportIN_OUT = false;
  boolean DefaultScreen = true; 
  boolean State_IN_OUT = false;
  String selectedAirport = "";
  String selectedState = "";
  ArrayList<Widget> airportWidgets;  
  Table table;

  
  int Outboundcount=0; int Inboundcount=0;                  int Outboundcount2=0; int Inboundcount2=0;
  int Outboundpagenum=1; int Inboundpagenum=1;                int Outboundpagenum2=1; int Inboundpagenum2=1;
  


Widget OutboundBack, OutboundForward, InboundBack, InboundForward, StateSpecific_In_Out;
Widget OutboundBack2, OutboundForward2, InboundBack2, InboundForward2;
String[] OriginArray; String[] OrgCityArray; String[] DestArray; String[] DestCityArray; 
String[] OriginArray2; String[] OrgCityArray2; String[] DestArray2; String[] DestCityArray2; 

String[] OriginArray1; String[] OrgCityArray1; String[] DestArray1; String[] DestCityArray1; 
String[] OriginArray22; String[] OrgCityArray22; String[] DestArray22; String[] DestCityArray22; 
