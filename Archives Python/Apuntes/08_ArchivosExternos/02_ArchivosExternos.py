from io import open

archivo_texto = open("archivo.txt","r") 

print(archivo_texto.read())
print(archivo_texto.read()) # no se vuelve a repetir ta que el cursor esta al final
# con el metodo seek() le decimos donde queremos que se posicion del puntero

archivo_texto.seek(0)
print(archivo_texto.read())

archivo_texto.seek(11) #empieza por el caracter 11

archivo_texto.seek(0)
print(archivo_texto.read(11)) #lee hasta el caracter 11
print(archivo_texto.read()) # lee el resto

archivo_texto.seek(0)
archivo_texto.seek(len(archivo_texto.read())/2)
print(archivo_texto.read())

archivo_texto.close()

archivo_texto = open("archivo.txt","r+") # lectura y escritura

lista_texto=archivo_texto.readlines();
lista_texto[1]="Esta línea a sido incluida desde el exterior \n"
archivo_texto.seek(0)
archivo_texto.writelines(lista_texto)
#asi se sobreescribira la segunda linea del archivo