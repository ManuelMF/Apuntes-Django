package a8invert;

public class Invert {

	public static int[] invert(int[] array) {
		
		for (int i=0; i<array.length; i++){
	    	int n = array[i];
	    	n=-n;
	    	
	    	array[i]=n;
	    	
	    }
	    
	    
	  return array;
	  }
	
}
