'''
Imaginamos que queremos  poder añadir clientes desde el panel de administracion
tendriamos que ir a gestion de pediods - admin
y ahi poner  from gestionPedidos.models import Clientes
y admin.site.register(Clientes)

HACER UN CAMPO OPCIONAL
ir al modelo
email=models.EmailField(blank=True,null=True)

y faltaria hacer una migracion
python manage.py makemigrations 
python manage.py migrate
'''