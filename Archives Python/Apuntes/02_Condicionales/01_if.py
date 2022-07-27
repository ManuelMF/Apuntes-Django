def evaluacion(nota):
	valoracion = "Aprobado"
	if nota<5: 
		valoracion = "Suspendido"
	return valoracion

print("Programa de evalucaion de notas de alumnos")
nota_alumno = int(input()) #guarda un string
print(evaluacion(nota_alumno))

#para poder introducir info por teclado hay que abrir la consola tools / sublimeREPL / Python / Python - RUN current file

#Se puede introducir un mensaje en un input
nota_alumno = int(input("Programa de evalucaion de notas de alumnos")) #guarda un string
print(evaluacion(nota_alumno))