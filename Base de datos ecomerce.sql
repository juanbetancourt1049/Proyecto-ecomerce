-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2024 a las 01:32:28
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecommerce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `subject`, `message`, `created_at`) VALUES
(1, 'Juan Pérez', 'juanperez@email.com', 'Consulta sobre productos', 'Estoy interesado en más información sobre los productos deportivos.', '2024-11-13 21:21:56'),
(2, 'reer', 'renebetancour@gmail.com', 'rereg', 'reerger', '2024-11-14 03:33:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`) VALUES
(1, 'Juan Pérez', 'juan.perez@example.com', 'password123'),
(2, 'María Gómez', 'maria.gomez@example.com', 'securepassword'),
(3, 'Carlos López', 'carlos.lopez@example.com', 'mysecurepassword');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `nombre`, `descripcion`, `precio`, `categoria`, `imagen_url`, `stock`, `fecha_creacion`) VALUES
(1, 'Camiseta Básica', 'Camiseta de algodón 100% con ajuste regular', 12.99, 'Ropa', 'https://backoff.carlosnieto.com.co/backend/admin/backend/web/archivosDelCliente/items/images/20240320135739-CAMISETAS--POLOS-CAMISETA-CAMISETA-BASICA-GRIS-MEDIO-JASPE-CN-703520240320135739821.jpg', 50, '2024-11-13 15:27:41'),
(2, 'Jeans Azul', 'Jeans clásico de corte recto', 35.50, 'Ropa', 'https://amigosafety.com/images/productos/1680213793_PANTALON%20FRENTE.png', 30, '2024-11-13 15:27:41'),
(3, 'Zapatillas Deportivas', 'Zapatillas cómodas para entrenamiento diario', 59.99, 'Calzado', 'https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/01190add819e47c8a092653b9fd29bac_9366/tenis-de-running-runfalcon-5.jpg', 20, '2024-11-13 15:27:41'),
(4, 'Sudadera con Capucha', 'Sudadera de algodón suave con capucha', 24.99, 'Ropa', 'https://ae01.alicdn.com/kf/S0954e6da78fc446ba52f1c53e1de4832a.jpg_640x640q90.jpg', 40, '2024-11-13 15:27:41'),
(5, 'Bolso de Cuero', 'Bolso de cuero genuino, ideal para el uso diario', 80.00, 'Accesorios', 'https://belcorpcolombia.vtexassets.com/arquivos/ids/971687-800-800?v=638622030313000000&width=800&height=800&aspect=true', 15, '2024-11-13 15:27:41'),
(6, 'Reloj Deportivo', 'Reloj resistente al agua con cronómetro', 45.75, 'Accesorios', 'https://imagedelivery.net/4fYuQyy-r8_rpBpcY7lH_A/falabellaCO/133088085_01/w=800,h=800,fit=pad', 25, '2024-11-13 15:27:41'),
(7, 'Auriculares Inalámbricos', 'Auriculares Bluetooth con sonido envolvente', 29.99, 'Electrónica', 'https://www.jbl.com.co/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw6cd45214/01.JBL_Tune%20Buds_Product%20Image_Hero_Black.jpg?sw=270&sh=330&sm=fit&sfrm=png', 35, '2024-11-13 15:27:41'),
(8, 'Smartphone 5G', 'Smartphone con pantalla de 6.5 pulgadas y 128GB de almacenamiento', 299.99, 'Electrónica', 'https://imagedelivery.net/4fYuQyy-r8_rpBpcY7lH_A/falabellaCO/127921200_01/w=1500,h=1500,fit=pad', 10, '2024-11-13 15:27:41'),
(9, 'Libro: Programación en JavaScript', 'Libro para aprender JavaScript desde cero', 18.75, 'Libros', 'https://m.media-amazon.com/images/I/6104rZ6dplL._AC_UF1000,1000_QL80_.jpg', 50, '2024-11-13 15:27:41'),
(10, 'Cafetera Espresso', 'Cafetera automática con molinillo de café integrado', 150.00, 'Hogar', 'https://pepeganga.vtexassets.com/arquivos/ids/703875-800-auto?v=637829657479500000&width=800&height=auto&aspect=true', 8, '2024-11-13 15:27:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products2`
--

CREATE TABLE `products2` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products2`
--

INSERT INTO `products2` (`id`, `name`, `description`, `category`, `price`, `image_url`) VALUES
(1, 'Camiseta Estampada', 'Camiseta estampada en algodón de alta calidad.', 'Ropa', 35.99, 'https://arturocalle.vtexassets.com/arquivos/ids/647045-800-1067?v=638549221114900000&width=800&height=1067&aspect=true'),
(2, 'Gorra Unisex', 'Gorra ajustable unisex de la marca New Balance.', 'Accesorios', 15.50, 'https://pilatos21.vtexassets.com/arquivos/ids/1252674/Gorra-Unisex-Performance-Hat-New-Balance119.jpg?v=638350726354770000'),
(3, 'Zapatos Deportivos', 'Zapatos deportivos para entrenamientos y actividades físicas.', 'Calzado', 59.99, 'https://http2.mlstatic.com/D_NQ_NP_748586-CBT70207926584_062023-O.webp'),
(4, 'Chaqueta Casual', 'Chaqueta casual con capucha ideal para el invierno.', 'Ropa', 49.99, 'https://cdnx.jumpseller.com/urbenmood/image/45708999/JK55118.jpg?1708494634'),
(5, 'Bolso de Mano', 'Bolso de mano de cuero con estilo moderno.', 'Accesorios', 39.99, 'https://m.media-amazon.com/images/I/81cLGOcL6SL._AC_SL1500_.jpg'),
(6, 'Reloj Analógico', 'Reloj analógico elegante con correa de cuero.', 'Accesorios', 99.99, 'https://http2.mlstatic.com/D_NQ_NP_830486-MLU74433357265_022024-O.webp'),
(7, 'Audífonos Bluetooth', 'Audífonos Bluetooth con cancelación de ruido.', 'Tecnología', 79.99, 'https://http2.mlstatic.com/D_NQ_NP_759831-MLU73418662320_122023-O.webp'),
(8, 'Tablet 10 pulgadas', 'Tablet de 10 pulgadas con pantalla HD y gran capacidad.', 'Electrónica', 199.99, 'https://http2.mlstatic.com/D_NQ_NP_675527-CBT75354355782_032024-O.webp'),
(9, 'Libro: Python Avanzado', 'Libro para aprender técnicas avanzadas de programación en Python.', 'Libros', 29.99, 'https://m.media-amazon.com/images/I/71eTR3B4j8L._UF1000,1000_QL80_.jpg'),
(10, 'Cafetera de Goteo', 'Cafetera de goteo de 1.2 litros ideal para preparar café.', 'Hogar', 45.99, 'https://laferiadelagreca.com/wp-content/uploads/090158.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products2`
--
ALTER TABLE `products2`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `products2`
--
ALTER TABLE `products2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
