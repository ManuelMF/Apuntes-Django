nombreUsuario=input("Introduce tu nombre de Usuario: \n")

print("El nombre es: ", nombreUsuario.lower())
print("El nombre es: ", nombreUsuario.upper())
print("El nombre es: ", nombreUsuario.capitalize()) #primera mayus

edad= input("Introduce la edad \n")
print(edad.isdigit())#mira si es un número

while(edad.isdigit()==False):
	print("Por favor introduce un valor númerico")
	edad=input("Introduce tu edad \n")

if (int(edad)<18):
	print("No puedes pasar")
else:
	print("Puedes pasar")