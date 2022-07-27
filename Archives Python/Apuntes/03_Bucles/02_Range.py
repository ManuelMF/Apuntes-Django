# range es para indicar cuando van a durar 
# se puede poner uno que son las rep
# si hay 2 el pri por que numero empieza y el seg las veces que se rep 
# si hay 3 el ter será dira que ira de ese numero en ese numero

#for i in range(5,50,5):
#	print(f"valor de la variable {i}")
	# f indica a python que vamos a usar una notacion especial ponerle formatos de forma diferente
	# y {} concatena lo que le ponemos con la variavle

valido=False
email = input("Introduce tu email")
for i in range(len(email)):
	if email[i]=="@":
		valido = True

print(valido)