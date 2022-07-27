#Ejercicio 1:
#• Crea un programa que muestre los números impares del 1 al 100. Los números deberán 
#aparecer una al lado del otro sin salto de línea

for i in range(101):
	if i%2 != 0: print(i,end=" ")