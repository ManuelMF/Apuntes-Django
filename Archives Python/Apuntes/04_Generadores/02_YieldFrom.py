# Yield from
# es como un array de dos dimensiones
# para entrar usaremos bucles anidados = for dentro de otro for
# generador creo objetos cada vez que se ejecuta, si quieres acceder al interior de ese elemento

#1 for para coger el elemento y el segundo para coger el subElemento

def devuelve_ciudades(*ciudades):#va a recibir un numero indeterminado de elementos y los recibira en forma de tupla
	for elemento in ciudades:
		#vamos a acceder a los subelementos de el string que son las letras
		for subElemento in elemento:
			yield subElemento

ciudades_devueltas = devuelve_ciudades("Madrid", "Barcelona", "Bilbao", "Valencia")
print(next(ciudades_devueltas))
print(next(ciudades_devueltas))

# esto se facilida con yield from 
def devuelve_ciudades2(*ciudades):
	for elemento in ciudades:
		yield from elemento #le decimos haz un yield desde elemento


ciudades_devueltas = devuelve_ciudades2("Madrid", "Barcelona", "Bilbao", "Valencia")
print(next(ciudades_devueltas))
print(next(ciudades_devueltas))