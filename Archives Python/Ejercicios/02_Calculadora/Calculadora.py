from tkinter import *

raiz = Tk()

miFrame = Frame(raiz)

miFrame.pack()

# -- Controlador --

# numeros

def Boton7():
	texto = pantalla.get()
	if texto[0]=="0":
		pantalla.delete(0,"end")
		pantalla.insert(END, "7")
	else:	
		pantalla.insert(END, "7")

def Boton8():
	texto = pantalla.get()
	if texto[0]=="0":
		pantalla.delete(0,"end")
		pantalla.insert(END, "8")
	else:	
		pantalla.insert(END, "8")

def Boton9():
	texto = pantalla.get()
	if texto[0]=="0":
		pantalla.delete(0,"end")
		pantalla.insert(END, "9")
	else:	
		pantalla.insert(END, "9")

def Boton4():
	texto = pantalla.get()
	if texto[0]=="0":
		pantalla.delete(0,"end")
		pantalla.insert(END, "4")
	else:	
		pantalla.insert(END, "4")

def Boton5():
	texto = pantalla.get()
	if texto[0]=="0":
		pantalla.delete(0,"end")
		pantalla.insert(END, "5")
	else:	
		pantalla.insert(END, "5")

def Boton6():
	texto = pantalla.get()
	if texto[0]=="0":
		pantalla.delete(0,"end")
		pantalla.insert(END, "6")
	else:	
		pantalla.insert(END, "6")

def Boton1():
	texto = pantalla.get()
	if texto[0]=="0":
		pantalla.delete(0,"end")
		pantalla.insert(END, "1")
	else:	
		pantalla.insert(END, "1")

def Boton2():
	texto = pantalla.get()
	if texto[0]=="0":
		pantalla.delete(0,"end")
		pantalla.insert(END, "2")
	else:	
		pantalla.insert(END, "2")

def Boton3():
	texto = pantalla.get()
	if texto[0]=="0":
		pantalla.delete(0,"end")
		pantalla.insert(END, "3")
	else:	
		pantalla.insert(END, "3")

def Boton0():
	texto = pantalla.get()
	if texto[0]!="0":
		pantalla.insert(END, "0")

def Botoncoma():
	texto = pantalla.get()
	m=texto.rfind("x")
	d=texto.rfind("÷")
	s=texto.rfind("+")
	r=texto.rfind("-")
	
	numeros = [m,d,s,r]
	numeros.sort(reverse=True)
	cal=numeros[0]
	print(cal)
	num=texto[cal+1:]
	print(num)
	print(num.find("."))
	if num.find(".") == -1:
		if len(num)>0:
			if len(num)==1 and num=="0":
				pass
			else:	
				pantalla.insert(END, ".")
	
