# Listas inmutables
# No permiter addend remove... 
# Permiten extraer porciones creando una tupla nueva
# Si permiten comprobar si un elemento se encuentra en la tupla

#son mas rapidas
#ocupan menos en memoria
tupla=(4.2,"Pepe",6,"28",True)
#print(tupla[2])

# Pasar de Tupla a lista 
lista = list(tupla)

lista.append(5)
#print(lista[:])

#pasar de lista a tupla
tupla = tuple(lista)

#print(tupla[:])

#print("Pepe" in tupla)
#print(tupla.count("Pepe")) # te dice el número de veces que se repite
#print(len(tupla)) #cuenta los elementos que hay (no empieza en 0)

tuplaUnitaria = ("Juan",)

# desenpaquetado de tupla
tupla2 = ("Juan",13,1,1995)
nombre ,dia ,mes , anyo = tupla2 # asigna por orden los valores de la tupla
print(nombre," Fecha de nacimiento: ",dia,"/",mes,"/",anyo)

#buscar el index
print(tupla.index("Pepe"))

