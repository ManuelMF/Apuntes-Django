#Proyecto a elavorar
'''
Hay que crear una tienda online 
que tendrá una aplicacion de gestion de pedidos
que tendrá un Model con una BBDD con las siguientes tablas
Tabla Clientes: Nombre Direccion Email Tfno
Tabla Artículo: Nombre Sección Precio
Tabla Pedidos: N_Pedido Fecha Entregado

CREAR LA BD
Tendremos que ir a Model una vez creada la app
Creamos una clase
class Clientes(models.Model):
    #tipo de dato   string de 30
    nombre=models.CharField(max_length=30)
    direccion=models.CharField(max_length=30)
    #valida que sea un correo
    email=models.EmailField()
    tfno=models.CharField(max_length=7)

DECIR A DJANGO QUE TENEMOS UNA APP (HAY QUE REGISTRARLO EN SETTINGS)
tenemos que ir a settings del proyecto y ir a intalled apps
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'gestionPedidos',
]

Check de que todo vaya bien
python manage.py check gestionPedidos

AUN FALTA CREAR LA BDD 
para crearla ejecutamos python manage.py makemigrations
la crea pero vacia y hay que meterle las tablas
Crear el codigo sql
python manage.py sqlmagrate nombreapp numerode migracion que nos dio al crear la micracion (python manage.py makemigrations)
python manage.py sqlmagrate gestionPedidos 0001
y nos falta meter el codigo en la base detados
python manage.py migrate
ya estaria la BD
'''