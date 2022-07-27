package FechaHerencia;

import java.text.ParseException;

public class Main2 {

	public static void main(String[] args) {

		try {

			Fecha fDMA = new Fecha("20/12/2021");
			
			System.out.println(fDMA.getDMA());
			
			
			Fecha fDMAHM = new Fecha("20/12/2021 15:41");
			
			System.out.println(fDMAHM.getDMAHM());
			
			
			Fecha fDMAHMS = new Fecha("20/12/2021 15:41:25");
			
			System.out.println(fDMAHMS.getDMAHMS());
		} catch (ParseException e) {
			System.out.println("Fehca incorrecta");
		}
	}

}
