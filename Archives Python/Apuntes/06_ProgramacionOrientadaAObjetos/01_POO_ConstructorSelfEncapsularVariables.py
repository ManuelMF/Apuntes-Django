class Coche():
	
	def __init__(self): #constructor
		#para que no las pueda modificar desde fuera tengo que encapsularlas con __
		self.largoChasis=250
		self.__anchoChasis=120
		self.__ruedas=4
		self.__enMarcha=False

	def arrancar(self,arrancamos):#self es como this
		self.__enMarcha = arrancamos

		self.__enMarcha=True
		
		if(self.__enMarcha):
			return "El coche esta en marcha"
		else:
			return "El coche esta parado"
	def estado(self):
		print("El coche tiene ", self.__ruedas, " ruedas. Un ancho de " , self.__anchoChasis, " y un largo de ", self.largoChasis)

	
miCoche = Coche() 

print("El largo del coche es:", miCoche.largoChasis)

miCoche.estado()
print(miCoche.arrancar(True))

print("Creamos otro coche")

segCoche = Coche()
print(segCoche.arrancar(False))

segCoche.__ruedas=2 # no se modifica ya que las he hecho privadas con el __
segCoche.estado()