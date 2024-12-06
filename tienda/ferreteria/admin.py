from django.contrib import admin
from .models import Producto,Cotizacion,ProductoCotizacion

class ProductoAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'categoria', 'precio', 'stock', 'destacado')
    search_fields = ('nombre', 'categoria')
    list_filter = ('categoria', 'destacado')
    ordering = ('nombre',)
    
class ProductoCotizacionInline(admin.TabularInline):
    model = ProductoCotizacion
    extra = 0

@admin.register(Cotizacion)
class CotizacionAdmin(admin.ModelAdmin):
    list_display = ('id', 'correo', 'total', 'fecha', 'usuario')
    list_filter = ('fecha',)
    search_fields = ('correo', 'usuario__username')
    inlines = [ProductoCotizacionInline]

admin.site.register(Producto, ProductoAdmin)
