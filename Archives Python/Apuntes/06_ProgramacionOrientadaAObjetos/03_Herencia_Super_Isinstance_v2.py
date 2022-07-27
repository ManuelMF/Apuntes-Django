class Persona():
	def __init__(self,nombre,edad,lugar_Residencia):
		self.nombre=nombre
		self.edad=edad
		self.lugar_Residencia=lugar_Residencia

	def descripcion(self):
		print("Nombre: ",self.nombre, " Edad: ",self.edad," Lugar de residencia: ", self.lugar_Residencia )


class Empleado(Persona):
	def __init__(self, salario, antiguedad,nombre_em,edad_em,residencia_em):
		#Utilizamos super para enviar los datos a el constructor de Empleado porque sino no podriamos usar sus cosas
		# llama al metodo de la clase padra, le decimos que ejecute el metodo init y le damos los datos
		super().__init__(nombre_em,edad_em,residencia_em)
		self.salario=salario
		self.antiguedad=antiguedad
	def descripcion(self):
		super().descripcion() #llamamos a descripcion y le añadimos el resto
		print(" Salario: ",self.salario," Antiguedad: ", self.antiguedad)

Antonio = Persona("Antonio",55,"España")

Antonio.descripcion()

Pepe=Empleado(45000,2,"Pepe",25,"España")
Pepe.descripcion()

#Isinstance sirve para saber si un objeto es instacia de una clase determinada , devuelve true o false
print(isinstance(Pepe,Empleado))
print(isinstance(Pepe,Persona))
# Como podemos ver este objeto es empleado y persona ya que nos da true
print(isinstance(Antonio,Empleado))
# Antonio no es empleado y da false
