from tkinter import *
from tkinter import filedialog

root=Tk()

def abreFichero():
	# 												especificamos donde abrira      2 pos min
	fichero=filedialog.askopenfilename(title="Abrir",initialdir="C:", filetypes=(("Ficheros de Excel","*.xlsx"),("Ficheros de texto","*.txt"),("Todos los Archivos", "*.*")))
	print(fichero)                                                   #Especificamos tipo de archivo que buscara

Button(root, text="Abrir fichero", command=abreFichero).pack()

root.mainloop()