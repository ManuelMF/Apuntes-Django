from tkinter import *

raiz=Tk()


#poner titulo
raiz.title("Ventana de prueba")

# impedir que se pueda mover el tamaño
raiz.resizable(0,0) # es lo mismo que poner false false

#poner icono para eso hay que tener un archivo .ico
# y especificar la ruta
raiz.iconbitmap("fotos/icono.ico")

#Especificar tamaño
raiz.geometry("650x350")

#Fondo de color
raiz.config(bg="blue")

#es el ultimo
raiz.mainloop()

#para que no salga la consola tenemos que poner la estension .pyw