#Lanzamineto de excepciones
#Usaremos la instruccion Raise
#podremos crear excepciones propias
def evaluaEdad(edad):
	if edad<0:
		raise TypeError("No se permiten edades negativas")
	if edad<20:
		return "Eres muy joven "
	elif edad<40:
		return "Eres joven"
	elif edad<65:
		return "Eres maduro"
	elif edad<40:
		return "Cuídate"
#print(evaluaEdad(-1))

import math
def calculaRaiz():
	
	op1=(int(input("Introduce un número: "))) 
	if op1<0:
		raise ValueError ("El número no puede ser negativo")
	else:
		return math.sqrt(op1)

try:
	print(calculaRaiz())
except ValueError as ErrorDeNumeroNegativo: #darle un nombre al error
	print(ErrorDeNumeroNegativo)

print("Programa terminado")