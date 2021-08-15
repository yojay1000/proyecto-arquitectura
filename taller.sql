-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-08-2021 a las 21:09:11
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `taller`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Correo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `cedula` int(14) NOT NULL,
  `telefono` int(14) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email_unique` (`email`),
  UNIQUE KEY `cedula` (`cedula`),
  UNIQUE KEY `telefono` (`telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `email`, `cedula`, `telefono`, `password`) VALUES
(3, 'yojay esteban', 'yojay1000@gmail.com', 25054547, 2147483647, '$2a$08$OgEkEAT9clM7WzCSWUyjFe83yji4nHTcra2piOw1yS3ZHfiwZzUQ.'),
(7, 'victor davila', 'victor@gmail.com', 125475123, 12341234, '$2a$08$XrpqLLHfltkYkBLJvAOF0uLorSduD9EygZffCPwjZG/SPIzlO1BEy'),
(13, 'marcos perez', 'marcos@gmail.com', 12142342, 12342142, '$2a$08$cMUSK6qUzX1UDxWPpWFEEeaHMNBzE8P/t0Oc62Ym0VQfBpVGA9bQy');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hojas_recepcion`
--

CREATE TABLE IF NOT EXISTS `hojas_recepcion` (
  `id_recepcion` int(11) NOT NULL AUTO_INCREMENT,
  `piezas_necesarias` varchar(500) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_recepcion`),
  KEY `hojas_de_recepcion_ibfk_2` (`id_vehiculo`),
  KEY `hojas_de_recepcion_ibfk_3` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `hojas_recepcion`
--

