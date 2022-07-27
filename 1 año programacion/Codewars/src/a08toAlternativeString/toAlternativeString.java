package a08toAlternativeString;

public class toAlternativeString {
	 public toAlternativeString() {
		   
		  }
	 
	 public static String toAlternative(String string) {
		 
		 String newtexto = "";
		 for (int x=0; x<string.length();x++) {
			 String let = string.charAt(x)+"";
			
			if (let.equals(let.toUpperCase())) {
				let = let.toLowerCase();
			} else let=let.toUpperCase();		
			newtexto +=let;	
		 }	 
		 return  newtexto;
	}

}
