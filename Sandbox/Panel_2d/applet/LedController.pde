
public class LedController 
{


  //These are inherited by the child class
  //=====================================
  int   ledCoordinates; //example 000, 001 
  color ledColor;       //example red, green, blue, (255,0,0)
  float ledBrightness;  //example 0 - 4096 it will be divisable so it is a float
  int   ledSize;  

  TreeMap treeMapOfLeds = new TreeMap();


  LedController() {
  }


  //Create the number of leds specifed by the parent
  LedController(int numberOfLedsToCreate)
  {


      for ( int numberOfLedsToCreateItterator = 0; numberOfLedsToCreateItterator <= numberOfLedsToCreate; numberOfLedsToCreateItterator++)
      {
  
        //int ledCordinates, color ledColor, float ledBrightness, int ledSize
        LedObject aLedObject = new LedObject(ledCoordinates, ledColor, ledBrightness, ledSize);
        aLedObject.setLedCoordinates(numberOfLedsToCreateItterator); // set the led to 000 through 16
        aLedObject.setLedColor(LedRed);
  
  
        println("The object coordinate will be the key in map " + aLedObject.getLedCoordinates() );
        String treeMapKey = aLedObject.getLedCoordinates() + ""; // the cordinate will be the key in the treemap 000
        println("got the coordinate " + treeMapKey);
        treeMapOfLeds.put(treeMapKey, aLedObject);
      }
  }// end LedController

  void displayAllLeds()
  {

       println( treeMapOfLeds.size() + "");

      for (int displayAllLedsIterator = 0; displayAllLedsIterator < treeMapOfLeds.size() -1 ; displayAllLedsIterator++ )
      {
        //Recreate the object from the hashmap
        LedObject aTemporaryLed = (LedObject ) treeMapOfLeds.get(displayAllLedsIterator+""); //Notice that (LedObject) is required to get object from hashmap
  
  
        aTemporaryLed.displayOneLed( 30+ displayAllLedsIterator * 100 /4, 40  ); // new object call method displayOneLed,( x location, y location)
        
      } //end for loop to display all leds
      
  } //end displayAllLeds
  
  
  
} // end class LedObjects

