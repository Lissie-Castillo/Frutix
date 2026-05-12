-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         8.4.3 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para frutix
CREATE DATABASE IF NOT EXISTS `frutix` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `frutix`;

-- Volcando estructura para tabla frutix.caja
CREATE TABLE IF NOT EXISTS `caja` (
  `ID_C` int NOT NULL AUTO_INCREMENT,
  `Total_gastos` int NOT NULL DEFAULT '0',
  `Total_Ventas` int NOT NULL DEFAULT '0',
  `Total_Caja` int NOT NULL DEFAULT '0',
  `Fecha` int NOT NULL DEFAULT '0',
  `Hora` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_C`),
  KEY `Fecha` (`Fecha`),
  KEY `Hora` (`Hora`),
  CONSTRAINT `FK_caja_fecha` FOREIGN KEY (`Fecha`) REFERENCES `fecha` (`ID_F`),
  CONSTRAINT `FK_caja_hora` FOREIGN KEY (`Hora`) REFERENCES `hora` (`ID_H`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla frutix.caja: ~0 rows (aproximadamente)

-- Volcando estructura para tabla frutix.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `ID_C` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_C`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla frutix.categoria: ~6 rows (aproximadamente)
INSERT INTO `categoria` (`ID_C`, `Nombre`) VALUES
	(1, 'Frutas'),
	(2, 'Verduras'),
	(3, 'Abarrotes'),
	(4, 'Condimentos'),
	(5, 'Dulces'),
	(6, 'Carnes');

-- Volcando estructura para tabla frutix.embolsado
CREATE TABLE IF NOT EXISTS `embolsado` (
  `ID_EM` int NOT NULL AUTO_INCREMENT,
  `Nombre_Embolsado` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_EM`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla frutix.embolsado: ~4 rows (aproximadamente)
INSERT INTO `embolsado` (`ID_EM`, `Nombre_Embolsado`) VALUES
	(1, 'Kilo'),
	(2, 'Gramos'),
	(3, 'Pieza'),
	(4, 'Bolsa');

-- Volcando estructura para tabla frutix.fecha
CREATE TABLE IF NOT EXISTS `fecha` (
  `ID_F` int NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`ID_F`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla frutix.fecha: ~33 rows (aproximadamente)
INSERT INTO `fecha` (`ID_F`, `Fecha`) VALUES
	(1, '2026-03-31'),
	(2, '2026-04-01'),
	(4, '2026-04-02'),
	(5, '2026-04-02'),
	(6, '2026-04-02'),
	(7, '2026-04-02'),
	(8, '2026-04-02'),
	(9, '2026-04-02'),
	(10, '2026-04-02'),
	(11, '2026-04-03'),
	(17, '2026-04-03'),
	(18, '2026-04-03'),
	(19, '2026-04-04'),
	(20, '2026-04-04'),
	(21, '2026-04-04'),
	(22, '2026-04-04'),
	(26, '2026-04-10'),
	(27, '2026-04-10'),
	(28, '2026-04-10'),
	(29, '2026-04-10'),
	(30, '2026-04-10'),
	(31, '2026-04-10'),
	(32, '2026-04-10'),
	(33, '2026-04-10'),
	(37, '2026-04-10'),
	(38, '2026-04-21'),
	(39, '2026-04-23'),
	(40, '2026-04-23'),
	(41, '2026-04-28'),
	(42, '2026-05-12'),
	(43, '2026-05-12'),
	(44, '2026-05-12'),
	(45, '2026-05-12');

-- Volcando estructura para tabla frutix.gastos
CREATE TABLE IF NOT EXISTS `gastos` (
  `ID_G` int NOT NULL AUTO_INCREMENT,
  `Concepto` varchar(50) NOT NULL DEFAULT '0',
  `Total` decimal(5,0) NOT NULL DEFAULT '0',
  `Fecha` int NOT NULL DEFAULT (0),
  `Hora` int NOT NULL DEFAULT (0),
  PRIMARY KEY (`ID_G`),
  KEY `FK_gastos_fecha` (`Fecha`),
  KEY `FK_gastos_hora` (`Hora`),
  CONSTRAINT `FK_gastos_fecha` FOREIGN KEY (`Fecha`) REFERENCES `fecha` (`ID_F`),
  CONSTRAINT `FK_gastos_hora` FOREIGN KEY (`Hora`) REFERENCES `hora` (`ID_H`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla frutix.gastos: ~1 rows (aproximadamente)
INSERT INTO `gastos` (`ID_G`, `Concepto`, `Total`, `Fecha`, `Hora`) VALUES
	(1, 'Basura', 1500, 17, 15);

-- Volcando estructura para tabla frutix.hora
CREATE TABLE IF NOT EXISTS `hora` (
  `ID_H` int NOT NULL AUTO_INCREMENT,
  `Hora` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`ID_H`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla frutix.hora: ~31 rows (aproximadamente)
INSERT INTO `hora` (`ID_H`, `Hora`) VALUES
	(2, '20:59:53'),
	(3, '21:01:53'),
	(4, '21:05:21'),
	(5, '21:09:05'),
	(6, '21:11:04'),
	(7, '21:20:31'),
	(8, '21:22:12'),
	(9, '10:02:53'),
	(15, '10:49:00'),
	(16, '17:49:36'),
	(17, '11:52:21'),
	(18, '11:56:20'),
	(19, '11:56:30'),
	(20, '12:16:14'),
	(24, '11:47:10'),
	(25, '11:47:29'),
	(26, '11:48:59'),
	(27, '11:49:15'),
	(28, '11:51:29'),
	(29, '11:51:43'),
	(30, '11:51:58'),
	(31, '13:09:23'),
	(35, '16:13:00'),
	(36, '15:57:54'),
	(37, '17:50:44'),
	(38, '17:51:43'),
	(39, '15:51:20'),
	(40, '08:33:48'),
	(41, '08:35:28'),
	(42, '08:36:16'),
	(43, '08:42:29');

-- Volcando estructura para tabla frutix.inventario
CREATE TABLE IF NOT EXISTS `inventario` (
  `ID_Inv` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(50) NOT NULL DEFAULT '',
  `Cantidad` int NOT NULL DEFAULT (0),
  `Precio_Unitario` decimal(20,2) NOT NULL DEFAULT (0),
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Producto` int NOT NULL,
  PRIMARY KEY (`ID_Inv`),
  KEY `Fecha` (`Fecha`),
  KEY `Hora` (`Hora`),
  KEY `Producto` (`Producto`),
  CONSTRAINT `FK_Productos` FOREIGN KEY (`Producto`) REFERENCES `productos` (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla frutix.inventario: ~3 rows (aproximadamente)
INSERT INTO `inventario` (`ID_Inv`, `Tipo`, `Cantidad`, `Precio_Unitario`, `Fecha`, `Hora`, `Producto`) VALUES
	(2, 'Ingreso', 12, 5.00, '2026-05-12', '08:27:03', 14),
	(10, 'Egreso', 2, 4.00, '2026-05-12', '08:42:29', 10),
	(11, 'Egreso', 2, 5.00, '2026-05-12', '08:42:29', 14);

-- Volcando estructura para tabla frutix.mm_prodtip
CREATE TABLE IF NOT EXISTS `mm_prodtip` (
  `ID_PT` int NOT NULL AUTO_INCREMENT,
  `ID_Producto` int NOT NULL DEFAULT '0',
  `ID_Embolsado` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_PT`),
  KEY `FK__productos` (`ID_Producto`),
  KEY `FK__embolsado` (`ID_Embolsado`),
  CONSTRAINT `FK__embolsado` FOREIGN KEY (`ID_Embolsado`) REFERENCES `embolsado` (`ID_EM`),
  CONSTRAINT `FK__productos` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla frutix.mm_prodtip: ~11 rows (aproximadamente)
INSERT INTO `mm_prodtip` (`ID_PT`, `ID_Producto`, `ID_Embolsado`) VALUES
	(1, 1, 1),
	(2, 2, 1),
	(3, 3, 1),
	(4, 4, 2),
	(5, 5, 3),
	(6, 6, 1),
	(7, 7, 3),
	(8, 8, 3),
	(9, 9, 3),
	(10, 10, 3),
	(14, 14, 3);

-- Volcando estructura para tabla frutix.mm_vp
CREATE TABLE IF NOT EXISTS `mm_vp` (
  `ID_VP` int NOT NULL AUTO_INCREMENT,
  `Cantidad` int NOT NULL DEFAULT '0',
  `ID_Producto` int NOT NULL DEFAULT '0',
  `ID_Venta` int NOT NULL DEFAULT '0',
  `Precio_unitario` decimal(5,2) NOT NULL,
  PRIMARY KEY (`ID_VP`),
  KEY `FK_mm_vp_productos` (`ID_Producto`),
  KEY `FK_mm_vp_ventas` (`ID_Venta`),
  CONSTRAINT `FK_mm_vp_productos` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`Codigo`),
  CONSTRAINT `FK_mm_vp_ventas` FOREIGN KEY (`ID_Venta`) REFERENCES `ventas` (`ID_V`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla frutix.mm_vp: ~90 rows (aproximadamente)
INSERT INTO `mm_vp` (`ID_VP`, `Cantidad`, `ID_Producto`, `ID_Venta`, `Precio_unitario`) VALUES
	(1, 3, 1, 7, 2.00),
	(2, 3, 2, 7, 1.50),
	(3, 4, 1, 8, 2.00),
	(4, 3, 2, 8, 1.50),
	(5, 2, 1, 9, 2.00),
	(6, 1, 2, 9, 1.50),
	(7, 0, 1, 10, 2.00),
	(8, 0, 2, 10, 1.50),
	(9, 0, 3, 10, 150.00),
	(10, 0, 4, 10, 20.00),
	(11, 0, 5, 10, 17.00),
	(12, 0, 1, 13, 2.00),
	(13, 0, 2, 13, 1.50),
	(14, 0, 3, 13, 150.00),
	(15, 1, 4, 13, 20.00),
	(16, 0, 5, 13, 17.00),
	(17, 2, 1, 14, 2.00),
	(18, 0, 2, 14, 1.50),
	(19, 0, 3, 14, 150.00),
	(20, 0, 4, 14, 20.00),
	(21, 0, 5, 14, 17.00),
	(22, 2, 1, 15, 2.00),
	(23, 0, 2, 15, 1.50),
	(24, 0, 3, 15, 150.00),
	(25, 0, 4, 15, 20.00),
	(26, 0, 5, 15, 17.00),
	(27, 0, 1, 16, 2.00),
	(28, 3, 2, 16, 1.50),
	(29, 0, 3, 16, 150.00),
	(30, 0, 4, 16, 20.00),
	(31, 0, 5, 16, 17.00),
	(32, 0, 1, 17, 2.00),
	(33, 4, 2, 17, 1.50),
	(34, 0, 3, 17, 150.00),
	(35, 0, 4, 17, 20.00),
	(36, 0, 5, 17, 17.00),
	(37, 0, 1, 18, 2.00),
	(38, 2, 2, 18, 1.50),
	(39, 0, 3, 18, 150.00),
	(40, 0, 4, 18, 20.00),
	(41, 0, 5, 18, 17.00),
	(42, 4, 1, 19, 2.00),
	(43, 0, 2, 19, 1.50),
	(44, 0, 3, 19, 150.00),
	(45, 0, 4, 19, 20.00),
	(46, 0, 5, 19, 17.00),
	(47, 6, 1, 20, 2.00),
	(48, 2, 2, 20, 1.50),
	(49, 0, 3, 20, 150.00),
	(50, 0, 4, 20, 20.00),
	(51, 0, 5, 20, 17.00),
	(52, 0, 1, 21, 2.00),
	(53, 0, 2, 21, 1.50),
	(54, 1, 3, 21, 150.00),
	(55, 0, 4, 21, 20.00),
	(56, 3, 1, 22, 2.00),
	(57, 2, 2, 22, 1.50),
	(58, 3, 2, 23, 1.50),
	(59, 2, 3, 23, 150.00),
	(60, 5, 2, 24, 5.00),
	(61, 0, 3, 24, 150.00),
	(62, 1, 3, 25, 150.00),
	(63, 0, 1, 26, 9.00),
	(64, 0, 2, 26, 5.00),
	(65, 0, 3, 26, 150.00),
	(66, 0, 4, 26, 20.00),
	(67, 0, 5, 26, 17.00),
	(68, 0, 10, 26, 4.00),
	(69, 2, 14, 26, 5.00),
	(70, 0, 1, 27, 9.00),
	(71, 0, 2, 27, 5.00),
	(72, 0, 3, 27, 150.00),
	(73, 0, 4, 27, 20.00),
	(74, 0, 5, 27, 17.00),
	(75, 0, 10, 27, 4.00),
	(76, 2, 14, 27, 5.00),
	(77, 0, 1, 28, 9.00),
	(78, 0, 2, 28, 5.00),
	(79, 0, 3, 28, 150.00),
	(80, 0, 4, 28, 20.00),
	(81, 0, 5, 28, 17.00),
	(82, 0, 10, 28, 4.00),
	(83, 2, 14, 28, 5.00),
	(84, 0, 1, 29, 9.00),
	(85, 0, 2, 29, 5.00),
	(86, 0, 3, 29, 150.00),
	(87, 0, 4, 29, 20.00),
	(88, 0, 5, 29, 17.00),
	(89, 2, 10, 29, 4.00),
	(90, 2, 14, 29, 5.00);

-- Volcando estructura para tabla frutix.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `Codigo` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL DEFAULT '0',
  `Precio` decimal(5,2) NOT NULL DEFAULT (0),
  `Cantidad` int NOT NULL,
  `Merma` decimal(5,2) NOT NULL DEFAULT (0),
  `Categoria` int NOT NULL DEFAULT (0),
  `Estado` varchar(8) NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`Codigo`),
  KEY `FK__categoria` (`Categoria`),
  CONSTRAINT `FK__categoria` FOREIGN KEY (`Categoria`) REFERENCES `categoria` (`ID_C`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla frutix.productos: ~11 rows (aproximadamente)
INSERT INTO `productos` (`Codigo`, `Nombre`, `Precio`, `Cantidad`, `Merma`, `Categoria`, `Estado`) VALUES
	(1, 'Manzana', 9.00, 17, 2.00, 1, 'Activo'),
	(2, 'Zanahoria', 5.00, 10, 0.00, 1, 'Activo'),
	(3, 'Pollo', 150.00, 11, 0.00, 6, 'Activo'),
	(4, 'Azucar', 20.00, 10, 1.00, 3, 'Activo'),
	(5, 'Chocolate', 17.00, 12, 3.00, 5, 'Activo'),
	(6, 'Tomate', 26.00, 50, 0.00, 2, 'Inactivo'),
	(7, 'Mango', 3.00, 24, 0.00, 1, 'Inactivo'),
	(8, 'Mango', 3.00, 10, 0.00, 1, 'Inactivo'),
	(9, 'Mango', 3.00, 13, 0.00, 1, 'Inactivo'),
	(10, 'Mango', 4.00, 21, 0.00, 1, 'Activo'),
	(14, 'Platano', 5.00, 4, 1.00, 1, 'Activo');

-- Volcando estructura para tabla frutix.re_merma
CREATE TABLE IF NOT EXISTS `re_merma` (
  `ID_M` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL DEFAULT '0',
  `Fecha` int NOT NULL DEFAULT (0),
  `Cantidad` decimal(5,2) NOT NULL DEFAULT (0),
  `Observaciones` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_M`),
  KEY `FK__fecha` (`Fecha`),
  CONSTRAINT `FK__fecha` FOREIGN KEY (`Fecha`) REFERENCES `fecha` (`ID_F`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla frutix.re_merma: ~0 rows (aproximadamente)

-- Volcando estructura para tabla frutix.re_prod
CREATE TABLE IF NOT EXISTS `re_prod` (
  `ID_Ing` int NOT NULL AUTO_INCREMENT,
  `fecha` int NOT NULL DEFAULT '0',
  `nombre` varchar(20) NOT NULL DEFAULT '0',
  `cantidad` int NOT NULL DEFAULT (0),
  `categoria` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_Ing`),
  KEY `fecha` (`fecha`),
  KEY `categoria` (`categoria`),
  CONSTRAINT `categoria` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`ID_C`),
  CONSTRAINT `fecha` FOREIGN KEY (`fecha`) REFERENCES `fecha` (`ID_F`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla frutix.re_prod: ~2 rows (aproximadamente)
INSERT INTO `re_prod` (`ID_Ing`, `fecha`, `nombre`, `cantidad`, `categoria`) VALUES
	(1, 1, 'Manzana', 10, 1),
	(2, 2, 'Zanahoria', 7, 2);

-- Volcando estructura para tabla frutix.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `ID_U` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL DEFAULT '0',
  `Contraseña` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `Rol` int NOT NULL,
  `Estado` varchar(8) NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`ID_U`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla frutix.usuarios: ~21 rows (aproximadamente)
INSERT INTO `usuarios` (`ID_U`, `Nombre`, `Contraseña`, `Rol`, `Estado`) VALUES
	(1, 'Israel', '10092005', 1, 'Activo'),
	(2, 'Edelmy', '1234', 3, 'Activo'),
	(3, 'Kimberly', 'Kim98', 2, 'Inactivo'),
	(4, 'Lissie', 'Liss0982', 2, 'Activo'),
	(5, 'Kimberly Miranda', 'Kim', 3, 'Inactivo'),
	(6, 'Kimberly Miranda', 'Kim', 3, 'Inactivo'),
	(7, 'Kimberly Miranda', 'Kim', 3, 'Inactivo'),
	(8, 'Kimberly Miranda', 'Kim', 3, 'Inactivo'),
	(9, 'Kimberly', 'Kim', 3, 'Inactivo'),
	(10, 'Kimberly', 'Kim', 3, 'Inactivo'),
	(11, 'Kimberly', 'Kim', 3, 'Inactivo'),
	(12, 'Kimberly', 'Kim', 3, 'Inactivo'),
	(13, 'Kimberly', 'Kim', 3, 'Inactivo'),
	(14, 'Kimberly', 'Kim', 3, 'Inactivo'),
	(15, 'Kimberly', 'Kim', 3, 'Inactivo'),
	(16, 'Kimberly', 'Kim', 3, 'Inactivo'),
	(17, 'Kimberly', 'Kim', 3, 'Inactivo'),
	(18, 'Kimberly', 'kim', 3, 'Inactivo'),
	(19, 'Kimberly', 'kim', 3, 'Inactivo'),
	(20, 'Kimberly', 'Kim', 3, 'Inactivo'),
	(21, 'Kimberly', '10092005', 3, 'Activo');

-- Volcando estructura para tabla frutix.ventas
CREATE TABLE IF NOT EXISTS `ventas` (
  `ID_V` int NOT NULL AUTO_INCREMENT,
  `Concepto` varchar(100) NOT NULL DEFAULT '',
  `Fecha` int NOT NULL DEFAULT (0),
  `Hora` int NOT NULL DEFAULT (0),
  `Total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `Empleado` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_V`),
  KEY `FK__hora` (`Hora`),
  KEY `FK_ventas_fecha` (`Fecha`),
  KEY `FK__usuarios` (`Empleado`) USING BTREE,
  CONSTRAINT `FK__hora` FOREIGN KEY (`Hora`) REFERENCES `hora` (`ID_H`),
  CONSTRAINT `FK__usuarios` FOREIGN KEY (`Empleado`) REFERENCES `usuarios` (`ID_U`),
  CONSTRAINT `FK_ventas_fecha` FOREIGN KEY (`Fecha`) REFERENCES `fecha` (`ID_F`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla frutix.ventas: ~24 rows (aproximadamente)
INSERT INTO `ventas` (`ID_V`, `Concepto`, `Fecha`, `Hora`, `Total`, `Empleado`) VALUES
	(4, 'Manzana x2', 7, 5, 4.00, 1),
	(5, 'Manzana x2, Zanahoria x2', 8, 6, 7.00, 1),
	(6, 'Manzana x2, Zanahoria x3', 9, 7, 8.50, 1),
	(7, 'Manzana x3, Zanahoria x3', 10, 8, 10.50, 1),
	(8, 'Manzana x4, Zanahoria x3', 11, 9, 12.50, 1),
	(9, 'Manzana x2, Zanahoria x1', 18, 16, 5.50, 2),
	(10, 'Manzana x0, Zanahoria x0, Pollo x0, Azucar x0, Chocolate x0', 19, 17, 0.00, 1),
	(13, 'Manzana x0, Zanahoria x0, Pollo x0, Azucar x1, Chocolate x0', 22, 20, 20.00, 1),
	(14, 'Manzana x2, Zanahoria x0, Pollo x0, Azucar x0, Chocolate x0', 26, 24, 4.00, 1),
	(15, 'Manzana x2, Zanahoria x0, Pollo x0, Azucar x0, Chocolate x0', 27, 25, 4.00, 1),
	(16, 'Manzana x0, Zanahoria x3, Pollo x0, Azucar x0, Chocolate x0', 28, 26, 4.50, 1),
	(17, 'Manzana x0, Zanahoria x4, Pollo x0, Azucar x0, Chocolate x0', 29, 27, 6.00, 1),
	(18, 'Manzana x0, Zanahoria x2, Pollo x0, Azucar x0, Chocolate x0', 30, 28, 3.00, 1),
	(19, 'Manzana x4, Zanahoria x0, Pollo x0, Azucar x0, Chocolate x0', 31, 29, 8.00, 1),
	(20, 'Manzana x6, Zanahoria x2, Pollo x0, Azucar x0, Chocolate x0', 32, 30, 15.00, 1),
	(21, 'Manzana x0, Zanahoria x0, Pollo x1, Azucar x0', 33, 31, 150.00, 1),
	(22, 'Manzana x3, Zanahoria x2', 38, 36, 9.00, 1),
	(23, 'Zanahoria x3, Pollo x2', 39, 37, 304.50, 2),
	(24, 'Zanahoria x5, Pollo x0', 40, 38, 25.00, 2),
	(25, 'Pollo x1', 41, 39, 150.00, 1),
	(26, 'Manzana x0, Zanahoria x0, Pollo x0, Azucar x0, Chocolate x0, Mango x0, Platano x2', 42, 40, 10.00, 1),
	(27, 'Manzana x0, Zanahoria x0, Pollo x0, Azucar x0, Chocolate x0, Mango x0, Platano x2', 43, 41, 10.00, 1),
	(28, 'Manzana x0, Zanahoria x0, Pollo x0, Azucar x0, Chocolate x0, Mango x0, Platano x2', 44, 42, 10.00, 1),
	(29, 'Manzana x0, Zanahoria x0, Pollo x0, Azucar x0, Chocolate x0, Mango x2, Platano x2', 45, 43, 18.00, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
