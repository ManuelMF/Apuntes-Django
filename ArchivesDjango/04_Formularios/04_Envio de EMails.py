'''
Envio de Emails
Para hacer esto necesitamos usar la libreria core.mail

it a setting,py
EMAIL_BACKEND="django.core.mail.backends.smtp.EmailBackend"
EMAIL_HOST="smtp.gmail.com"
EMAIL_USE_TLS=True
EMAIL_PORT=587
EMAIL_HOST_USER="mmf19500@gmail.com"
EMAIL_HOST_PASSWORD="bqlfbwbkylzmiojb"

verificacion en 2 pasos y crear una contraseña

lo probaremos en la consola 
python manage.py shell
importamos la libreria
>>> from django.core.mail import send_mail 
>>> send_mail('Subject here','Here is the message.','mmf19500@gmail.com',['mmf19500@gmail.com'],fail_silently=False,)


modificamos la vista para hacerlo
def contacto(request):
    # la primera vez que lo ejecutamos no entra en el if pero cuando le damos a enter en el html le pusimos que nos enviara a la vista de contacto y entrariamos con el post y nos llevaria a gracias.html
    #si recibe el metodo post entrara  <!-- post para que se nos envie los datos-->
    if request.method=="POST":

        subject = request.POST["asunto"]

        message = request.POST["mensaje"]+ " " + request.POST["email"]

        email_from = settings.EMAIL_HOST_USER

        recipient_list=["mmf19500@gmail.com"]

        send_mail(subject, message, email_from, recipient_list)

        return render(request, "gracias.html")

    return render(request, "contacto.html")

y importamos la libreria core mail y settings

'''