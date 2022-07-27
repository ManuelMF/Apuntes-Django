def verificar_edad():
	print("Verificación de acceso")
	edad_user = int(input("Introduce tu edad"))
	if edad_user<18:
		print("No puedes pasar")
	elif edad_user>115:
		print("Introduce una edad correcta")
	else:
		print("Puedes pasar")
	print("El programa a finalizado")

verificar_edad()