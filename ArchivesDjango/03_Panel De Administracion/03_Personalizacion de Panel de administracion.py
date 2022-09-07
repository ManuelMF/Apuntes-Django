'''
- Personalizacion de Panel de administracion
-- Cambio de nombres de campos de tablas
En el modelo poner 
tfno=models.CharField(verbose_name="Telefono")

-- Hacer que no salga los objetos sin nombre Cliente1 CLiente2
ir al modelo
def __str__(self):
    return self.nombre

hacemos migraciones

-- Modificaciones en los modelos que nos llegan para poder ver no solo el nombre sino que dirreccion tlfn
vamos a models
Creamos una clase con los campos que queremos que se vean
class ClientesAdmin(admin.ModelAdmin):
    list_display=("nombre","direccion","tfno")

admin.site.register(Clientes,ClientesAdmin)

-- Casilla de busqueda
se le añade en class clientesadmin la varialble search fiedls

class ClientesAdmin(admin.ModelAdmin):
    list_display=("nombre","direccion","tfno")
    search_fields=("nombre", "tfno")

'''