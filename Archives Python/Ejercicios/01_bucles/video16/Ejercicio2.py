#Ejercicio 2:
#• Crea un programa que pida por teclado introducir una contraseña. La contraseña no 
#podrá tener menos de 8 caracteres ni espacios en blanco. Si la contraseña es correcta, 
#el programa imprime “Contraseña OK”. En caso contrario imprime “Contraseña 
#errónea”

Con = input("Introduce una contraseña \n")
validez = True
x = 1
if len(Con)<8: 
	validez = False
	x=2
for i in Con:
	if i == " ": validez = False

if validez == False and x == 2: print("Contraseña errónea: Contaseña demasiado corta")
elif validez == False and x == 1: print("Contraseña errónea: No puede tener espacios")
else: print("Contraseña OK")