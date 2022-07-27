package A07Static_Banco;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.LinkedList;
import java.util.Scanner;

// Hay que meter el convertor de descubierto el num y meter en select cuenta		    listo

// Modificar el saldo del cliente coaundo hago un ingreso 								listo
// Buscar cuenta por dni y por cuenta la bd												listo
// Eliminar por dni 																	listo
// al buscar cuenta buscar el cliente para crear directamentoe la cuenta                listo
// buscar cuentas por dni me dara una linked list de cuentas							listo
// dame la pasta
// modificar la cuenta
// crear metodo load para cargar el cliente y consultarlo se usara para buscar clientes listo
// update cliente para editar un cliente												listo
// hacer private a los contructores sin que pete										listo
// poner contructor 
// elim,
public class Main {
	static Scanner sc=new Scanner(System.in);
	public static void main(String[] args) throws NumeroNegativoExeption {
		
		Banco banco = null;
		String nb="Banco Santander";
		banco = Banco.Create(nb);
		boolean salir=false;
		
			System.out.println(nb);
		do {
			
			System.out.println("--------------------------------------");
			System.out.println("Que operacion quieres hacer");
			System.out.println("1) Añadir una cuenta");
			System.out.println("2) Eliminar una cuenta");
			System.out.println("3) Saldo total del banco");
			System.out.println("4) Buscar cuenta");
			System.out.println("5) Apagar");
			System.out.println("--------------------------------------");
			
			Cuenta cuenta=null;
			
			switch (sc.nextLine()) {
			
				case "1":
					String DNICliente="";
					boolean error=true;
					String nombreCliente="";
					int nivelCuenta=4;
					
					do {
						try {
							System.out.println("DNI del cliente");
							DNICliente = sc.nextLine();
						
							if (DNICliente.length()!=9)  throw new RuntimeException();
							error=false;
						} catch (RuntimeException e) {
							System.out.println("DNI erroneo");
						}
					} while(error);
					
//				mirar
					if (Cliente.load(null, DNICliente)==null) {
						error=true;
						
						do {
							try {
								System.out.println("Nombre del cliente");
								nombreCliente = sc.nextLine();
								
								if (nombreCliente.length() < 3) throw new RuntimeException();
								
								error=false;
							} catch (RuntimeException e) {
								System.out.println("Introduce un nombre valido por favor");
							} 
						} while (error);
						
						
						Cliente cliente = Cliente.Create(nombreCliente,DNICliente);
						
						System.out.println("Nivel de cuenta del usuario");
						nivelCuenta = Integer.parseInt(sc.nextLine());
						
						cuenta=banco.CrearCuenta(cliente,nivelCuenta);
						
					} else {
						Cliente cliente =Cliente.load(null, DNICliente);
						
						
						System.out.println("Nivel de cuenta del usuario");
						nivelCuenta = Integer.parseInt(sc.nextLine());
					
						cuenta=banco.CrearCuenta(cliente,nivelCuenta);
					}
					break;
				case "2":
					error=true;
					String resp="";
					
					do {
						try {
							System.out.println("Eliminar cuenta por\n1) Numero de cuenta \n2) DNI ");
							resp = sc.nextLine();
						
							if (resp.equals("1")||resp.equals("2")) {}else throw new RuntimeException();
							
							error=false;
						} catch (RuntimeException e) {
							System.out.println("Numero invalido");
						}
					} while (error);
			
					switch (resp) {
						case "1":
							System.out.println("Introduce el numero de cuenta");
							int n = Integer.parseInt(sc.nextLine());
							// elimino la cuenta de la BD
							Cuenta c =  Cuenta.load(n,null);
							if (c.getSaldo().compareTo(new BigDecimal(0))==0) {
							c.delete();
							
							} else if (c.getSaldo().compareTo(new BigDecimal(0))==1) System.out.println("No se Puede eliminar una cuenta con dinero");
							else System.out.println("No se puede eliminar una cuenta con deudas");
							
							break;	
					
						case "2":
							System.out.println("Introduce el DNI");
							String dni=sc.nextLine();
							Cuenta c1 =Cuenta.load(null,dni);
							if (c1.getSaldo().compareTo(new BigDecimal(0))==0) {
								c1.delete();
								
								} else if (Cuenta.load(null,dni).getSaldo().compareTo(new BigDecimal(0))==1) System.out.println("No se Puede eliminar una cuenta con dinero");
								else System.out.println("No se puede eliminar una cuenta con deudas");
							break;	
					}
					break;
			
				case "3":
					BigDecimal total = banco.SaldoTotal();
					System.out.println("Total: "+total);
					break;
				
				case "4":
					resp=""; 
					error=true;
					
					do {
						System.out.println("Buscar cuenta \n1) Numero de cuenta \n2) DNI ");
						resp = sc.nextLine();
						
						if (resp.equals("1")||resp.equals("2")) error=false;
					} while (error);
					
					switch (resp) {
						case "1":
							
							error=true;
							do {
								try {
									System.out.println("Introduce el número de cuenta");
									
									cuenta = Cuenta.load(Integer.parseInt(sc.nextLine()), null);
									if (cuenta==null) System.out.println("No se encontro ninguna cuenta");
									error=false;
								} catch (RuntimeException s) {
									System.out.println("Tiene que ser un numero");
								} 
							} while (error);
							break;	
							
						case "2":
							error=true;
							String Dni;
							
							do {
								System.out.println("Introduce el DNI");
								Dni = sc.nextLine();
								
								if (Dni.length()==9) {error=false;} else {System.out.println("DNI erroneo");}
							} while(error);
							
							cuenta = Cuenta.load(null, Dni);
							if (cuenta==null) System.out.println("No se encontro ninguna cuenta");
							
							break;	
					}	
					break;
					
				case "5":
					
					salir=true;
					
					break;
			}
			while (cuenta!=null) {
				System.out.println("--------------------------------------");
				System.out.println("N cliente: "+cuenta.getNumeroCuenta());
				System.out.println("Cuenta de "+cuenta.getCli().getNombre()+" con DNI: "+cuenta.getCli().getDni());
				System.out.println("Saldo: "+cuenta.getSaldo());
				System.out.println("--------------------------------------");
				System.out.println("Que quieres hacer");
				System.out.println("1) Ingreso");
				System.out.println("2) Retirar dinero");
				System.out.println("3) Eliminar cuenta");
				System.out.println("4) Buscar movimientos");
				System.out.println("5) Salir");
				System.out.println("--------------------------------------");
				String resp = sc.nextLine();
				
				switch (resp) {
				
					case "1":
						boolean error = true;
						
						do {
							try {
								System.out.println("Cuanto dinero quieres ingresar");
								BigDecimal ing = new BigDecimal(Integer.parseInt(sc.nextLine()));
								
//								mirar negativo
								BigDecimal n0 = new BigDecimal(0);
								if (ing.compareTo(n0)==-1) throw new NumeroNegativoExeption();
								
								System.out.println("Concepto");
								cuenta.ingresarDinero(ing, sc.nextLine());
								error=false;
								
							} catch (NumberFormatException f) {
							System.out.println("Tienes que introducir un numero");
							} catch (NumeroNegativoExeption f) {
								System.out.println("No puedes meter numeros negativos");
							}
							
						}while (error);
						
						break;
					
					case "2":
						error=true;
						
						do { 
							try {
								System.out.println("Cuanto dinero quieres retirar");
								BigDecimal ret = new BigDecimal(Integer.parseInt(sc.nextLine()));
								cuenta.retirarDinero(ret);
								
								error = false;
							} catch(SaldoInsuficienteException e) {
								System.out.println("No tienes suficiente saldo");
							} catch (NumberFormatException f) {
								System.out.println("Tienes que introducir un numero");
							}
							
						} while (error);
						break;
					
					case "3":
						if (cuenta.getSaldo().compareTo(new BigDecimal(0))==0) {
						cuenta.delete();
						
						cuenta=null;
						} else if (cuenta.getSaldo().compareTo(new BigDecimal(0))==1) System.out.println("No se Puede eliminar una cuenta con dinero");
						else System.out.println("No se puede eliminar una cuenta con deudas");
						break;	
					
					case "4":
						LinkedList<Movimiento> lista = null;
						System.out.println("Quieres buscar por Fecha?");
						if (sc.nextLine().equals("si")) {
						
						SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
						SimpleDateFormat formato2 = new SimpleDateFormat("dd/MM/yyyy HH:mm");
						
						error = true;
						Fecha fechaini = null, fechafin = null;
						
						do {
							try {
								System.out.println("Fecha de inicio dd/MM/yyyy");
								fechaini = new Fecha(sc.nextLine());
								
								error = false;
							} catch (ParseException e) {
								System.out.println("Fecha incorrecta");
							} 
							
						}while (error);
						
						
						error = true;
						do {
							try {
								System.out.println("Fecha de fin dd/mm/yyyy");
								fechafin = new Fecha(sc.nextLine()+" 23:59");
								
								error = false;
							} catch (ParseException e) {
								System.out.println("Fecha incorrecta");
							} 
						} while (error);
						
						
						 lista = Movimiento.find(cuenta.getCli().getId(),fechaini,fechafin);
						
						System.out.println("Quieres ordenar los movimientos (si/no)");
						if (sc.nextLine().equals("si")) {
							
							System.out.println("Quieres ordenar for fecha o por importe (f/i)");
							
							if (sc.nextLine().equals("f")) {
//							compara por fecha
							Collections.sort(lista);
							} else {
	//						compara por importe
							Collections.sort(lista, new comparadorImporte().reversed());
							}
						}
						if (lista.isEmpty()) {
							System.out.println("No hay movimientos");
						} else {
							for(Movimiento m : lista) System.out.println(m.getFecha().getDMAHM()+"  "+m.getConcepto()+" Importe: "+m.getImporte()+"€ Total:"+m.getSaldoActual()+"€");
							
						}
						} else {
							
							lista = Movimiento.find(cuenta.getCli().getId(),null,null);
							for (Movimiento m : lista) System.out.println(m.getFecha().getDMAHM()+"  "+m.getConcepto()+" Importe: "+m.getImporte()+"€ Total:"+m.getSaldoActual()+"€");
						}
						System.out.println("--------------------------------------");
						System.out.println("Pulsa cualquier techa para continuar");
						sc.nextLine();
						
					break;	
						
					case "5":
						
						cuenta=null;
						
						break;
				}
			}
		} while(!salir);
//		guardamos
		banco.guardarDatos();
	}

}