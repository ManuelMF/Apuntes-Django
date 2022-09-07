'''
Crear un comentario
% comment %} NO TEMAS DISEÑADOR
            IGNORA ESTA PARTE
        {% endcomment %}

FILTRO
                                lo aplica en mayus y minus
<p>Mi nombre es: {{nombre_persona|upper}} {{apellido_persona|lower}}</p>

<ul>   
    {% if lista_temas %}    
        {% for elTema in lista_temas %}
          
                     Nos muestra la primera letra
            <li>{{elTema|first|lower}}</li>
                    encadena los filtros

        {% endfor %}
    {% else %} 
        <p>No hay elementos que mostrar</p>
    {% endif %}
</ul>

Cargador de plantillas
se le dice al proyecto de django que todas las carpetas estan en un directorio 
hay que importar en el url
from django.template import loader
luego hay que ir a setting buscar templates 
en DIRS
hay que indicarle la ruta
y vamos a las lista y ponemos
doc_externo=loader.get_template('miplantilla.html')

y hay que renderizarla
 documento=doc_externo.render({"nombre_persona":p1.nombre, "apellido_persona":p1.apellido, "Fecha":ahora, "lista_temas":lista})

CUANDO SE HAGA DE ESTA FORMA NO TENDREMOS QUE PONERLE CONTEXT SINO QUE LE PONDREMOS DIRECTAMENTE EL DICCIONARIO

'''