PShape usa;
PShape california; texas; new_york; florida; 
PShape[] states;

void setup()
{
  screen1 = new Screen();
  cacreen = new Screen();
  screen1.toggleActive();
  usa = loadShape("us.svg");
  states = usa.getChildren();
  california = usa.getChild("CA");
  texas = = usa.getChild("TX");
  
}

void draw()
{
  background(255);
  shape(usa);
  //if (state.contains(mouseX, mouseY)) {System.out.print("xxxx");}
  for(int i = 0; i < states.length; i++)
  {
    if(states[i].contains(mouseX, mouseY))
    {
      System.out.println(states[i].getName());
    }
  }
}
