package a8BeginnerSeries2Clock;

public class Clock
{
  public static int Past(int h, int m, int s) 
  {
	  int mili=0;
	  mili+=h*3600000;
	  mili+=m*60*1000;
	  mili+=s*1000;
	  
    return mili;
    		
  }
}