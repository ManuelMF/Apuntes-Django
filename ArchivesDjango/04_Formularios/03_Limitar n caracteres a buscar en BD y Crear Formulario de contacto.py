'''
-- Limitar n caracteres a buscar en BD 
si pusieramos un texto muy grande en la busqueda relentizaria el servidor por eso lo vamos a topar
lo meteriamos en un if

def buscar(request):              
    if request.GET["prd"]:
        
        producto = request.GET["prd"]
        if len(producto)>20:
            mensaje="Texto de búsqueda demasiado largo"
        else:
            articulos = Articulos.objects.filter(nombre__icontains=producto)
            return render(request, "resultados_busqueda.html", {"articulos":articulos, "query":producto})

    else:
        mensaje="No has introducido nada"
    return HttpResponse(mensaje)



-- Crear Formulario de contacto
crear la vista
def contacto(request):
    # la primera vez que lo ejecutamos no entra en el if pero cuando le damos a enter en el html le pusimos que nos enviara a la vista de contacto y entrariamos con el post y nos llevaria a gracias.html
    # si recibe el metodo post entrara  <!-- post para que se nos envie un correo electronico-->
    if request.method=="POST":
        return render(request, "gracias.html")
    return render(request, "contacto.html")

poner la url
path('contacto/', views.contacto),
vistas crear la vista
<html>
    <head>
        <title>Contactar</title>
    </head>

    <body>

        <h1>Contáctanos</h1>
        <!-- formulario que va a la vista contacto      es para seguridad   -->
        <form action="/buscar/" method="POST">          {%csrf_token %}
                                <!-- post para que se nos envie los datos-->
            <p>Asunto: <input type="text" name="asunto"/></p>
            <p>EMail: <input type="text" name="email"/></p>
            <p>Mensaje: <textarea name="mensaje" rows="15" cols="45"></textarea></p>

            <input type="submit" value="Enviar"/>

        </form>                 
    </body>
</html>

'''