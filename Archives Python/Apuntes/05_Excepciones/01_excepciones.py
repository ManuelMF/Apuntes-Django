# Excepciones
# son errores que saltan en el rograma estando la sintaxis del codigo bien pero sucede algo inesperado

def suma(num1, num2):
	return num1+num2

def resta(num1, num2):
	return num1-num2

def multiplica(num1, num2):
	return num1*num2

def divide(num1,num2):		
	try:
		return num1/num2
	except ZeroDivisionError:
		print("No se puede dividir entre 0")
		return "Operación erronea"

op1=(int(input("Introduce el primer número: ")))

operacion=input("Introduce la operación a realizar (+,-,*,/): ")

op2=(int(input("Introduce el segundo número: ")))		


if operacion=="+":
	print(suma(op1,op2))
	
elif operacion=="-":
	print(resta(op1,op2))

elif operacion=="*":
	print(multiplica(op1,op2))

elif operacion=="/":
	print(divide(op1,op2))

else:
	print ("Operación no contemplada")


print("Operación ejecutada. Continuación de ejecúción del programa ")