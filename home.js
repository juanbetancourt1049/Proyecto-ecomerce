const url_productos = "http://127.0.0.1:5000/products";
let carrito = [];

cargar_productos();
async function cargar_productos() {
    try {
        const respuesta = await fetch(url_productos, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
            }
        });

        if (respuesta.ok) {
            const productos = await respuesta.json();
            const ultimosproductos = productos.slice(-10).reverse();
            const productList = document.getElementById("product-list");

            ultimosproductos.forEach(producto => {
                const productItem = document.createElement("div");
                productItem.classList.add("product-item");

                const img = document.createElement("img");
                img.src = producto.imagen_url;
                img.alt = producto.nombre;
                productItem.appendChild(img);

                const productName = document.createElement("p");
                productName.textContent = producto.nombre;
                productItem.appendChild(productName);

                const price = document.createElement("p");
                price.textContent = `$${Number(producto.precio).toFixed(2)}`;
                productItem.appendChild(price);

                const category = document.createElement("p");
                category.textContent = producto.categoria;
                productItem.appendChild(category);

                const button = document.createElement("button");
                button.classList.add("btn-primary");
                button.textContent = "Comprar";
                button.onclick = () => agregarAlCarrito(producto);
                productItem.appendChild(button);

                productList.appendChild(productItem);
            });
        } else {
            console.log("Error en la respuesta de la API");
        }

    } catch (error) {
        console.log("Error:", error);
    }
}

function agregarAlCarrito(producto) {
    carrito.push(producto);
    localStorage.setItem("carrito", JSON.stringify(carrito));
    alert("Producto añadido al carrito");
}
