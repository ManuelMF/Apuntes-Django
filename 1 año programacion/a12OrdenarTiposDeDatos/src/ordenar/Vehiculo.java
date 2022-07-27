package ordenar;

import java.util.Date;

public class Vehiculo implements Comparable<Vehiculo> {
	public String modelo;
	public int velocidad;
	public int potencia;
	public Fecha fecha;
	
	
	public Vehiculo(String m,int v,int p, Fecha f) {
		this.modelo=m;
		this.velocidad=v;
		this.potencia=p;
		this.fecha=f;
	}
	
//	para comprara objetos por velociodad
	@Override
	public int compareTo(Vehiculo o) {
		if(this.velocidad == o.velocidad) return 0;
		
		if(this.velocidad < o.velocidad) return -1;
		
		return 1;
	}
	
}
