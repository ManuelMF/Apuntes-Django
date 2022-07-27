package Vista;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.Date;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;

import Modelo.Usuario;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.RootPaneContainer;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.SystemColor;

public class AppUser extends JFrame {

	private static final long serialVersionUID = 1L;
	
	FondoPanel fondo = new FondoPanel();
	
	public JButton btnInicio;

	public JScrollPane scrollPaneMenu;
	
	public JScrollPane scrollPaneBuscador;

	public JPanel panelTabla;

	public JButton btnBuscar;

	public JButton btnBiblioteca;

	public JButton btnCrearPlaylist;

	public JButton btnMisPlaylist;

	public JButton btnMeGusta;

	public JPanel panelBuscador;
	private JPanel panel;
	private JLabel lblBuscador;
	private JTextField textField;

	public JLabel lblBiblioteca;

	public Modelo.Tabla mitabla;
	public AppUser() {
		super();
		this.setContentPane(fondo);
		this.setIconImage(Toolkit.getDefaultToolkit().getImage(AppUser.class.getResource("/Resources/logo.png")));
		this.setBounds(500, 300, 1046, 645);
		this.setLocationRelativeTo(null);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setResizable(false);
		this.setTitle("Top Music");
		this.getContentPane().setLayout(null);
		
		btnInicio = new JButton("Inicio");
		btnInicio.setFont(new Font("Yu Gothic UI Semibold", Font.PLAIN, 16));
		btnInicio.setForeground(Color.WHITE);
		btnInicio.setBounds(23, 38, 115, 23);
		fondo.add(btnInicio);
		btnInicio.setIcon(new ImageIcon(AppUser.class.getResource("/Resources/icons8-casa-24 (1).png")));
		btnInicio.setOpaque(false);
		btnInicio.setContentAreaFilled(false);
		btnInicio.setBorderPainted(false);
		
		btnBuscar = new JButton("Buscar");
		btnBuscar.setIcon(new ImageIcon(AppUser.class.getResource("/Resources/icons8-b\u00FAsqueda-24.png")));
		btnBuscar.setOpaque(false);
		btnBuscar.setForeground(Color.WHITE);
		btnBuscar.setFont(new Font("Yu Gothic UI Semibold", Font.PLAIN, 16));
		btnBuscar.setContentAreaFilled(false);
		btnBuscar.setBorderPainted(false);
		btnBuscar.setBounds(23, 72, 115, 30);
		fondo.add(btnBuscar);
		
		btnBiblioteca = new JButton("Biblioteca");
		btnBiblioteca.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		btnBiblioteca.setIcon(new ImageIcon(AppUser.class.getResource("/Resources/icons8-estante-de-libro-24.png")));
		btnBiblioteca.setOpaque(false);
		btnBiblioteca.setForeground(Color.WHITE);
		btnBiblioteca.setFont(new Font("Yu Gothic UI Semibold", Font.PLAIN, 16));
		btnBiblioteca.setContentAreaFilled(false);
		btnBiblioteca.setBorderPainted(false);
		btnBiblioteca.setBounds(23, 113, 143, 30);
		fondo.add(btnBiblioteca);
		
		btnCrearPlaylist = new JButton("Crear playlist");
		btnCrearPlaylist.setIcon(new ImageIcon(AppUser.class.getResource("/Resources/icons8-a\u00F1adir-24.png")));
		btnCrearPlaylist.setOpaque(false);
		btnCrearPlaylist.setForeground(Color.WHITE);
		btnCrearPlaylist.setFont(new Font("Yu Gothic UI Semibold", Font.PLAIN, 16));
		btnCrearPlaylist.setContentAreaFilled(false);
		btnCrearPlaylist.setBorderPainted(false);
		btnCrearPlaylist.setBounds(23, 182, 162, 30);
		fondo.add(btnCrearPlaylist);
		
		btnMisPlaylist = new JButton("Mis playlist");
		btnMisPlaylist.setIcon(new ImageIcon(AppUser.class.getResource("/Resources/icons8-libros-24.png")));
		btnMisPlaylist.setOpaque(false);
		btnMisPlaylist.setForeground(Color.WHITE);
		btnMisPlaylist.setFont(new Font("Yu Gothic UI Semibold", Font.PLAIN, 16));
		btnMisPlaylist.setContentAreaFilled(false);
		btnMisPlaylist.setBorderPainted(false);
		btnMisPlaylist.setBounds(23, 223, 152, 30);
		fondo.add(btnMisPlaylist);
		
		btnMeGusta = new JButton("Me gusta");
		btnMeGusta.setIcon(new ImageIcon(AppUser.class.getResource("/Resources/icons8-me-gusta-24.png")));
		btnMeGusta.setOpaque(false);
		btnMeGusta.setForeground(Color.WHITE);
		btnMeGusta.setFont(new Font("Yu Gothic UI Semibold", Font.PLAIN, 16));
		btnMeGusta.setContentAreaFilled(false);
		btnMeGusta.setBorderPainted(false);
		btnMeGusta.setBounds(23, 264, 143, 30);
		fondo.add(btnMeGusta);
		
		// PRIMER PRINCIPAL
		
		panelTabla = new JPanel();
		panelTabla.setBounds(195, 0, 835, 606);
		fondo.add(panelTabla);
		panelTabla.setLayout(new BorderLayout(0, 0));
		
		
		JPanel panel_titulo = new JPanel();
		panelTabla.add(panel_titulo, BorderLayout.NORTH);
		
		lblBiblioteca = new JLabel("Biblioteca\r\n");
		lblBiblioteca.setFont(new Font("Yu Gothic UI Semibold", Font.BOLD, 17));
		panel_titulo.add(lblBiblioteca);
		
		JPanel panel_TablaTabla = new JPanel();
		panelTabla.add(panel_TablaTabla, BorderLayout.CENTER);
		
		scrollPaneMenu = new JScrollPane();
        Object[] cabecera= {"Nombre","Duracion","Fecha","Url"};
        Class<?>[] clases= {String.class,String.class, Date.class,String.class};
        Integer[] medidas= {100, 5, 5};
        mitabla = new Modelo.Tabla(cabecera, clases, medidas, null,null,null);
        scrollPaneMenu.setViewportView(mitabla.tabla);
        panelTabla.add(scrollPaneMenu);
       // mitabla.alinear('l', 0);
//        for (int i = 0; i < 100; i++) {
//            Object[] datos = { 23, "Manolo", new Date() };
//            mitabla.modelo.addRow(datos);
//        }
        mitabla.tabla.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                if (e.getClickCount()==2 && e.getButton()==1) {
                    System.out.println(mitabla.getValueSelected(0));

                }
            }
        });
		
        
        // PANEL BUSCADOR
        panelBuscador = new JPanel();
        panelBuscador.setForeground(new Color(0, 0, 0));
        panelBuscador.setBackground(new Color(0, 0, 0));
		panelBuscador.setBounds(195, 0, 835, 606);
		fondo.add(panelBuscador);
		panelBuscador.setLayout(null);
		
		panel = new JPanel();
		panel.setBounds(0, 108, 835, 498);
		panelBuscador.add(panel);
		panel.setLayout(new BorderLayout(0, 0));
		panelBuscador.setVisible(false);
        
		scrollPaneBuscador = new JScrollPane();
        Object[] cabecera1= {"id","Nombre","Fecha"};
        Class<?>[] clases1= {Integer.class, String.class, Date.class};
        Integer[] medidas1= {100, 200, 150};
        Modelo.Tabla mitabla1=new Modelo.Tabla(cabecera1, clases1, medidas1, null,null,null);
        scrollPaneBuscador.setViewportView(mitabla1.tabla);
        panel.add(scrollPaneBuscador);
        
        lblBuscador = new JLabel("");
        lblBuscador.setIcon(new ImageIcon(AppUser.class.getResource("/Resources/icons8-b\u00FAsqueda-30.png")));
        lblBuscador.setForeground(Color.WHITE);
        lblBuscador.setFont(new Font("Yu Gothic UI Semibold", Font.PLAIN, 20));
        lblBuscador.setBounds(36, 38, 124, 30);
        panelBuscador.add(lblBuscador);
        
        textField = new JTextField();
        textField.setFont(new Font("Yu Gothic UI Semibold", Font.PLAIN, 20));
        textField.setBounds(80, 34, 702, 39);
        panelBuscador.add(textField);
        textField.setColumns(10);
       // mitabla.alinear('l', 0);
//        for (int i = 0; i < 100; i++) {
//            Object[] datos = { 23, "Manolo", new Date() };
//            mitabla1.modelo.addRow(datos);
//        }
        mitabla1.tabla.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                if (e.getClickCount()==2 && e.getButton()==1) {
                    System.out.println(mitabla1.getValueSelected(0));

                }
            }
        });
        
        
		this.repaint();
		this.revalidate();
		this.setVisible(true);
	}
}
