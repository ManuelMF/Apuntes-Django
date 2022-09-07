from django.db import models

# Create your models here.
class Clientes(models.Model):
    #tipo de dato   string de 30
    nombre=models.CharField(max_length=30)
    direccion=models.CharField(max_length=50)
    #valida que sea un correo
    email=models.EmailField(blank=True,null=True)
    tfno=models.CharField(max_length=7, verbose_name="Telefono")
    def __str__(self):
        return self.nombre

class Articulos(models.Model):
    nombre=models.CharField(max_length=30)
    seccion=models.CharField(max_length=20)
    precio=models.IntegerField()

    def __str__(self):
        return 'El nombre es %s la seccion es %s y el precio es %s' % (self.nombre,self.seccion,self.precio)

class pedidos(models.Model):
    numero=models.IntegerField()
    #valida que sea una fecha
    fecha=models.DateField()
    entregado=models.BooleanField()
    def __str__(self):
        return str(self.numero)