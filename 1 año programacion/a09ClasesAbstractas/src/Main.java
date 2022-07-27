
public class Main {

	public static void main(String[] args) {
		
		Triangulo triangulo = new Triangulo(10);
		
		System.out.println(triangulo.getPerimetro());
		System.out.println(triangulo.getArea());
		
		PoligonoRegular triangulo2 = new Triangulo(10);
		
		System.out.println(triangulo2.getPerimetro());
		System.out.println(triangulo2.getArea());
		
		PoligonoRegular cuadrado = new Cuadrado(2);
		System.out.println(cuadrado.getPerimetro());
		System.out.println(cuadrado.getArea());
	}

}
