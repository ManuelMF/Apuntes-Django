package a07DescendingOrder;


import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;

public class DescendingOrder {
	public static int sortDesc(final int num) {
		
		String listaNum = num+"";
		String listaNumOrdenada="";
		LinkedList<Integer> lista= new LinkedList<Integer>();
		
		for (int x=0 ; x<listaNum.length() ; x++) {
			int numero = Integer.parseInt(listaNum.charAt(x)+"");
			lista.add(numero);
		}
		Comparator<Integer> comparator = Collections.reverseOrder();
		Collections.sort(lista, comparator);

		for (int ContruirNum : lista) listaNumOrdenada+=ContruirNum+"";
		
		return Integer.parseInt(listaNumOrdenada);
	}
}
