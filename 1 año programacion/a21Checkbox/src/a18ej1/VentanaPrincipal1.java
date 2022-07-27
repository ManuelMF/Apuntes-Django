package a18ej1;

import javax.swing.JFrame;

import java.awt.Point;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import java.awt.Cursor;
import java.awt.event.ActionListener;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.awt.event.ActionEvent;
import javax.swing.SwingConstants;
import java.awt.Toolkit;
import javax.swing.JSpinner;
import javax.swing.SpinnerNumberModel;
import javax.swing.JCheckBox;
import java.awt.Color;
import javax.swing.JRadioButton;
import javax.swing.ButtonGroup;
import javax.swing.JSeparator;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;
import javax.swing.JPasswordField;
import javax.swing.JSlider;
import javax.swing.event.ChangeListener;
import javax.swing.event.ChangeEvent;
import javax.swing.JComboBox;

public class VentanaPrincipal1 extends JFrame{
	
	JLabel etiqueta1;
	JButton btnAction;
	private JLabel lblCantidad;
	private JLabel lblTotal;
	private JTextField tftotal;
	public JSpinner sPrecio;
	private JSpinner sCantidad;
	private JButton btnCalculo;
	private JCheckBox chckbxIVA;
	
	private final ButtonGroup buttonGroup = new ButtonGroup();
	private JRadioButton rdbtnPeseta;
	private JRadioButton rdbtnDolar;
	private JRadioButton rdbtnEuro;
	private JRadioButton rdbtnPrecioEuros;
	private JRadioButton rdbtnprecioDolares;
	private JRadioButton rdbtnPrecioPesetas;
	private final ButtonGroup buttonGroup_1 = new ButtonGroup();
	private JSeparator separator_1;
	private JSeparator separator_2;
	private JPasswordField tfPass;
	private JButton btnReset;
	private JSlider sliderprecio;
	private JSlider slidercantidad;
	private JComboBox<Gato> comboBox;
	private JTextField textRaza;
	private JButton btnInfoGato;
	private JButton btnEliminarGato;
	private JButton btnInfoallGatos;
	
