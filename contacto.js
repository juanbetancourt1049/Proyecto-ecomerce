const url_contact = "http://127.0.0.1:5000/contact-us";  // Asegúrate de que sea el endpoint correcto

// Obtener el formulario
const form = document.getElementById("contact-form");

form.addEventListener("submit", async function (event) {
    event.preventDefault();

    // Obtener los valores del formulario
    const formData = {
        name: document.getElementById("name").value,
        email: document.getElementById("email").value,
        subject: document.getElementById("subject").value,
        message: document.getElementById("message").value
    };

    try {
        const response = await fetch(url_contact, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData),
        });

        const responseData = await response.json();

        if (response.ok) {
            // Mostrar mensaje de éxito
            document.getElementById("response-message").textContent = "Mensaje enviado exitosamente!";
            document.getElementById("response-message").style.color = "green";
            form.reset(); // Limpiar el formulario
        } else {
            // Mostrar mensaje de error
            document.getElementById("response-message").textContent = "Hubo un problema al enviar el mensaje.";
            document.getElementById("response-message").style.color = "red";
        }
    } catch (error) {
        document.getElementById("response-message").textContent = "Error en la solicitud. Intenta nuevamente.";
        document.getElementById("response-message").style.color = "red";
    }
});
