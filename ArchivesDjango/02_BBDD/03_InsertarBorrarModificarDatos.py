'''
1 Abrir el shel
estando sobre el proyecto ejecutar python manage.py shell
2 hay que importar el modelo que queramos trabajar en este caso Articulos
>>> from gestionPedidos.models import Articulos

INSERT
>>> art = Articulos(nombre='mesa', seccion='decoracion', precio=90)
ejecutar la accion 
>>> art.save()
se inserto

otra forma con una linea de codigo
art2=Articulos.objects.create(nombre='taladro',seccion='ferreteria',precio=45) 

UPDATE
tengo guardada la variable 
art.precio=95
art.save()

DELETE                         condiciones
>>> art5=Articulos.objects.get(id=1) 
>>> art5.delete()

SELECT
lista completa
Lista=Articulos.objects.all()
ver lista
Lista
la select que hizo
Lista.query.__str__()
'''