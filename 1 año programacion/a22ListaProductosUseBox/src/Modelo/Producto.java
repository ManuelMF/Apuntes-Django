package Modelo;

public class Producto {
	
	public String nombre;
	
	public double precio;
	
	public Producto(String n, double p) {
		this.nombre=n;
		this.precio=p;
	}
	public String toString() {
		return nombre +" "+precio+"€" ;
	}
}
