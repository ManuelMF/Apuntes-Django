from django import forms

class FormularioContacto(forms.Form):
    asunto=forms.CharField()
    #le indicamos que es un campo de caracteres
    email=forms.EmailField()
    mensaje=forms.CharField()