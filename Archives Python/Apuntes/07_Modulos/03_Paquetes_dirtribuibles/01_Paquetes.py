#para hacer paquetes distribuibles hay que ir a la carpeta raiz la de Archives pyton en este caso y ahi crear un setup.py que contendra una describcion del paquete que vamos a dirtribuir
#luego donde tengamos el archivo hacemos shift quick derecho y abri ventana en powershell
#nos abrá creado dist entrmamos y el paquete lo instalaremos en python c
# en powershel con el comando pip3 install pa y tabulador para que nos lo rellene  y ya estaria instalado

from Calculos.subpaquete_redondeo_potencia.Redondea_Potencia import *

print(potencia(5,5))
#ahora podemos ejecutar este archivo desde cualquier sitio 
# es capaz de leer el paquete desde cualquier lugar 
# este paquete instalado forma parte del python de nuestro sistema operativo

# para desinstalarlo 
#pip3 uninstall paquete+nombredelpaquete en este caso paqueteCalculos