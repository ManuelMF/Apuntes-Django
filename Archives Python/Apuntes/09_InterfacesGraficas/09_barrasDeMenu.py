from tkinter import *

root = Tk()
#BARRA MENU
barraMenu = Menu(root) # ponemos en el menu del root la barra de menu
root.config(menu=barraMenu, width=300, height=300)

#VARIABLES
#quitar ----- que sale por defecto
archivoMenu=Menu(barraMenu, tearoff=0)

#SUBVARIABLES
archivoMenu.add_command(label="Nuevo")
archivoMenu.add_command(label="Guardar")
archivoMenu.add_command(label="Guardar como")
# crear barra separadora hay que situarse donde queramos hacerlo
archivoMenu.add_separator()
archivoMenu.add_command(label="Cerrar")
archivoMenu.add_command(label="Salir")

archivoEdicion=Menu(barraMenu, tearoff=0)
archivoEdicion.add_command(label="Copiar")
archivoEdicion.add_command(label="Cortar")
archivoEdicion.add_command(label="Pegar")

archivoHerramientas=Menu(barraMenu, tearoff=0)

archivoAyuda=Menu(barraMenu, tearoff=0)
archivoAyuda.add_command(label="Licencia")
archivoAyuda.add_command(label="Acerca de...")

#TEXTO DE LAS VARIABLES
#falta decirle cual es el texto de estas variables (ahora no saldria nada)
barraMenu.add_cascade(label="Archivo",menu=archivoMenu)
barraMenu.add_cascade(label="Edicion",menu=archivoEdicion)
barraMenu.add_cascade(label="Herramientas",menu=archivoHerramientas)
barraMenu.add_cascade(label="Ayuda",menu=archivoAyuda)

root.mainloop()