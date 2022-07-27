# Coger a mano
def divide():
	try:
		op1=(float(input("introduce el primer número: ")))
		op2=(float(input("introduce el segundo número: ")))

		print("La division es: " + str(op1/op2))
	except ValueError:
		print("Valor introducido erroneo")
	except ZeroDivisionError:
		print("No se puede divider entre 0")

	print("Cálculo finalizado")


# Coger todas de una, poco recomendable
def divide2():
	try:
		op1=(float(input("introduce el primer número: ")))
		op2=(float(input("introduce el segundo número: ")))

		print("La division es: " + str(op1/op2))
	except:
		print("Ha ocurrido un error")
	finally:
		print("Cálculo finalizado")# Este codigo siempre se ejecutara al estar dentro del finaly
divide2()