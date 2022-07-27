package Modelo;

import java.math.BigDecimal;
import java.util.LinkedList;

public class Producto {
	
	public String nombre;
	
	public double precio;
	
	public Producto(String n, double p) {
		this.nombre=n;
		this.precio=p;
	}
	
	public static LinkedList<Producto> find(){
		
		LinkedList<Producto> lista = new LinkedList<Producto>();
		
		lista.add(new Producto("Pan",5.34));
		lista.add(new Producto("Atun",2.99));
		lista.add(new Producto("Pescado fresco",4.34));
		lista.add(new Producto("Fuet",6.68));
		lista.add(new Producto("Agua",3.65));
		lista.add(new Producto("Cocacola",2.34));
		lista.add(new Producto("Fanta",3.74));
		lista.add(new Producto("Manzana",5.65));
		lista.add(new Producto("Pera",3.45));
		lista.add(new Producto("Sandia",1.90));
		lista.add(new Producto("Pipas", 2.3));
		lista.add(new Producto("1/2 Docena de Huevos",1.75));
		lista.add(new Producto("1L de Leche", 1));
		lista.add(new Producto("1L Aguan", 0.28));
		lista.add(new Producto("Pienso", 15));
		lista.add(new Producto("Pechugas de Pollo", 5));
		lista.add(new Producto("1Kg Cebollas", 1.6));
		lista.add(new Producto("Jamón Serrano Ibérico", 9.99));
		lista.add(new Producto("Mejillones al Vapor", 5.35));
		
		return lista;
	}
	
	public String toString() {
		return nombre +" "+precio+"€" ;
	}
}