	public VentanaPrincipal1() {
		super();
		setIconImage(Toolkit.getDefaultToolkit().getImage(VentanaPrincipal1.class.getResource("/a18ej1/257791.png")));
	//	Ajuste pantalla
		this.setBounds(500, 300, 508, 552);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setTitle("Calculo");
		//this.setResizable(false);
		this.getContentPane().setLayout(null);
		
		
		sPrecio = new JSpinner();
		sPrecio.addChangeListener(new ChangeListener() {
			public void stateChanged(ChangeEvent e) {
				sliderprecio.setValue((int)sPrecio.getValue());
			}
		});
		sPrecio.setModel(new SpinnerNumberModel(0, 0, 1000000, 1));
		sPrecio.setBounds(89, 30, 149, 20);
		getContentPane().add(sPrecio);
		
		sCantidad = new JSpinner();
		sCantidad.addChangeListener(new ChangeListener() {
			public void stateChanged(ChangeEvent e) {
				slidercantidad.setValue((int)sCantidad.getValue());
			}
		});
		sCantidad.setModel(new SpinnerNumberModel(0, 0, 100, 1));
		sCantidad.setBounds(89, 61, 149, 20);
		getContentPane().add(sCantidad);
		
		
//		Label pPrecio
		this.etiqueta1 = new JLabel("Precio:");
		this.etiqueta1.setToolTipText("Introduce el precio");
		this.etiqueta1.setBounds(23, 33, 46, 14);
		this.getContentPane().add(etiqueta1);
		
//		Label Cantidad
		lblCantidad = new JLabel("Cantidad:");
		lblCantidad.setBounds(23, 64, 56, 14);
		getContentPane().add(lblCantidad);
		
		lblTotal = new JLabel("Total:");
		lblTotal.setBounds(23, 95, 46, 14);
		getContentPane().add(lblTotal);
		
		tftotal = new JTextField();
		tftotal.setToolTipText("Aqui te saldr\u00E1 el total");
		tftotal.setHorizontalAlignment(SwingConstants.RIGHT);
		tftotal.setBounds(89, 92, 149, 20);
		getContentPane().add(tftotal);
		tftotal.setColumns(10);
		
		chckbxIVA = new JCheckBox("Precios con IVA");
		chckbxIVA.setBounds(89, 160, 125, 23);
		getContentPane().add(chckbxIVA);
		
		btnCalculo = new JButton("Calcular");
		btnCalculo.setToolTipText("Calcular\u00E1");
		btnCalculo.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				try {
					
					BigDecimal precio = new BigDecimal((Integer) sPrecio.getValue());
					
					if (rdbtnprecioDolares.isSelected()) {
						precio=precio.multiply(new BigDecimal(0.95));
					} else 	if (rdbtnPrecioPesetas.isSelected()) {
						precio=precio.multiply(new BigDecimal(0.006 ));
					}
					
					BigDecimal cantidad = new BigDecimal((Integer)sCantidad.getValue());
					BigDecimal total = precio.multiply(cantidad);
					
					
					// calcular iva
					if (chckbxIVA.isSelected()) {
						total=total.multiply(new BigDecimal(1.21));
					}
					
					// pasar a pesetas
					if (rdbtnPeseta.isSelected()) {
						total= total.multiply(new BigDecimal(166.386));
					} else if (rdbtnDolar.isSelected()) {
						total= total.multiply(new BigDecimal(1.056));
					}
					
					// redondear
					total=total.setScale(2,RoundingMode.HALF_UP);
					
					
					tftotal.setText(total.toString()+" €");
					if (rdbtnPeseta.isSelected()) {
						total=total.setScale(0,RoundingMode.HALF_UP);
						tftotal.setText(total.toString()+" ₧");
					} else if (rdbtnDolar.isSelected()) {
						total=total.setScale(2,RoundingMode.HALF_UP);
						tftotal.setText(total.toString()+" $");
					}
					String pass = new String(tfPass.getPassword());
					System.out.println(pass);
				} catch (Exception e1) {
					
					e1.printStackTrace();
					JOptionPane.showMessageDialog(null, "Datos Incorrectos!!","ERROR",JOptionPane.ERROR_MESSAGE);
				}
			}
		});
		btnCalculo.setBounds(161, 130, 89, 23);
		getContentPane().add(btnCalculo);
		
		btnReset = new JButton("Reset");
		btnReset.setToolTipText("Resetea");
		btnReset.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				int valor = JOptionPane.showConfirmDialog(null, "Estás seguro","CONFIRMACION",JOptionPane.YES_NO_OPTION);
				
				if (valor==JOptionPane.YES_NO_OPTION) {
					//SPrecio.set;
					//tfCantidad.setText("0");
					tftotal.setText("");
					chckbxIVA.setSelected(false);
					slidercantidad.setValue(0);
					sliderprecio.setValue(0);
				}
				comboBox.removeAllItems();
				
			}
		});
		btnReset.setBounds(58, 130, 89, 23);
		getContentPane().add(btnReset);
		
		
		
		rdbtnEuro = new JRadioButton("Resultado en Euros");
		rdbtnEuro.setSelected(true);
		buttonGroup.add(rdbtnEuro);
		rdbtnEuro.setBounds(89, 195, 149, 23);
		getContentPane().add(rdbtnEuro);
		
		rdbtnDolar = new JRadioButton("Resultado en Dolares");
		buttonGroup.add(rdbtnDolar);
		rdbtnDolar.setBounds(89, 221, 168, 23);
		getContentPane().add(rdbtnDolar);
		
		rdbtnPeseta = new JRadioButton("Resultado en  Pesetas");
		buttonGroup.add(rdbtnPeseta);
		rdbtnPeseta.setBounds(89, 247, 168, 23);
		getContentPane().add(rdbtnPeseta);
		
		rdbtnPrecioEuros = new JRadioButton("Precio en Euros");
		rdbtnPrecioEuros.setSelected(true);
		buttonGroup_1.add(rdbtnPrecioEuros);
		rdbtnPrecioEuros.setBounds(89, 290, 149, 23);
		getContentPane().add(rdbtnPrecioEuros);
		
		rdbtnprecioDolares = new JRadioButton("Precio en Dolares");
		buttonGroup_1.add(rdbtnprecioDolares);
		rdbtnprecioDolares.setBounds(89, 316, 142, 23);
		getContentPane().add(rdbtnprecioDolares);
		
		rdbtnPrecioPesetas = new JRadioButton("Precio en Pesetas");
		buttonGroup_1.add(rdbtnPrecioPesetas);
		rdbtnPrecioPesetas.setBounds(89, 342, 154, 23);
		getContentPane().add(rdbtnPrecioPesetas);
		
		JSeparator separator = new JSeparator();
		separator.setBounds(39, 288, 192, -13);
		getContentPane().add(separator);
		
		separator_1 = new JSeparator();
		separator_1.setBounds(58, 281, 192, 2);
		getContentPane().add(separator_1);
		
		separator_2 = new JSeparator();
		separator_2.setBounds(58, 190, 192, 2);
		getContentPane().add(separator_2);
		
		
		
		JScrollPane scrollPane_1 = new JScrollPane();
		scrollPane_1.setBounds(259, 30, 213, 189);
		getContentPane().add(scrollPane_1);
		
		JTextArea txtrTextoInicial = new JTextArea();
		txtrTextoInicial.setLineWrap(true);
		txtrTextoInicial.setText("Producto:");
		txtrTextoInicial.addFocusListener(new FocusAdapter() {
			
			public void focusGained(FocusEvent e) {
				if (txtrTextoInicial.getText().equals("Producto:")) {
					txtrTextoInicial.setText("");
				}
			}
		});
		scrollPane_1.setViewportView(txtrTextoInicial);
		
		tfPass = new JPasswordField();
		tfPass.setText("hola");
		tfPass.setBounds(259, 248, 213, 20);
		getContentPane().add(tfPass);
		
		sliderprecio = new JSlider();
		sliderprecio.setMaximum(50);
		sliderprecio.setValue(0);
		sliderprecio.setSnapToTicks(true);
		sliderprecio.addChangeListener(new ChangeListener() {
			public void stateChanged(ChangeEvent e) {
				sPrecio.setValue(sliderprecio.getValue());
			}
		});
		sliderprecio.setBounds(263, 305, 209, 26);
		getContentPane().add(sliderprecio);
		
		JLabel textoBarraprecio = new JLabel("Precio");
		textoBarraprecio.setBounds(260, 281, 46, 14);
		getContentPane().add(textoBarraprecio);
		
		slidercantidad = new JSlider();
		slidercantidad.setValue(0);
		slidercantidad.setSnapToTicks(true);
		slidercantidad.setBounds(259, 371, 209, 26);
		slidercantidad.addChangeListener(new ChangeListener() {
			public void stateChanged(ChangeEvent e) {
				sCantidad.setValue(slidercantidad.getValue());
			}
		});
		getContentPane().add(slidercantidad);
		
		JLabel textoBarravantidad_1 = new JLabel("Cantidad");
		textoBarravantidad_1.setBounds(260, 346, 46, 14);
		getContentPane().add(textoBarravantidad_1);
		
		comboBox = new JComboBox<Gato>();
		comboBox.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Gato g = (Gato) comboBox.getSelectedItem();
				txtrTextoInicial.setText("Raza: "+g.raza+"\nEdad: "+g.edad);
			}
		});
		comboBox.setBounds(368, 472, 114, 22);
		getContentPane().add(comboBox);
		
		JLabel lblRaza = new JLabel("Raza:");
		lblRaza.setBounds(368, 408, 35, 14);
		getContentPane().add(lblRaza);
		
		JLabel lblEdad = new JLabel("Edad:");
		lblEdad.setBounds(368, 442, 46, 14);
		getContentPane().add(lblEdad);
		
		textRaza = new JTextField();
		textRaza.setBounds(406, 405, 76, 20);
		getContentPane().add(textRaza);
		textRaza.setColumns(10);
		
		JSpinner spedad = new JSpinner();
		spedad.setBounds(406, 439, 76, 20);
		getContentPane().add(spedad);
		
		JButton btnGato = new JButton("Añadir gato");
		btnGato.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Gato g = new Gato(textRaza.getText(),(int) spedad.getValue());
				comboBox.addItem(g);
				comboBox.setSelectedItem(g);
				repaint();
				revalidate();
			}
		});
		btnGato.setBounds(248, 408, 110, 23);
		getContentPane().add(btnGato);
		
		btnInfoGato = new JButton("Info gato");
		btnInfoGato.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Gato g = (Gato) comboBox.getSelectedItem();
				txtrTextoInicial.setText("Raza: "+g.raza+"\nEdad: "+g.edad);
			}
		});
		btnInfoGato.setBounds(248, 438, 110, 23);
		getContentPane().add(btnInfoGato);
		
		btnEliminarGato = new JButton("Eliminar gato");
		btnEliminarGato.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Gato g = (Gato) comboBox.getSelectedItem();
				comboBox.removeItem(g);
			}
		});
		btnEliminarGato.setBounds(124, 438, 114, 23);
		getContentPane().add(btnEliminarGato);
		
		btnInfoallGatos = new JButton("Info gatos");
		btnInfoallGatos.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String text=new String("");
				for (int x=0 ; x<comboBox.getItemCount() ; x++) {
					Gato g = comboBox.getItemAt(x);
					text+="Raza: "+g.raza+"\nEdad: "+g.edad+"\n";
				}
				txtrTextoInicial.setText(text);
			}
		});
		btnInfoallGatos.setBounds(124, 408, 114, 23);
		getContentPane().add(btnInfoallGatos);
		comboBox.addItem(new Gato("Común",7));
		comboBox.addItem(new Gato("Siames",2));
		comboBox.addItem(new Gato("Bengali",4));
		
		this.repaint();
		this.revalidate();
	
		this.setVisible(true);
		
		
	}
}
