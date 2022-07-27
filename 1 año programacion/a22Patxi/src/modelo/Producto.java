package modelo;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Collections;
import java.util.LinkedList;

public class Producto implements Comparable<Producto> {
	public String nombre;
	public BigDecimal precio;
	public int idProducto;
	
	private Producto(int id, String n, BigDecimal p) {
		this.idProducto=id;
		this.nombre=n;
		this.precio=p;
	}
	
	
	public void update() {
		PreparedStatement stm;
		
		String update="Update productos set producto=?, precio=? where idProducto=?";
		
		Conexion.open();
		try {
			stm=Conexion.con.prepareStatement(update);
			stm.setString(1, this.nombre);
			stm.setBigDecimal(2, this.precio);
			stm.setInt(3, this.idProducto);
			
			stm.executeUpdate();
			
		} catch (SQLException e) {
			
		}
	}
	
	
	public void delete() {
		PreparedStatement stm;
		
		String delete="delete from productos where idProducto=?";
		
		Conexion.open();
		try {
			stm=Conexion.con.prepareStatement(delete);
			stm.setInt(1, this.idProducto);
			
			stm.executeUpdate();
		} catch (SQLException e) {
			
		}
	}
	
	public static Producto create(String n, BigDecimal p) {
		
		//insert
		
		PreparedStatement stm;
		ResultSet res;
		
		String insert="insert into productos (producto, precio) values (?, ?) ";
		
		Conexion.open();
		
		try {
			stm=Conexion.con.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
			stm.setString(1, n);
			stm.setBigDecimal(2, p);
			
			stm.executeUpdate();
			res=stm.getGeneratedKeys();
			
			res.next();
			
			Producto pro=new Producto(res.getInt(1), n, p);
			
			return pro;
			
			
		} catch (SQLException e) {
			
		}
		
		return null;
		
	}
	
	
	public static LinkedList<Producto> find(){
		LinkedList<Producto> lista=new LinkedList<Producto>();
		
		PreparedStatement stm;
		ResultSet res;
		
		String consulta="Select * from productos";
		
		Conexion.open();
		try {
			stm=Conexion.con.prepareStatement(consulta);
			res=stm.executeQuery();
			
			
			while (res.next()) {
				Producto p=new Producto(res.getInt("idProducto"), res.getString("producto"), res.getBigDecimal("precio"));
				lista.add(p);
			}
			
		} catch (SQLException e) {
			
		}
		
		
		Collections.sort(lista);
		return lista;

	}
	
	public static Producto load(int i){
		
		PreparedStatement stm;
		ResultSet res;
		
		String consulta="Select * from productos where idproducto=?";
		
		Conexion.open();
		try {
			stm=Conexion.con.prepareStatement(consulta);
			stm.setInt(1, i);
			res=stm.executeQuery();
			
			
			if (res.next()) {
				Producto p=new Producto(res.getInt("idProducto"), res.getString("producto"), res.getBigDecimal("precio"));
				return p;
			}
			
		} catch (SQLException e) {
			
		}
		
		return null;

	}
	
	public String toString() {
		return this.nombre+" ("+this.precio+" €)";
	}

	@Override
	public int compareTo(Producto o) {
		
		return this.nombre.compareToIgnoreCase(o.nombre);
	}
	

}
