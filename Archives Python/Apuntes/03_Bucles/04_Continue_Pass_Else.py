# Continue
# Cuando lee esta condicion ignora el resto de la repeticion y empieza la siguiente

# Pass
# El bucle devuelve null (como si no se ejecutara el bucle)
# Se suele usar para dejar para despues de desarrollo de un bucle para que el programa se siga ejecutando a pesar de no tenerlo hecho

# Else
# Hace lo mismo que con el if

# Continue
for letra in ("Python"):

	if letra=="h":
		continue

	print("Viendo la letra: " + letra)

# Contar caracteres " " no cuenta por eso no vale length
nombre = "Pildoras Informaticas"
# print(len(nombre))
contador = 0
for i in nombre:
	if i == " ":
		continue
	contador+=1

print(contador)

# Pass
while True:
	pass
	# mantendra el bucle ocupado hasta el que usuario pulse cntr + c

class Miclase:
	pass # para implementar mas tarde

# Else # se puede usar en bucles pero no hace falta se puede hacer con otras cosas
email=input("Introduce tu email, por favor: \n")
for i in email:
	if i=="@":
		arroba=true
		break # AL HABER UN BREAK DIGAMOS QUE SALE DEL BUCLE FOR ANTES DE QUE TERMINE Y ASI NO ENTRARA EN EL ELSE
else:
	arroba=False

print(arroba)