def Botonigual():

	texto = pantalla.get()

	while True:
		contador = 0

		x1=texto.find("x")
		x2=texto.find("÷")

		if x1 != -1 or x2 != -1:

			for i in texto:

				contador = contador + 1

				if i == "x" or i == "÷":

					#numero anterior
					numeroAnt = texto[:contador-1]
					cal=0

					suma=numeroAnt.rfind("+")
					res=numeroAnt.rfind("-")
					mul=numeroAnt.find("x")
					div=numeroAnt.find("÷")

					numeros = [suma,res,mul,div]
					numeros.sort(reverse=True)
					cal=numeros[0]

					priNum=texto[cal+1:contador-1]

					#numero posterior
					numeroPos = texto[contador:]
					cal2=0

					suma=numeroPos.find("+")
					res=numeroPos.find("-")
					mul=numeroPos.find("x")
					div=numeroPos.find("÷")

					if suma==-1:
						suma=10000
					if res==-1:
						res=10000
					if mul==-1:
						mul=10000
					if div==-1:
						div=10000

					numeros = [suma,res,mul,div]
					numeros.sort()
					cal2=numeros[0]
						
					segNum = texto[contador:contador+cal2]
						
					#Calculo
					calculo=0

					if i=="x":
						calculo = float(priNum)*float(segNum)
						#calculo = float(5.0)*float(5.0)
					else:
						calculo = float(priNum)/float(segNum)

					texto=texto[:cal+1]+str(calculo)+texto[contador+cal2:]
					break
		else:
			for i in texto:
				contador = contador + 1

				if i == "+" or i == "-":
					#Numero anterior
					numeroAnt2 = texto[:contador-1]
					cal=0

					suma=numeroAnt2.rfind("+")
					res=numeroAnt2.rfind("-")
					mul=numeroAnt2.find("x")
					div=numeroAnt2.find("÷")
 
					numeros = [suma,res,mul,div]
					numeros.sort(reverse=True)
					cal=numeros[0]
					
					priNum=texto[cal+1:contador-1]

					#Numero post
					numeroPos2 = texto[contador:]
					cal2=0

					suma=numeroPos2.find("+")
					res=numeroPos2.find("-")
					mul=numeroPos2.find("x")
					div=numeroPos2.find("÷")

					if suma==-1:
						suma=10000
					if res==-1:
						res=10000
					if mul==-1:
						mul=10000
					if div==-1:
						div=10000

					numeros = [suma,res,mul,div]
					numeros.sort()					
					cal2=numeros[0]
						
					segNum = texto[contador:contador+cal2]
						
					#Caculo
					calculo=0.0
					if i=="+":
						calculo = float(priNum)+float(segNum)
					else:
						calculo = float(priNum)-float(segNum)
						
					texto=texto[:cal+1]+str(calculo)+texto[contador+cal2:]
					break
		x=0
		for i in texto:
			if i == "+" or i == "-" or i == "x" or i == "÷":
				x=1
		if x == 0:
			pantalla.delete(0,"end")
			pantalla.insert(END,texto)
			break
				
# funciones
def Botondiv():
	pantalla.insert(END, "÷")
def Botonmul():
	pantalla.insert(END, "x")
def Botonres():
	pantalla.insert(END, "-")
def Botonsum():
	pantalla.insert(END, "+")
# -----------------

# --- Vista ---

# -- Pantalla --
pantalla = Entry(miFrame)
pantalla.grid(row=1, column=1, padx=10,pady=10, columnspan=4)
pantalla.config(background="black", fg="#03f943", justify="right", width="20")
pantalla.insert(END, "0")

# -- Primera fila 7 8 9 ÷--
btn7 = Button(miFrame,text="7",width=3, command=Boton7)
btn7.grid(row=2,column=1)
btn8 = Button(miFrame,text="8",width=3, command=Boton8)
btn8.grid(row=2,column=2)
btn9 = Button(miFrame,text="9",width=3, command=Boton9)
btn9.grid(row=2,column=3)
btndiv = Button(miFrame,text="÷",width=3, command=Botondiv)
btndiv.grid(row=2,column=4)

# -- segunda fila 4 5 6 *--
btn4 = Button(miFrame,text="4",width=3, command=Boton4)
btn4.grid(row=3,column=1)
btn5 = Button(miFrame,text="5",width=3, command=Boton5)
btn5.grid(row=3,column=2)
btn6 = Button(miFrame,text="6",width=3, command=Boton6)
btn6.grid(row=3,column=3)
btnmult = Button(miFrame,text="x",width=3, command=Botonmul)
btnmult.grid(row=3,column=4)

# -- tercera fila 1 2 3 - --
btn1 = Button(miFrame,text="1",width=3, command=Boton1)
btn1.grid(row=4,column=1)
btn2 = Button(miFrame,text="2",width=3, command=Boton2)
btn2.grid(row=4,column=2)
btn3 = Button(miFrame,text="3",width=3, command=Boton3)
btn3.grid(row=4,column=3)
btnres = Button(miFrame,text="-",width=3, command=Botonres)
btnres.grid(row=4,column=4)

# -- cuarta fila , 0 = + --
btncomma = Button(miFrame,text=",",width=3, command=Botoncoma)
btncomma.grid(row=5,column=1)
btn0 = Button(miFrame,text="0",width=3, command=Boton0)
btn0.grid(row=5,column=2)
btnIgual = Button(miFrame,text="=",width=3, command=Botonigual)
btnIgual.grid(row=5,column=3)
btnSum = Button(miFrame,text="+",width=3, command=Botonsum)
btnSum.grid(row=5,column=4)

raiz.mainloop()

# -------------

# Modelo

# -------------

