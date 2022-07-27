import javax.swing.UIManager;

import Controlador.Calculadora;


public class Main {

	public static void main(String[] args) {
		try {
			UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
		} catch (Exception e) {
			
		}
		new Calculadora();

	}

}
