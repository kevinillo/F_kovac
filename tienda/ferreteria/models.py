from django.db import models
from django.conf import settings
from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm



class Producto(models.Model):
    class Meta:
        ordering = ['nombre']
        
        
    CATEGORIAS = [
        ('sin_categoria', 'Sin Categoría'),
        
        ('bticino', 'Bticino'),
        ('lexo', 'Lexo'),
        ('synthesi', 'Synthesi'),
        ('smarthome', 'Smart Home'),
        ('stanford', 'Stanford'),
        
        ('cablesevaflex', 'Cables Evaflex'),
        ('cordones', 'Cordones'),
        ('otrosconductores', 'Otros Conductores'),
        ('volantes_adaptadores', 'Volantes y Adaptadores'),
        ('terminales_conductores', 'Terminales y Conductores'),
        
        ('abrazaderaspvc', 'Abrazaderas PVC'),
        ('curvaspvc', 'Curvas PVC'),
        ('tuberiaspvc', 'Tuberias PVC'),
        
        ('abrazaderasemt', 'Abrazaderas EMT'),
        ('cajasemt', 'Cajas EMT'),
        ('conectormet', 'Conector MET'),
        ('conectorhub', 'Conector HUB'),
        ('coplasemt', 'Coplas EMT'),
        ('curvasemt', 'Curvas EMT'),
        ('terminalesemt', 'Terminales EMT'),
        ('tuberiasemt', 'Tuberias EMT'),
        
        ('galvanizado', 'Galvanizado'),
        
        ('tuberiasflexibles_accesorios', 'Tuberias Flexibles y Accesorios'),
        
        ('accesoriosdemoldura', 'Accesorios de Moldura'),
        ('canaletas', 'Canaletas'),
        ('molduras', 'Molduras'),
        
        ('accesoriobandeja', 'Accesorios De Bandeja'),
        ('accesoriosescalerilla', 'Accesorios De Escalerilla'),
        ('bandeja', 'Bandeja'),
        ('escalerilla', 'Escalerilla'),
        
        ('equipoestanco', 'Equipos Estancos'),
        ('equipocanoa', 'Equipos Canoas'),
        ('tubosled', 'Tubos LED'),
        ('tubosfluorescentes', 'Tubos Fluorescentes'),
        
        ('panelesledredondosobrepuestos', 'Paneles LED Redondos Sobrepuestos'),
        ('panelesledredondoembutidos', 'Paneles LED Redondos Embutidos'),
        ('panelesledcuadradosobrepuestos', 'Paneles LED Cuadrados Sobrepuestos'),
        ('panelesledcuadradoembutidos', 'Paneles LED Cuadrados Embutidos'),
        
        ('proyectoresconsensor', 'Proyectores Con Sensor'),
        ('proyectoressinsensor', 'Proyectores Sin Sensor'),
        ('proyectoressolares', 'Proyectores Solares'),
        
        ('accesoriosiluminacion', 'Accesorios De Iluminacion'),
        
        ('apliques', 'Apliques'),
        
        ('ampolletase27', 'Ampolletas E27'),
        ('ampolletasgu10', 'Ampolletas GU10'),
        ('ampolletassmart', 'Ampolletas Smart'),
        ('ampolletasvintage', 'Ampolletas Vintage'),
        
        ('lamparas', 'Lamparas'),
        
        ('sobrepuestos380', 'Sobrepuestos 380V'),
        ('sobrepuestos220', 'Sobrepuestos 220V'),
        
        ('volantes380', 'Volantes 380V'),
        ('volantes220', 'Volantes 220V'),
        
        ('embutidos380', 'Embutidos 380V'),
        ('embutidos220', 'Embutidos 220V'),
        
        ('tablerosexterior', 'Tableros Exterior'),
        ('tablerossobrepuesto', 'Tableros Sobrepuestos'),
        ('tablerosembutido', 'Tableros Embutidos'),
        
        ('gabinetes', 'Gabinetes'),
        
        ('cajas', 'Cajas'),
        ('cajasempalme', 'Cajas De Empalme'),
        
        ('automaticos', 'Automaticos'),
        ('diferenciales', 'Diferenciales'),
        ('contactores', 'Contactores'),
        ('complementosaccesorios', 'Complementos y Accesorios'),
        
        ('tuercas', 'Tuercas'),
        ('fijaciones', 'Fijaciones'),
        
    ]

    nombre = models.CharField(max_length=255)
    descripcion = models.TextField(null=True, blank=True)
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    stock = models.PositiveIntegerField(default=0)
    imagen = models.ImageField(null=True, blank=True, upload_to='productos/')
    destacado = models.BooleanField(default=False)
    categoria = models.CharField(max_length=50, choices=CATEGORIAS, default='Sin Categoria')
    sku = models.CharField(max_length=50, unique=True, null=True, blank=True)
    

    def __str__(self):
        return self.nombre

class CarritoItem(models.Model):
    usuario = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    cantidad = models.PositiveIntegerField(default=1)

    def subtotal(self):
        return self.producto.precio * self.cantidad

    def __str__(self):
        return f"{self.producto.nombre} x {self.cantidad}"

class CustomUserCreationForm(UserCreationForm):
    email = forms.EmailField(required=True, label="Correo Electrónico")
    first_name = forms.CharField(max_length=30, required=True, label="Nombre")
    last_name = forms.CharField(max_length=30, required=True, label="Apellido")

    class Meta:
        db_table = 'registro_usuarios'
        model = User
        fields = ['username', 'email', 'first_name', 'last_name', 'password1', 'password2']

    def save(self, commit=True):
        user = super().save(commit=False)
        user.email = self.cleaned_data['email']
        user.first_name = self.cleaned_data['first_name']
        user.last_name = self.cleaned_data['last_name']
        if commit:
            user.save()
        return user
    

class Cotizacion(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)
    correo = models.EmailField()
    total = models.DecimalField(max_digits=10, decimal_places=2)
    fecha = models.DateTimeField(auto_now_add=True)
    class Meta:
        
        ordering = ['-fecha']
        verbose_name = "Cotización"
        verbose_name_plural = "Cotizaciones"

    def __str__(self):
        return f"Cotización #{self.id} - {self.correo} - {self.total} CLP"


class ProductoCotizacion(models.Model):
    cotizacion = models.ForeignKey(Cotizacion, on_delete=models.CASCADE, related_name='productos')
    nombre = models.CharField(max_length=255)
    cantidad = models.PositiveIntegerField()
    sku = models.CharField(max_length=50, null=True, blank=True)
    precio = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        verbose_name = "Cotización"
        verbose_name_plural = "Productos cotizados por el cliente"
    def __str__(self):
        return f"{self.nombre} - {self.cantidad} unidades - SKU: {self.sku or 'Sin SKU'}"