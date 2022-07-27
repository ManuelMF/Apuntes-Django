#Polimosfirmo cambiar formas un objeto
#Un camion pasar a ser un coche o a un camion o una moto

class Coche():
	def desplazamiento(self):
		print("Me desplazo utilizando 4 ruedas")

class Moto():
	def desplazamiento(self):
		print("Me desplazo utilizando 2 ruedas")

class Camion():
	def desplazamiento(self):
		print("Me desplazo utilizando 6 ruedas")

miVehiculo = Moto()
miVehiculo.desplazamiento()

miVehiculo2 = Coche()
miVehiculo2.desplazamiento()

miVehiculo3 = Camion()
miVehiculo3.desplazamiento()

def desplazamientoVehiculo(Vehiculo):
	Vehiculo.desplazamiento()

desplazamientoVehiculo(miVehiculo)
desplazamientoVehiculo(miVehiculo2)
desplazamientoVehiculo(miVehiculo3)	