from django.http import HttpResponse
import datetime
from django.template import Template, Context

class Persona(object):
    def __init__(self,nombre,apellido):
        self.nombre=nombre
        self.apellido=apellido

def saludo(request): #primera vista que devuelve una respuesta que suelta este texto
    p1=Persona("Profesor Juan","Díaz")
    lista = ["Plantillas","Modelos","Formularios","Vistas","Despliege"]
    ahora = datetime.datetime.now()

    doc_externo=open("C:/Users/mmf19/OneDrive/Escritorio/ArchivesDjango/Proyecto1/Proyecto1/plantillas/miplantilla.html")

    plt = Template(doc_externo.read())

    doc_externo.close()

    ctx=Context({"nombre_persona":p1.nombre, "apellido_persona":p1.apellido, "Fecha":ahora, "lista_temas":lista})

    documento=plt.render(ctx)

    return HttpResponse(documento)
# urls es una tabla de contenidos donde le meteremos el enlace

def despedida(request): 
    return HttpResponse("Hasta luego")

#mostrar hora y fecha actuales
def dameFecha(request):
    fecha_actual=datetime.datetime.now()
    documento="""
    <html>
        <body>
            <h2>
                Fecha y hora actuales %s
            </h2>
        </body>
    </html>
    """ % fecha_actual

    return HttpResponse(documento)

#calcular la edad en el futuro, tiene que recibir el parametro año
def calculaEdad(request,edad,agno):

    date = datetime.date.today()
    year = int(date.strftime("%Y"))

    periodo=agno-year

    edadFutura=edad+periodo

    documento="""
    <html>
        <body>
            <h2>
                En el año %s tendrás %s años
            </h2>
        </body>
    </html>
    """ % (agno,edadFutura)
    return HttpResponse(documento)
