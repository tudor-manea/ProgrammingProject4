class Widget {
 final int GAP=10;
int x, y, width, height;
String label; int event;
color widgetColor, labelColor;
PFont widgetFont;
Widget(int x,int y, int width, int height, String label,
color widgetColor, PFont widgetFont){
this.x=x; this.y=y; this.width = width; this.height= height;
this.label=label;
this.widgetColor=widgetColor; this.widgetFont=widgetFont;
labelColor= color(0);
}
void draw(){
fill(widgetColor);
rect(x,y,width,height);
fill(labelColor);
textFont(widgetFont);
text(label, x+GAP, y+height-GAP);

}
}
  
  //ArrayList<String> ETA = new ArrayList<String>();
  //for (int i=0; i<=10; i++) {
    //ETA.add(ArrTime[i]);
  //}
  
 
  
