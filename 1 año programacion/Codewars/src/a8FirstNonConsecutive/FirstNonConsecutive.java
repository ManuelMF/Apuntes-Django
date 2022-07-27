package a8FirstNonConsecutive;

public class FirstNonConsecutive {
	 
	static Integer find(final int[] array) {
		
		for (int i=0; i<array.length; i++){
	    	int n = array[i];
	    	
	    	if (n!= array[i+1]-1) return n;
	    	
	    	
	    	
	    }
	    return null;
	}
}
