//PShape usa;
//PShape[] states;
//boolean screenActive = false;

//void setup() {
//  size(1000, 1000);
//  usa = loadShape("us.svg");
//  states = usa.getChildren();
  
//}

//void draw() {
//  background(255);
//  shape(usa);
//}



//void displayStateScreen(String name) {
//  background(200, 100, 100);
//  textSize(48);
//  textAlign(CENTER, CENTER);
//  text(name, width/2, height/2);
//  rect(20, 20, 100, 50);
//}

//void mousePressed() 
//{
//  for(int i = 0; i < states.length; i++)
//  {
//    if(states[i].contains(mouseX, mouseY))
//    {
//      String state = states[i].getName();
//      println(state);
//      displayStateScreen(state);
//      break;
//    }
//  }
//}
