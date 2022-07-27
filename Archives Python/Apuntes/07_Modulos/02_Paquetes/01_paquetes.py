#Paquetes
# un paquete es un directorio donde se almacena modulos relacionados entre si
# sirven para organizar y reutilizar los modulos

#para crear un paquete hay que crear una carpeta con un archivo __init__.py

#USO MODULO DE CALCULO
#from Calculos.Calculos_Generales import *

#print(dividir(20,5))

#estoy importando las clases de un paquete 

#uso subpaquetes basico y redondeo
from Calculos.subpaquete_basicos.Operaciones_Basicas import *

print(sumar(4,5))

from Calculos.subpaquete_redondeo_potencia.Redondea_Potencia import *

print(potencia(5,25))