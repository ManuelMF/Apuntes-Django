# SINTAXIS
# variableLabel = Label(contenedor, opciones)
#algunas opciones
# Text = pone texto Image muestra imagen en lugar de texto Bg color del fondo...

from tkinter import *

root=Tk()
miFrame=Frame(root,width=1200,height=1000)
miFrame.pack()

# LABEL
miLabel = Label(miFrame, text="Hola alumnos de Python")
#Si usasemos pack cogeria el frame entero asi que le ponemos place con x y
miLabel.place(x=100,y=100)

#Abreviar si no la vamos a usar mas
Label(miFrame, text="Texto abreviado",fg="red",bg="blue",font=("Comic Sans MS",18)).place(x=200,y=200)

# IMAGEN
miImagen=PhotoImage(file="fotos/AK-47.png")
Label(miFrame, image= miImagen).place(x=100, y=300)
root.mainloop()