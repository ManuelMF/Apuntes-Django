from tkinter import *

raiz=Tk()
raiz.geometry("650x350")

# Creamos un Frame
miFrame=Frame()

# Hay que meterlo en la raiz 
miFrame.pack(
	#side="right",# se anclara a la derecha
	#anchor="n"# si le ponemos las 2 podemos ponerlo donde queramos n derecha ...
	#fill="x" #el frame se expande horizontalmente
	#fill="y",expand="True" #el frame se expande verticalmente
	#fill="both",expand="True" #el frame se expande completamente
	)

miFrame.config(bg="red")
miFrame.config(width="600", height="300")

# Le pones ancho al borde
miFrame.config(bd=10)
# tipo de borde
miFrame.config(relief="groove")

# Icono del cursor del raton 
miFrame.config(cursor="hand2")

raiz.mainloop()
