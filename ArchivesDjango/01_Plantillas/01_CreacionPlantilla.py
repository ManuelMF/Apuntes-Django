# Pasos
# 1 paso
# Creacion de un objeto de tipo template 
# plt = Template(doc_externo.read())

# 2 paso
# Creacion de contexto 
# Son los datos adicionales para el template(variables funciones etc)
# aunque este vacio se tiene que crear
# ctx=Context()

# 3 paso
# Renderizar el objeto template
# documento = plt.render(ctx)


# lo que hacemos 
# - creamos una capeta plantilla
# - metemos el html

# vamos a la views 
#importamos, from django.template import Template, Context

# creamos un doc_externo=open("C:/Users/mmf19/OneDrive/Escritorio/Archives Django/Proyecto1/Proyecto1/plantillas/miplantilla.html")
# con la ruta del html

# creamos un template
# plt = Template(doc_externo.read())
# doc_externo.close y cerramos lo otro para no cosumir recursos

# creamos el contexto que en este caso ira vacio
# ctx = Contex()

# ultimo paso 
# documento=plt.render(ctx)
# return return HttpResponse(documento)