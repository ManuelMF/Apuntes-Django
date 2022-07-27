package Controlador;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.math.BigDecimal;
import java.math.RoundingMode;

import javax.swing.JOptionPane;

import Modelo.Producto;

public class Lista {
	Vista.Lista Ventana;
	public Lista() {
		Ventana = new Vista.Lista();
		
		Ventana.btnAñadir.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				anyadirProductoALista();
			}
		});
		
		Ventana.btnDelete.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				delProductoALista();
			}
		});
		
		Ventana.btnVaciar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				vaciarProductoALista();
			}
		});
		
		Ventana.btnAñadir_lista.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				anyadirProducto();
			}
		});
		
		Ventana.btnDelete_lista.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				deleteProducto();
			}
		});
		
		Ventana.btnVaciar_lista.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				vaciarProducto();
			}
		});
		
		Ventana.btnChange.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				change();
			}
		});
	}
	
	public boolean contiene(Producto p, Vista.Lista Ventana) {
		
		for(int x=0; x< Ventana.boxSeleccionados.getItemCount() ; x++) {
			if (p.equals(Ventana.boxSeleccionados.getItemAt(x))) return true;
		}
		
		return false;
	}
	
	private void anyadirProductoALista() {
		Producto p = (Producto) Ventana.BoxListaProductos.getSelectedItem();
		
		if (contiene(p,Ventana)) {
			JOptionPane.showMessageDialog(null, "Producto ya añadido","ERROR",JOptionPane.ERROR_MESSAGE);
		} else {
			Ventana.boxSeleccionados.addItem(p);
			Ventana.boxSeleccionados.setSelectedItem(p);
			calcularTotal();
		}
	}
	
	private void delProductoALista() {
		Producto p = (Producto) Ventana.boxSeleccionados.getSelectedItem();
		Ventana.boxSeleccionados.removeItem(p);
		calcularTotal();
	}
	
	private void vaciarProductoALista() {
		Ventana.boxSeleccionados.removeAllItems();
		calcularTotal();
	}
	
	private void anyadirProducto() {
		
		String nombrep = JOptionPane.showInputDialog ( "Nombre del producto:" );
		String preciop = JOptionPane.showInputDialog ( "Precio del producto:" );
		double precio=Double.parseDouble(preciop);
		Producto p =new Producto(nombrep,precio);
		 
		if (contiene(p,Ventana)) {
			JOptionPane.showMessageDialog(null, "Producto ya añadido","ERROR",JOptionPane.ERROR_MESSAGE);
		} else {
			Ventana.BoxListaProductos.addItem(p);
			Ventana.BoxListaProductos.setSelectedItem(p);
		}
	}

	private void deleteProducto() {
		Producto p = (Producto) Ventana.BoxListaProductos.getSelectedItem();
		Ventana.BoxListaProductos.removeItem(p);
		
	}
	
	private void vaciarProducto() {
		Ventana.BoxListaProductos.removeAllItems();
	}
	
	private void change() {
		if (Ventana.btnVaciar_lista.isVisible()) {
			Ventana.btnVaciar_lista.setVisible(false);
			Ventana.btnDelete_lista.setVisible(false);
			Ventana.btnAñadir_lista.setVisible(false);
			Ventana.lbltextoProductos.setVisible(false);
			Ventana.btnVaciar.setVisible(true);
			Ventana.btnDelete.setVisible(true);
			Ventana.btnAñadir.setVisible(true);
			Ventana.lblTexto.setVisible(true);
		} else {
			Ventana.btnVaciar.setVisible(false);
			Ventana.btnDelete.setVisible(false);
			Ventana.btnAñadir.setVisible(false);
			Ventana.lblTexto.setVisible(false);
			Ventana.btnVaciar_lista.setVisible(true);
			Ventana.btnDelete_lista.setVisible(true);
			Ventana.btnAñadir_lista.setVisible(true);
			Ventana.lbltextoProductos.setVisible(true);
		}
	}
	
	private void calcularTotal() {
		BigDecimal total = new BigDecimal(0);
		for (int x=0 ; x < Ventana.boxSeleccionados.getItemCount() ; x++) {
			Producto p = Ventana.boxSeleccionados.getItemAt(x);
			total= total.add(new BigDecimal(p.precio));
			total = total.setScale(2, RoundingMode.DOWN);
		}
		Ventana.textTotal.setText(total+"€");
	}
}
