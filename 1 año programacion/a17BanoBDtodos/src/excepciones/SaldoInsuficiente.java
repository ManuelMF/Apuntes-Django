package excepciones;

public class SaldoInsuficiente extends RuntimeException {
	
	
	public SaldoInsuficiente() {
		super();
	}
	
	public SaldoInsuficiente(String m) {
		super(m);
	}
	
	
}
