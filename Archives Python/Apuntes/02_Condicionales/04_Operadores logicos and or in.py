# ej 1 operadores and y or
#print("Programa de becas Año 2021")
#distancia = float(input("Introduce la distancia hasta el centro en KM "))
#print(distancia)
#numero_hermanos = int(input("Introduce el número de hermanos en el centro "))
#print(numero_hermanos)
#salario_familiar = float(input("Introduce el salario anual bruto de toda la familia "))
#print(salario_familiar)

#if distancia > 40 and numero_hermanos > 2 or salario_familiar <= 20000:
#	print("Tienes derecho a beca")
#else:
#	print("No tienes derecho a beca")

# ej 2 operador in
print("Asignaturas optativas Año 2017")
print("Informática gráfica - Pruebas de software - Usabilidad y accesibilidad")
asignatura = input("Escribe la asignatura escogida: ").lower() #minusculas

if asignatura in ("informática gráfica", "pruebas de software", "usabilidad y accesibilidad"):
	print("Asignatura elegida: " + asignatura)
else:
	print("La asignatura escogida no está contemplada")  