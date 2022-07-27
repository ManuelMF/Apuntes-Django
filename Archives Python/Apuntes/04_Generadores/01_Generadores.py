# Generador
# def generaNumeros():
# yield numeros

# Construye un objeto con el primer valor de la lista, si se vulve a llamar cogerá el número siguiente
# 2 4 6 8 10

def GeneraPares(limite):
	num=1
	while num<limite:
		yield num*2
		num+=1	 

devuelvePares=GeneraPares(10)

#for i in devuelvePares:
#	print(i)

# decir al programa que me vaya diciendo valor a valor
print(next(devuelvePares))
print("Aqui podria ir mas codigo...")
print(next(devuelvePares))
print("Aqui podria ir mas codigo...")
print(next(devuelvePares))

# entre llamada y llamada entra en suspension el objeto

# diferencia entre funcion normal
# una funcion normal podria llamar a los 3 primeros pero tendría que crear antes toda la lista de pares  
# mientras que en un generador solo crea los 3 primeros y no ha tenido que reservar espacio en memoria para usarlo
# se puede usar en funciones que crean valores infinitos y que posiblemente quede colgado el programa y tendria un consimo de recursos enormes