package a18Swing;

import javax.swing.UIManager;

public class Main {

	public static void main(String[] args) {

		try {
			UIManager.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
		} catch (Throwable e) {
			
		}
		
		new VentanaPrincipal();
	}

}
