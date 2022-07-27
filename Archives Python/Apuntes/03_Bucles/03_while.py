#i=1
#while i<=10:
#	print("Ejecucion " + str(i))
#	i+=1

#edad=int(input("Introduce tu edad por favor: \n"))
#while edad<5 or edad>100:
#	print("Has introducido una edad erronea. Vuelve a intentarlo")
#	edad=int(input("Introduce tu edad por favor: \n"))
#
#print("Gracias por colaborar. Puedes pasar")
#print("Edad del aspirante " + str(edad))
import math
print("Programa de cálculo de raíz cuadrada")
numero = int(input("Introduce un número por favor: \n"))

intentos=0

while numero<0:
	print("No se puede hallar la raíz de un número negativo")
	if intentos==2:
		print("Has consumido demasiados intentos. El programa ha finalizado")
		break

	numero = int(input("Introduce un número por favor: \n"))
	if numero<0:
		intentos+=1

if intentos<2:
	solucion = round(math.sqrt(numero),2)
	print ("La raíz cuadrada de " + str(numero) + " es " + str(solucion))
