package FechaHerencia;

import java.text.ParseException;
import java.util.Date;
import java.util.Scanner;

public class Main {
	static Scanner sc=new Scanner(System.in);

	public static void main(String[] args) {
//		pedir fecha hemos modificado la clase fecha con los metodos que quiero
		Fecha fecha = new Fecha(); 
		
		System.out.println(fecha.getDMA());
		
		boolean error=true;
		do {
			try {
				System.out.println("Introduce la nueva fecha");
				fecha.setDMA(sc.nextLine());
				
				error=false;
			} catch (ParseException e) {
				System.out.println("Fecha erronea");
			}
		}while(error);
		System.out.println(fecha.getDMA());
	}

}
