class Coche():
	
	def __init__(self): 
		self.largoChasis=250
		self.__anchoChasis=120
		self.__ruedas=4
		self.__enMarcha=False

	def arrancar(self,arrancamos):
		self.__enMarcha = arrancamos
		
		if self.__enMarcha :
			chequeo=self.__chequeo_interno()

		if(self.__enMarcha and chequeo):
			return "El coche esta en marcha"
		elif self.__enMarcha and chequeo==False:
			return "Algo a ido mal en el chequeo. No podemos arrancar"
		else:
			return "El coche esta parado"
	def estado(self):
		print("El coche tiene ", self.__ruedas, " ruedas. Un ancho de " , self.__anchoChasis, " y un largo de ", self.largoChasis)

	
	def __chequeo_interno(self): #el poner __ hace que no se pueda ejecutar desde fuera
		print("Realizando chequeo interno")
		self.gasolina="ok"
		self.aceite="ok"
		self.puertas="cerradas"

		if self.gasolina=="ok" and self.aceite=="ok" and self.puertas=="cerradas":
			return True
		else:
			return False


miCoche = Coche() 
print("El largo del coche es:", miCoche.largoChasis)
print(miCoche.arrancar(True))
miCoche.estado()

print(segCoche.__chequeo_interno())# esto no se puede hacer ya que no tiene sentido hacer un chequeo con el coche encendido 
# Por eso voy a encapsular el metodo asi solo se podra usar desde dentro de la clase