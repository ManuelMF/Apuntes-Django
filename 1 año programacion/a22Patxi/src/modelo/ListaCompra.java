package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

public class ListaCompra {
	
	public int idlista;
	public String nombre;
	public LinkedList<Producto> listaproductos;
	
	private ListaCompra(int i, String n, LinkedList<Producto> l) {
		this.idlista=i;
		this.nombre=n;
		this.listaproductos=l;
	}
	
	public static ListaCompra load(int i) {
		
		
		PreparedStatement stm;
		ResultSet res;
		
		String consulta="Select * from listascompra left join lineascompra using (idLista) where listascompra.idlista=?";
		
		Conexion.open();
		try {
			stm=Conexion.con.prepareStatement(consulta);
			stm.setInt(1, i);
			res=stm.executeQuery();
			
			int id=0;
			String n="";
			LinkedList<Producto> lp=new LinkedList<Producto>();
			
			while (res.next()) {
				id=res.getInt("idLista");
				n=res.getString("nombre");
				Producto p=Producto.load(res.getInt("idProducto"));
				if (p!=null) lp.add(Producto.load(res.getInt("idProducto")));
			}
			
			if (id!=0) {
				ListaCompra l=new ListaCompra(id, n, lp);
				return l;
			}
			
		} catch (SQLException e) {
			
		}
		return null;
	}
	
	public static LinkedList<ListaCompra> find(){
		PreparedStatement stm;
		ResultSet res;
		
		LinkedList<ListaCompra> lc=new LinkedList<ListaCompra>();
		
		String consulta="Select * from listascompra order by nombre";
		
		Conexion.open();
		
		try {
			stm=Conexion.con.prepareStatement(consulta);
			res=stm.executeQuery();
			
			while (res.next()) {
				lc.add(ListaCompra.load(res.getInt("idLista")));
			}

		} catch (SQLException e) {
			
		}
		
		return lc;
		
	}
	
	public void insertProduct(Producto p) {
		PreparedStatement stm;
		
		String insert="insert into lineascompra (idlista, idproducto) values (?, ?) ";
		
		Conexion.open();
		
		try {
			stm=Conexion.con.prepareStatement(insert);
			stm.setInt(1, this.idlista);
			stm.setInt(2, p.idProducto);
			
			stm.executeUpdate();
			
		} catch (SQLException e) {
			
		}

		
	}
	
	public void delProduct(Producto p) {
		PreparedStatement stm;

		
		String delete="delete from lineascompra where idLista=? and idProducto=? ";
		
		Conexion.open();
		
		try {
			stm=Conexion.con.prepareStatement(delete);
			stm.setInt(1, this.idlista);
			stm.setInt(2, p.idProducto);
			
			stm.executeUpdate();
			
		} catch (SQLException e) {
			
		}

		
	}
	
	public void update() {
		
	}
	
	public void delete() {
		PreparedStatement stm;
		
		String delete="delete from listascompra where idlista=?";
		
		Conexion.open();
		try {
			stm=Conexion.con.prepareStatement(delete);
			stm.setInt(1, this.idlista);
			
			stm.executeUpdate();
		} catch (SQLException e) {
			
		}
	}
	
	public static ListaCompra Create(String n) {
	
		PreparedStatement stm;
		ResultSet res;
		
		String insert="insert into listascompra (nombre) values (?) ";
		
		Conexion.open();
		
		try {
			stm=Conexion.con.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
			stm.setString(1, n);
			stm.executeUpdate();
			
			res=stm.getGeneratedKeys();
			
			if (res.next()) {
				ListaCompra lc=ListaCompra.load(res.getInt(1));
				return lc;
			}
			
			
		} catch (SQLException e) {
			
		}
		return null;
	}
	
	public String toString() {
		return this.nombre;
	}
	

}
