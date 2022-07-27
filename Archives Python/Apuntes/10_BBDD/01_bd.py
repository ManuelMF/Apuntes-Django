import sqlite3
# Abrir Crear una conexion

miConexion=sqlite3.connect("01_PrimeraBase")

#Crear cursor
miCursor=miConexion.cursor()

#Ejecutar una query
miCursor.execute("CREATE TABLE productos (nombre_articulo varchar(50),precio integer,seccion varchar(20))")

#Cerrar conexion

miConexion.close()