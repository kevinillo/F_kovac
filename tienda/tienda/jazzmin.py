JAZZMIN_SETTINGS = {
        # Título de la ventana (usará el valor de current_admin_site.site_title si está ausente o es None)
    "site_title": "Panel de Administración de Ferretería KOVAC",

    # Título en la pantalla de inicio de sesión (máximo 19 caracteres) (usará el valor de current_admin_site.site_header si está ausente o es None)
    "site_header": "Panel de Administración de Ferretería KOVAC",

    # Título en la marca (máximo 19 caracteres) (usará el valor de current_admin_site.site_header si está ausente o es None)
    "site_brand": "CP Ferretería KOVAC",

    # Logo para usar en tu sitio, debe estar presente en los archivos estáticos, se usa para la marca en la parte superior izquierda
    "site_logo": "kovac.jpg",

    # Logo para usar en el formulario de inicio de sesión, debe estar presente en los archivos estáticos (por defecto usa site_logo)
    "login_logo": "kovac.jpg",

    # Logo para usar en el formulario de inicio de sesión en temas oscuros (por defecto usa login_logo)
    "login_logo_dark": None,

    # Clases CSS que se aplican al logo anterior
    "site_logo_classes": "img",

    # Ruta relativa a un favicon para tu sitio, por defecto usa site_logo si está ausente (idealmente de 32x32 px)
    "site_icon": None,

    # Texto de bienvenida en la pantalla de inicio de sesión
    "welcome_sign": "Bienvenido al Panel de Administración de Ferretería KOVAC",

    # Copyright en el pie de página
    "copyright": "KOVAC Ferretería Técnica.",

    # Lista de administradores de modelos para buscar desde la barra de búsqueda, se omite la barra de búsqueda si se excluye
    # Si deseas usar un único campo de búsqueda, no necesitas usar una lista, puedes usar un string simple
    "search_model": ["auth.User", "auth.Group",],

    # Nombre del campo en el modelo de usuario que contiene un avatar (ImageField/URLField/CharField o un callable que recibe el usuario)
    "user_avatar": None,

    ############
    # Menú Superior #
    ############

    # Enlaces para colocar en el menú superior
    "topmenu_links": [

        # URL que se invierte (se pueden agregar permisos)
        {"name": "Inicio",  "url": "admin:index", "permissions": ["auth.view_user"]},

        # Administrador del modelo al que enlazar (los permisos se verifican contra el modelo)
        {"model": "auth.User"},

        # Aplicación con menú desplegable para todas sus páginas de modelos (los permisos se verifican contra los modelos)
        {"app": "books"},
    ],


    #############
    # Menú Lateral #
    #############

    # Si se debe mostrar el menú lateral
    "show_sidebar": True,

    # Si se debe expandir automáticamente el menú
    "navigation_expanded": True,

    # Ocultar estas aplicaciones al generar el menú lateral, por ejemplo: (auth)
    "hide_apps": [],

    # Ocultar estos modelos al generar el menú lateral (por ejemplo auth.user)
    "hide_models": [],

    # Lista de aplicaciones (y/o modelos) para basar el orden del menú lateral (no necesita contener todas las aplicaciones/modelos)
    "order_with_respect_to": ["auth", "books", "books.author", "books.book"],

    # Enlaces personalizados para agregar a los grupos de aplicaciones, clave basada en el nombre de la aplicación
    "custom_links": {
        "books": [{
            "name": "Crear Mensajes", 
            "url": "make_messages", 
            "icon": "fas fa-comments",
            "permissions": ["books.view_book"]
        }]
    },

    # Iconos personalizados para aplicaciones/modelos del menú lateral. Ver https://fontawesome.com/icons para la lista completa.
    "icons": {
        "auth": "fas fa-users-cog",
        "auth.user": "fas fa-user",
        "auth.Group": "fas fa-users",
    },
    # Iconos que se usan cuando no se especifica uno manualmente
    "default_icon_parents": "fas fa-chevron-circle-right",
    "default_icon_children": "fas fa-circle",

    #################
    # Modal Relacionado #
    #################
    # Usar modales en lugar de ventanas emergentes
    "related_modal_active": False,

    #############
    # Ajustes de la Interfaz #
    #############
    # Rutas relativas a scripts CSS/JS personalizados (deben estar presentes en los archivos estáticos)
    "custom_css": None,
    "custom_js": None,
    # Si se debe enlazar la fuente desde fonts.googleapis.com (usar custom_css para proporcionar otra fuente)
    "use_google_fonts_cdn": True,
    # Si se debe mostrar el personalizador de UI en el menú lateral
    "show_ui_builder": False,

    ###############
    # Vista de Cambio #
    ###############
    # Renderizar la vista de cambio como un único formulario o en pestañas, las opciones actuales son:
    # - single
    # - horizontal_tabs (por defecto)
    # - vertical_tabs
    # - collapsible
    # - carousel
    "changeform_format": "collapsible_tabs",
    # Sobrescribir formularios de cambio según un modelo admin específico
    "changeform_format_overrides": {"auth.user": "collapsible", "auth.group": "vertical_tabs"},
    # Agregar un selector de idioma en el administrador

}
