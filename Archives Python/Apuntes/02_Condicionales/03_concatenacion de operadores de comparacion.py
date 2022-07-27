#edad = 5

#ej1
# concadenar en el if lee de iz a dere
#if 0<edad<100:
#	print("Edad correcta")
#else:
#	print("Edad incorrecta")


#ej2
salario_presidente = int(input("Introduce el salario del presidente"))
print("Salario presidente: " + str(salario_presidente))

salario_director = int(input("Introduce el salario del director"))
print("Salario director: " + str(salario_director))

salario_jefeArea = int(input("Introduce el salario del jefe de área"))
print("Salario jefe de área: " + str(salario_jefeArea))

salario_administrativo = int(input("Introduce el salario del administrativo"))
print("Salario administrativo: " + str(salario_administrativo))

if salario_administrativo<salario_jefeArea<salario_director<salario_presidente:
	print("Escala correcta")
else:
	print("Salarios desproporcionados")