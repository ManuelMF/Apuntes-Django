package a08maxmin;

public class Kata {
	public int min(int[] list) {
	   int min=list[0]; 
	   for (int n : list) {
	    	if (n<min) min=n;
	    }
	    return min;
	  }
	  
	  public int max(int[] list) {
		  int max=list[0]; 
		   for (int n : list) {
		    	if (n>max) max=n;
		    }
		    return max;
	  }
}
