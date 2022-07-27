
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.Collections;

import java.util.LinkedList;
import java.util.Scanner;

import excepciones.SaldoInsuficiente;

public class Main {

	static Scanner sc=new Scanner(System.in);
	
	public static void main(String[] args) {
		
		Banco miBanco=Banco.load(1);
		

		
		String opcion=null, dni;
		Cuenta cuentaActiva=null;
		boolean error=true;
		BigDecimal importe=null;
		
		do {
			
			System.out.println("BANCO: "+miBanco.getNombre()+" ("+miBanco.dameLaPasta()+"€) ");
			System.out.println("------------------------------------------");
			System.out.println("1) Abrir Cuenta");
			System.out.println("2) Buscar Cuenta por Nº");
			System.out.println("3) Buscar Cuenta por DNI");
			System.out.println("4) Listado de Cuentas por Saldo");
			System.out.println("S) Salir");
			System.out.println("------------------------------------------");
			System.out.print  ("Opción? ");
			opcion=sc.nextLine();
			
			switch (opcion) {
				case "1":
					Cliente cli;
					System.out.print("DNI: ");
					dni=sc.nextLine();
					
					LinkedList<Cliente> lista=Cliente.find(dni);
					
					if (!lista.isEmpty()) {
						cli=lista.getFirst();
					} else {
						System.out.print("NOMBRE: ");
						String nombre=sc.nextLine();
						
						cli=Cliente.create(nombre, dni);
					}
					
					
					
					error=true;
					BigDecimal des=null;
					do {
						System.out.println("Introduce el máximo saldo en descubierto: ");
						try {
							des=new BigDecimal(sc.nextLine());
							error=false;
						} catch (Exception e) {
							System.out.println("Importe Inválido");
						}
						
					} while (error);
					
					cuentaActiva=miBanco.abrirCuenta(cli, des);
					
				break;
	
				case "2":
					error=true;
					int num=0;
					do {
						try {
							System.out.println("Nº de la Cuenta: ");
							num = Integer.parseInt(sc.nextLine());
							error=false;
						} catch (NumberFormatException e) {
							System.out.println("Número de Cuenta incorrecto!!!");
						}
					} while (error);
					
					cuentaActiva=Cuenta.load(num);
					
					if (cuentaActiva==null) {
						System.out.println("No se ha encontrado la cuenta con número "+num);
						System.out.println("Pulsa una tecla para continuar.....");
						sc.nextLine();
					}
					
				break;
					
				case "3":
					System.out.println("DNI del Cliente: ");
					dni = sc.nextLine();
					LinkedList<Cliente> listacli=Cliente.find(dni);
					
					if (listacli.isEmpty()) {
						System.out.println("No existe ningún Cliente con este DNI");
						System.out.println("Pulsa una tecla para continuar.....");
						sc.nextLine();
					} else {
					
						LinkedList<Cuenta> list=Cuenta.find(miBanco.getId(), listacli.getFirst().getId());
	
						
						if (list.isEmpty()) {
							System.out.println("No se ha encontrado la cuenta del Cliente con DNI "+dni);
							System.out.println("Pulsa una tecla para continuar.....");
							sc.nextLine();
						} else {
							if (list.size()==1) {
								cuentaActiva=list.getFirst();
							} else {
								int x=1;
								for (Cuenta c:list) {
									System.out.println(x+") "+c.getId()+" - "+c.getSaldo()+"€");
									x++;
								}
								System.out.println("------------------------------------------------");
								error=true;
								int pos=0;
								do {
									System.out.println("Selecciona: ");
									try {
										pos=Integer.parseInt(sc.nextLine());
										if (pos>list.size()) {
											System.out.println("Opción incorrecta.");
										} else {
											error=false;
										}
									} catch (NumberFormatException e) {
										System.out.println("Opción incorrecta.");
									}
									
								}while (error);
								
								cuentaActiva=list.get(pos-1);
								
							}
						}
					}
					
				break;
				case "4":
					LinkedList<Cuenta> l=Cuenta.find(miBanco.getId(), null);
					Collections.sort(l, Collections.reverseOrder());
					System.out.println();
					System.out.println("+--------+-----------------------------------+------------+");
					System.out.println("|     Nº | CLIENTE                           |      SALDO |");
					System.out.println("+--------+-----------------------------------+------------+");
					for (Cuenta c:l) {
						Cliente cliente=Cliente.load(c.getIdCliente());
						System.out.printf("|%8s |%-34s|%10s€ |\n",c.getId(), cliente.getNombre()+" ("+cliente.getDni()+")",c.getSaldo());
						
					}
					System.out.println("+--------+-----------------------------------+------------+");
					System.out.println("Pulsa una tecla para continuar.....");
					sc.nextLine();
					break;
			}
			
			
			while(cuentaActiva!=null) {
				Cliente cliente=Cliente.load(cuentaActiva.getIdCliente());
				System.out.println("DATOS DE LA CUENTA:");
				System.out.println("Nº CUENTA: "+cuentaActiva.getId());
				System.out.println("NOMBRE: "+cliente.getNombre());
				System.out.println("DNI: "+cliente.getDni());
				System.out.println("SALDO: "+cuentaActiva.getSaldo()+"€");
				System.out.println("MÁXIMO DECUBIERTO: -"+cuentaActiva.getDescubierto()+"€");
				System.out.println("------------------------------------------------------");
				System.out.println("1) Ingresar Dinero");
				System.out.println("2) Retirar Dinero");
				System.out.println("3) Mostrar Movimientos");
				System.out.println("4) Eliminar Cuenta");
				System.out.println("V) Volver al Menú Principal");
				System.out.println("------------------------------------------------------");
				System.out.print  ("Opción? ");
				opcion=sc.nextLine().toLowerCase();
				
				switch (opcion) {
					case "1":
						error=true;
						do {
							try {
								System.out.print("Importe a ingresar? ");
								importe = new BigDecimal(sc.nextLine());
								error=false;
							} catch (Exception e) {
								System.out.println("Importe incorrecto!!!");
							}
						} while (error);
						
						System.out.println("Concepto de Ingreso: ");
						String concepto=sc.nextLine();
						
						cuentaActiva.ingresar(importe, concepto);
						System.out.println("Ingreso correcto!!");
						System.out.println("Pulsa una tecla para continuar.....");
						sc.nextLine();
					break;
						
					case "2":
						error=true;
						do {
							try {
								System.out.print("Importe a Retirar? ");
								importe = new BigDecimal(sc.nextLine());
								error=false;
							} catch (Exception e) {
								System.out.println("Importe incorrecto!!!");
							}
						} while (error);
						
						
						try {
							cuentaActiva.retirar(importe);
							System.out.println("Retirada de efectivo satisfactorio");
						} catch (SaldoInsuficiente e) {
							System.out.println("Saldo Insuficiente. Tienes "+cuentaActiva.getSaldo()+"€, máximo Descubierto: "+cuentaActiva.getDescubierto()+"€ y pides "+importe+"€");
						}
						
						System.out.println("Pulsa una tecla para continuar.....");
						sc.nextLine();
						
					break;
	
					case "3":
						error=true;
						Fecha fecIni=null, fechFin=null;
						do {
							System.out.println("Fecha de Inicio (dd/mm/aaaa): ");
							try {
								fecIni=new Fecha(sc.nextLine());
								error=false;
							} catch (ParseException e) {
								System.out.println("Formato de fecha Incorrecto.");
							}
						} while(error);
						
						error=true;
						do {
							System.out.println("Fecha Final (dd/mm/aaaa): ");
							try {
								fechFin=new Fecha(sc.nextLine()+" 23:59");
								error=false;
							} catch (ParseException e) {
								System.out.println("Formato de fecha Incorrecto.");
							}
						} while(error);
						
						
						LinkedList<Movimiento> movs=Movimiento.find(cuentaActiva.getId(), fecIni, fechFin);
						
						if (movs.isEmpty()) {
							System.out.println("No hay Movimientos entre estas fechas.");
						} else {
							System.out.println("----------------------------------------------------------------------------------------------------");
							for (Movimiento m:movs) {
								System.out.println(m.getFecha().getDMAHM()+" "+m.getConcepto()+" "+m.getSaldoAnterior()+"€ "+m.getImporte()+"€ "+m.getSaldoActual()+"€");
							}
							System.out.println("----------------------------------------------------------------------------------------------------");
							
						}
						System.out.println("Pulsa una tecla para continuar.....");
						sc.nextLine();
	
					break;
					case "4":
						System.out.print("¿Estás Seguro? S/N ");
						String seguro=sc.nextLine();
						
						if (seguro.equalsIgnoreCase("s")) {
							cuentaActiva.remove();
							cuentaActiva=null;
						}
						
					break;
					case "v":
						
						cuentaActiva=null;
						
					break;
				}
				
			}
			
		}while (!opcion.equalsIgnoreCase("s"));

		
	}

}
