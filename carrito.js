// Inicializar el carrito desde localStorage
let carrito = JSON.parse(localStorage.getItem("carrito")) || [];

function mostrarCarrito() {
    const carritoList = document.getElementById("carrito-list");
    const pagarBtn = document.getElementById("pagar-btn");
    const totalElement = document.getElementById("total-carrito");
    carritoList.innerHTML = '';

    // Mostrar u ocultar el botón de pagar según si hay productos
    if (carrito.length > 0) {
        pagarBtn.style.display = 'block';
    } else {
        pagarBtn.style.display = 'none';
    }

    // Variable para calcular el total
    let total = 0;

    carrito.forEach((producto, index) => {
        const cartItem = document.createElement("div");
        cartItem.classList.add("cart-item");

        const img = document.createElement("img");
        img.src = producto.imagen_url || producto.image_url; // Manejar ambos formatos de URL
        img.alt = producto.nombre || producto.name; // Manejar ambos formatos de nombre
        cartItem.appendChild(img);

        const productInfo = document.createElement("div");
        productInfo.classList.add("cart-item-info");

        const productName = document.createElement("p");
        productName.classList.add("product-name");
        productName.textContent = producto.nombre || producto.name;
        productInfo.appendChild(productName);

        const price = document.createElement("p");
        price.classList.add("product-price");
        const precioNumerico = Number(producto.precio || producto.price);
        price.textContent = `$${precioNumerico.toFixed(2)}`;
        productInfo.appendChild(price);

        const category = document.createElement("p");
        category.classList.add("product-category");
        category.textContent = producto.categoria || producto.category;
        productInfo.appendChild(category);

        cartItem.appendChild(productInfo);

        const controls = document.createElement("div");
        controls.classList.add("cart-item-controls");

        // Botón de eliminar
        const removeButton = document.createElement("button");
        removeButton.classList.add("btn-remove");
        removeButton.textContent = "Eliminar";
        removeButton.onclick = () => eliminarProducto(index);
        controls.appendChild(removeButton);

        cartItem.appendChild(controls);
        carritoList.appendChild(cartItem);

        // Sumar al total
        total += precioNumerico;
    });

    // Mostrar el total si existe el elemento
    if (totalElement) {
        totalElement.textContent = `Total: $${total.toFixed(2)}`;
    }
}

function eliminarProducto(index) {
    carrito.splice(index, 1);
    localStorage.setItem("carrito", JSON.stringify(carrito));
    mostrarCarrito();
}

// Evento del botón pagar
document.getElementById("pagar-btn").addEventListener("click", () => {
    if (carrito.length > 0) {
        alert(`Proceso de pago iniciado. Total a pagar: $${calcularTotal()}`);
        carrito = [];
        localStorage.setItem("carrito", JSON.stringify(carrito));
        mostrarCarrito();
    }
});

// Función auxiliar para calcular el total
function calcularTotal() {
    return carrito.reduce((total, producto) => {
        const precio = Number(producto.precio || producto.price);
        return total + precio;
    }, 0).toFixed(2);
}

// Mostrar el carrito al cargar la página
mostrarCarrito();