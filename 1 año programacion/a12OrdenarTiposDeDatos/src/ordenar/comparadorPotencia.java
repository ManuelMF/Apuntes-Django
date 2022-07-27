package ordenar;

import java.util.Comparator;

public class comparadorPotencia implements Comparator<Vehiculo> {

	public int compare(Vehiculo o1,Vehiculo o2) {
	if(o1.potencia == o2.potencia) return 0;
	
	if(o1.potencia < o2.potencia) return -1;
	
	return 1;
	}
}
