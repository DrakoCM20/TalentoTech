-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-05-2025 a las 18:45:13
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libreria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID_cliente` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Correo` varchar(255) NOT NULL,
  `Telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID_cliente`, `Nombre`, `Correo`, `Telefono`) VALUES
(1, 'Ana Rodríguez', 'ana.rodriguez@librosweb.com', '+52 55 1234 5678'),
(2, 'Pedro Silva', 'pedro.silva88@correo.net', '11 9876-5432'),
(3, 'Laura Chen', 'lchen_92@mailasia.com', '+86 138 0000 1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `ID_libro` int(11) NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `Autor` varchar(255) NOT NULL,
  `Genero` varchar(100) DEFAULT NULL,
  `Año_publicacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`ID_libro`, `Titulo`, `Autor`, `Genero`, `Año_publicacion`) VALUES
(1, 'El nombre del viento', 'Patrick Rothfuss', 'Fantasía', 2007),
(2, 'Circe', 'Madeline Miller', 'Mitología', 2018),
(3, 'El hombre en busca de sentido', 'Viktor Frankl', 'Thriller psicológico', 1946),
(4, 'Los siete maridos de Evelyn Hugo', 'Taylor Jenkins Reid', 'Ficción', 2017),
(5, 'Proyecto Hail Mary', 'Andy Weir', 'Ciencia ficción', 2021);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `ID_prestamo` int(11) NOT NULL,
  `ID_cliente` int(11) DEFAULT NULL,
  `ID_libro` int(11) DEFAULT NULL,
  `Fecha_prestamo` date DEFAULT NULL,
  `Fecha_devolucion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`ID_prestamo`, `ID_cliente`, `ID_libro`, `Fecha_prestamo`, `Fecha_devolucion`) VALUES
(1, 1, 2, '2024-02-01', '2024-02-15'),
(2, 2, 5, '2024-03-10', NULL),
(3, 3, 4, '2024-01-20', '2024-02-05');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_cliente`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`ID_libro`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`ID_prestamo`),
  ADD KEY `ID_cliente` (`ID_cliente`),
  ADD KEY `ID_libro` (`ID_libro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `ID_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `ID_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`ID_cliente`) REFERENCES `clientes` (`ID_cliente`),
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`ID_libro`) REFERENCES `libros` (`ID_libro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
