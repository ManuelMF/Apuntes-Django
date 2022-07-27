package Vista;

import javax.swing.JFrame;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import java.awt.Font;
import java.awt.Color;
import java.awt.Toolkit;
import javax.swing.JLabel;
import javax.swing.ImageIcon;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

public class Calculadora extends JFrame {
	public JTextField visor;
	public BotonCalc btn7;
	public BotonCalc btn8;
	public BotonCalc btn9;
	public BotonCalc btnIgual;
	public BotonCalc btn6;
	public BotonCalc btn5;
	public BotonCalc btn4;
	public BotonCalc btn3;
	public BotonCalc btn2;
	public BotonCalc btn1;
	public BotonCalc btnPoint;
	public BotonCalc btn0;
	public BotonCalc btnPlus;
	public BotonCalc btnMin;
	public BotonCalc btnMul;
	public BotonCalc btnDiv;
	public BotonCalc btnReset;
	public BotonCalc btnDel;
	public BotonCalc btnChange;
	private JLabel Logo;
	
	public Calculadora() {
		super();
		setIconImage(Toolkit.getDefaultToolkit().getImage(Calculadora.class.getResource("/resources/pngwing.com.png")));
		setResizable(false);
		setTitle("Calculator Pro 64bits");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(10,10,362,628);
		getContentPane().setLayout(null);
		
		visor = new JTextField();
		visor.setEditable(false);
		visor.setBackground(Color.WHITE);
		visor.setFont(new Font("Tahoma", Font.PLAIN, 26));
		visor.setHorizontalAlignment(SwingConstants.RIGHT);
		visor.setText("0");
		visor.setBounds(10, 76, 326, 60);
		getContentPane().add(visor);
		visor.setColumns(10);
		
		btn7 = new BotonCalc("7");
		btn7.setBounds(10, 240, 74, 74);
		getContentPane().add(btn7);
		
		btn8 = new BotonCalc("8");
		btn8.setBounds(94, 240, 74, 74);
		getContentPane().add(btn8);
		
		btn9 = new BotonCalc("9");
		btn9.setBounds(178, 240, 74, 74);
		getContentPane().add(btn9);
		
		btn6 = new BotonCalc("6");
		btn6.setBounds(178, 327, 74, 74);
		getContentPane().add(btn6);
		
		btn5 = new BotonCalc("5");
		btn5.setBounds(94, 327, 74, 74);
		getContentPane().add(btn5);
		
		btn4 = new BotonCalc("4");
		btn4.setBounds(10, 327, 74, 74);
		getContentPane().add(btn4);
		
		btn3 = new BotonCalc("3");
		btn3.setBounds(178, 414, 74, 74);
		getContentPane().add(btn3);
		
		btn2 = new BotonCalc("2");
		btn2.setBounds(94, 414, 74, 74);
		getContentPane().add(btn2);
		
		btn1 = new BotonCalc("1");
		btn1.setBounds(10, 414, 74, 74);
		getContentPane().add(btn1);
		
		btnPoint = new BotonCalc(".");
		btnPoint.setBounds(10, 501, 74, 74);
		getContentPane().add(btnPoint);
		
		btn0 = new BotonCalc("0");
		btn0.setBounds(94, 501, 74, 74);
		getContentPane().add(btn0);
		
		btnPlus = new BotonCalc("+");
		btnPlus.setBounds(262, 153, 74, 74);
		getContentPane().add(btnPlus);
		
		btnMin = new BotonCalc("-");
		btnMin.setBounds(262, 240, 74, 74);
		getContentPane().add(btnMin);
		
		btnMul = new BotonCalc("X");
		btnMul.setBounds(262, 327, 74, 74);
		getContentPane().add(btnMul);
		
		btnDiv = new BotonCalc("/");
		btnDiv.setBounds(262, 414, 74, 74);
		getContentPane().add(btnDiv);
		
		btnIgual = new BotonCalc("=");
		btnIgual.setBounds(178, 501, 159, 74);
		getContentPane().add(btnIgual);
		
		btnReset = new BotonCalc("AC");
		btnReset.setFont(new Font("Tahoma", Font.PLAIN, 34));
		btnReset.setBounds(10, 153, 74, 74);
		getContentPane().add(btnReset);
		
		btnDel = new BotonCalc("C");
		btnDel.setFont(new Font("Tahoma", Font.PLAIN, 38));
		btnDel.setBounds(94, 153, 74, 74);
		getContentPane().add(btnDel);
		
		btnChange = new BotonCalc("+/-");
		btnChange.setFont(new Font("Tahoma", Font.PLAIN, 22));
		btnChange.setBounds(178, 155, 74, 74);
		getContentPane().add(btnChange);
		
		Logo = new JLabel("");
		Logo.setHorizontalAlignment(SwingConstants.CENTER);
		Logo.setIcon(new ImageIcon(Calculadora.class.getResource("/resources/casio.png")));
		Logo.setBounds(10, 11, 326, 54);
		getContentPane().add(Logo);
		
		setVisible(true);
	}
}
