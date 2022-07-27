#las caracteristicas de los label son aplicables a entry
from tkinter import *

raiz=Tk()



miFrame=Frame(raiz,width=1200, height=600)
miFrame.pack()

#CREAR ENTRY
labelNombre=Label(miFrame,text="Nombre:")
labelNombre.grid(row=0,column=0, sticky="e", padx=10, pady=10)
EntryNombre=Entry(miFrame)
#metodo grid() es como una tabla en la interfaz con tanta filas y columnas como queramos para diverdir la interfaz en casillas
EntryNombre.grid(row=0,column=1, padx=10, pady=10)#parametros row column
EntryNombre.config(fg="red", justify="center")


labelPass=Label(miFrame,text="Contaseña:")
labelPass.grid(row=1,column=0, sticky="e", padx=10, pady=10)
EntryPass=Entry(miFrame)
EntryPass.grid(row=1,column=1, padx=10, pady=10)
EntryPass.config(show="*")

labelApellido=Label(miFrame,text="Apellido:")
labelApellido.grid(row=2,column=0, sticky="e", padx=10, pady=10)
EntryApellido=Entry(miFrame)
EntryApellido.grid(row=2,column=1, padx=10, pady=10)#parametros row column

labeldireccion=Label(miFrame,text="Dirección:")
labeldireccion.grid(row=3,column=0, sticky="e", padx=10, pady=10)
Entrydireccion=Entry(miFrame)
Entrydireccion.grid(row=3,column=1, padx=10, pady=10)#parametros row column

# sticky permite decir si queremos el texto arriba abajo derecha izquierda "N s w e " "ne se sw nw"
# Pady padx distancia que hay entre el texto del elemento y el limite del contenedor del elemento

raiz.mainloop()