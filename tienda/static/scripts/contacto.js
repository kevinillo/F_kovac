document.addEventListener("DOMContentLoaded", () => {
    const isUserLoggedIn = JSON.parse(document.getElementById("isUserLoggedIn").textContent);
    const userEmail = document.getElementById("userEmail").textContent || "";

    const correoField = document.getElementById("correo");
    const form = document.getElementById("contact-form");
    const submitButton = form.querySelector(".contact-button");

    if (isUserLoggedIn) {
        correoField.style.display = "none"; // Oculta el campo de correo si el usuario está autenticado
        correoField.value = userEmail; // Establece el correo del usuario autenticado
    } else {
        correoField.style.display = "block"; // Muestra el campo de correo si el usuario no está autenticado
    }

    form.addEventListener("submit", async (event) => {
        event.preventDefault(); // Evita que la página recargue
        submitButton.disabled = true; // Deshabilita el botón para evitar múltiples envíos
        submitButton.textContent = "Enviando..."; // Cambia el texto del botón para dar retroalimentación

        const nombre = document.getElementById("nombre").value;
        const correo = isUserLoggedIn ? userEmail : document.getElementById("correo").value;
        const mensaje = document.getElementById("mensaje").value;

        try {
            const response = await fetch("/enviar-correo/", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "X-CSRFToken": document.querySelector('[name=csrfmiddlewaretoken]').value,
                },
                body: JSON.stringify({ nombre, correo, mensaje }),
            });

            const data = await response.json();

            Swal.fire({
                title: "¡Enviado!",
                text: data.mensaje || "Correo enviado con éxito.",
                icon: "success",
                confirmButtonText: "Aceptar",
            });

            form.reset(); // Limpia el formulario después de enviarlo
        } catch (error) {
            console.error("Error al enviar el correo:", error);
            Swal.fire({
                title: "Error",
                text: "Hubo un error al enviar el correo.",
                icon: "error",
                confirmButtonText: "Aceptar",
            });
        } finally {
            // Reactiva el botón después de procesar
            submitButton.disabled = false;
            submitButton.textContent = "Enviar"; // Restaura el texto del botón
        }
    });
});
