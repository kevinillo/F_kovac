document.addEventListener("DOMContentLoaded", () => {
    const emailInput = document.getElementById("email");
    const emailError = document.getElementById("email-error");
    const form = document.getElementById("recovery-form");
    const loadingSpinner = document.getElementById("loading-spinner");

    emailInput.addEventListener("input", () => {
        const emailValue = emailInput.value.trim();
        if (!emailValue.includes("@") || !emailValue.includes(".")) {
            emailError.textContent = "Correo electrónico no válido";
            emailError.style.display = "block";
        } else {
            emailError.textContent = "";
            emailError.style.display = "none";
        }
    });

    form.addEventListener("submit", (e) => {
        if (emailError.textContent) {
            e.preventDefault();
            alert("Corrige los errores antes de enviar el formulario.");
        } else {
            loadingSpinner.style.display = "flex"; // Mostrar el spinner
        }
    });
});
