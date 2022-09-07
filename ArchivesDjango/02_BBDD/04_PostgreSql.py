'''
Buscamos en windows la carpeta 
postgresSQL 13 y abrimos
pgAdmin 4

ponemos la contra
 nos metemos en databases clik derecho en postgres query tool
 y creamos la base de datos: create database ArticulosClientes

falta introducir tablas y esas cosas para esp
 Tenemos que conectar nuestro proyecto de jango con la base de datos ArticulosClientes
 para esto tenemos que importa en django psycopg2
  hay que intalarla primero desde la consola en el directorio del proyecto 
  pip install psycopg2
 Ahora hay que cambiar la configuracion en TiendaOnline TiendaOnlina setting para que nuestro proyecto de django conecte con nuestra base de datos
 vamos a DATABASES
 LO QUE PONE
 DATABASES = {
     'default': {
         'ENGINE': 'django.db.backends.sqlite3',
         'NAME': BASE_DIR / 'db.sqlite3',
     }
 }
 LO QUE TENEMOS QUE PONER
 DATABASES = {
     'default': {
         'ENGINE': 'django.db.backends.postgresql_psycopg2',
         'NAME': 'articulosclientes',
         'USER' : 'postgres',
         'PASSWORD' : 'mmfmmf123456',
         'HOST' : 'localhost',
         'DATABASE_PORT' : '5432',
     }
 }
Importar tablas
 ir a la tiendaOnline con cd y
  python manage.py makemigrations
  python manage.py migrate
y ya estarian las tablas

meter datos 
 python manage.py shell
 >>> from gestionPedidos.models import Clientes
 >>> cli=Clientes(nombre='Manuel',direccion='mi casa', tfno='6012415')
 >>> cli.save()
'''