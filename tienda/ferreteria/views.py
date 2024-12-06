from datetime import datetime, timedelta
import json
import re
from django.conf import settings
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.hashers import make_password
from django.contrib.auth.models import User
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.contrib.sites.models import Site
from django.core.cache import cache
from django.core.mail import EmailMessage, send_mail
from django.http import JsonResponse
from django.shortcuts import get_object_or_404, redirect, render
from django.utils.encoding import force_bytes, force_str
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from django.views.decorators.csrf import csrf_exempt
from .models import CarritoItem, Cotizacion, Producto, ProductoCotizacion

# Clase para manejar el token
token_generator = PasswordResetTokenGenerator()

def recuperar_contrasena(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        if not email:
            messages.error(request, 'Por favor ingresa tu correo electrónico.')
        else:
            try:
                user = User.objects.get(email=email)
                token = token_generator.make_token(user)
                uid = urlsafe_base64_encode(force_bytes(user.pk))
                reset_url = request.build_absolute_uri(
                    f"/reset_password/{uid}/{token}/"
                )
                # Enviar el correo
                send_mail(
                    'Restablecimiento de Contraseña',
                    f'Hola {user.username}, usa el siguiente enlace para restablecer tu contraseña: {reset_url}',
                    'tu_correo@gmail.com',
                    [email],
                    fail_silently=False,
                )
                messages.success(request, 'Se ha enviado un enlace para restablecer tu contraseña a tu correo.')
            except User.DoesNotExist:
                messages.error(request, 'No se encontró una cuenta con ese correo electrónico.')
        return redirect('recuperar_contrasena')
    return render(request, 'registration/recuperar_contrasena.html')

def reset_password(request, uidb64, token):
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except (TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None

    if user is not None and token_generator.check_token(user, token):
        if request.method == 'POST':
            new_password = request.POST.get('password')
            confirm_password = request.POST.get('confirm_password')

            # Validaciones de contraseña
            if new_password != confirm_password:
                messages.error(request, 'Las contraseñas no coinciden.')
            elif len(new_password) < 8:
                messages.error(request, 'La contraseña debe tener al menos 8 caracteres.')
            elif not re.search(r'[A-Z]', new_password):
                messages.error(request, 'La contraseña debe contener al menos una letra mayúscula.')
            elif not re.search(r'[a-z]', new_password):
                messages.error(request, 'La contraseña debe contener al menos una letra minúscula.')
            elif not re.search(r'[0-9]', new_password):
                messages.error(request, 'La contraseña debe contener al menos un número.')
            elif not re.search(r'[!@#$%^&*(),.?":{}|<>]', new_password):
                messages.error(request, 'La contraseña debe contener al menos un símbolo.')
            else:
                user.password = make_password(new_password)
                user.save()
                messages.success(request, '¡Tu contraseña ha sido restablecida exitosamente!')
                return redirect('login')

        return render(request, 'registration/reset_password.html', {'valid_link': True})
    else:
        messages.error(request, 'El enlace de restablecimiento de contraseña no es válido o ha expirado.')
        return render(request, 'registration/reset_password.html', {'valid_link': False})


# Registro de usuarios
@csrf_exempt
def registro_view(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        email = request.POST.get('email')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        password1 = request.POST.get('password1')
        password2 = request.POST.get('password2')

        # Validación de contraseñas
        if password1 != password2:
            return JsonResponse({'error': 'Las contraseñas no coinciden.'}, status=400)
        elif len(password1) < 8:
            return JsonResponse({'error': 'La contraseña debe tener al menos 8 caracteres.'}, status=400)
        elif not re.search(r'[A-Z]', password1):
            return JsonResponse({'error': 'La contraseña debe contener al menos una letra mayúscula.'}, status=400)
        elif not re.search(r'[a-z]', password1):
            return JsonResponse({'error': 'La contraseña debe contener al menos una letra minúscula.'}, status=400)
        elif not re.search(r'[0-9]', password1):
            return JsonResponse({'error': 'La contraseña debe contener al menos un número.'}, status=400)
        elif not re.search(r'[!@#$%^&*(),.?":{}|<>]', password1):
            return JsonResponse({'error': 'La contraseña debe contener al menos un símbolo.'}, status=400)
        elif User.objects.filter(username=username).exists():
            return JsonResponse({'error': 'El nombre de usuario ya existe.'}, status=400)
        elif User.objects.filter(email=email).exists():
            return JsonResponse({'error': 'El correo electrónico ya está registrado.'}, status=400)
        else:
            user = User.objects.create_user(
                username=username,
                email=email,
                first_name=first_name,
                last_name=last_name,
                password=password1
            )
            user.save()
            return JsonResponse({'success': 'Usuario registrado exitosamente.'})

    return render(request, 'registration/registro.html')

# Página de inicio
def inicio(request):
    return render(request, 'tienda_final/inicio.html')

# Vista de productos destacados
@login_required
def productosdestacados(request):
    productosdestacados = Producto.objects.all()
    productosdestacados = Producto.objects.filter(destacado=True)
    return render(request, 'categorias_tienda/productosdestacados.html', {'productos': productosdestacados})

@login_required
def bticino(request):
    bticino = Producto.objects.filter(categoria='bticino')  
    return render(request, 'categorias_tienda/bticino.html', {'productos': bticino})

@login_required
def lexo(request):
    lexo = Producto.objects.filter(categoria='lexo')  
    return render(request, 'categorias_tienda/lexo.html', {'productos': lexo})

@login_required
def synthesi(request):
    synthesi = Producto.objects.filter(categoria='synthesi')  
    return render(request, 'categorias_tienda/synthesi.html', {'productos': synthesi})

@login_required
def smarthome(request):
    smarthome = Producto.objects.filter(categoria='smarthome')  
    return render(request, 'categorias_tienda/smarthome.html', {'productos': smarthome})

@login_required
def stanford(request):
    stanford = Producto.objects.filter(categoria='stanford')  
    return render(request, 'categorias_tienda/stanford.html', {'productos': stanford})

@login_required
def cablesevaflex(request):
    cablesevaflex = Producto.objects.filter(categoria='cablesevaflex')  
    return render(request, 'categorias_tienda/cablesevaflex.html', {'productos': cablesevaflex})

@login_required
def cordones(request):
    cordones = Producto.objects.filter(categoria='cordones')  
    return render(request, 'categorias_tienda/cordones.html', {'productos': cordones})

@login_required
def otrosconductores(request):
    otrosconductores = Producto.objects.filter(categoria='otrosconductores')  
    return render(request, 'categorias_tienda/otrosconductores.html', {'productos': otrosconductores})

@login_required
def volantes_adaptadores(request):
    volantes_adaptadores = Producto.objects.filter(categoria='volantes_adaptadores')  
    return render(request, 'categorias_tienda/volantes_adaptadores.html', {'productos': volantes_adaptadores})

@login_required
def terminales_conductores(request):
    terminales_conductores = Producto.objects.filter(categoria='terminales_conductores')  
    return render(request, 'categorias_tienda/terminales_conductores.html', {'productos': terminales_conductores})

@login_required
def abrazaderaspvc (request):
    abrazaderaspvc = Producto.objects.filter(categoria='abrazaderaspvc')  
    return render(request, 'categorias_tienda/abrazaderaspvc.html', {'productos': abrazaderaspvc})

@login_required
def curvaspvc (request):
    curvaspvc = Producto.objects.filter(categoria='curvaspvc')  
    return render(request, 'categorias_tienda/curvaspvc.html', {'productos': curvaspvc})

@login_required
def tuberiaspvc (request):
    tuberiaspvc = Producto.objects.filter(categoria='tuberiaspvc')  
    return render(request, 'categorias_tienda/tuberiaspvc.html', {'productos': tuberiaspvc})

@login_required
def abrazaderasemt (request):
    abrazaderasemt = Producto.objects.filter(categoria='abrazaderasemt')  
    return render(request, 'categorias_tienda/abrazaderasemt.html', {'productos': abrazaderasemt})

@login_required
def cajasemt (request):
    cajasemt = Producto.objects.filter(categoria='cajasemt')  
    return render(request, 'categorias_tienda/cajasemt.html', {'productos': cajasemt})

@login_required
def conectormet (request):
    conectormet = Producto.objects.filter(categoria='conectormet')  
    return render(request, 'categorias_tienda/conectormet.html', {'productos': conectormet})

@login_required
def conectorhub (request):
    conectorhub = Producto.objects.filter(categoria='conectorhub')  
    return render(request, 'categorias_tienda/conectorhub.html', {'productos': conectorhub})

@login_required
def coplasemt (request):
    coplasemt = Producto.objects.filter(categoria='coplasemt')  
    return render(request, 'categorias_tienda/coplasemt.html', {'productos': coplasemt})

@login_required
def curvasemt (request):
    curvasemt = Producto.objects.filter(categoria='curvasemt')  
    return render(request, 'categorias_tienda/curvasemt.html', {'productos': curvasemt})
    
@login_required
def terminalesemt (request):
    terminalesemt = Producto.objects.filter(categoria='terminalesemt')  
    return render(request, 'categorias_tienda/terminalesemt.html', {'productos': terminalesemt})

@login_required
def tuberiasemt (request):
    tuberiasemt = Producto.objects.filter(categoria='tuberiasemt')  
    return render(request, 'categorias_tienda/tuberiasemt.html', {'productos': tuberiasemt})

@login_required
def galvanizado (request):
    galvanizado = Producto.objects.filter(categoria='galvanizado')  
    return render(request, 'categorias_tienda/galvanizado.html', {'productos': galvanizado})

@login_required
def tuberiasflexibles_accesorios (request):
    tuberiasflexibles_accesorios = Producto.objects.filter(categoria='tuberiasflexibles_accesorios')  
    return render(request, 'categorias_tienda/tuberiasflexibles_accesorios.html', {'productos': tuberiasflexibles_accesorios})

@login_required
def accesoriosdemolduras (request):
    accesoriosdemolduras = Producto.objects.filter(categoria='accesoriosdemolduras')  
    return render(request, 'categorias_tienda/accesoriosdemolduras.html', {'productos': accesoriosdemolduras})

@login_required
def canaletas (request):
    canaletas = Producto.objects.filter(categoria='canaletas')  
    return render(request, 'categorias_tienda/canaletas.html', {'productos': canaletas})

@login_required
def molduras (request):
    molduras = Producto.objects.filter(categoria='molduras')  
    return render(request, 'categorias_tienda/molduras.html', {'productos': molduras})

@login_required
def accesoriobandeja (request):
    accesoriobandeja = Producto.objects.filter(categoria='accesoriobandeja')  
    return render(request, 'categorias_tienda/accesoriobandeja.html', {'productos': accesoriobandeja})

@login_required
def accesorioescalerilla (request):
    accesorioescalerilla = Producto.objects.filter(categoria='accesorioescalerilla')  
    return render(request, 'categorias_tienda/accesorioescalerilla.html', {'productos': accesorioescalerilla})

@login_required
def bandeja (request):
    bandeja = Producto.objects.filter(categoria='bandeja')  
    return render(request, 'categorias_tienda/bandeja.html', {'productos': bandeja})

@login_required
def escalerilla (request):
    escalerilla = Producto.objects.filter(categoria='escalerilla')  
    return render(request, 'categorias_tienda/escalerilla.html', {'productos': escalerilla})

@login_required
def fijaciones(request):
    fijaciones = Producto.objects.filter(categoria='fijaciones')  
    return render(request, 'categorias_tienda/fijaciones.html', {'productos': fijaciones})

@login_required
def tuercas(request):
    tuercas = Producto.objects.filter(categoria='tuercas')  
    return render(request, 'categorias_tienda/tuercas.html', {'productos': tuercas})

@login_required
def complementosaccesorios(request):
    complementosaccesorios = Producto.objects.filter(categoria='complementosaccesorios')  
    return render(request, 'categorias_tienda/complementosaccesorios.html', {'productos': complementosaccesorios})

@login_required
def contactores(request):
    contactores = Producto.objects.filter(categoria='contactores')  
    return render(request, 'categorias_tienda/contactores.html', {'productos': contactores})

@login_required
def diferenciales(request):
    diferenciales = Producto.objects.filter(categoria='diferenciales')  
    return render(request, 'categorias_tienda/diferenciales.html', {'productos': diferenciales})

@login_required
def automaticos(request):
    automaticos = Producto.objects.filter(categoria='automaticos')  
    return render(request, 'categorias_tienda/automaticos.html', {'productos': automaticos})

@login_required
def cajasempalme(request):
    cajasempalme = Producto.objects.filter(categoria='cajasempalme')  
    return render(request, 'categorias_tienda/cajasempalme.html', {'productos': cajasempalme})

@login_required
def cajas(request):
    cajas = Producto.objects.filter(categoria='cajas')  
    return render(request, 'categorias_tienda/cajas.html', {'productos': cajas})

@login_required
def gabinetes(request):
    gabinetes = Producto.objects.filter(categoria='gabinetes')  
    return render(request, 'categorias_tienda/gabinetes.html', {'productos': gabinetes})

@login_required
def tablerosembutido(request):
    tablerosembutido = Producto.objects.filter(categoria='tablerosembutido')  
    return render(request, 'categorias_tienda/tablerosembutido.html', {'productos': tablerosembutido})

@login_required
def tablerossobrepuesto(request):
    tablerossobrepuesto = Producto.objects.filter(categoria='tablerossobrepuesto')  
    return render(request, 'categorias_tienda/tablerossobrepuesto.html', {'productos': tablerossobrepuesto})

@login_required
def tablerosexterior(request):
    tablerosexterior = Producto.objects.filter(categoria='tablerosexterior')  
    return render(request, 'categorias_tienda/tablerosexterior.html', {'productos': tablerosexterior})

@login_required
def embutidos220(request):
    embutidos220 = Producto.objects.filter(categoria='embutidos220')  
    return render(request, 'categorias_tienda/embutidos220.html', {'productos': embutidos220})

@login_required
def embutidos380(request):
    embutidos380 = Producto.objects.filter(categoria='embutidos380')  
    return render(request, 'categorias_tienda/embutidos380.html', {'productos': embutidos380})

@login_required
def volantes220(request):
    volantes220 = Producto.objects.filter(categoria='volantes220')  
    return render(request, 'categorias_tienda/volantes220.html', {'productos': volantes220})

@login_required
def volantes380(request):
    volantes380 = Producto.objects.filter(categoria='volantes380')  
    return render(request, 'categorias_tienda/volantes380.html', {'productos': volantes380})

@login_required
def sobrepuestos220(request):
    sobrepuestos220 = Producto.objects.filter(categoria='sobrepuestos220')  
    return render(request, 'categorias_tienda/sobrepuestos220.html', {'productos': sobrepuestos220})

@login_required
def sobrepuestos380(request):
    sobrepuestos380 = Producto.objects.filter(categoria='sobrepuestos380')  
    return render(request, 'categorias_tienda/sobrepuestos380.html', {'productos': sobrepuestos380})

@login_required
def lamparas(request):
    lamparas = Producto.objects.filter(categoria='lamparas')  
    return render(request, 'categorias_tienda/lamparas.html', {'productos': lamparas})

@login_required
def ampolletasvintage(request):
    ampolletasvintage = Producto.objects.filter(categoria='ampolletasvintage')  
    return render(request, 'categorias_tienda/ampolletasvintage.html', {'productos': ampolletasvintage})

@login_required
def ampolletassmart(request):
    ampolletassmart = Producto.objects.filter(categoria='ampolletassmart')  
    return render(request, 'categorias_tienda/ampolletassmart.html', {'productos': ampolletassmart})

@login_required
def ampolletasgu10(request):
    ampolletasgu10 = Producto.objects.filter(categoria='ampolletasgu10')  
    return render(request, 'categorias_tienda/ampolletasgu10.html', {'productos': ampolletasgu10})

@login_required
def ampolletase27(request):
    ampolletase27 = Producto.objects.filter(categoria='ampolletase27')  
    return render(request, 'categorias_tienda/ampolletase27.html', {'productos': ampolletase27})

@login_required
def apliques(request):
    apliques = Producto.objects.filter(categoria='apliques')  
    return render(request, 'categorias_tienda/apliques.html', {'productos': apliques})

@login_required
def accesoriosiluminacion(request):
    accesoriosiluminacion = Producto.objects.filter(categoria='accesoriosiluminacion')  
    return render(request, 'categorias_tienda/accesoriosiluminacion.html', {'productos': accesoriosiluminacion})

@login_required
def proyectoresconsensor(request):
    proyectoresconsensor = Producto.objects.filter(categoria='proyectoresconsensor')  
    return render(request, 'categorias_tienda/proyectoresconsensor.html', {'productos': proyectoresconsensor})

@login_required
def proyectoressinsensor(request):
    proyectoressinsensor = Producto.objects.filter(categoria='proyectoressinsensor')  
    return render(request, 'categorias_tienda/proyectoressinsensor.html', {'productos': proyectoressinsensor})

@login_required
def proyectoressolares(request):
    proyectoressolares = Producto.objects.filter(categoria='proyectoressolares')  
    return render(request, 'categorias_tienda/proyectoressolares.html', {'productos': proyectoressolares})

@login_required
def panelesledcuadradoembutidos(request):
    panelesledcuadradoembutidos = Producto.objects.filter(categoria='panelesledcuadradoembutidos')  
    return render(request, 'categorias_tienda/panelesledcuadradoembutidos.html', {'productos': panelesledcuadradoembutidos})

@login_required
def panelesledcuadradosobrepuestos(request):
    panelesledcuadradosobrepuestos = Producto.objects.filter(categoria='panelesledcuadradosobrepuestos')  
    return render(request, 'categorias_tienda/panelesledcuadradosobrepuestos.html', {'productos': panelesledcuadradosobrepuestos})

@login_required
def panelesledredondoembutidos(request):
    panelesledredondoembutidos = Producto.objects.filter(categoria='panelesledredondoembutidos')  
    return render(request, 'categorias_tienda/panelesledredondoembutidos.html', {'productos': panelesledredondoembutidos})

@login_required
def panelesledredondosobrepuestos(request):
    panelesledredondosobrepuestos = Producto.objects.filter(categoria='panelesledredondosobrepuestos')  
    return render(request, 'categorias_tienda/panelesledredondosobrepuestos.html', {'productos': panelesledredondosobrepuestos})

@login_required
def tubosfluorescentes(request):
    tubosfluorescentes = Producto.objects.filter(categoria='tubosfluorescentes')  
    return render(request, 'categorias_tienda/tubosfluorescentes.html', {'productos': tubosfluorescentes})

@login_required
def tubosled(request):
    tubosled = Producto.objects.filter(categoria='tubosled')  
    return render(request, 'categorias_tienda/tubosled.html', {'productos': tubosled})

@login_required
def equipocanoa(request):
    equipocanoa = Producto.objects.filter(categoria='equipocanoa')  
    return render(request, 'categorias_tienda/equipocanoa.html', {'productos': equipocanoa})

@login_required
def equipoestanco(request):
    equipoestanco = Producto.objects.filter(categoria='equipoestanco')  
    return render(request, 'categorias_tienda/equipoestanco.html', {'productos': equipoestanco})

def terminoscondiciones(request):
    return render(request, 'utilidad_tienda/terminoscondiciones.html', {'productos': terminoscondiciones})

def ayuda(request):
    return render(request, 'utilidad_tienda/ayuda.html', {'productos': ayuda})

def ver_carrito(request):
    carrito_items = CarritoItem.objects.filter(usuario=request.user)
    total = sum(item.producto.precio * item.cantidad for item in carrito_items)
    return render(request, 'carro/carrito.html', {'carrito_items': carrito_items, 'total': total})

def agregar_al_carrito(request, producto_id):
    producto = get_object_or_404(Producto, id=producto_id)
    carrito_item, created = CarritoItem.objects.get_or_create(
        usuario=request.user,
        producto=producto
    )
    if not created:
        carrito_item.cantidad += 1
    carrito_item.save()

def categorias_tienda(request):
    query = request.GET.get('q', '')  # Obtiene el término de búsqueda de la URL
    productos = Producto.objects.filter(nombre__icontains=query)  # Filtra los productos

    # Si hay productos, toma la categoría del primer producto o un valor por defecto
    if productos.exists():
        categoria = productos[0].categoria
        template_name = f'categorias_tienda/{categoria}.html'
    else:
        categoria = None
        template_name = 'categorias_tienda/default.html'  # Carga una plantilla genérica

    # Contexto que incluye la búsqueda y el resultado
    context = {
        'productos': productos,
        'query': query,
        'categoria': categoria,
    }

    return render(request, template_name, context)

@login_required
def eliminar_del_carrito(request, item_id):
    carrito_item = get_object_or_404(CarritoItem, id=item_id)
    carrito_item.delete()

@login_required
def finalizar_compra(request):
    if request.method == 'POST':
        usuario = request.user

        # Verificar si el usuario ya hizo una solicitud recientemente
        ultima_cotizacion = cache.get(f"ultima_cotizacion_{usuario.id}")
        if ultima_cotizacion:
            tiempo_restante = (ultima_cotizacion + timedelta(seconds=20)) - datetime.now()
            if tiempo_restante.total_seconds() > 0:
                return JsonResponse({
                    "mensaje": f"Por favor espera {int(tiempo_restante.total_seconds())} segundos antes de intentar nuevamente."
                }, status=429)

        # Guardar la fecha/hora de esta cotización en la caché
        cache.set(f"ultima_cotizacion_{usuario.id}", datetime.now(), timeout=10)

        # Procesar la cotización normalmente
        try:
            carrito = json.loads(request.body).get('carrito', [])

            if not carrito:
                return JsonResponse({"mensaje": "El carrito está vacío."}, status=400)

            # Obtener información del usuario
            usuario_nombre = usuario.get_full_name() or usuario.username
            usuario_email = usuario.email

            # Calcular el total de la cotización
            total_cotizacion = sum(item['precio'] * item['cantidad'] for item in carrito)

            # Guardar cotización en la base de datos
            cotizacion = Cotizacion.objects.create(
                usuario=usuario,
                correo=usuario_email,
                total=total_cotizacion
            )

            for item in carrito:
                ProductoCotizacion.objects.create(
                    cotizacion=cotizacion,
                    nombre=item['nombre'],
                    cantidad=item['cantidad'],
                    precio=item['precio']
                )

            # Crear el contenido del correo para el cliente
            mensaje_html = f"""
            <h1>Gracias por realizar tu cotización en Ferretería KOVAC</h1>
            <p>Estos son los productos que has seleccionado:</p>
            <ul>
            """
            for item in carrito:
                mensaje_html += f"""
                <li>
                    <p><strong>{item['nombre']}</strong></p>
                    <p>Cantidad: {item['cantidad']}</p>
                    <p>Precio: ${item['precio']}</p>
                </li>
                """
            mensaje_html += f"""
            </ul>
            <p><strong>El total de su cotización es:</strong> ${total_cotizacion}</p>
            <p>Muchas gracias por preferirnos, nos pondremos en contacto contigo pronto.</p>
            """

            # Crear el contenido del correo para el administrador
            mensaje_admin_html = f"""
            <h1>Nueva cotización recibida</h1>
            <p><strong>El usuario:</strong> {usuario_nombre} ha realizado una nueva cotización</p>
            <p>Estos son los productos seleccionados por el cliente:</p>
            <ul>
            """
            for item in carrito:
                mensaje_admin_html += f"""
                <li>
                    <p><strong>{item['nombre']}</strong></p>
                    <p>ID del producto: {item['id']}</p>  <!-- ID del producto solo para el administrador -->
                    <p>Cantidad: {item['cantidad']}</p>
                    <p>Precio: ${item['precio']}</p>
                </li>
                """
            mensaje_admin_html += f"""
            </ul>
            <p><strong>Total de la cotización:</strong> ${total_cotizacion}</p>
            """

            # Enviar el correo al cliente
            send_mail(
                "Cotización realizada",
                '',  # Mensaje de texto plano (puede estar vacío si usas HTML)
                settings.DEFAULT_FROM_EMAIL,
                [usuario_email],  # Correo del cliente
                html_message=mensaje_html  # Contenido HTML del correo
            )

            # Enviar el correo al administrador con "Reply-To"
            email = EmailMessage(
                subject="Nueva cotización recibida",
                body=mensaje_admin_html,
                from_email=settings.DEFAULT_FROM_EMAIL,
                to=['fkovac1346@gmail.com'],  # Correo del administrador
                reply_to=[usuario_email],  # Reply-To apunta al cliente
            )
            email.content_subtype = "html"  # Configura el correo como HTML
            email.send()

            return JsonResponse({"mensaje": "Cotización realizada y registrada con éxito."})

        except Exception as e:
            print(f"Error al procesar la cotización: {e}")
            return JsonResponse({"error": "Error al procesar la cotización."}, status=500)
    
    return JsonResponse({"error": "Método no permitido"}, status=400)

def enviar_correo(request):
    if request.method == "POST":
        try:
            data = json.loads(request.body)
            nombre = data.get("nombre", "Anónimo").strip()
            correo = data.get("correo", "").strip()  # Limpia espacios y saltos de línea
            mensaje = data.get("mensaje", "").strip()


            if not correo or not mensaje:
                return JsonResponse({"mensaje": "Faltan datos obligatorios."}, status=400)

            # Mensaje para el administrador
            mensaje_admin = f"""
            Nuevo mensaje recibido:
            
            Nombre: {nombre}
            Mensaje:
            {mensaje}
            """

            # Mensaje para el cliente
            mensaje_cliente = f"""
            Hola {nombre},

            Gracias por contactarte con nosotros. Este es un resumen de tu mensaje:

            {mensaje}

            Nos pondremos en contacto contigo lo antes posible.

            Saludos,
            Ferretería Kovac
            """

            # Enviar correo al administrador (usando EmailMessage para Reply-To)
            email_admin = EmailMessage(
                subject="Nuevo mensaje recibido",
                body=mensaje_admin,
                from_email=settings.DEFAULT_FROM_EMAIL,
                to=["fkovac1346@gmail.com"],  # Correo del administrador
                reply_to=[correo],  # Correo del cliente
            )
            email_admin.send()

            # Enviar correo al cliente
            send_mail(
                subject="Gracias por tu mensaje",
                message=mensaje_cliente,
                from_email=settings.DEFAULT_FROM_EMAIL,
                recipient_list=[correo],  # Correo del cliente
            )

            return JsonResponse({"mensaje": "Correo enviado con éxito."})
        except Exception as e:
            print(f"Error al enviar el correo: {e}")
            return JsonResponse({"error": "Hubo un error al enviar el correo."}, status=500)

    return JsonResponse({"error": "Método no permitido."}, status=405)
