package a19Calculadora;

import javax.swing.JFrame;
import javax.swing.JButton;
import javax.swing.JTextField;
import java.awt.event.ActionListener;
import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.awt.event.ActionEvent;
import javax.swing.SwingConstants;

public class FramePrincipal extends JFrame {
	private JTextField Pantalla;
	private JTextField PantallaSuperior;
	
	public FramePrincipal() {  
		super();
		setResizable(false);
		this.setBounds(500, 300, 331, 401);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		getContentPane().setLayout(null);
		
		Pantalla = new JTextField();
		Pantalla.setHorizontalAlignment(SwingConstants.RIGHT);
		Pantalla.setEditable(false);
		Pantalla.setBounds(48, 36, 222, 36);
		getContentPane().add(Pantalla);
		Pantalla.setColumns(10);
		
		PantallaSuperior = new JTextField();
		PantallaSuperior.setHorizontalAlignment(SwingConstants.RIGHT);
		PantallaSuperior.setEditable(false);
		PantallaSuperior.setBounds(172, 11, 97, 20);
		getContentPane().add(PantallaSuperior);
		PantallaSuperior.setColumns(10);
		
		JButton b0 = new JButton("0");
		b0.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				if (!PantallaSuperior.getText().isEmpty()){
					int tamnum = PantallaSuperior.getText().length();
					String dospuntos =  PantallaSuperior.getText().substring(tamnum-1, tamnum);
					if (dospuntos.equals(":")) {
						Pantalla.setText("");
						PantallaSuperior.setText("");
					}
				}
				
				if (PantallaSuperior.getText().isEmpty()) Pantalla.setText(Pantalla.getText()+"0");
				else if (!PantallaSuperior.getText().isEmpty()) {
					
					int tamnum = PantallaSuperior.getText().length();
					String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
					if (!num1.equals(Pantalla.getText())) {
							Pantalla.setText(Pantalla.getText()+"0");
							
					}		
				}
				
				if (!PantallaSuperior.getText().isEmpty()) {
					int tamnum = PantallaSuperior.getText().length();
					String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
					if (num1.equals(Pantalla.getText())) {
						Pantalla.setText("0");
						
					}
					
				}
			}
		});
		b0.setBounds(106, 271, 48, 36);
		getContentPane().add(b0);
		
		JButton b1 = new JButton("1");
		b1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				if (!PantallaSuperior.getText().isEmpty()){
					int tamnum = PantallaSuperior.getText().length();
					String dospuntos =  PantallaSuperior.getText().substring(tamnum-1, tamnum);
					if (dospuntos.equals(":")) {
						Pantalla.setText("");
						PantallaSuperior.setText("");
					}
				}
				
				if (PantallaSuperior.getText().isEmpty()) Pantalla.setText(Pantalla.getText()+"1");
				else if (!PantallaSuperior.getText().isEmpty()) {
					
					int tamnum = PantallaSuperior.getText().length();
					String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
					if (!num1.equals(Pantalla.getText())) {
							Pantalla.setText(Pantalla.getText()+"1");
							
					}		
				}
				
				if (!PantallaSuperior.getText().isEmpty()) {
					int tamnum = PantallaSuperior.getText().length();
					String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
					if (num1.equals(Pantalla.getText())) {
						Pantalla.setText("1");
						
					}
					
				}
				
				
			}
		});
		b1.setBounds(48, 224, 48, 36);
		getContentPane().add(b1);
		
		JButton b2 = new JButton("2");
		b2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				if (!PantallaSuperior.getText().isEmpty()){
					int tamnum = PantallaSuperior.getText().length();
					String dospuntos =  PantallaSuperior.getText().substring(tamnum-1, tamnum);
					if (dospuntos.equals(":")) {
						Pantalla.setText("");
						PantallaSuperior.setText("");
					}
				}
				
				if (PantallaSuperior.getText().isEmpty()) Pantalla.setText(Pantalla.getText()+"2");
				else if (!PantallaSuperior.getText().isEmpty()) {
					
					int tamnum = PantallaSuperior.getText().length();
					String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
					if (!num1.equals(Pantalla.getText())) {
							Pantalla.setText(Pantalla.getText()+"2");
							
					}		
				}
				
				if (!PantallaSuperior.getText().isEmpty()) {
					int tamnum = PantallaSuperior.getText().length();
					String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
					if (num1.equals(Pantalla.getText())) {
						Pantalla.setText("2");
						
					}
					
				}
			}
		});
		b2.setBounds(106, 224, 48, 36);
		getContentPane().add(b2);
		
		JButton b3 = new JButton("3");
		b3.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				if (!PantallaSuperior.getText().isEmpty()){
					int tamnum = PantallaSuperior.getText().length();
					String dospuntos =  PantallaSuperior.getText().substring(tamnum-1, tamnum);
					if (dospuntos.equals(":")) {
						Pantalla.setText("");
						PantallaSuperior.setText("");
					}
				}
				
				if (PantallaSuperior.getText().isEmpty()) Pantalla.setText(Pantalla.getText()+"3");
				else if (!PantallaSuperior.getText().isEmpty()) {
					
					int tamnum = PantallaSuperior.getText().length();
					String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
					if (!num1.equals(Pantalla.getText())) {
							Pantalla.setText(Pantalla.getText()+"3");
							
					}		
				}
				
				if (!PantallaSuperior.getText().isEmpty()) {
					int tamnum = PantallaSuperior.getText().length();
					String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
					if (num1.equals(Pantalla.getText())) {
						Pantalla.setText("3");
						
					}
					
				}
			}
		});
		b3.setBounds(164, 224, 48, 36);
		getContentPane().add(b3);
		
		JButton b4 = new JButton("4");
		b4.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				if (!PantallaSuperior.getText().isEmpty()){
					int tamnum = PantallaSuperior.getText().length();
					String dospuntos =  PantallaSuperior.getText().substring(tamnum-1, tamnum);
					if (dospuntos.equals(":")) {
						Pantalla.setText("");
						PantallaSuperior.setText("");
					}
				}
				
				if (PantallaSuperior.getText().isEmpty()) Pantalla.setText(Pantalla.getText()+"4");
				else if (!PantallaSuperior.getText().isEmpty()) {
					
					int tamnum = PantallaSuperior.getText().length();
					String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
					if (!num1.equals(Pantalla.getText())) {
							Pantalla.setText(Pantalla.getText()+"4");
							
					}		
				}
				
				if (!PantallaSuperior.getText().isEmpty()) {
					int tamnum = PantallaSuperior.getText().length();
					String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
					if (num1.equals(Pantalla.getText())) {
						Pantalla.setText("4");
						
					}
					
				}
			}
		});
		b4.setBounds(48, 177, 48, 36);
		getContentPane().add(b4);
		

		JButton b5 = new JButton("5");
		b5.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				if (!PantallaSuperior.getText().isEmpty()){
					int tamnum = PantallaSuperior.getText().length();
					String dospuntos =  PantallaSuperior.getText().substring(tamnum-1, tamnum);
					if (dospuntos.equals(":")) {
						Pantalla.setText("");
						PantallaSuperior.setText("");
					}
				}
				
				if (PantallaSuperior.getText().isEmpty()) Pantalla.setText(Pantalla.getText()+"5");
				else if (!PantallaSuperior.getText().isEmpty()) {
					
					int tamnum = PantallaSuperior.getText().length();
					String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
					if (!num1.equals(Pantalla.getText())) {
							Pantalla.setText(Pantalla.getText()+"5");
							
					}		
				}
				
				if (!PantallaSuperior.getText().isEmpty()) {
					int tamnum = PantallaSuperior.getText().length();
					String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
					if (num1.equals(Pantalla.getText())) {
						Pantalla.setText("5");
						
					}
					
				}
			}
		});
		b5.setBounds(106, 177, 48, 36);
		getContentPane().add(b5);
		
		JButton b6 = new JButton("6");
		b6.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				if (!PantallaSuperior.getText().isEmpty()){
					int tamnum = PantallaSuperior.getText().length();
					String dospuntos =  PantallaSuperior.getText().substring(tamnum-1, tamnum);
					if (dospuntos.equals(":")) {
						Pantalla.setText("");
						PantallaSuperior.setText("");
					}
				}
				
				if (PantallaSuperior.getText().isEmpty()) Pantalla.setText(Pantalla.getText()+"6");
				else if (!PantallaSuperior.getText().isEmpty()) {
					
					int tamnum = PantallaSuperior.getText().length();
					String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
					if (!num1.equals(Pantalla.getText())) {
							Pantalla.setText(Pantalla.getText()+"6");
							
					}		
				}
				
				if (!PantallaSuperior.getText().isEmpty()) {
					int tamnum = PantallaSuperior.getText().length();
					String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
					if (num1.equals(Pantalla.getText())) {
						Pantalla.setText("6");
						
					}
					
				}
			}
		});
		b6.setBounds(164, 177, 48, 36);
		getContentPane().add(b6);
		
		JButton b7 = new JButton("7");
		b7.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				if (!PantallaSuperior.getText().isEmpty()){
					int tamnum = PantallaSuperior.getText().length();
					String dospuntos =  PantallaSuperior.getText().substring(tamnum-1, tamnum);
					if (dospuntos.equals(":")) {
						Pantalla.setText("");
						PantallaSuperior.setText("");
					}
				}
				
				if (PantallaSuperior.getText().isEmpty()) Pantalla.setText(Pantalla.getText()+"7");
				else if (!PantallaSuperior.getText().isEmpty()) {
					
					int tamnum = PantallaSuperior.getText().length();
					String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
					if (!num1.equals(Pantalla.getText())) {
							Pantalla.setText(Pantalla.getText()+"7");
							
					}		
				}
				
				if (!PantallaSuperior.getText().isEmpty()) {
					int tamnum = PantallaSuperior.getText().length();
					String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
					if (num1.equals(Pantalla.getText())) {
						Pantalla.setText("7");
						
					}
					
				}
			}
		});
		b7.setBounds(48, 130, 48, 36);
		getContentPane().add(b7);
		
		JButton b8 = new JButton("8");
		b8.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				if (!PantallaSuperior.getText().isEmpty()){
					int tamnum = PantallaSuperior.getText().length();
					String dospuntos =  PantallaSuperior.getText().substring(tamnum-1, tamnum);
					if (dospuntos.equals(":")) {
						Pantalla.setText("");
						PantallaSuperior.setText("");
					}
				}
				
				if (PantallaSuperior.getText().isEmpty()) Pantalla.setText(Pantalla.getText()+"8");
				else if (!PantallaSuperior.getText().isEmpty()) {
					
					int tamnum = PantallaSuperior.getText().length();
					String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
					if (!num1.equals(Pantalla.getText())) {
							Pantalla.setText(Pantalla.getText()+"8");
							
					}		
				}
				
				if (!PantallaSuperior.getText().isEmpty()) {
					int tamnum = PantallaSuperior.getText().length();
					String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
					if (num1.equals(Pantalla.getText())) {
						Pantalla.setText("8");
						
					}
					
				}
			}
		});
		b8.setBounds(106, 130, 48, 36);
		getContentPane().add(b8);
		
		JButton b9 = new JButton("9");
		b9.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				if (!PantallaSuperior.getText().isEmpty()){
					int tamnum = PantallaSuperior.getText().length();
					String dospuntos =  PantallaSuperior.getText().substring(tamnum-1, tamnum);
					if (dospuntos.equals(":")) {
						Pantalla.setText("");
						PantallaSuperior.setText("");
					}
				}	
				
				if (PantallaSuperior.getText().isEmpty()) Pantalla.setText(Pantalla.getText()+"9");
				else if (!PantallaSuperior.getText().isEmpty()) {
					
					int tamnum = PantallaSuperior.getText().length();
					String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
					if (!num1.equals(Pantalla.getText())) {
							Pantalla.setText(Pantalla.getText()+"9");
							
					}		
				}
				
				if (!PantallaSuperior.getText().isEmpty()) {
					int tamnum = PantallaSuperior.getText().length();
					String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
					if (num1.equals(Pantalla.getText())) {
						Pantalla.setText("9");
						
					}
					
				}
			}
		});
		b9.setBounds(164, 130, 48, 36);
		getContentPane().add(b9);
		
		JButton bpunto = new JButton(".");
		bpunto.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				if (!Pantalla.getText().contains(".")) {
					if (!Pantalla.getText().endsWith(".")) {
						Pantalla.setText(Pantalla.getText()+".");
					}	
				}
			}
		});
		bpunto.setBounds(48, 271, 48, 36);
		getContentPane().add(bpunto);
		
		JButton Bmas = new JButton("+");
		Bmas.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				int x=1;
				if (!PantallaSuperior.getText().isEmpty()){
					int tamnum = PantallaSuperior.getText().length();
					String dospuntos =  PantallaSuperior.getText().substring(tamnum-1, tamnum);
					if (dospuntos.equals(":")) {
						;
						PantallaSuperior.setText(Pantalla.getText()+"+");
						
					}
				}
				
				if (PantallaSuperior.getText().isEmpty()) {
				
				PantallaSuperior.setText(Pantalla.getText()+"+");
				Pantalla.setText("");
				
				} else {
					
					if (Pantalla.getText().isEmpty()) {
						int tamnum = PantallaSuperior.getText().length();
						String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
						String num2 = Pantalla.getText();
						
						BigDecimal  Primer = new BigDecimal(num1);
						BigDecimal Segon = new BigDecimal(num2);
						BigDecimal total = Primer.add(Segon);
						Pantalla.setText(total+"");
						PantallaSuperior.setText(total+"+");
					} else {
						

						int tamnum = PantallaSuperior.getText().length();
						String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
						String num2 = Pantalla.getText();
						String simbolo =  PantallaSuperior.getText().substring(tamnum-1, tamnum);
						
						BigDecimal  Primer = new BigDecimal(num1);
						BigDecimal Segon = new BigDecimal(num2);
						BigDecimal total = new BigDecimal(0);
						if (simbolo.equals("+")) {
							total = Primer.add(Segon);
							PantallaSuperior.setText(total+"+");
							Pantalla.setText(total+"");
						}
						if (simbolo.equals("-")) {
							total = Primer.subtract(Segon);
							PantallaSuperior.setText(total+"+");
							Pantalla.setText(total+"");
						}
						if (simbolo.equals("x")) {
							total = Primer.multiply(Segon);
							PantallaSuperior.setText(total+"+");
							Pantalla.setText(total+"");
						}
						if (simbolo.equals("/")) {
							total = Primer.divide(Segon, MathContext.DECIMAL32);
							PantallaSuperior.setText(total+"+");
							Pantalla.setText(total+"");
						}
					}		
				}	
			}
		});
		Bmas.setBounds(222, 83, 48, 36);
		getContentPane().add(Bmas);
		
		JButton Brestar = new JButton("-");
		Brestar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				if (PantallaSuperior.getText().isEmpty()) {
				
				PantallaSuperior.setText(Pantalla.getText()+"-");
				Pantalla.setText("");
				
				} else {
					
					if (Pantalla.getText().isEmpty()) {
						int tamnum = PantallaSuperior.getText().length();
						String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
						String num2 = Pantalla.getText();
						
						BigDecimal  Primer = new BigDecimal(num1);
						BigDecimal Segon = new BigDecimal(num2);
						BigDecimal total = Primer.subtract(Segon);
						Pantalla.setText(total+"");
						PantallaSuperior.setText(total+"-");
					} else {
						
						int tamnum = PantallaSuperior.getText().length();
						String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
						String num2 = Pantalla.getText();
						String simbolo =  PantallaSuperior.getText().substring(tamnum-1, tamnum);
						
						BigDecimal  Primer = new BigDecimal(num1);
						BigDecimal Segon = new BigDecimal(num2);
						BigDecimal total = new BigDecimal(0);
						if (simbolo.equals("+")) {
							total = Primer.add(Segon);
							PantallaSuperior.setText(total+"-");
							Pantalla.setText(total+"");
						}
						if (simbolo.equals("-")) {
							total = Primer.subtract(Segon);
							PantallaSuperior.setText(total+"-");
							Pantalla.setText(total+"");
						}
						if (simbolo.equals("x")) {
							total = Primer.multiply(Segon);
							PantallaSuperior.setText(total+"-");
							Pantalla.setText(total+"");
						}
						if (simbolo.equals("/")) {
							total = Primer.divide(Segon, MathContext.DECIMAL32);
							PantallaSuperior.setText(total+"-");
							Pantalla.setText(total+"");
						}
						
					}
					
					
				}
				
			}
		});
		Brestar.setBounds(222, 130, 48, 36);
		getContentPane().add(Brestar);
		
		JButton bmultiplicar = new JButton("x");
		bmultiplicar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				if (PantallaSuperior.getText().isEmpty()) {
					
				PantallaSuperior.setText(Pantalla.getText()+"x");
				Pantalla.setText("");
				
				} else {
					
					if (Pantalla.getText().isEmpty()) {
						int tamnum = PantallaSuperior.getText().length();
						String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
						String num2 = Pantalla.getText();
						
						BigDecimal  Primer = new BigDecimal(num1);
						BigDecimal Segon = new BigDecimal(num2);
						BigDecimal total = Primer.multiply(Segon);
						Pantalla.setText(total+"");
						PantallaSuperior.setText(total+"x");
					} else {
						
						int tamnum = PantallaSuperior.getText().length();
						String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
						String num2 = Pantalla.getText();
						String simbolo =  PantallaSuperior.getText().substring(tamnum-1, tamnum);
						
						
						BigDecimal  Primer = new BigDecimal(num1);
						BigDecimal Segon = new BigDecimal(num2);
						BigDecimal total = new BigDecimal(0);
						if (simbolo.equals("+")) {
							total = Primer.add(Segon);
							PantallaSuperior.setText(total+"x");
							Pantalla.setText(total+"");
						}
						if (simbolo.equals("-")) {
							total = Primer.subtract(Segon);
							PantallaSuperior.setText(total+"x");
							Pantalla.setText(total+"");
						}
						if (simbolo.equals("x")) {
							total = Primer.multiply(Segon);
							PantallaSuperior.setText(total+"x");
							Pantalla.setText(total+"");
						}
						if (simbolo.equals("/")) {
							total = Primer.divide(Segon, MathContext.DECIMAL32);
							PantallaSuperior.setText(total+"x");
							Pantalla.setText(total+"");
						}
					}
					
					
				}
			}
		});
		bmultiplicar.setBounds(222, 177, 48, 36);
		getContentPane().add(bmultiplicar);
		
		JButton Bdividir = new JButton("/");
		Bdividir.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if (PantallaSuperior.getText().isEmpty()) {
					
					PantallaSuperior.setText(Pantalla.getText()+"/");
					Pantalla.setText("");
					
					} else {
						
						if (Pantalla.getText().isEmpty()) {
							int tamnum = PantallaSuperior.getText().length();
							String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
							String num2 = Pantalla.getText();
							
							BigDecimal  Primer = new BigDecimal(num1);
							BigDecimal Segon = new BigDecimal(num2);
							BigDecimal total = Primer.divide(Segon);
							Pantalla.setText(total+"");
							PantallaSuperior.setText(total+"/");
						} else {
							
							int tamnum = PantallaSuperior.getText().length();
							String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
							String num2 = Pantalla.getText();
							String simbolo =  PantallaSuperior.getText().substring(tamnum-1, tamnum);
							
							BigDecimal  Primer = new BigDecimal(num1);
							BigDecimal Segon = new BigDecimal(num2);
							BigDecimal total = new BigDecimal(0);
							if (simbolo.equals("+")) {
								total = Primer.add(Segon);
								PantallaSuperior.setText(total+"/");
								Pantalla.setText(total+"");
							}
							if (simbolo.equals("-")) {
								total = Primer.subtract(Segon);
								PantallaSuperior.setText(total+"/");
								Pantalla.setText(total+"");
							}
							if (simbolo.equals("x")) {
								total = Primer.multiply(Segon);
								PantallaSuperior.setText(total+"/");
								Pantalla.setText(total+"");
							}
							if (simbolo.equals("/")) {
								total = Primer.divide(Segon, MathContext.DECIMAL32);
								PantallaSuperior.setText(total+"/");
								Pantalla.setText(total+"");
							}
						}
						
						
					};
			}
		});
		Bdividir.setBounds(222, 224, 48, 36);
		getContentPane().add(Bdividir);
		
		JButton BResultado = new JButton("=");
		BResultado.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				int tamnum = PantallaSuperior.getText().length();
				String num1 = PantallaSuperior.getText().substring(0, tamnum-1);
				String num2 = Pantalla.getText();
				String simbolo =  PantallaSuperior.getText().substring(tamnum-1, tamnum);
				
				BigDecimal  Primer = new BigDecimal(num1);
				BigDecimal Segon = new BigDecimal(num2);
				BigDecimal total = new BigDecimal(0);
				if (simbolo.equals("+")) {
					total = Primer.add(Segon);
					PantallaSuperior.setText(Primer+" + "+Segon+":");
					Pantalla.setText(total+"");
				}
				if (simbolo.equals("-")) {
					total = Primer.subtract(Segon);
					PantallaSuperior.setText(Primer+" - "+Segon+":");
					Pantalla.setText(total+"");
				}
				if (simbolo.equals("x")) {
					total = Primer.multiply(Segon);
					PantallaSuperior.setText(Primer+" x "+Segon+":");
					Pantalla.setText(total+"");
				}
				if (simbolo.equals("/")) {
					total = Primer.divide(Segon, MathContext.DECIMAL32);
					PantallaSuperior.setText(Primer+" / "+Segon+":");
					Pantalla.setText(total+"");
				}
			}
		});
		BResultado.setBounds(222, 271, 48, 36);
		getContentPane().add(BResultado);
		
		
		
		
		
		JButton Bborrar = new JButton("D");
		Bborrar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				if (Pantalla.getText().length()!=0) {
					int tamnum = Pantalla.getText().length();
					String texto = Pantalla.getText().substring(0, tamnum-1);
					Pantalla.setText(texto);
				}
			}
		});
		Bborrar.setBounds(164, 83, 48, 36);
		getContentPane().add(Bborrar);

		JButton BC = new JButton("C");
		BC.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Pantalla.setText("");
			}
		});
		BC.setBounds(106, 83, 48, 36);
		getContentPane().add(BC);
		
		JButton BCE = new JButton("B");
		BCE.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Pantalla.setText("");
				PantallaSuperior.setText("");
			}
		});
		BCE.setBounds(48, 83, 48, 36);
		getContentPane().add(BCE);
		
		JButton BResultado_1 = new JButton("+/-");
		BResultado_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if (Pantalla.getText().length()!=0) {
					int tamnum = Pantalla.getText().length();
					String texto = Pantalla.getText().substring(0, tamnum);
					if (texto.substring(0, 1).equals("-")) texto= texto.substring(1, tamnum);
					else texto="-"+texto;
					Pantalla.setText(texto);
				}
			}
		});
		BResultado_1.setBounds(164, 271, 48, 36);
		getContentPane().add(BResultado_1);
		
		
		setVisible(true);
		repaint();
		revalidate();
	}
}
