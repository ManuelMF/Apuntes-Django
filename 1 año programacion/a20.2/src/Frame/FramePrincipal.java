package Frame;

import java.awt.Toolkit;

import javax.swing.JFrame;
import javax.swing.JLabel;
import java.awt.Dimension;
import java.awt.Font;
import javax.swing.JTextField;

public class FramePrincipal extends JFrame {
	
	private JTextField JTProductos;
	public FramePrincipal() {
		super();
		setResizable(false);
		setIconImage(Toolkit.getDefaultToolkit().getImage(FramePrincipal.class.getResource("/resources/pngwing.com.png")));
		setTitle("Lista productos");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(300,300,457,390);
		getContentPane().setLayout(null);
		
		JLabel lblNombreProducto = new JLabel("Producto:");
		lblNombreProducto.setBounds(54, 83, 47, 14);
		getContentPane().add(lblNombreProducto);
		
		JLabel lblTitulo = new JLabel("Lista de productos");
		lblTitulo.setFont(new Font("Tahoma", Font.PLAIN, 24));
		lblTitulo.setBounds(122, 29, 202, 27);
		getContentPane().add(lblTitulo);
		
		JTProductos = new JTextField();
		JTProductos.setBounds(122, 80, 113, 20);
		getContentPane().add(JTProductos);
		JTProductos.setColumns(10);
		
	}
}
