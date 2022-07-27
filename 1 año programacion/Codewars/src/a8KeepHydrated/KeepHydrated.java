package a8KeepHydrated;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class KeepHydrated  {

	  public int Liters(double time)  {
	    
	    double litros = time*0.5;
	    
	    BigDecimal l = new BigDecimal(litros).setScale(0, RoundingMode.HALF_UP);;
	    
	    litros = l.intValue();
	    return (int) litros;
	  
	  }

	}