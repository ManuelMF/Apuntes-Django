'''
SHORTCUT RENDER()
se utiliza para ahorrar codigo

doc_externo=loader.get_template('miplantilla.html')
documento=doc_externo.render({"nombre_persona":p1.nombre, "apellido_persona":p1.apellido, "Fecha":ahora, "lista_temas":lista})
return HttpResponse(documento)

 se simplifica a  
                     plantilla           diccionario
return render(request,"miplantilla.html", {"nombre_persona":p1.nombre, "apellido_persona":p1.apellido, "Fecha":ahora, "lista_temas":lista}  )

   
PLANTILLAS INCRUSTADAS 
plantilla dentro de otra plantilla
es muy normal que la barra de navegacion este en otro archivo diferente ya que se usara para diferentes paginas de la pagina web
Contenido tmbn puede estar en una pag distinta

-----------------------------------------
-           -----------------           -
-           -   barra.html  -           -
-           -----------------           -
-                                       -
-                                       -
-                                       -
-                                       -
-           -------------------         -
-           -                 -         -
-           -                 -         -
-           -                 -         -  
-           -  contenido.html -         -
-           -------------------         -
-                                       -
-----------------------------------------
            plantilla.html

  <!-- importar plantilla -->
        {% include "barra.html" %}
        en la parte donde queramos añadirla 
        y crear la plantilla
'''