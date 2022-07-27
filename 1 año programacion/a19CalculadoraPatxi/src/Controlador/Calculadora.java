package Controlador;

import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.math.BigDecimal;
import java.math.RoundingMode;

import javax.swing.JOptionPane;

public class Calculadora {
	
	public Vista.Calculadora vCalculadora;
	public BigDecimal total;
	public String operador;
	public boolean borrar;
	
	public Calculadora() {
		vCalculadora = new Vista.Calculadora();
		int ancho=Toolkit.getDefaultToolkit().getScreenSize().width;
		int alto=Toolkit.getDefaultToolkit().getScreenSize().height;

		int posx=(ancho/2)-(vCalculadora.getSize().width/2);
		int posy=(alto/2)-(vCalculadora.getSize().height/2);
		
		vCalculadora.setLocation(posx, posy);
		total=null;
		operador=null;
		borrar=false;
		
		vCalculadora.btn0.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				numero(0);
			}
		});
		vCalculadora.btn1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				numero(1);
			}
		});
		vCalculadora.btn2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				numero(2);
			}
		});
		vCalculadora.btn3.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				numero(3);
			}
		});
		vCalculadora.btn4.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				numero(4);
			}
		});
		vCalculadora.btn5.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				numero(5);
			}
		});
		vCalculadora.btn6.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				numero(6);
			}
		});
		vCalculadora.btn7.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				numero(7);
			}
		});
		vCalculadora.btn8.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				numero(8);
			}
		});
		vCalculadora.btn9.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				numero(9);
			}
		});
		vCalculadora.btnPoint.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				coma();
			}
		});
		vCalculadora.btnPlus.addActionListener(new ActionListener() {
			
			public void actionPerformed(ActionEvent e) {
				operar("+");
			}
		});
		vCalculadora.btnMin.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				operar("-");
			}
		});
		vCalculadora.btnMul.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				operar("x");
			}
		});
		vCalculadora.btnDiv.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				operar("/");
			}
		});
		vCalculadora.btnIgual.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				operar("=");
			}
		});
		vCalculadora.btnReset.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				reset();
			}
		});
		vCalculadora.btnDel.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				del();
			}
		});
		vCalculadora.btnChange.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					BigDecimal tmp =new BigDecimal(vCalculadora.visor.getText());
					BigDecimal cmp = tmp.setScale(0);
					if (tmp.compareTo(cmp) == 0) vCalculadora.visor.setText(cmp.toPlainString());
				} catch (Exception ex) {

				}
				BigDecimal tmp =new BigDecimal(vCalculadora.visor.getText());
				tmp=tmp.multiply(new BigDecimal("-1"));
				vCalculadora.visor.setText(tmp.toPlainString());
			}
		});
	}
	private void reset() {
		total=null;
		operador=null;
		borrar=false;
		vCalculadora.visor.setText("0");
	}
	private void del() {
		if (!borrar) vCalculadora.visor.setText("0");
		else reset();
	}
	private void operar(String o) {
		try {
			BigDecimal tmp =new BigDecimal(vCalculadora.visor.getText());
			BigDecimal cmp = tmp.setScale(0);
			if (tmp.compareTo(cmp) == 0) vCalculadora.visor.setText(cmp.toPlainString());
		} catch (Exception e) {

		}
		calcular();
		total=new BigDecimal(vCalculadora.visor.getText());
		operador=o;
		borrar=true;
	}
	
	private void calcular() {
		if (total!=null && !borrar) {
			if (operador.equals("+")) {
				total=total.add(new BigDecimal(vCalculadora.visor.getText()));
			}
			if (operador.equals("-")) {
				total=total.subtract(new BigDecimal(vCalculadora.visor.getText()));
			}
			if (operador.equals("x")) {
				total=total.multiply(new BigDecimal(vCalculadora.visor.getText()));
			}
			if (operador.equals("/")) {
				try {
					total=total.divide(new BigDecimal(vCalculadora.visor.getText()),20, RoundingMode.HALF_UP);
				} catch (Exception e) {
					//e.printStackTrace();
					JOptionPane.showMessageDialog(null, "No se puede dividir por 0", " Error", JOptionPane.ERROR_MESSAGE);
				}
			} 

			try {
				BigDecimal cmp = total.setScale(0);
				if (total.compareTo(cmp) == 0) total=cmp;
			} catch (Exception e) {

			}
			
			vCalculadora.visor.setText(total.toPlainString());
			
		}
	}
	
	private void coma() {
		if (borrar) {
			vCalculadora.visor.setText("0");
			borrar=false;
		}
		String s=vCalculadora.visor.getText();
		if (!s.contains(".")) s=s+".";
		vCalculadora.visor.setText(s);
	}
	
	public void numero(int n) {
		if (borrar) {
			vCalculadora.visor.setText("0");
			borrar=false;
		}
		
		String s=vCalculadora.visor.getText();
		s=s+n;
		BigDecimal t=new BigDecimal(s);
		vCalculadora.visor.setText(t.toPlainString());
	}

}
