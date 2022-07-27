package a8zeroFuel;

public class ZeroFuel {
	
		  
	public static boolean zeroFuel(double distanceToPump, double mpg, double fuelLeft) {
		  
		double totalConsumo = distanceToPump * mpg;
		
		if (totalConsumo>fuelLeft) return true;
		else return false;
	}
		  
	
}
