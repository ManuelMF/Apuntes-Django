#Herencia
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


class Moto(Vehiculos):
	hCaballito=""

	def Caballito(self):
		self.hCaballito="Voy haciendo el caballito"# si aqui no me aplico el self. no se añadira a la variable de hcaballito

	# Para poder poner en el estado si estoy haciendo el caballito tengo que sobre escribir el metodo que tiene que tener el mismo nombre y el mismo numero de caracteres para que los sobre escriba bien
	def estado(self):
		print("Marca: ", self.marca, "\nModelo: ", self.modelo, "\nEn Marcha: ", self.enmarcha, "\nAcelerando: ",self.acelera, "\nFrenando: ", self.frena, "\nHace el caballito?", self.hCaballito)

class Furgoneta(Vehiculos):
# el constructor sera el de vehiculos ya que no tiene
	def carga(self,cargar):
		self.cargado=cargar
		if self.cargado:
			return "La furgoneta está cargada"
		else:
			return "La furgoneta no está cargada"
	def estado(self):
		print("Marca: ", self.marca, "\nModelo: ", self.modelo, "\nEn Marcha: ", self.enmarcha, "\nAcelerando: ",self.acelera, "\nFrenando: ", self.frena, "\nCarga: ", self.cargado)

class VElectricos(Vehiculos):

	def __init__(self,marca,modelo):
		
		super().__init__(marca,modelo)

		self.autonomia=100

	def cargarEnergia(self):
		self.cargando=True

#HERENCIA MULTIPLE
class BicicletaElectrica(VElectricos,Vehiculos):
	#Hereda todos los metodos y todas las propiedades del las dos clases
	pass
	#se le da preferencia a la primera clase que pongamos para el contructor



#Moto1=Moto("Honda","CBR")
#Moto1.Caballito()
#Moto1.estado()

#Furgoneta1 = Furgoneta("Renault","Kango")
#Furgoneta1.arrancar()
#Furgoneta1.carga(True)
#Furgoneta1.estado()

#bici1 = BicicletaElectrica("Orbea","2020")
#Tesla = VElectricos("Tesla","Model 1")
#bici1.arrancar()
#bici1.estado()