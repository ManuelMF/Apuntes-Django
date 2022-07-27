from tkinter import *

raiz = Tk()

miFrame = Frame(raiz)

miFrame.pack()

#variable global
operacion=""

# funciones
def Botonsum(num1,num2):
	global operacion

	

	operacion=num1+num2
	pantalla.insert(END, operacion)
# -----------------

# --- Vista ---

# -- Pantalla --
pantalla = Entry(miFrame)
pantalla.grid(row=1, column=1, padx=10,pady=10, columnspan=4)
pantalla.config(background="black", fg="#03f943", justify="right", width="20")
pantalla.insert(END, "0")

# llamar a la funcion y mandarle dos variables
btnSum = Button(miFrame,text="+",width=3, command=lambda:Botonsum(4,5))
btnSum.grid(row=5,column=4)

raiz.mainloop()

# -------------

# Modelo

# -------------

