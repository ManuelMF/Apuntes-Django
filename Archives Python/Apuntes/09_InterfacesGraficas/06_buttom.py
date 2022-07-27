from tkinter import *

raiz=Tk()

miFrame=Frame(raiz,width=1200, height=600)
miFrame.pack()

minombre=StringVar()#indicarle que se trada de una cadena de caracteres para el dep

labelNombre=Label(miFrame,text="Nombre:")
labelNombre.grid(row=0,column=0, sticky="e", padx=10, pady=10)
EntryNombre=Entry(miFrame, textvariable=minombre) #textvariable se usa para que este asociado a la variable que acabamos de crear
EntryNombre.grid(row=0,column=1, padx=10, pady=10)
EntryNombre.config(fg="red", justify="center")

labelPass=Label(miFrame,text="Contaseña:")
labelPass.grid(row=1,column=0, sticky="e", padx=10, pady=10)
EntryPass=Entry(miFrame)
EntryPass.grid(row=1,column=1, padx=10, pady=10)
EntryPass.config(show="*")

labelApellido=Label(miFrame,text="Apellido:")
labelApellido.grid(row=2,column=0, sticky="e", padx=10, pady=10)
EntryApellido=Entry(miFrame)
EntryApellido.grid(row=2,column=1, padx=10, pady=10)

labeldireccion=Label(miFrame,text="Dirección:")
labeldireccion.grid(row=3,column=0, sticky="e", padx=10, pady=10)
Entrydireccion=Entry(miFrame)
Entrydireccion.grid(row=3,column=1, padx=10, pady=10)

# CREAR TEXT
labelComentario=Label(miFrame,text="Comentarios:")
labelComentario.grid(row=4,column=0, sticky="e", padx=10, pady=10)
TextComentario=Text(miFrame, width=16, height=5)#lo crea muy grande asi que ponemos width and height
TextComentario.grid(row=4,column=1, padx=10, pady=10)

scrollVert=Scrollbar(miFrame, command=TextComentario.yview)
scrollVert.grid(row=4,column=2, sticky="nsew")
TextComentario.config(yscrollcommand=scrollVert.set)

def codigoBoton():
	minombre.set("Manuel")
	#obtener info de un texto get

# CREAR BOTON
btnEnvio = Button(raiz,text="Enviar", command=codigoBoton)#ejecutara esta funcion al pulsarlo
btnEnvio.pack()

raiz.mainloop()

