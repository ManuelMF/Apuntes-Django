package Vista;


import java.awt.Font;

import javax.swing.JButton;

public class BotonCalc extends JButton {
	
	public BotonCalc() {
		this("");
	}
	public BotonCalc(String s) {
		super(s);
		setFont(new Font("Tahoma", Font.PLAIN, 40));
	}

}
