'''
Formulario
El ordenador al darle clik manda un Reques que son los datos y los manda al servidor

primero tendremos que crear el formulario 
creamos una carpeta templates 
creamos el formulario
<!-- cuando pulsemos el boton enter le decimos que ira a una direcion buscar -->
        <form acction="/buscar/" method="GET">
                                <!-- method dice como va a ir la info get significa que en la url-->
            
            <input type="text" name="prd">
            <input type="submit" value="Buscar">

        </form>   


Tenemos que crear una vista que nos lleve a este formulario
vamos a views
creamos un def         recibe el parametro request ya que es el paquete que recibe del fomulario
def busqueda_productos(request):
    return render(request, "busqueda_productos.html")

Ahora tenemos que registrar la url
vamos a urls
importamos views
from gestionPedidos import views

en urlpatterns = [  añadimos 
path('busqueda_productos/', views.busqueda_productos),

Ahora creamos otra vista para que nos confirme si la info que introducimos llega o no llega
from django.http import HttpResponse

def buscar(request):               #coge el request que es donde va la info hace un get de donde va la info y ponemos prd porque es el nombre que le pusimos a la variable 
    mensaje="artículo buscado: %r" %request.GET["prd"]
    return HttpResponse(mensaje)

'''