#Ejercicio 2:
#• Crea un programa que pida números positivos indefinidamente. El programa termina 
#cuando se introduce un número negativo. Finalmente el programa muestras la suma de 
#todos los números introducidos

lista = []
numero_actual=1
while 0 < numero_actual:
	lista.append(numero_actual)

	numero_actual = int(input("Introduce un número positivo \n"))
lista.remove(1)
print("Introduciste un número negativo")
print(lista)
