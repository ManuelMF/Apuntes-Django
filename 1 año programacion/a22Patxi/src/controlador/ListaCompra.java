package controlador;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.math.BigDecimal;
import java.util.LinkedList;
import java.util.List;

import javax.swing.JOptionPane;

import modelo.Producto;

public class ListaCompra {
	public vista.ListaCompra vCompra;
	public Producto prodsel;
	
	
	public ListaCompra() {
		vCompra=new vista.ListaCompra();
		
		rellenaListaproductos();
		
		vCompra.btnAdd.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				insertarProductoLista();
				calculaTotal();
			}
		});
		
		vCompra.btnDel.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				eliminarProductoLista();
				calculaTotal();
			}
		});
		
		vCompra.btnClear.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				resetLista();
				calculaTotal();
			}
		});
		
		vCompra.btnNewProducto.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				if (!vCompra.tfIdProd.getText().equals("")) {
					modificaProd();
					resetFormProd();
				} else {
					addNewProducto();
				}
				
				rellenaListaproductos();

			}
		});
		
		vCompra.btnDelProducto.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				delProducto();
				rellenaListaproductos();
				rellenarProductodeLista((modelo.ListaCompra) vCompra.cmbListasCompra.getSelectedItem());
			}
		});
		
		vCompra.btnModificarProducto.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
			}
		});
		
		vCompra.btnModificarProducto.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				cargaProducto();
				rellenaListaproductos();
			}
		});
		
		vCompra.btnCancelProd.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				resetFormProd();
				
			}
		});
		
		vCompra.cmbListasCompra.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
		
				rellenarProductodeLista((modelo.ListaCompra) vCompra.cmbListasCompra.getSelectedItem());
			}
		});
		
		vCompra.btnDelLista.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				deleteListaSeleccionada();
				rellenaComboLista();
			}
			
		});
		
		vCompra.btnAddNewLista.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				modelo.ListaCompra lc=anadirListaNueva();
				rellenaComboLista();
				seleccionarListaenCombo(lc.idlista);
				
			}
		});
		
		rellenaComboLista();
		
	}

	private void seleccionarListaenCombo(int id) {
		int total=vCompra.cmbListasCompra.getItemCount();
		for (int x=0; x<total; x++) {
			if (((modelo.ListaCompra)vCompra.cmbListasCompra.getItemAt(x)).idlista==id) {
				vCompra.cmbListasCompra.setSelectedIndex(x);
				break;
			}
		}
	}
	
	private modelo.ListaCompra anadirListaNueva() {
		String n=vCompra.tfNewListaCompra.getText();
		if (n.isEmpty()) {
			JOptionPane.showMessageDialog(null, "Falta el Nombre de la Lista!!!", "Error Creando Lista",JOptionPane.ERROR_MESSAGE);
		} else {
			return modelo.ListaCompra.Create(n);
		}
		return null;
	}
	
	private void deleteListaSeleccionada() {
		int valor=JOptionPane.showConfirmDialog(null, "Estás Seguro??", "CONFIRMACIÓN", JOptionPane.YES_NO_OPTION);
		if (valor==JOptionPane.YES_OPTION) {
			modelo.ListaCompra lc=(modelo.ListaCompra)vCompra.cmbListasCompra.getSelectedItem();
			lc.delete();
			
		}
	}
	
	private void rellenaComboLista() {
		vCompra.cmbListasCompra.removeAllItems();
		LinkedList<modelo.ListaCompra> lc=modelo.ListaCompra.find();
		
		for (modelo.ListaCompra l:lc) {
			vCompra.cmbListasCompra.addItem(l);
		}
		
		vCompra.repaint();
		vCompra.revalidate();
	}
	
	private void modificaProd() {
		prodsel.nombre=vCompra.tfNewNombre.getText();
		prodsel.precio=new BigDecimal((double) vCompra.spNewprecio.getValue());
		
		
		prodsel.update();
		
	}
	
	
	private void resetFormProd() {
		vCompra.tfIdProd.setText("");
		vCompra.tfNewNombre.setText("");
		vCompra.spNewprecio.setValue(0);
		this.prodsel=null;
	}

	private void cargaProducto() {
		int total=vCompra.listProductos.getSelectedValuesList().size();
		if (total==0) {
			JOptionPane.showMessageDialog(null, "Has de Seleccionar un Producto!!", "Error Cargando Producto",JOptionPane.ERROR_MESSAGE);
		} else {
			Producto p=vCompra.listProductos.getSelectedValuesList().get(0);
			vCompra.tfIdProd.setText(p.idProducto+"");
			vCompra.tfNewNombre.setText(p.nombre);
			vCompra.spNewprecio.setValue(p.precio.doubleValue());
			prodsel=p;
		}
	}
	
	private void delProducto() {
		int total=vCompra.listProductos.getSelectedValuesList().size();
		int valor=JOptionPane.showConfirmDialog(null, "Se van a Eliminar "+total+" Productos\nEstás Seguro??", "CONFIRMACIÓN", JOptionPane.YES_NO_OPTION);
		if (valor==JOptionPane.YES_OPTION) {
			List<Producto> listap=vCompra.listProductos.getSelectedValuesList();
			
			for (Producto p:listap) {
				p.delete();
			}
			
		}
	}
	
	private void addNewProducto() {
		Producto p=Producto.create(vCompra.tfNewNombre.getText(), new BigDecimal((double) vCompra.spNewprecio.getValue()));
		
		if (p==null) {
			JOptionPane.showMessageDialog(null, "Producto Duplicado", "Error Añadiendo Producto",JOptionPane.ERROR_MESSAGE);
		}
	}
	
	private void calculaTotal() {
		
		BigDecimal total=new BigDecimal(0);
		
		for (int x=0; x<vCompra.modeloListaCompra.getSize(); x++) {
			Producto p=vCompra.modeloListaCompra.get(x);
			total=total.add(p.precio);
		}
		
		vCompra.tfTotal.setText(total.toPlainString()+" €");
	}
	
	private void resetLista() {
		vCompra.modeloListaCompra.removeAllElements();
		 
		vCompra.repaint();
		vCompra.revalidate();
	}
	
	
	
	private void rellenaListaproductos() {

		vCompra.modeloListaProductos.removeAllElements();
		
		LinkedList<Producto> lista=Producto.find();
		
		for (Producto p:lista) {
			vCompra.modeloListaProductos.addElement(p);
		}
		
		vCompra.repaint();

		
	}
	
	private void eliminarProductoLista() {
		List<Producto> listap=vCompra.listCompra.getSelectedValuesList();
		
		for (Producto p:listap) {
			((modelo.ListaCompra) vCompra.cmbListasCompra.getSelectedItem()).delProduct(p);
		}
		
		rellenarProductodeLista((modelo.ListaCompra) vCompra.cmbListasCompra.getSelectedItem());

		
	}
	
	
	private void insertarProductoLista() {
		List<Producto> listap=vCompra.listProductos.getSelectedValuesList();
		
		for (Producto p:listap) {
			
			((modelo.ListaCompra) vCompra.cmbListasCompra.getSelectedItem()).insertProduct(p);

		}
		
		
		rellenarProductodeLista((modelo.ListaCompra) vCompra.cmbListasCompra.getSelectedItem());
	}
	
	private void rellenarProductodeLista(modelo.ListaCompra lc) {
		
		vCompra.modeloListaCompra.removeAllElements();
		if (lc!=null) {
			
			
			lc=modelo.ListaCompra.load(lc.idlista);
			
			for (Producto p:lc.listaproductos) {
				vCompra.modeloListaCompra.addElement(p);
			}
			calculaTotal();
			
			vCompra.repaint();
			vCompra.revalidate();
		}
		
	}
	


}
