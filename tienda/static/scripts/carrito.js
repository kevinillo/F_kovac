let carrito = [];
const carritoItems = document.getElementById("carrito-items");
const carritoTotal = document.getElementById("carrito-total");
const abrirCarrito = document.getElementById("abrir-carrito");
const cerrarCarrito = document.getElementById("cerrar-carrito");
const finalizarCompra = document.getElementById("finalizar-compra");
const carritoCount = document.getElementById("carrito-count");
const aceptarTerminos = document.getElementById("aceptar-terminos");

// Cargar el carrito desde LocalStorage al iniciar
document.addEventListener("DOMContentLoaded", () => {
    cargarCarrito();
    finalizarCompra.disabled = true; // Deshabilitar botón al cargar la página
});

// Función para agregar un producto al carrito
function agregarAlCarrito(productoId, nombre, precio, imagen, stock, sku) {
    const existe = carrito.find(item => item.id === productoId);

    if (existe) {
        if (existe.cantidad < stock) {
            existe.cantidad++;
            Swal.fire({
                title: '¡Producto agregado!',
                text: `Se ha agregado una unidad más de ${nombre} a la cotización.`,
                icon: 'success',
                confirmButtonText: 'Aceptar'
            });
        } else {
            Swal.fire({
                title: 'Stock insuficiente',
                text: 'No hay suficiente stock disponible.',
                icon: 'error',
                confirmButtonText: 'Aceptar'
            });
        }
    } else {
        if (stock > 0) {
            carrito.push({ id: productoId, nombre, precio, cantidad: 1, imagen, stock, sku }); // Se añade `sku`
            Swal.fire({
                title: '¡Producto agregado!',
                text: `${nombre} se ha añadido a la cotización`,
                icon: 'success',
                confirmButtonText: 'Aceptar'
            });
        } else {
            Swal.fire({
                title: 'Producto agotado',
                text: 'El producto está agotado.',
                icon: 'warning',
                confirmButtonText: 'Aceptar'
            });
        }
    }

    actualizarCarrito();
    guardarCarrito();
}

// Función para actualizar el contenido del carrito
function actualizarCarrito() {
    carritoItems.innerHTML = ""; // Limpia el contenido actual del carrito
    let total = 0;
    let cantidadTotal = 0;

    carrito.forEach(item => {
        total += item.precio * item.cantidad;
        cantidadTotal += item.cantidad;

        const div = document.createElement("div");
        div.classList.add("carrito-item");
        div.innerHTML = `
            <div class="carrito-item-img">
                <img class="carrito-img" src="${item.imagen}" alt="${item.nombre}">
            </div>
            <div class="carrito-item-detalle">
                <p><strong>${item.nombre}</strong></p>
                <p>SKU: ${item.sku || "Sin SKU"}</p> <!-- Mostrar el SKU -->
                <p>Precio: $${item.precio}</p>
                <div class="carrito-item-controles">
                    <button onclick="actualizarCantidad(${item.id}, -1)">-</button>
                    <span>${item.cantidad}</span>
                    <button onclick="actualizarCantidad(${item.id}, 1)">+</button>
                    <button class="btn-remove" onclick="quitarDelCarrito(${item.id})">🗑️</button>
                </div>
            </div>
        `;
        carritoItems.appendChild(div);
    });

    carritoTotal.innerText = `$${total}`;
    carritoCount.innerText = cantidadTotal;

    

    guardarCarrito(); // Guardar los cambios en LocalStorage
}

// Función para actualizar la cantidad de un producto en el carrito
function actualizarCantidad(productoId, cambio) {
    const item = carrito.find(item => item.id === productoId);
    if (item) {
        if (cambio === -1 || item.cantidad + cambio <= item.stock) {
            item.cantidad += cambio;
            if (item.cantidad <= 0) {
                quitarDelCarrito(productoId);
            } else {
                actualizarCarrito();
            }
        } else {
            Swal.fire({
                title: 'Stock insuficiente',
                text: 'No hay suficiente stock disponible.',
                icon: 'error',
                confirmButtonText: 'Aceptar'
            });
        }
    }
}

// Función para quitar un producto del carrito
function quitarDelCarrito(productoId) {
    carrito = carrito.filter(item => item.id !== productoId);
    Swal.fire({
        title: 'Producto eliminado',
        text: 'El producto ha sido eliminado de la cotización',
        icon: 'info',
        confirmButtonText: 'Aceptar'
    });
    actualizarCarrito();
}

// Mostrar el carrito
abrirCarrito.addEventListener("click", () => {
    document.getElementById("carrito").classList.add("visible");
});

// Ocultar el carrito
cerrarCarrito.addEventListener("click", () => {
    document.getElementById("carrito").classList.remove("visible");
});

// Habilitar o deshabilitar el botón según el estado del checkbox
aceptarTerminos.addEventListener("change", () => {
    finalizarCompra.disabled = !aceptarTerminos.checked;
});

// Finalizar compra
finalizarCompra.addEventListener("click", () => {
    if (carrito.length === 0) {
        Swal.fire({
            title: 'Carrito vacío',
            text: 'El carrito está vacío. ¡Agrega productos antes de finalizar la cotización!',
            icon: 'warning',
            confirmButtonText: 'Aceptar'
        });
        return;
    }

    // Deshabilitar el botón y mostrar el mensaje de procesamiento
    finalizarCompra.disabled = true;
    Swal.fire({
        title: 'Procesando cotización',
        text: 'Por favor, espere mientras procesamos su solicitud...',
        allowOutsideClick: false,
        onBeforeOpen: () => {
            Swal.showLoading(); // Muestra el loading
        }
    });

    fetch("/finalizar-compra/", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "X-CSRFToken": document.querySelector('[name=csrfmiddlewaretoken]').value
        },
        body: JSON.stringify({ carrito })
    })
        .then(response => response.json())
        .then(data => {
            Swal.fire({
                title: 'Cotización realizada',
                text: data.mensaje || '¡Cotización realizada con éxito!',
                icon: 'success',
                confirmButtonText: 'Aceptar'
            });
            carrito = [];
            actualizarCarrito();
            document.getElementById("carrito").classList.remove("visible");
            aceptarTerminos.checked = false; // Reiniciar el checkbox
            finalizarCompra.disabled = true; // Deshabilitar el botón nuevamente
        })
        .catch(error => {
            console.error("Error al finalizar la cotización:", error);
            Swal.fire({
                title: 'Error',
                text: 'Hubo un error al procesar tu cotización. Intenta nuevamente.',
                icon: 'error',
                confirmButtonText: 'Aceptar'
            });
        })
        .finally(() => {
            finalizarCompra.disabled = false; // Restaurar el botón
        });
});

// Guardar el carrito en LocalStorage
function guardarCarrito() {
    localStorage.setItem("carrito", JSON.stringify(carrito));
}

// Cargar el carrito desde LocalStorage
function cargarCarrito() {
    const carritoGuardado = localStorage.getItem("carrito");
    if (carritoGuardado) {
        carrito = JSON.parse(carritoGuardado);
        actualizarCarrito();
    }
}