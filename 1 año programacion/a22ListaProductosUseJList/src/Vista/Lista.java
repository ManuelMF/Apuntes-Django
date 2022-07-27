package Vista;

import javax.swing.JFrame;
import java.awt.Toolkit;
import javax.swing.JComboBox;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JSeparator;
import java.awt.event.ActionListener;
import java.util.LinkedList;
import java.awt.event.ActionEvent;
import javax.swing.JLabel;
import javax.swing.JTextField;

import Modelo.Producto;

import javax.swing.JScrollPane;
import javax.swing.JList;

public class Lista extends JFrame {
	public JButton btnAñadir;
	public JButton btnDelete;
	public JButton btnVaciar;
	public JButton btnDelete_lista;
	public JButton btnAñadir_lista;
	public JButton btnVaciar_lista;
	public JButton btnChange;
	public JLabel lbltextoProductos;
	public JLabel lblTexto;
	public JTextField textTotal;
	public JScrollPane scrollPaneProductos;
	public JScrollPane scrollPaneLista;
	public JList<Producto> listProductos;
	public JList<Producto> list_Lista;
	public DefaultListModel<Producto> modeloProductos;
	public DefaultListModel<Producto> modeloLista;

	public Lista() {
		super();
		
		this.setBounds(500, 300, 508, 253);
		this.setLocationRelativeTo(null);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setResizable(false);
		this.setTitle("Lista");
		this.getContentPane().setLayout(null);
		setIconImage(Toolkit.getDefaultToolkit().getImage(Lista.class.getResource("/Recourses/1351.png")));
		
		
		btnAñadir = new JButton("A\u00F1adir producto");
		btnAñadir.setBounds(179, 87, 109, 23);
		getContentPane().add(btnAñadir);
		
		btnDelete = new JButton("Borrar producto");
		btnDelete.setBounds(179, 121, 109, 23);
		getContentPane().add(btnDelete);
		
		btnVaciar = new JButton("Vaciar");
		btnVaciar.setBounds(179, 155, 109, 23);
		getContentPane().add(btnVaciar);
		
		lblTexto = new JLabel("Lista");
		lblTexto.setBounds(220, 64, 47, 14);
		getContentPane().add(lblTexto);
		
		btnDelete_lista = new JButton("Borrar producto");
		btnDelete_lista.setVisible(false);
		btnDelete_lista.setBounds(179, 121, 109, 23);
		getContentPane().add(btnDelete_lista);
		
		btnAñadir_lista = new JButton("A\u00F1adir producto");
		btnAñadir_lista.setVisible(false);
		btnAñadir_lista.setBounds(179, 87, 109, 23);
		getContentPane().add(btnAñadir_lista);
		
		btnVaciar_lista = new JButton("Vaciar");
		btnVaciar_lista.setVisible(false);
		btnVaciar_lista.setBounds(179, 155, 109, 23);
		getContentPane().add(btnVaciar_lista);
		
		btnChange = new JButton("Cambiar");
		btnChange.setBounds(189, 30, 89, 23);
		getContentPane().add(btnChange);
		
		lbltextoProductos = new JLabel("Productos");
		lbltextoProductos.setVisible(false);
		lbltextoProductos.setBounds(209, 64, 58, 14);
		getContentPane().add(lbltextoProductos);
		
		JLabel lblTotal = new JLabel("Total");
		lblTotal.setBounds(179, 189, 46, 14);
		getContentPane().add(lblTotal);
		
		textTotal = new JTextField();
		textTotal.setBounds(220, 186, 68, 20);
		getContentPane().add(textTotal);
		textTotal.setColumns(10);
		
		scrollPaneProductos = new JScrollPane();
		scrollPaneProductos.setBounds(24, 33, 133, 180);
		getContentPane().add(scrollPaneProductos);
		
		modeloProductos = new DefaultListModel<Producto>();
		LinkedList<Producto> lista = Modelo.Producto.find();
		for (Producto p : lista) modeloProductos.addElement(p);
		
		
		
		modeloLista = new DefaultListModel<Producto>();
		scrollPaneLista = new JScrollPane();
		scrollPaneLista.setBounds(317, 33, 133, 180);
		getContentPane().add(scrollPaneLista);
		
		listProductos = new JList<Producto>(modeloProductos);
		scrollPaneProductos.setViewportView(listProductos);
		
		list_Lista = new JList<Producto>(modeloLista);
		scrollPaneLista.setViewportView(list_Lista);
		
		
		
		this.repaint();
		this.revalidate();
		this.setVisible(true);
	}
}
