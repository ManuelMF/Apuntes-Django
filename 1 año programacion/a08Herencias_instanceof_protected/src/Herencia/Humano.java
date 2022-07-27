package Herencia;

public class Humano extends SerVivo {
	
	public char sexo;
	public String colorPelo;
	
	public Humano(Dimension dimension, int espVida, char sex, String cp) {
		super("Homo Sapiens",dimension,espVida);
		this.sexo=sex;
		this.colorPelo=cp;
		
	}
	
	public void tenyirse(String nc) {
		this.colorPelo=nc;
	}

}
