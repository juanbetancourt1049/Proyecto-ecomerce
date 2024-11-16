const url_products2 = "http://127.0.0.1:5000/products2";

// Inicializar el carrito desde localStorage
let carrito = JSON.parse(localStorage.getItem("carrito")) || [];

async function cargar_productos2() {
    try {
        const respuesta = await fetch(url_products2, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
            }
        });

        if (respuesta.ok) {
            const productos = await respuesta.json();
            const ultimosproductos = productos.slice(-10).reverse();
            console.log(productos);

            const productList = document.getElementById("product-list");
            productList.innerHTML = ''; // Limpiar la lista antes de agregar nuevos productos

            ultimosproductos.forEach(producto => {
                const productItem = document.createElement("div");
                productItem.classList.add("product-item");

                const img = document.createElement("img");
                img.src = producto.image_url;
                img.alt = producto.name;
                productItem.appendChild(img);

                const productName = document.createElement("p");
                productName.textContent = producto.name;
                productItem.appendChild(productName);

                const price = document.createElement("p");
                price.textContent = `$${Number(producto.price).toFixed(2)}`;
                productItem.appendChild(price);

                const category = document.createElement("p");
                category.textContent = producto.category;
                productItem.appendChild(category);

                const button = document.createElement("button");
                button.classList.add("btn-primary");
                button.textContent = "Comprar";
                // Agregar la funcionalidad del carrito al botón
                button.onclick = () => agregarAlCarrito({
                    nombre: producto.name,
                    precio: producto.price,
                    imagen_url: producto.image_url,
                    categoria: producto.category
                });
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

// Función para agregar productos al carrito
function agregarAlCarrito(producto) {
    carrito.push(producto);
    localStorage.setItem("carrito", JSON.stringify(carrito));
    alert("Producto añadido al carrito");
}

// Cargar productos al iniciar la página
cargar_productos2();