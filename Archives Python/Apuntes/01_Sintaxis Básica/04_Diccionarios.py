# Crear diccionario
diccionario = {"Alemania":"Berlin", "Francia":"Paris", "Reino Unido":"Londres", "España":"Madrid", 23.4:"Jordan", "Numero de plazas":30}

#añadir 
diccionario["Italia"] = "Lisboa"

#modificar
diccionario["Italia"] = "Roma"

#borrar
del diccionario["Reino Unido"]

#pintar valor especifico
#print(diccionario["Francia"])

#print(diccionario)

tupla = ["España", "Francia", "Reino Unido"]
diccionario2 = {tupla[0]:"Madrid", tupla[1]:"Paris", tupla[2]:"London"}
#print(diccionario2[tupla[0]])
#print(diccionario2["España"])

#meter en un diccionario una tupla de valores
diccionario3 = {23:"Jordan", "Nombre":"Michael", "Equipo":"Chicago", "anillos":[1991,1992,1993,1996,1997,1998]}
print(diccionario3)
print(1991  in diccionario3["anillos"])

#diccionario en diccionario
diccionario4 = {"anillos":{"temporadas":[1991,1992,1993,1996,1997,1998]}}
print(diccionario4)

#keys son las claves(como el titulo que luego tiene el contenido España : madrid )
print(diccionario.keys())
#values al contrario
print(diccionario.values())
#len total de valores
print(len(diccionario))