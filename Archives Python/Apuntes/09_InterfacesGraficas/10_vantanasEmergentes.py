from tkinter import *
#hay que importarlas
from tkinter import messagebox

root = Tk()
# ABRIREMOS VENTANAS EMERGENTES CON LOS BOTONES DEL MENU
barraMenu = Menu(root) 
root.config(menu=barraMenu, width=300, height=300)

def infoAdicional():
	messagebox.showinfo("Procesador de Juan","Procesador de textos version 2018")
#modificar la estructura de esa ventana
def avisoLicencia():
	messagebox.showwarning("Licencia", "Producto bajo licencia GNU")
def salirApp():
	#respuesta=messagebox.askquestion("Salir", "¿Deseas salir de la aplicacion?")
	
	#Para que salga aceptar o cancelar pero devuelve true o false 
	respuesta=messagebox.askokcancel("Salir", "¿Deseas salir de la aplicacion?")
	#if respuesta=="yes":
	if respuesta==True:
		root.destroy()
def cerrarDocumento():
	respuesta=messagebox.askretrycancel("Reintentar", "No es posible cerrar. Documento bloqueado")
	if respuesta==False:
		root.destroy()

archivoMenu=Menu(barraMenu, tearoff=0)
archivoMenu.add_command(label="Nuevo")
archivoMenu.add_command(label="Guardar")
archivoMenu.add_command(label="Guardar como")
archivoMenu.add_separator()
archivoMenu.add_command(label="Cerrar", command=cerrarDocumento)
archivoMenu.add_command(label="Salir",command=salirApp)

archivoEdicion=Menu(barraMenu, tearoff=0)
archivoEdicion.add_command(label="Copiar")
archivoEdicion.add_command(label="Cortar")
archivoEdicion.add_command(label="Pegar")

archivoHerramientas=Menu(barraMenu, tearoff=0)

archivoAyuda=Menu(barraMenu, tearoff=0)
archivoAyuda.add_command(label="Licencia",command=avisoLicencia)
archivoAyuda.add_command(label="Acerca de...", command=infoAdicional)
barraMenu.add_cascade(label="Archivo",menu=archivoMenu)
barraMenu.add_cascade(label="Edicion",menu=archivoEdicion)
barraMenu.add_cascade(label="Herramientas",menu=archivoHerramientas)
barraMenu.add_cascade(label="Ayuda",menu=archivoAyuda)

root.mainloop()