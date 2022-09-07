'''
abrimos el shell python manage.py shell
importamos el modelo con el que trabajamos
>>> From gestionPedidos.models import Articulos
>>> Articulos.objects.filter(seccion='deportes')
>>> Articulos.objects.filter(nombre='mesa', seccion='deportes')
MAYOR                      simbolos que se usan en el shell
>>> Articulos.objects.filter(precio__gte=100)
                                    >
                            (precio__lte=100)
                                    <           se pueden usar las dos a la vez con , o precio__range(10,50) 

nos devuelve un Queryset en forma de tabla 
para ver la info:
hay que decirle que tranforme estos objetos en cadena de caracteres con __str__()
pero para eso hay que ir a la clase y crear el __str__

cada vez que hacemos un cambio en el modelo hay que hacer las migraciones
python manage.py makemigrations
python manage.py migrate     

ORDENAR REGISTROS
>>> Articulos.objects.filter(precio__gte=100).order_by('precio')
descendente
>>> Articulos.objects.filter(precio__gte=100).order_by('-precio')
'''