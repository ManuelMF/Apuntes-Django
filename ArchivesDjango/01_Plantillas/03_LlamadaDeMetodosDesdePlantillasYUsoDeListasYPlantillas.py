'''
pasar una LISTA 
lista = ["Plantillas","Modelos","Formularios","Vistas","Despliege"]
ctx=Context({"lista_temas":lista})
o
ctx=Context({"lista_temas":["Plantillas","Modelos","Formularios","Vistas","Despliege"]})

jerarquia u orden de llamadas del .
-------------------------------------
elemento de un diccionario
Atributo o propiedad de una clase
metodo de una clase o objeto
indice de lista


Crear un FOR en una plantilla
similar a un buble for each
<p>
    <ul>
    {% for elTema in lista_temas %}
        <li> {{elTema}} </li>

    {% endfor %}
    </ul>
</p>

usar IF
<ul>   <!-- mira si existe temas y si tiene info-->
    {% if  temas %}    
        {% for elTema in lista_temas %}
            <li>{{elTema}}</li>
        {% endfor %}
    {% endif %}
</ul>

las llamadas a metodos en django no tiene ()
.upper .lower no lo lleva 
'''