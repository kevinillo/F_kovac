from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.core.mail import EmailMessage

@receiver(post_save, sender=User)
def enviar_correo_registro(sender, instance, created, **kwargs):
    if created:  # Solo ejecuta esto al crear un nuevo usuario
        # Enviar correo al usuario
        asunto_usuario = "¡Bienvenido a Kovac Ferretería!"
        mensaje_usuario = f"Hola {instance.first_name},\n\nGracias por registrarte en Kovac Ferretería. Espero sea de tu agrado"
        email_usuario = EmailMessage(
            subject=asunto_usuario,
            body=mensaje_usuario,
            from_email='fkovac1346@gmail.com',  # Remitente
            to=[instance.email],               # Destinatario
        )
        email_usuario.send()

        # Enviar correo al administrador
        asunto_admin = "Nuevo usuario registrado"
        mensaje_admin = (
            f"Se ha registrado un nuevo usuario:\n\n"
            f"Nombre: {instance.first_name}\n"
            f"Apellido: {instance.last_name}\n"
        )
        email_admin = EmailMessage(
            subject=asunto_admin,
            body=mensaje_admin,
            from_email='fkovac1346@gmail.com',  # Remitente
            to=['fkovac1346@gmail.com'],        # Tu correo como destinatario
            reply_to=[instance.email],          # Configura el correo del cliente en "Responder a"
        )
        email_admin.send()
