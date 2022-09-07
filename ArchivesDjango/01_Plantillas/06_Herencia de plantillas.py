''' Herencia de plantillas
consiste en crear una plantilla padre que va a seguir todas las hijas

se crea una plantilla que siempre tiene una cabecera y un pie de pag
y a esa cabecera padre se le dice que la zona central va a ser un contenido o un bloque cambiante
y el resto de plantilla hereda la cabezera y el pie

--platilla padre

<html>
    <head>

        <title>
            <!-- le decimos que dentro de block hay un texto que puede cambiar-->
            {% block title %} {% endblock %}

        </title>

    </head>

    <body>

        <h1>Píldoras informáticas</h1>
        <h3>Cursos de programacíon, ofimática y diseño web</h3>

        {% block content %}

        {% endblock %}

        <p>Cursos gratuitos. Gracias por su visita</p>
    </body>
</html>

--plantilla hija

{% extends "base.html" %}

<!-- Cambia el titulo y el contenido para indicarselo hacemos lo sigiente

-->
{% block title %} Curso c# {% endblock %}

{% block content %}

<p> Estamos a día: {{dameFecha}}</p>

<iframe width="560" height="315" src="https://www.youtube.com/embed/d1-UX6aR_TM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

{% endblock %}

CON ESTO YA TENEMOS LAS PLATILLAS
TENEMOS QUE REGISTRAR LA VISTA
Y LA URL PARA VISITAR LA PAGINA

Registro la vista en views
def cursoC(request):
    fecha_actual=datetime.datetime.now()
    return render(request,"CursoC.html",{"dameFecha":fecha_actual})

Registro la url 
importo la vista
from Proyecto1.views import cursoC

y en urlpatterns = [ añado
path('cursoC/', cursoC)
'''