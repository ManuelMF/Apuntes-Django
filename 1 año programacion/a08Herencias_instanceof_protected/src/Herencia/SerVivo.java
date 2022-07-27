package Herencia;

public class SerVivo {

	public String especie;
	public Dimension dimension;
	public int esperanzaVida;
	
	
//	con protected es privada y pueden acceder los hijos
	protected SerVivo(String es,Dimension dimension,int esp) {
		this.especie=es;
		this.dimension=dimension;
		this.esperanzaVida=esp;

		
	}

	public void engordar(int valor) {
		this.dimension.ancho += valor;
	}
	
	
}
