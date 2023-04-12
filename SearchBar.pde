class SearchProgram {
  String State="";
   void search(){
    // Get the search query from the user
    if (selectedState == "" || selectedState!= State){
    State = JOptionPane.showInputDialog(null, "Enter state abbreviation");
    selectedState = State;
    stateName = State;
    
   }
   else searchBar=false;

  }
  //void draw(){
    //background(255);
  //}
}
