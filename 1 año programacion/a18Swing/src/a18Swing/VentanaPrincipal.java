package a18Swing;

import javax.swing.JFrame;

import java.awt.Point;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JTextField;
import java.awt.Cursor;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class VentanaPrincipal extends JFrame{
	
	JLabel etiqueta1;
	private JTextField tfPrecio;
	JButton btnAction;
	private JLabel lblCantidad;
	VentanaPrincipal() {
		super();
		//tamaño
		//this.setSize(400,300);
		//this.setLocation(500,300);
		this.setBounds(500, 300, 400, 300);
		
		//dar porpiedades suele empezar por set
		// le decimos que cuando le demos a la x esta festaña cierre el programa
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		//titulo
		this.setTitle("Mi nueva ventana.");
		// no podemos cambiar el tamaño
		this.setResizable(false);
		//hay que ponerlo para que se vea bien
		this.getContentPane().setLayout(null);
		
		
		this.etiqueta1 = new JLabel("Precio:");
		this.etiqueta1.setToolTipText("Holaa!!");
		this.etiqueta1.setBounds(23, 49, 46, 14);
		this.getContentPane().add(etiqueta1);
		
		tfPrecio = new JTextField();
		tfPrecio.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		tfPrecio.setBounds(79, 46, 86, 20);
		getContentPane().add(tfPrecio);
		tfPrecio.setColumns(10);
		
		// boton click derecho add event andler 
		// crear un lisener que escucha a el boton y dentro de action performent sale lo que va a hacer
		btnAction = new JButton("Click me!!");
		btnAction.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				tfPrecio.setText("Manolo");
			}
		});
		btnAction.setBounds(126, 156, 89, 23);
		getContentPane().add(btnAction);
		
		lblCantidad = new JLabel("Cantidad:");
		lblCantidad.setBounds(23, 74, 46, 14);
		getContentPane().add(lblCantidad);
		// texto que queramos
		//tfPrecio.setText("s");
		// no lo puedes hacer nada
		//tfPrecio.setEnabled(false);
		// no puedes editarlo
		//tfPrecio.setEditable(false);
		
		// otra forma de poner la posicion
		//Point p = new Point(30,100);
		//etiqueta1.setLocation(p);
		//etiqueta1.setText("Precio:");
	
		
		//se pone antes del set visible, escanea todos los componentes y los repinta por si no cargan bien
		this.repaint();
		this.revalidate();
		// aparece por defecto false 
		this.setVisible(true);
		
		
		

		
	}
}
