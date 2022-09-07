from django.http import HttpResponse
import datetime
from django.template import Template, Context
#CARGADOR DE PLANTILLAS
#para acortarlo hay que importar 
from django.template import loader
#tiene el metodo loader.get_template() que permite importar plantillas mas facilmente

from django.shortcuts import render

class Persona(object):
    def __init__(self,nombre,apellido):
        self.nombre=nombre
        self.apellido=apellido

def saludo(request): #primera vista que devuelve una respuesta que suelta este texto
    p1=Persona("Profesor Juan","Díaz")
    lista = ["Plantillas","Modelos","Formularios","Vistas","Despliege"]
    ahora = datetime.datetime.now()

    #doc_externo=loader.get_template('miplantilla.html')
    #documento=doc_externo.render({"nombre_persona":p1.nombre, "apellido_persona":p1.apellido, "Fecha":ahora, "lista_temas":lista})
    #return HttpResponse(documento)

    # se simplifica a  
                        # plantilla           diccionario
    return render(request,"miplantilla.html", {"nombre_persona":p1.nombre, "apellido_persona":p1.apellido, "Fecha":ahora, "lista_temas":lista}  )

def cursoC(request):
    fecha_actual=datetime.datetime.now()
    return render(request,"CursoC.html",{"dameFecha":fecha_actual})

def cursoCss(request):
    fecha_actual=datetime.datetime.now()
    return render(request,"CursoCss.html",{"dameFecha":fecha_actual})

def despedida(request):  
    return HttpResponse("Hasta luego")

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
