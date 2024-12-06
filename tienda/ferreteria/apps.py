from django.apps import AppConfig


class FerreteriaKovac(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'ferreteria'

    def ready(self):
        import ferreteria.signals