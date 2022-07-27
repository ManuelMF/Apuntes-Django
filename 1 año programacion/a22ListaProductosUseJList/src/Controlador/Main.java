package Controlador;


import javax.swing.UIManager;

public class Main {

	public static void main(String[] args) {
		//  meter productos ordenados
		// calcular total
		try {
			UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
		} catch (Exception e) {	
		}
		new Controlador.Lista();
	}

}
