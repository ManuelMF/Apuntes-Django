'''
Uso de variables en un plantilla
queremos para una variable 
def 
    nombre='Manuel'

lo podremos hacer con el context que almacena diccionarios 
    ctx = Context({"nombre_persona":nombre})

ahora tendremos que rescatar el valor en el html
con {{nombre_persona}}

class Persona(object):
    def __init__(self,nombre,apellido):
        self.nombre=nombre
        self.apellido=apellido
ctx=Context({"nombre_persona":p1.nombre, "apellido_persona":p1.apellido})
'''