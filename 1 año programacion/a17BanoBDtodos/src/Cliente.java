import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

public class Cliente implements Serializable  {

	private static final long serialVersionUID = -4682795037634436687L;
	private String nombre;
	private String dni;
	private int id;
	
	
	private Cliente(String n, String d, int i) {
		this.id=i;
		this.nombre=n;
		this.dni=d;
	}
	
	public static Cliente create(String n, String d) {
		
		//insert
		
		PreparedStatement stm;
		ResultSet res;
		
		String insert="insert into clientes (nombre, dni) values (?, ?) ";
		
		Conexion.open();
		
		try {
			stm=Conexion.con.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
			stm.setString(1, n);
			stm.setString(2, d);
			
			stm.executeUpdate();
			res=stm.getGeneratedKeys();
			
			res.next();
			
			Cliente c=new Cliente(n, d, res.getInt(1));
			
			return c;
			
			
		} catch (SQLException e) {
			
		}
		
		return null;
		
	}
	
	public static LinkedList<Cliente> find(String dni ){
		
		//Select 
		
		LinkedList<Cliente> lista=new LinkedList<Cliente>();
		PreparedStatement stm;
		ResultSet res;
		
		String consulta="Select * from clientes where dni=? ";
		
		Conexion.open();
		try {
			stm=Conexion.con.prepareStatement(consulta);
			stm.setString(1, dni);
			res=stm.executeQuery();
			
			
			while (res.next()) {
				Cliente c=new Cliente(res.getString("nombre"), res.getString("dni"), res.getInt("id"));
				lista.add(c);
			}
			
		} catch (SQLException e) {
			
		}
		
		return lista;
		
	}
	
	public static Cliente load(int i){
		
		//Select 
		
		PreparedStatement stm;
		ResultSet res;
		
		String consulta="Select * from clientes where id=?";
		
		Conexion.open();
		try {
			stm=Conexion.con.prepareStatement(consulta);
			stm.setInt(1, i);
			res=stm.executeQuery();
			
			if (res.next()) {
				Cliente c=new Cliente(	res.getString("nombre"),
										res.getString("dni"),
										res.getInt("id"));
				return c;
			}
			
			
			
		} catch (SQLException e) {
			
		}
		
		return null;
		
	}

	public void update() {
		PreparedStatement stm;
		
		String update="Update clientes set nombre=?, dni=? where id=?";
		
		Conexion.open();
		try {
			stm=Conexion.con.prepareStatement(update);
			stm.setString(1, this.nombre);
			stm.setString(2, this.dni);
			stm.setInt(3, this.id);
			
			stm.executeUpdate();
			
		} catch (SQLException e) {
			
		}
	}

	public String getNombre() {
		return this.nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getDni() {
		return this.dni;
	}
	
	public int getId() {
		return this.id;
	}

	
	
	
}