INSERT INTO `hojas_recepcion` (`id_recepcion`, `piezas_necesarias`, `id_vehiculo`, `id_cliente`) VALUES
(1, 'no registradas', 1, 3),
(2, 'no registradas', 21, 13),
(55, 'no registradas', 2, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_reparaciones`
--

CREATE TABLE IF NOT EXISTS `lista_reparaciones` (
  `id_lista` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_lista` varchar(50) NOT NULL,
  `descripcion-lista` varchar(500) NOT NULL,
  `precio` int(5) NOT NULL,
  PRIMARY KEY (`id_lista`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `lista_reparaciones`
--

INSERT INTO `lista_reparaciones` (`id_lista`, `titulo_lista`, `descripcion-lista`, `precio`) VALUES
(1, 'SERVICIOS EMBELLECIMIENTO AUTOMOTRIZ', '1.Laminado y pintura\n2.Lavado de tapicería\n3.Detailing\n', 35),
(2, 'SERVICIOS MANTENIMIENTO PREVENTIVO AUTOMOTRIZ', '1.Revisión de frenos\n2.Cambio de líquidos de frenos\n3.Cambio de aceite\n4.Cambio de Kit de Distribución\n5.Sincronización y puesta punto a punto\n7.Inspección en la dirección', 55),
(3, 'SERVICIOS MANTENIMIENTO CORRECTIVO AUTOMOTRIZ', '1.Suspensión\n2.Dirección\n3.Amortiguadores\n4.Kit de Embrague\n5.Electricidad y electrónica\n6.Corrección de fugas\n', 70),
(4, 'REPARACIÓN DE MOTOR', 'Autorizar el diagnóstico de la rectificadora. Usualmente lleva entre 6-8hs. Se obtiene el resultado de la rectificadora y se repara el motor.', 85),
(5, 'REPARACIÓN DE CAJA DE VELOCIDADES', 'Para el mantenimiento de las cajas de cambios contamos con un amplio catálogo de lubricantes.\r\nEn el siguiente enlace puedes encontrar todo tipo de lubricantes dependiendo del modelo de tu coche que mantendrán nuestra caja de cambios en perfecto estado.', 85),
(6, 'REPARACIÓN DEL AIRE ACONDICIONADO', 'Para reparar el aire acondicionado del coche, primero hay que saber de dónde procede el problema. Lo primero consiste en detectar los síntomas activando el aire con el motor encendido. Es necesario prestar atención a posibles ruidos: si al encender el aire acondicionado se escuchan vibraciones extrañas, lo más probable es que el compresor esté dañado', 44),
(7, 'REPARACIÓN DEL TUBO DE ESCAPE', 'Para la reparación del tubo de escape, además del kit de reparación, son necesarios otros elementos suplementarios: un gato, guantes de goma, una lija y un cepillo. Primero es preciso echar el freno de mano y elevar el coche con la ayuda del gato hidráulico para que sea más fácil trabajar debajo del coche', 85),
(8, 'REPARACIÓN ELECTRÓNICA AUTOMOTRIZ', 'Los circuitos eléctricos automotrices y los cableados defectuosos son la causa de la mayoría de los problemas eléctricos intermitentes que se dan en un vehículo. Pero siempre es mejor revisar bien y rectificar, antes de atribuir el problema a un componente o al conjunto del cableado', 85),
(9, 'REPARACIÓN MECÁNICA AUTOMOTRIZ', 'La reparación es un proceso que consiste básicamente en diagnosticar y corregir el fallo presente en el vehículo, para llevar a cabo esta labor se requiere experiencia y conocimientos de su estructura, componentes y funcionamiento.', 55),
(10, 'REPARACIÓN DE LA BOMBA DE INYECCIÓN DIÉSEL', 'Se produce una pérdida de presión cuando el aire entra en las líneas de combustible de una bomba de inyección diésel,Purgar el sistema de combustible de aire y verificar si hay fugas en las líneas. Reemplazar las líneas si es necesario. Generalmente se corrige el problema.', 75),
(11, 'REPARACIÓN DE SUSPENSIÓN', 'Los componentes de la suspensión de su carro sufren al igual que otros de desgastes en sus prestaciones de flexibilidad y amortiguación, igualmente en sus barras de estabilidad. Con el tiempo se hace necesario que en promedio cada 20.000 kilómetro se revise y genere un mantenimiento preventivo,', 85),
(12, 'REPARACIÓN DEL SISTEMA DE ENCENDIDO CONVENCIONAL', 'e trata de un tipo de transformador eléctrico que eleva el voltaje de la batería (que no suele superar los 12 voltios) a los miles de voltios necesarios para poder pasar a la bujía, inflamar la mezcla de aire y combustible y finalmente arrancar el motor.', 74),
(13, 'REPARACIÓN DE TREN DELANTERO', 'El grupo de piezas que llamamos tren delantero o ensamblaje frontal incluye tanto el sistema de dirección como el sistema de suspensión del vehículo. La estructura debe ser hermética, sólida y segura, con componentes metálicos y blandos en buenas condiciones.', 90),
(14, 'REPARACIÓN DE FRENOS', 'Para encontrar el problema, en primer lugar se debe hablar con el conductor del coche. A través de lo que él diga se puede localizar qué necesita ser reparado.', 55);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mecanicos`
--

CREATE TABLE IF NOT EXISTS `mecanicos` (
  `id_mecanico` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` int(14) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `disponibilidad` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id_mecanico`),
  UNIQUE KEY `email_unique` (`email`),
  UNIQUE KEY `cedula_unique` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mecanicos`
--

INSERT INTO `mecanicos` (`id_mecanico`, `cedula`, `nombre`, `email`, `disponibilidad`, `password`) VALUES
(1, 12547512, 'Juan Pablo', 'Juan@gmail.com', 'ocupado', '12345678'),
(8, 28738728, 'pedro fuentes', 'pedro@gmail.com', 'libre', '12345678');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reparaciones_pendientes`
--

CREATE TABLE IF NOT EXISTS `reparaciones_pendientes` (
  `id_reparacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_recepcion` int(11) NOT NULL,
  `descripcion_reparacion` varchar(500) NOT NULL,
  `estado_reparacion` varchar(50) NOT NULL,
  `mecanico_encargado` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  PRIMARY KEY (`id_reparacion`),
  KEY `reparaciones_pendientes_ibfk_3` (`id_recepcion`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_vehiculo` (`id_vehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reparaciones_pendientes`
--

INSERT INTO `reparaciones_pendientes` (`id_reparacion`, `id_recepcion`, `descripcion_reparacion`, `estado_reparacion`, `mecanico_encargado`, `id_cliente`, `id_vehiculo`) VALUES
(1, 1, 'reparacion delantera', 'en reparacion', 1, 3, 1),
(2, 1, 'reparacion trasera', 'en reparacion', 8, 3, 1),
(3, 2, 'reparacion lateral', 'mecanico asignado, en proceso', 1, 13, 21),
(4, 2, 'reparacion tridimencional', 'mecanico asignado, en proceso', 1, 13, 21),
(15, 55, 'REPARACIÓN DE MOTOR', 'sin asignacion', 0, 7, 2),
(16, 55, 'REPARACIÓN DE CAJA DE VELOCIDADES', 'sin asignacion', 0, 7, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE IF NOT EXISTS `vehiculos` (
  `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `color` varchar(40) NOT NULL,
  PRIMARY KEY (`id_vehiculo`),
  UNIQUE KEY `placa_unique` (`placa`),
  KEY `id_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id_vehiculo`, `id_cliente`, `marca`, `placa`, `modelo`, `color`) VALUES
(1, 3, 'Ford', '1F51S2', 'C-Max', 'azul turqueza'),
(2, 7, 'Honda', '12VRG', 'Jazz', 'Negro'),
(21, 13, 'hyundai', '123121', 'IONIQ ', 'blanco'),
(22, 7, 'nissan', '454546', 'citra', 'azul');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `hojas_recepcion`
--
ALTER TABLE `hojas_recepcion`
  ADD CONSTRAINT `hojas_recepcion_ibfk_2` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hojas_recepcion_ibfk_3` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reparaciones_pendientes`
--
ALTER TABLE `reparaciones_pendientes`
  ADD CONSTRAINT `reparaciones_pendientes_ibfk_3` FOREIGN KEY (`id_recepcion`) REFERENCES `hojas_recepcion` (`id_recepcion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reparaciones_pendientes_ibfk_4` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `reparaciones_pendientes_ibfk_5` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`);

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `vehiculos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;