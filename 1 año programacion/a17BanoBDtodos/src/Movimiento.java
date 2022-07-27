import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

public class Movimiento implements Serializable {
	
	private static final long serialVersionUID = -5234166278881396623L;
	private int id;
	private int idCuenta;
	private Fecha fecha;
	private BigDecimal importe;
	private BigDecimal saldoAnterior;
	private BigDecimal saldoActual;
	private String concepto;
	
	private Movimiento(int id, int idc, Fecha f, BigDecimal i, BigDecimal sant, BigDecimal sact, String c) {
		this.id=id;
		this.idCuenta=idc;
		this.fecha=f;
		this.importe=i;
		this.saldoAnterior=sant;
		this.saldoActual=sant.add(i);
		this.concepto=c;
	}
	
	public static LinkedList<Movimiento> find (Integer idc, Fecha desde, Fecha hasta){
		
		LinkedList<Movimiento> lista=new LinkedList<Movimiento>();
		
		PreparedStatement stm;
		ResultSet res;
		
		String consulta="Select * from movimientos where 1=1 ";
		if (idc!=null) consulta+=" and idCuenta = ? ";
		if (desde!=null) consulta+=" and fecha>= ? ";
		if (hasta!=null) consulta+=" and fecha<= ? ";
		consulta+=" orer by fecha desc";
		
		Conexion.open();
		try {
			stm=Conexion.con.prepareStatement(consulta);
			int x=1;
			if (idc!=null) stm.setInt(x++, idc);
			if (desde!=null) stm.setDate(x++, desde.getDateMysql());
			if (hasta!=null) stm.setDate(x++, hasta.getDateMysql());
			
			res=stm.executeQuery();
			
			while (res.next()) {
				lista.add(	new Movimiento(res.getInt("id"), 
							res.getInt("idCuenta"), 
							new Fecha(res.getTimestamp("fecha")), 
							res.getBigDecimal("importe"), 
							res.getBigDecimal("saldoAnt"), 
							res.getBigDecimal("saldoAct"), 
							res.getString("concepto")));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return lista;
		
	}
	
	public static Movimiento create(int idc, BigDecimal i, BigDecimal sant, String c) {
		
		Conexion.open();
		
		PreparedStatement stm;
		ResultSet res;
		
		String insert="insert into movimientos (idCuenta, fecha, importe, saldoAnt, saldoAct, concepto) values (?,NOW(), ?,?,?,?)";
		
		
		try {
			stm=Conexion.con.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
			stm.setInt(1, idc);
			stm.setBigDecimal(2, i);
			stm.setBigDecimal(3, sant);
			stm.setBigDecimal(4, sant.add(i));
			stm.setString(5,c);
			
			stm.executeUpdate();
			
			res=stm.getGeneratedKeys();
			res.next();
			

			return load(res.getInt(1));
			
		} catch (SQLException e) {
			System.out.println("Error insertando Producto!!");
		}
		
		return null;
		
	}
	
	public static Movimiento load(int i) {
		PreparedStatement stm;
		ResultSet res;
		
		String consulta="Select * from movimientos where id=?";
		
		Conexion.open();
		try {
			stm=Conexion.con.prepareStatement(consulta);
			stm.setInt(1, i);
			
			res=stm.executeQuery();
			
			if (res.next()) {
				return new Movimiento(i, res.getInt("idCuenta"), new Fecha(res.getTimestamp("fecha")), res.getBigDecimal("importe"), res.getBigDecimal("saldoAnt"), res.getBigDecimal("saldoAct"), res.getString("concepto") );
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public Fecha getFecha() {
		return this.fecha;
	}

	public BigDecimal getImporte() {
		return this.importe;
	}

	public BigDecimal getSaldoActual() {
		return this.saldoActual;
	}

	public BigDecimal getSaldoAnterior() {
		return this.saldoAnterior;
	}

	public String getConcepto() {
		return this.concepto;
	}

	public int getIdCuenta() {
		return idCuenta;
	}

	public int getId() {
		return id;
	}
	
}
