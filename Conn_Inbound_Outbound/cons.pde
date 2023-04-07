PShape usa;
PShape[] states;
boolean screenActive = false;
String selectedState = "";
import processing.data.*;
import java.io.*;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Collections;
final int EVENT_BACK=1;
final int EVENT_FORWARD=2;
final int EVENT_NULL=0;
Table table;


int Outboundcount=0; int Inboundcount=0;
int Outboundpagenum=1; int Inboundpagenum=1;
PFont stdFont;
Widget OutboundBack, OutboundForward, InboundBack, InboundForward;
String[] OriginArray; String[] OrgCityArray; String[] DestArray; String[] DestCityArray; 
String[] OriginArray2; String[] OrgCityArray2; String[] DestArray2; String[] DestCityArray2; 
