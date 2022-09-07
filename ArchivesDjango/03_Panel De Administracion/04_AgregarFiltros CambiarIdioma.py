'''
-- Filtrar Registros
filtraremos por seccion
vamos a admin.py
para manipular tablas desde el panel de administracion lo haremos a trabes de clases
Creamos la clase
class PedidosAdmin(admin.ModelAdmin):
filtra por fecha
    list_filter=("fecha",)
filtra por meses
    date_hierarchy=("fecha")

class ArticulosAdmin(admin.ModelAdmin):
    le decimos que filtre por seccion hay que poner la , porque es una tupla
    list_filter=("seccion",)
admin.site.register(Articulos,ArticulosAdmin) y le decimos que use esa clase


-- Cambiar idioma
settings Tienda online
LANGUAGE_CODE = 'es-eu'
'''