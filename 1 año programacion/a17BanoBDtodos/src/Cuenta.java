import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import excepciones.SaldoInsuficiente;

public class Cuenta implements Serializable, Comparable<Cuenta>{

	private static final long serialVersionUID = 282521331644874853L;
	private int id;
	private int idBanco;
	private BigDecimal saldo;
	private int idCliente;
	private BigDecimal descubierto;
	
	private Cuenta(int i, int idb, int idc, BigDecimal des, BigDecimal saldo ) {
		this.id=i;
		this.saldo=new BigDecimal(0);
		this.idBanco=idb;
		this.idCliente=idc;
		this.descubierto=des;
		this.saldo=saldo;
	}

	public static Cuenta load(int i){
		
		//Select 
		
		PreparedStatement stm;
		ResultSet res;
		
		String consulta="Select * from cuentas where id=?";
		
		Conexion.open();
		try {
			stm=Conexion.con.prepareStatement(consulta);
			stm.setInt(1, i);
			res=stm.executeQuery();
			
			if (res.next()) {
				Cuenta cu=new Cuenta(res.getInt("id"), 
									res.getInt("idbanco"), 
									res.getInt("idCliente"), 
									res.getBigDecimal("descubierto"), 
									res.getBigDecimal("saldo"));
				return cu;
			}
			
		} catch (SQLException e) {
			
		}
		
		return null;
		
	}
	
	public static LinkedList<Cuenta> find(Integer idb, Integer idc ){
		
		//Select 
		
		LinkedList<Cuenta> lista=new LinkedList<Cuenta>();
		PreparedStatement stm;
		ResultSet res;
		
		String consulta="Select * from cuentas where 1=1 ";
		if (idb!=null) consulta+=" and idBanco=? ";
		if (idc!=null) consulta+=" and idCliente=? ";
		
		Conexion.open();
		try {
			stm=Conexion.con.prepareStatement(consulta);
			int x=1;
			if (idb!=null) stm.setInt(x++, idb);
			if (idc!=null) stm.setInt(x++, idc);
			res=stm.executeQuery();
			
			
			while (res.next()) {
				Cuenta cu=new Cuenta(res.getInt("id"), 
									res.getInt("idbanco"), 
									res.getInt("idCliente"), 
									res.getBigDecimal("descubierto"), 
									res.getBigDecimal("saldo"));
				lista.add(cu);
			}
			
		} catch (SQLException e) {
			
		}
		
		return lista;
		
	}
	
	public static Cuenta create(Cliente c, BigDecimal des, int idb) {
		PreparedStatement stm;
		ResultSet res;
		
		String insert="insert into cuentas (idCliente, saldo, descubierto, idBanco) values (?, ?, ?, ?) ";
		
		Conexion.open();
		
		try {
			stm=Conexion.con.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
			stm.setInt(1, c.getId());
			stm.setBigDecimal(2, new BigDecimal(0));
			stm.setBigDecimal(3, des);
			stm.setInt(4, idb);
			
			stm.executeUpdate();
			res=stm.getGeneratedKeys();
			
			res.next();
			
			Cuenta cu=new Cuenta(res.getInt(1), idb, c.getId(), des, new BigDecimal(0) );
			
			return cu;
			
			
		} catch (SQLException e) {
			
		}
		
		return null;
	}
	
	public void remove() {
		PreparedStatement stm;
		
		String delete="delete from cuentas where id=?";
		
		Conexion.open();
		try {
			stm=Conexion.con.prepareStatement(delete);
			stm.setInt(1, this.id);
			
			stm.executeUpdate();
		} catch (SQLException e) {
			
		}
	}
	public BigDecimal ingresar(BigDecimal importe, String c) {
		
		//Movimiento m=new Movimiento(importe, this.saldo, c);
		//this.movimientos.add(m);
		
		Movimiento.create(this.id, importe, this.saldo, c);
		
		this.saldo=this.saldo.add(importe);
		this.update();
		
		return this.saldo;
	}
	
	public void update() {
		PreparedStatement stm;
		
		String update="Update cuentas set saldo=?, descubierto=? where id=?";
		
		Conexion.open();
		try {
			stm=Conexion.con.prepareStatement(update);
			stm.setBigDecimal(1, this.saldo);
			stm.setBigDecimal(2, this.descubierto);
			stm.setInt(3, this.id);
			
			stm.executeUpdate();
			
		} catch (SQLException e) {
			
		}
	}
	
	public BigDecimal retirar(BigDecimal importe) {
		
		if (this.saldo.add(this.descubierto).compareTo(importe)==-1) {
			throw new SaldoInsuficiente("Saldo actual: "+this.saldo+" y quieres sacar: "+importe);
		}
		
		Movimiento.create(this.id, importe.negate(), this.saldo, "Retirada en Efectivo");
		
		this.saldo=this.saldo.subtract(importe);
		this.update();
		
		return this.saldo;
		
	}
	
	public LinkedList<Movimiento> buscarMovimientos(Fecha fechaIni, Fecha fechaFin){
		
		LinkedList<Movimiento> lista=Movimiento.find(this.id, fechaIni, fechaFin);
		
		return lista;
	}
	
	public BigDecimal getSaldo() {
		return this.saldo;
	}
	
	public BigDecimal getDescubierto() {
		return this.descubierto;
	}

	@Override
	public int compareTo(Cuenta o) {
		return this.saldo.compareTo(o.saldo);
	}

	public int getId() {
		return id;
	}

	public int getIdBanco() {
		return idBanco;
	}

	public int getIdCliente() {
		return idCliente;
	}
	
}

