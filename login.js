document.getElementById("loginForm").addEventListener("submit", async function(event) {
    event.preventDefault();

    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;

    const response = await fetch("http://localhost:5000/login", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({ email, password })
    });

    const result = await response.json();

    const messageElement = document.getElementById("message");

    if (response.ok) {
        messageElement.style.color = "green";
        messageElement.textContent = "Inicio de sesión exitoso. Bienvenido, " + result.user.name + "!";

        // Redirigir a home.html después de un inicio de sesión exitoso
        window.location.href = "home.html";  // Esto redirige a la página de inicio
    } else {
        messageElement.style.color = "red";
        messageElement.textContent = result.message;
    }
});