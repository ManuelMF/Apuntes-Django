'''
API FORMS
es una libreria que facilita la creacion de formularios
nos permite la validadion de datos como el email campos vacios...

Como se usa:
1 paso crear en cualquier lugar del proyecto un archivo forms.py mejor en la misma que views

hay que importar la clase forms
from django import forms

ahora creamos una clase que sea capaz de crear el formulario
class FormularioContacto(forms.Form):
    asunto=forms.CharField 
    #le indicamos que es un campo de caracteres
    email=forms.EmailField
    mensaje=forms.CharField


 cleaned_data la usaremos para obtener el name
 miFormulario.cleaned_data

 miFormulario.is_valid()
True mira si es valido que el email este bien ...

transformamos la vista para que funcione con un API FORMS
 primero hay que importar el proyecto y crear la vista

'''