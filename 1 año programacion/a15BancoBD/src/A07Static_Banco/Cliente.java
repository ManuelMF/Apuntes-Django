package A07Static_Banco;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Cliente implements Serializable  {
//	Propiedades: nombre, dni 
	
//	metodos: metodo constructor cliente que se le pasa el nombre y dni 
//	get nombre y get dni
	
	private static final long serialVersionUID = -1180274887982477582L;

	private String nombre;
	
	private String dni;
	
	private int id;
	
	public Cliente (String nombre, String dni, int id) {
		this.nombre=nombre;
		this.dni=dni;
		
		this.id=id;
	}

	public static Cliente Create(String nom, String dni) {
		
		Conexion.open();
		
		PreparedStatement stm;
		ResultSet res;
		
		String insert="insert into clientes(cli_nombre,cli_dni) values (?,?)";
		
		try {
			
			stm=Conexion.con.prepareStatement(insert,Statement.RETURN_GENERATED_KEYS);
			stm.setString(1, nom);
			stm.setString(2, dni);
			
			stm.executeUpdate();
			
			res=stm.getGeneratedKeys();
			res.next();
			
			Cliente cliente = new Cliente(nom,dni,res.getInt(1));
			System.out.println(res.getInt(1));
			return cliente;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	public static Cliente load(Integer id, String dni) {
		
		PreparedStatement stm;
		ResultSet res;
		
		String select="select * from clientes where 1=1";
		if (id!=null) select+= " and cli_codcli like ?";
		if (dni!=null) select+= " and cli_dni like ?";
		
		Conexion.open();
		
		try {
			stm= Conexion.con.prepareStatement(select);
			if (id!=null) stm.setInt(1, id);
			if (dni!=null) stm.setString(1, dni);
			
			res=stm.executeQuery();
			if (res.next()) {
				return new Cliente(res.getString("Cli_nombre"),res.getString("cli_dni"), res.getInt("cli_codcli"));
			}
				
		}catch (SQLException e) {
			System.out.println("Fallo Buscando cliente");
		}
		
		
		return null;
	}
	
	public void update() {
		
		PreparedStatement stm;
		
		String update="Update clientes set cli_nombre=?, cli_dni=? where cli_codcli=?";
		
		Conexion.open();
		
		try {
			stm= Conexion.con.prepareStatement(update);
			stm.setString(1, this.nombre);
			stm.setString(2, this.dni);
			stm.setInt(3, this.id);
				
		}catch (SQLException e) {
			System.out.println("Fallo Buscando cliente");
		}
		
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDni() {
		return dni;
	}

	public int getId() {
		return id;
	}

}
