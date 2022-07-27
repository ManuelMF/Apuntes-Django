import pickle

class Persona:

	def __init__(self,nombre,genero,edad):
		self.nombre=nombre
		self.genero=genero
		self.edad=edad
		print("Se ha creado una persona nueva con el nombre de ", self.nombre)

	def __str__(self): #combierte en texto un objeto
		return "{} {} {}".format(self.nombre, self.genero, self.edad)

class ListaPersonas:
	personas=[]

	def __init__(self):
		listaDePersonas=open("ficheroExterno","ab+")
		listaDePersonas.seek(0)

		try:#por si está vacía
			self.personas = pickle.load(listaDePersonas)
			print("Se cargaron {} personas del fichero externo".format(len(self.personas)))

		except:
			print("El fichero está vacío")
		finally:
			listaDePersonas.close()
			del(listaDePersonas)

	def addPersonas(self,persona):
		self.personas.append(persona)
		self.guardarPersonasEnFicheroExterno()

	def guardarPersonasEnFicheroExterno(self):
		listaDePersonas=open("ficheroExterno","wb")
		pickle.dump(self.personas, listaDePersonas)
		listaDePersonas.close()
		del(listaDePersonas)

	def mostrarInfoFicheroExterno(self):
		print("La información del fichero externo es la siguiente:")
		for p in self.personas:
			print(p)

milista=ListaPersonas()

p1=Persona("Sandra","Femenino",29)
p2=Persona("Paolo","Masculino",23)
p3=Persona("Rulo","Masculino",24)

milista.addPersonas(p1)
milista.addPersonas(p2)
milista.addPersonas(p3)

milista.mostrarInfoFicheroExterno()





