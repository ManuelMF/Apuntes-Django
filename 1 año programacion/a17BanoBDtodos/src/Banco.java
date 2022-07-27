import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Banco implements Serializable {

	private static final long serialVersionUID = 885932334226302916L;
	private String nombre;
	private int id;
	

	
	private Banco(String n, int i) {
		this.nombre=n;
		this.id=i;
		
	}
	
	public static Banco load(int i) {
		PreparedStatement stm;
		ResultSet res;
		
		String consulta="Select * from bancos where id=?";
		
		Conexion.open();
		try {
			stm=Conexion.con.prepareStatement(consulta);
			stm.setInt(1, i);
			res=stm.executeQuery();
			
			if (res.next()) {
				Banco b=new Banco(	res.getString("nombre"),
										res.getInt("id"));
				return b;
			}
			
			
			
		} catch (SQLException e) {
			
		}
		
		return null;
	}
	
	public Cuenta abrirCuenta(Cliente c, BigDecimal des) {
		Cuenta nc=Cuenta.create(c,des, this.id);		
		return nc;
		
	}
	
	public void eliminarCuenta(Cuenta c) {
		c.remove();;
		
	}
	
	public Cuenta buscarCuenta(int n) {
		
		Cuenta c=Cuenta.load(n);
		return c;
	}

	public BigDecimal dameLaPasta() {
		
		PreparedStatement stm;
		ResultSet res;
		
		String consulta="Select sum(saldo) total from cuentas where idBanco=?";
		
		Conexion.open();
		try {
			stm=Conexion.con.prepareStatement(consulta);
			stm.setInt(1, this.id);
			res=stm.executeQuery();
			
			if (res.next() && res.getBigDecimal("total")!=null) {
				return res.getBigDecimal("total");
			}
			
			
			
		} catch (SQLException e) {
			
		}
		
		return new BigDecimal(0);
		
	}

	public String getNombre() {
		return this.nombre;
	}
	
	public int getId() {
		return this.id;
	}
	
}
