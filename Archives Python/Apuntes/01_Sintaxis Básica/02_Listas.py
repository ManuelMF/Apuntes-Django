num1=5
num2="4"
num3=9

lista=[num1,num2,num3]
#print(lista[1])

listaNombres=["Maria","Pepe","Marta","Antonio"]
# imprimir lista completa
#print(listaNombres[:])

# Cuenta desde el final
#print(listaNombres[-1])

# Porcion de lista
#print(listaNombres[0:3])
#print(listaNombres[:3]) #coge 0 auto
#print(listaNombres[2:]) #coge el final auto

listaNombres.append("Lucia") #añade al final

listaNombres.insert(2,"Sandra") #añade donde quiera

listaNombres.extend(["Pepe","Ana"]) #añade conjunto de valores o listas
listaNombres.extend(lista)

# te dice el indice de donde esta
#print(listaNombres.index("Pepe")) 
#mira si esta
#print("Pepe" in listaNombres) 

#borrar elemento
listaNombres.remove("Ana") 
listaNombres.pop() #borra el ultimo

#print(listaNombres[:])

listaUnida = listaNombres+lista #concatena la lista
listaUnida = listaUnida * 3 #repite
print (listaUnida)
