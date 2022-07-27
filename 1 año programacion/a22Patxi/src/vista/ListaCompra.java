package vista;

import javax.swing.JFrame;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JTextField;

import modelo.Producto;

import javax.swing.JLabel;
import javax.swing.SwingConstants;
import javax.swing.JList;
import javax.swing.JScrollPane;
import javax.swing.JSeparator;
import java.awt.Font;
import java.awt.Toolkit;
import javax.swing.ImageIcon;
import java.awt.Insets;
import javax.swing.JSpinner;
import javax.swing.SpinnerNumberModel;
import javax.swing.JComboBox;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;


public class ListaCompra extends JFrame {

	private static final long serialVersionUID = -7383546136792758297L;
	public JButton btnAdd;
	public JButton btnDel;
	public JButton btnClear;
	public JTextField tfTotal;
	public JList<Producto> listProductos;
	public JList<Producto> listCompra;
	public DefaultListModel<Producto> modeloListaProductos;
	public DefaultListModel<Producto> modeloListaCompra;
	public JLabel lblListaCompra;
	public JTextField tfNewNombre;
	public JSpinner spNewprecio;
	public JButton btnNewProducto;
	public JButton btnDelProducto;
	public JButton btnModificarProducto;
	public JButton btnCancelProd;
	public JTextField tfIdProd;
	public JComboBox<modelo.ListaCompra> cmbListasCompra;
	public JTextField tfNewListaCompra;
	public JButton btnDelLista;
	public JButton btnAddNewLista;

