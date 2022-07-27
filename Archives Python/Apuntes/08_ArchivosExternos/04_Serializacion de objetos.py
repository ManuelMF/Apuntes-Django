import pickle

class Vehiculos():

	def __init__(self, marca, modelo):
		self.marca=marca
		self.modelo=modelo
		self.enmarcha=False
		self.acelera=False
		self.frena=False

	def arrancar(self):
		self.enmarcha=True

	def acelerar(self):
		self.acelera=True

	def frenar(self):
		self.frena=True

	def estado(self):
		print("Marca: ", self.marca, "\nModelo: ", self.modelo, "\nEn Marcha: ", self.enmarcha, "\nAcelerando: ",self.acelera, "\nFrenando: ", self.frena)

# GUARDAR OBJETOS
coche1 = Vehiculos("Tesla","model1")

coche2 = Vehiculos("BMW","Serie1")

coche3 = Vehiculos("Audi","A1")

coche4 = Vehiculos("Peugeot","206")

coches = [coche1,coche2,coche3,coche4]

fichero = open("losCoches", "wb")

pickle.dump(coches, fichero) # nombre de la coleccion , nombre del fichero dodne va la coleccion

fichero.close()

# CARGAR OBJETOS

fichero_apertura = open("losCoches", "rb")

miscoches = pickle.load(fichero_apertura)

fichero_apertura.close()

for c in miscoches:
	print(c.estado())

