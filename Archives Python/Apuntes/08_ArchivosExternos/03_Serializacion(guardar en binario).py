# se trata de guardar en un fichero externo una coleccion un dicionario o incluso un objeto en codigo binario
# usos
#para distribuirlo por internet es mas facil
# para guadar en una base de datos

#Bibliotecas necesarios 
# Pickle
# dump() permite hacer un volcado de datos al fichero binario externo
# load() carga de los datos del fichero binario externo

# METER DATOS EN BINARIO
import pickle

lista_nombres=["Pedro","Ana","Maria","Isabel"]

fichero_binario = open("lista_nombres","wb") #escritura binaria

pickle.dump(lista_nombres, fichero_binario)

fichero_binario.close()

# COGER DATOS EN BINARIO

import pickle

fichero_binario = open("lista_nombres","rb") # leer binario

lista = pickle.load(fichero_binario)

print(lista)