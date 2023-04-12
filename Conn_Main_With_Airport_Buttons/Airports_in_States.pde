import processing.core.*;
import processing.data.*;
import java.util.ArrayList;
import java.util.HashSet;

class AirportsInStates {
 // private Table table;

  AirportsInStates(String csvFilename) {
    table = loadTable(csvFilename, "header");
  }

  HashSet<String> getUniqueAirports(String stateAbbr) {
    ArrayList<String> originStateAbbr = new ArrayList<String>();
    ArrayList<String> origin = new ArrayList<String>();

    for (TableRow row : table.rows()) {
      String originState = row.getString("ORIGIN_STATE_ABR");
      String originCode = row.getString("ORIGIN");
      if (originState.equals(stateAbbr)) {
        originStateAbbr.add(originState);
        origin.add(originCode);
      }
    }

    HashSet<String> uniqueAirports = new HashSet<String>();

    for (int i = 0; i < originStateAbbr.size(); i++) {
      String originCode = origin.get(i);
      if (!uniqueAirports.contains(originCode)) {
        uniqueAirports.add(originCode);
        
      }
      //println(uniqueAirports);
    }
     
    return uniqueAirports;
  }
}
