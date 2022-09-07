from django.shortcuts import render
from django.http import HttpResponse
from gestionPedidos.models import Articulos
from django.core.mail import send_mail
from django.conf import settings
from gestionPedidos.forms import FormularioContacto

# Create your views here.

def busqueda_productos(request):
    return render(request, "busqueda_productos.html")

def buscar(request):               #coge el request que es donde va la info hace un get de donde va la info y ponemos prd porque es el nombre que le pusimos a la variable 
    if request.GET["prd"]:
        
        #mensaje="Atículo buscado: %r" %request.GET["prd"]
        producto = request.GET["prd"]
        if len(producto)>20:
            mensaje="Texto de búsqueda demasiado largo"
        else:
            #da una lista
            articulos = Articulos.objects.filter(nombre__icontains=producto)
            return render(request, "resultados_busqueda.html", {"articulos":articulos, "query":producto})

    else:
        mensaje="No has introducido nada"
    return HttpResponse(mensaje)

#def contacto(request):
    # la primera vez que lo ejecutamos no entra en el if pero cuando le damos a enter en el html le pusimos que nos enviara a la vista de contacto y entrariamos con el post y nos llevaria a gracias.html
    #si recibe el metodo post entrara  <!-- post para que se nos envie los datos-->
    if request.method=="POST":

        subject = request.POST["asunto"]

        message = request.POST["mensaje"]+ " " + request.POST["email"]

        email_from = settings.EMAIL_HOST_USER

        recipient_list=["mmf19500@gmail.com"]

        send_mail(subject, message, email_from, recipient_list)

        return render(request, "gracias.html")

    return render(request, "contacto.html")

#con la API
def contacto(request):
    
    if request.method=="POST":
        miFormulario=FormularioContacto(request.POST)
        # guardo todo en miFormulario

        if miFormulario.is_valid():
            infFrom=miFormulario.cleaned_data
            #guardamos la info
                                                                        #email tuyo y donde va 
            send_mail(infFrom['asunto'],infFrom['mensaje'],infFrom.get('email',''),['mmf19500@gmail.com'],)
            
            return render(request, "gracias.html")
        
    else:
        #para que cuando entremos por 1 vez lo cree vacio
        miFormulario=FormularioContacto()
    
    return render(request, "formulario_contacto.html", {"form":miFormulario})
