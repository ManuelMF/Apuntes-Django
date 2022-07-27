package A07Static_Banco;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.LinkedList;


public class Movimiento implements Serializable, Comparable<Movimiento>  {
//	Propiedades Fecha,concepto, importe puede ser positivo o negativo asi sabremos si en un ingreso o retirada,el saldo anterior
	
//	Metodos:
//	constuctor que se pasara el concepto , el importe que será BigDecimal y el saldo que sera BigDecimal
//	mas getters de fecha concepto importe y saldo anterior
	
	
	//private SimpleDateFormat formato = new SimpleDateFormat("dd/MM/YYYY HH:mm");
	
	private static final long serialVersionUID = -4579715984792543481L;

	private String concepto;
	
	private BigDecimal importe;
	
	private BigDecimal saldoActual;
	
	private BigDecimal saldoAnterior;
	
	private Fecha fecha;
	
	private int id;
	
	private Movimiento (String concepto, BigDecimal importe, BigDecimal saldoAnterior, int id) {
		
		this.concepto = concepto;
		this.importe = importe;
		this.saldoAnterior = saldoAnterior;
		this.saldoActual=saldoAnterior.add(importe);
		
//		this.fecha = formato.format(new Date());
		this.fecha = new Fecha();
		this.id=id;
	}

	public static Movimiento Create (String concepto, BigDecimal importe, BigDecimal saldoAnterior,int idcli, int numCuenta) {
		
		Conexion.open();
		
		PreparedStatement stm;
		
		ResultSet res;
		
		String insert = "insert into movimientos(mov_fecha,mov_concepto,mov_importe,mov_sladoAnterior,mov_saldoActual,mov_codcli) value (?,?,?,?,?,?)";
		
		try {
			stm = Conexion.con.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
			
			Date d = new Date();
			java.sql.Date date2 = new java.sql.Date(d.getTime());
			stm.setDate(1, date2 );
			stm.setString(2, concepto);
			stm.setBigDecimal(3, importe);
			stm.setBigDecimal(4, saldoAnterior);
			BigDecimal act = saldoAnterior.add(importe); 
			stm.setBigDecimal(5, act);
			stm.setInt(6, idcli);
			
			stm.executeUpdate();
			res=stm.getGeneratedKeys();
			res.next();
			
			Movimiento mov = new Movimiento(concepto, importe, saldoAnterior,res.getInt(1));
			
			stm=null;
			String Update = "update cuentas set cue_saldo=? where cue_codcue=?";
			try {
				stm = Conexion.con.prepareStatement(Update);
				System.out.println(act);
				stm.setBigDecimal(1, act);
				
				stm.setInt(2, numCuenta);
				stm.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("Fallo actualizando el saldo en la Base de Datos");
				e.printStackTrace();
			}
			
			return mov;
			
		} catch (SQLException e) {
			System.out.println("Fallo añadiendo un movimiento a la Base de Datos");
		}
		
		
		
		
		
		return null;
	}
	
	public static LinkedList<Movimiento> find(Integer id, Date FechaIni, Date FechaFin ) {
		
		LinkedList<Movimiento> lista = new LinkedList<Movimiento>();
		Conexion.open();
		
		PreparedStatement stm;
		ResultSet res;
		
		String consulta = "Select * from movimientos where 1=1";
		if (id!=null) consulta+= " and mov_codcli like ?"; 
		if (FechaIni!=null) consulta+= " and mov_fecha between ? and ?";
		
		
		try {
			stm = Conexion.con.prepareStatement(consulta);
			int x=1;
			if (id!=null)  stm.setInt(x++, id);
			
			if (FechaIni!=null) {
				
				java.sql.Date date1 = new java.sql.Date(FechaIni.getTime());
				stm.setDate(x++, date1);
			}
			if (FechaFin!=null) {
				java.sql.Date date2 = new java.sql.Date(FechaFin.getTime());
				stm.setDate(x++, date2);
			}
			
			res=stm.executeQuery();
			while(res.next()) {
				lista.add(new Movimiento( res.getString("mov_concepto"),
										  res.getBigDecimal("mov_importe"),
										  res.getBigDecimal("mov_sladoAnterior"),
										  res.getInt("mov_codmov")
										));
			}
			
			return lista;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public BigDecimal getSaldoActual() {
		return this.saldoActual;
	}

	public BigDecimal getImporte() {
		return this.importe;
	}

	public String getConcepto() {
		return this.concepto;
	}

	public Fecha getFecha() {
		return this.fecha;
	}

	public BigDecimal getSaldoAnterior() {
		return this.saldoAnterior;
	}

	@Override
	public int compareTo(Movimiento o) {

		return this.fecha.compareTo(o.fecha);
		
	}

	public int getId() {
		return id;
	}
	
	
	
	
	
	
	
}