	public ListaCompra() {
		super();
		setIconImage(Toolkit.getDefaultToolkit().getImage(ListaCompra.class.getResource("/assets/outline_receipt_long_black_24dp.png")));
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setResizable(false);
		setTitle("Lista de la Compra (Ver. 2.1)  \u00A9 - 2022 - Multi 1\u00BA EDIB - Est\u00E1is todos Suspendidos -");
		setBounds(100,100,727,598);
		getContentPane().setLayout(null);
		
		btnAdd = new JButton("A\u00F1adir");
		btnAdd.setMargin(new Insets(2, 5, 2, 5));
		btnAdd.setIcon(new ImageIcon(ListaCompra.class.getResource("/assets/outline_shopping_cart_black_18dp.png")));
		btnAdd.setBounds(292, 56, 116, 36);
		getContentPane().add(btnAdd);
		
		btnDel = new JButton("Quitar");
		btnDel.setIcon(new ImageIcon(ListaCompra.class.getResource("/assets/outline_delete_black_18dp.png")));
		
		btnDel.setBounds(292, 103, 116, 36);
		getContentPane().add(btnDel);
		
		btnClear = new JButton("Reset");
		btnClear.setIcon(new ImageIcon(ListaCompra.class.getResource("/assets/twotone_restart_alt_black_18dp.png")));
		
		btnClear.setBounds(292, 150, 116, 33);
		getContentPane().add(btnClear);
		
		tfTotal = new JTextField();
		tfTotal.setEditable(false);
		tfTotal.setHorizontalAlignment(SwingConstants.RIGHT);
		tfTotal.setBounds(292, 279, 116, 22);
		getContentPane().add(tfTotal);
		
		JLabel lblTotal = new JLabel("TOTAL:");
		lblTotal.setBounds(292, 264, 46, 14);
		getContentPane().add(lblTotal);
		
		JScrollPane scrollProductos = new JScrollPane();
		scrollProductos.setBounds(21, 56, 249, 245);
		getContentPane().add(scrollProductos);
		
		
		modeloListaProductos = new DefaultListModel<Producto>();
		modeloListaCompra = new DefaultListModel<Producto>();
		
		listProductos = new JList<Producto>(modeloListaProductos);
		scrollProductos.setViewportView(listProductos);
		
		JScrollPane scrollCompra = new JScrollPane();
		scrollCompra.setBounds(429, 92, 258, 209);
		getContentPane().add(scrollCompra);
		
		listCompra = new JList<Producto>(modeloListaCompra);
		scrollCompra.setViewportView(listCompra);
		
		JLabel lblProductos = new JLabel("Productos:");
		lblProductos.setFont(new Font("Tahoma", Font.PLAIN, 16));
		lblProductos.setBounds(21, 22, 89, 23);
		getContentPane().add(lblProductos);
		
		lblListaCompra = new JLabel("Lista de la Compra:");
		lblListaCompra.setFont(new Font("Tahoma", Font.PLAIN, 16));
		lblListaCompra.setBounds(429, 22, 189, 23);
		getContentPane().add(lblListaCompra);
		
		JSeparator sepBotones = new JSeparator();
		sepBotones.setBounds(292, 209, 116, 2);
		getContentPane().add(sepBotones);
		
		JLabel lblNewLabel = new JLabel("Producto:");
		lblNewLabel.setFont(new Font("Tahoma", Font.ITALIC, 11));
		lblNewLabel.setBounds(21, 397, 131, 14);
		getContentPane().add(lblNewLabel);
		
		JSeparator separator = new JSeparator();
		separator.setBounds(21, 368, 329, 2);
		getContentPane().add(separator);
		
		tfNewNombre = new JTextField();
		tfNewNombre.setBounds(21, 422, 249, 20);
		getContentPane().add(tfNewNombre);
		tfNewNombre.setColumns(10);
		
		spNewprecio = new JSpinner();
		spNewprecio.setModel(new SpinnerNumberModel(new Double(0), new Double(0), null, new Double(1)));
		spNewprecio.setBounds(68, 454, 202, 20);
		getContentPane().add(spNewprecio);
		
		JLabel lblNewLabel_1 = new JLabel("Precio:");
		lblNewLabel_1.setFont(new Font("Tahoma", Font.ITALIC, 11));
		lblNewLabel_1.setBounds(21, 457, 46, 14);
		getContentPane().add(lblNewLabel_1);
		
		btnNewProducto = new JButton("Guardar");
		btnNewProducto.setMargin(new Insets(2, 9, 2, 9));
		
		btnNewProducto.setIcon(new ImageIcon(ListaCompra.class.getResource("/assets/outline_save_black_18dp.png")));
		btnNewProducto.setBounds(21, 489, 103, 35);
		getContentPane().add(btnNewProducto);
		
		btnDelProducto = new JButton("Eliminar");
		
		btnDelProducto.setMargin(new Insets(2, 10, 2, 10));
		btnDelProducto.setIcon(new ImageIcon(ListaCompra.class.getResource("/assets/outline_delete_black_18dp.png")));
		btnDelProducto.setBounds(21, 312, 103, 33);
		getContentPane().add(btnDelProducto);
		
		btnModificarProducto = new JButton("Modificar");
		btnModificarProducto.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		
		btnModificarProducto.setIcon(new ImageIcon(ListaCompra.class.getResource("/assets/baseline_settings_black_18dp.png")));
		btnModificarProducto.setMargin(new Insets(2, 9, 2, 9));
		btnModificarProducto.setBounds(163, 312, 107, 33);
		getContentPane().add(btnModificarProducto);
		
		btnCancelProd = new JButton("Cancelar");
		
		btnCancelProd.setMargin(new Insets(2, 8, 2, 8));
		btnCancelProd.setIcon(new ImageIcon(ListaCompra.class.getResource("/assets/outline_cancel_black_18dp.png")));
		btnCancelProd.setBounds(163, 489, 107, 35);
		getContentPane().add(btnCancelProd);
		
		tfIdProd = new JTextField();
		tfIdProd.setEditable(false);
		tfIdProd.setBounds(224, 394, 46, 20);
		getContentPane().add(tfIdProd);
		tfIdProd.setColumns(10);
		
		cmbListasCompra = new JComboBox<modelo.ListaCompra>();
		
		cmbListasCompra.setBounds(429, 56, 258, 22);
		getContentPane().add(cmbListasCompra);
		
		JSeparator separator_1 = new JSeparator();
		separator_1.setOrientation(SwingConstants.VERTICAL);
		separator_1.setBounds(348, 397, 2, 128);
		getContentPane().add(separator_1);
		
		JLabel lblNewlista = new JLabel("Nueva Lista de la Compra:");
		lblNewlista.setFont(new Font("Tahoma", Font.ITALIC, 11));
		lblNewlista.setBounds(429, 368, 131, 14);
		getContentPane().add(lblNewlista);
		
		tfNewListaCompra = new JTextField();
		tfNewListaCompra.setColumns(10);
		tfNewListaCompra.setBounds(429, 394, 258, 20);
		getContentPane().add(tfNewListaCompra);
		
		btnAddNewLista = new JButton("A\u00F1adir Lista");
		
		btnAddNewLista.setIcon(new ImageIcon(ListaCompra.class.getResource("/assets/baseline_add_circle_outline_black_18dp.png")));
		btnAddNewLista.setMargin(new Insets(2, 5, 2, 5));
		btnAddNewLista.setBounds(429, 438, 140, 36);
		getContentPane().add(btnAddNewLista);
		
		btnDelLista = new JButton("Eliminar Lista");
		
		btnDelLista.setIcon(new ImageIcon(ListaCompra.class.getResource("/assets/outline_delete_black_18dp.png")));
		btnDelLista.setMargin(new Insets(2, 10, 2, 10));
		btnDelLista.setBounds(429, 312, 140, 33);
		getContentPane().add(btnDelLista);
		
		
		setVisible(true);
		repaint();
		revalidate();
	}
}
