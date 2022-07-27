# Guardar la info de texto plano 

# fases
# Creacion  apertura  manipulación  cierre

# hay que trabajar con el modulo io

from io import open

# GUARDAR DATOS
#archivo_texto=open("archivo.txt","w") #nos pide el nombre y el modo de que lo vamos a abrir: lectura escritura append para añadir info a un archivo que ya existe
# se creará un archivo
#frase= "Estupendo día para estudiar Python \nel miércoles"
#archivo_texto.write(frase)
#archivo_texto.close()

#LEER DATOS
#archivo_texto=open("archivo.txt","r")
#texto= archivo_texto.read() 
#archivo_texto.close()
#print(texto)


# READLINES()
#tambien existe el metodo readlines() que lee linea a linea
#archivo_texto=open("archivo.txt","r")
#lineas_texto = archivo_texto.readlines()
#archivo_texto.close()
#print(lineas_texto) # LISTA
#for x in range(len(lineas_texto)):
#	print(lineas_texto[x])

# AÑADIR TEXTO 
#archivo_texto=open("archivo.txt","a")
#archivo_texto.write("Siempre es una buena ocasuón para estudiar Python")
#archivo_texto.close()