#Ejercicio 1:
#• Crea un programa que pida números infinitamente. Los números introducidos deben 
#ser cada vez mayores El programa finalizará cuando se introduce un número menor que 
#el anterior.

numero_anterior=-1
numero_actual=0
while numero_anterior<numero_actual:
	numero_anterior = numero_actual
	numero_actual = int(input("Introduce un número mayor al anterior \n"))

print("Introduciste un número mas pequeño o igual al anterior")
