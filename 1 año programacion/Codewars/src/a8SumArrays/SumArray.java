package a8SumArrays;

public class SumArray {

	  public static double sum(double[] numbers) {
		  double total=0;
		  
		  if (numbers.length==0) return 0.0;
		  else {
	    	
			  for (double n : numbers) {
	    		total+=n;
			  }
		  }
	    
		  return total;
	  }
	}
