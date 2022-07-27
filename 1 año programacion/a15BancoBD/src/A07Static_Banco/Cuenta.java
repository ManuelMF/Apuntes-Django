package A07Static_Banco;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Collections;
import java.util.Date;
import java.util.LinkedList;
import java.util.Scanner;



public class Cuenta implements Serializable, Comparable<Cuenta> {
//	propiedades BIGDecimal saldo,  int numero cuenta,  Cliente cli , movimientos que será una linkedList de movimientos que sera otro objeot / hay que crear una variable static int num sig 
	
//	Metodos:
//	constructor cuenta(cliente c)
//	ingresar dinero con una variable BigDecimal y tambien le pasamos el concepto que sera un string
//	retirar dinero que le pasaremos el importeque y el concepto (hay que hacer comprovaciones si hay dindero y tiene que salir una excepcion que diga saldo insuficiente
//	tendremos que hacer gets de saldo, num cuenta , cliente y movimiendos donde le tendremos que pasar la fecha de inicio y la de fin (nos dara una linkedlist<Movimientos>
	
	private static final long serialVersionUID = 451672592654494688L;
	private BigDecimal saldo;
	private int numeroCuenta;
	private Cliente cli;
	private LinkedList<Movimiento> movimientos;
	private BigDecimal descubierto;
	private int NiveldeCuenta;
	static Scanner sc=new Scanner(System.in);


	
	
	private Cuenta(Cliente cliente, BigDecimal descubierto, int id,int ni,BigDecimal saldo) {
		this.saldo = saldo;
		this.numeroCuenta=id;
		this.cli=cliente;
		this.movimientos = new LinkedList<Movimiento>();
		this.descubierto=descubierto;
		this.NiveldeCuenta=ni;
		
		
		
		
		}
	
//	para hacer la base de datos tende que crear uno para cada uno ingresar retirar buscar 
	
	public static Cuenta create(Cliente cli ,BigDecimal saldo, BigDecimal descubierto,int cue_codban, int cue_codcli,int nivelCuenta) {
		Conexion.open();
		
		PreparedStatement stm;
		ResultSet res;
		
		String insert="insert into cuentas(cue_saldo,cue_descubierto,cue_codban,cue_codcli) values (?,?,?,?)";
		
		try {
			stm=Conexion.con.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
			stm.setBigDecimal(1,saldo);
			stm.setBigDecimal(2, descubierto);
			stm.setInt(3, cue_codban);
			stm.setInt(4, cue_codcli);
			
			stm.executeUpdate();
			res=stm.getGeneratedKeys();
			res.next();
			
			Cuenta cuenta = new Cuenta(cli,descubierto,res.getInt(1),nivelCuenta,new BigDecimal(0));
			
			return cuenta;
			
		} catch (SQLException e) {
			System.out.println("Error insertando cuenta!!");
			e.printStackTrace();
		}
		return null;
		
	}
	public static Cuenta load(Integer id, String dni) {
		
		PreparedStatement stm;
		ResultSet res;
		
		String select="";
		if (id!=null) select= "select * from cuentas left join clientes on cli_codcli=cue_codcli where cue_codcue like ?";
		if (dni!=null) select= " select * from cuentas left join clientes on cli_codcli=cue_codcli where cli_dni like ?";
		
		Conexion.open();
		
		try {
			stm= Conexion.con.prepareStatement(select);
			if (id!=null) stm.setInt(1, id);
			if (dni!=null) stm.setString(1, dni);
			
			res=stm.executeQuery();
			
				LinkedList<Cuenta> lista=new LinkedList<Cuenta>();
				while (res.next()) {
					
					int nive = res.getBigDecimal("cue_descubierto").intValueExact();
					
					int nivel = 0;
					switch (nive) {
					case 20000:
						nivel=1;
						
						break;
					case 10000:
						nivel=2;
						break;
					case 3000:
						nivel=3;
						break;
					case 1000:
						nivel=4;
						break;	
					case 400:
						nivel=5;
						break;
					
					case 200:
						nivel=6;
						break;
					}
					lista.add(new Cuenta(new Cliente(res.getString("cli_nombre")
										 , res.getString("cli_dni")
										 , res.getInt("cli_codcli")
										 )
							  , res.getBigDecimal("cue_descubierto")
							  , res.getInt("cue_codcue")
							  , nivel
							  , res.getBigDecimal("cue_saldo")));
				}
				
				if (lista.size()==1)  return lista.getFirst();
				else if (lista.isEmpty()) return null;
				else {
					int x=1;
					// ordenar las cuentas 
					Collections.sort(lista,Collections.reverseOrder());			
					
					
					
					int num=0;
					boolean error=true;
					
					do {
						try {
							System.out.println("A que cuenta quieres entrar");
							for (Cuenta c:lista) {
								System.out.println(x+": Num Cu: "+c.getNumeroCuenta()+" con un total de "+c.getSaldo()+"€");
								x++;
							}
							num= Integer.parseInt(sc.nextLine()); 
							
							if (num==0) { throw new RuntimeException();}
							
							error=false;
							
						} catch (RuntimeException e) {
							System.out.println("Caracter invalido");
						}
					} while (error==true);
					
					return lista.get(num-1);
				}
			
			
				
		}catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Fallo Buscando cuenta");
		}
		
		
		return null;
	}
	public void delete() {
		Conexion.open();
		
		PreparedStatement stm;

		
		String delete="delete from cuentas where cue_codcue=?";
		
		try {
			
			stm = Conexion.con.prepareStatement(delete);
			stm.setInt(1, this.getNumeroCuenta());
			
			stm.executeUpdate();
			
			
		} catch (SQLException e) {
			System.out.println("Problema al eliminar la cuenta");
		}
	}
	
	
	public BigDecimal ingresarDinero(BigDecimal dineroIng, String concepto) {
		
//		Movimiento mov=new Movimiento(concepto, dineroIng, this.saldo);
//		this.movimientos.add(mov);
		
		
		
		Movimiento.Create(concepto, dineroIng, this.saldo, cli.getId(),this.numeroCuenta);
		
		
		
		//this.movimientos.addFirst(new Movimiento(concepto, dineroIng, this.saldo));
		
		this.saldo = this.saldo.add(dineroIng);
		
		return this.saldo;
	}
	
	public BigDecimal retirarDinero(BigDecimal dineroRet) {
		
		//MIRAMOS QUE SEA -1 QUE SERIA QUE EL TOTAL ES NEGATIVO (NO HAY DINERO)
		if (-1==saldo.add(descubierto).compareTo(dineroRet)) {
			
			throw new SaldoInsuficienteException("Saldo actual:"+this.saldo+" y quieres sacar "+dineroRet);
		}
		
		Movimiento.Create("Retirada en efectivo", dineroRet.negate(), this.saldo, cli.getId(),this.numeroCuenta);
		//this.movimientos.addFirst(new Movimiento("Retirada en efectivo",dineroRet.negate(),this.saldo));
		this.saldo=this.saldo.subtract(dineroRet);
		
		return this.saldo;
	}
	

	
	public BigDecimal getSaldo() {
		return saldo;
	}

	public int getNumeroCuenta() {
		return numeroCuenta;
	}

	public Cliente getCli() {
		return cli;
	}
	public LinkedList<Movimiento> getMovimientos() {
		return movimientos;
	}


	@Override
	public int compareTo(Cuenta o) {
		return this.saldo.compareTo(o.saldo);
	}

	public int getNiveldeCuenta() {
		return NiveldeCuenta;
	}

	
	
}
