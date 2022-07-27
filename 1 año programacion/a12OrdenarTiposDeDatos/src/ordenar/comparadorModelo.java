package ordenar;

import java.util.Comparator;

public class comparadorModelo implements Comparator<Vehiculo> { 


		
	

	@Override
	public int compare(Vehiculo o1, Vehiculo o2) {
		
		return o1.modelo.compareTo(o2.modelo);
	}


}
