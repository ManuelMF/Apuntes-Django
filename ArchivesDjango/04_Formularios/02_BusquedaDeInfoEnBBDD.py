'''
nos vamos a la views 
ahi cogemos el texto
producto = request.GET["prd"]
y hacemos una select
articulos = Articulos.objects.filter(nombre__icontains=producto)
                                           __icontains es igual a un like
y le ponemos lo que va a llevar 
                       donde va a ir               identifica con la palabla articulos lo que tiene en la variable articulos y recibo como query el string de producto                                         
return render(request, "resultados_busqueda.html", {"articulos":articulos, "query":producto})

ahora vamos a crear la plantilla
tenemos que comprobar que en lo que busquemos haya algo porque sino quedara mal

<html>
    <head>
        <title>Resultado de busqueda</title>
    </head>

    <body>
        <p>Estas buscando: <strong>{{query}}</strong> </p>          
        {% if articulos %}
            <p>Artículos encontrados: {{articulos|length}} </p>
            <ul>
                {% for articulo in articulos %}
                <li>
                    {{articulo.nombre}} &nbsp; {{articulo.seccion}} &nbsp; {{articulo.precio}}
                                       <!-- espacio -->
                </li>
                {% endfor %}
            </ul>
        {% else %}
            <p> Artículo no encontrado</p>
        {% endif %}
    </body>
</html>
'''