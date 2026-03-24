/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `frutix` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `frutix`;

CREATE TABLE IF NOT EXISTS `caja` (
  `ID_C` int NOT NULL AUTO_INCREMENT,
  `Total_Gastos` decimal(5,0) NOT NULL,
  `Total_Ventas` decimal(5,2) NOT NULL,
  `Total_Caja` decimal(5,2) NOT NULL,
  `Fecha` int NOT NULL,
  `Hora` int NOT NULL,
  PRIMARY KEY (`ID_C`),
  KEY `FK_caja_fecha` (`Fecha`),
  KEY `FK_caja_hora` (`Hora`),
  CONSTRAINT `FK_caja_fecha` FOREIGN KEY (`Fecha`) REFERENCES `fecha` (`ID_F`),
  CONSTRAINT `FK_caja_hora` FOREIGN KEY (`Hora`) REFERENCES `hora` (`ID_H`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `categoria` (
  `ID_C` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID_C`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `categoria` (`ID_C`, `Nombre`) VALUES
	(1, 'Frutas'),
	(2, 'Verduras'),
	(3, 'Abarrotes'),
	(4, 'Condimentos'),
	(5, 'Dulces');

CREATE TABLE IF NOT EXISTS `embolsado` (
  `ID_EM` int NOT NULL AUTO_INCREMENT,
  `Nombre_Embolsado` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID_EM`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `embolsado` (`ID_EM`, `Nombre_Embolsado`) VALUES
	(1, 'Kilo'),
	(2, 'Gramos'),
	(3, 'Pieza'),
	(4, 'Bolsa');

CREATE TABLE IF NOT EXISTS `fecha` (
  `ID_F` int NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`ID_F`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `gastos` (
  `ID_G` int NOT NULL AUTO_INCREMENT,
  `Concepto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Total` decimal(5,2) NOT NULL,
  `Fecha` int NOT NULL,
  `Hora` int NOT NULL,
  PRIMARY KEY (`ID_G`),
  KEY `FK_gastos_fecha` (`Fecha`),
  KEY `FK_gastos_hora` (`Hora`),
  CONSTRAINT `FK_gastos_fecha` FOREIGN KEY (`Fecha`) REFERENCES `fecha` (`ID_F`),
  CONSTRAINT `FK_gastos_hora` FOREIGN KEY (`Hora`) REFERENCES `hora` (`ID_H`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `hora` (
  `ID_H` int NOT NULL AUTO_INCREMENT,
  `Hora` time NOT NULL,
  PRIMARY KEY (`ID_H`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `mm_prodtip` (
  `ID_PT` int NOT NULL AUTO_INCREMENT,
  `ID_Producto` int NOT NULL,
  `ID_Embolsado` int NOT NULL,
  PRIMARY KEY (`ID_PT`),
  KEY `FK_mm_prodtip_productos` (`ID_Producto`),
  KEY `FK_mm_prodtip_embolsado` (`ID_Embolsado`),
  CONSTRAINT `FK_mm_prodtip_embolsado` FOREIGN KEY (`ID_Embolsado`) REFERENCES `embolsado` (`ID_EM`),
  CONSTRAINT `FK_mm_prodtip_productos` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `mm_vp` (
  `ID_VP` int NOT NULL AUTO_INCREMENT,
  `ID_Producto` int NOT NULL,
  `ID_Venta` int NOT NULL,
  PRIMARY KEY (`ID_VP`),
  KEY `FK_mm_vp_productos` (`ID_Producto`),
  KEY `FK_mm_vp_ventas` (`ID_Venta`),
  CONSTRAINT `FK_mm_vp_productos` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`Codigo`),
  CONSTRAINT `FK_mm_vp_ventas` FOREIGN KEY (`ID_Venta`) REFERENCES `ventas` (`ID_V`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `productos` (
  `Codigo` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Precio` decimal(5,2) NOT NULL,
  `Cantidad` decimal(5,2) NOT NULL,
  `Merma` decimal(5,2) NOT NULL,
  `Categoria` int NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `FK_productos_categoria` (`Categoria`),
  CONSTRAINT `FK_productos_categoria` FOREIGN KEY (`Categoria`) REFERENCES `categoria` (`ID_C`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de Productos';


CREATE TABLE IF NOT EXISTS `re_merma` (
  `ID_M` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Fecha` int NOT NULL,
  `Cantidad` decimal(5,2) NOT NULL,
  `Observaciones` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID_M`),
  KEY `FK_re_merma_fecha` (`Fecha`),
  CONSTRAINT `FK_re_merma_fecha` FOREIGN KEY (`Fecha`) REFERENCES `fecha` (`ID_F`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `re_prod` (
  `ID_Ing` int NOT NULL AUTO_INCREMENT,
  `Fecha` int NOT NULL,
  `Nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Cantidad` decimal(5,2) NOT NULL,
  `Categoria` int NOT NULL,
  PRIMARY KEY (`ID_Ing`),
  KEY `FK_re_prod_fecha` (`Fecha`),
  KEY `FK_re_prod_categoria` (`Categoria`),
  CONSTRAINT `FK_re_prod_categoria` FOREIGN KEY (`Categoria`) REFERENCES `categoria` (`ID_C`),
  CONSTRAINT `FK_re_prod_fecha` FOREIGN KEY (`Fecha`) REFERENCES `fecha` (`ID_F`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `usuarios` (
  `ID_U` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Contraseña` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID_U`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `ventas` (
  `ID_V` int NOT NULL AUTO_INCREMENT,
  `Concepto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Fecha` int NOT NULL,
  `Hora` int NOT NULL,
  `Total` decimal(10,2) NOT NULL DEFAULT (0),
  `Empleado` int NOT NULL,
  PRIMARY KEY (`ID_V`),
  KEY `FK_ventas_fecha` (`Fecha`),
  KEY `FK_ventas_hora` (`Hora`),
  KEY `FK_ventas_usuarios` (`Empleado`),
  CONSTRAINT `FK_ventas_fecha` FOREIGN KEY (`Fecha`) REFERENCES `fecha` (`ID_F`),
  CONSTRAINT `FK_ventas_hora` FOREIGN KEY (`Hora`) REFERENCES `hora` (`ID_H`),
  CONSTRAINT `FK_ventas_usuarios` FOREIGN KEY (`Empleado`) REFERENCES `usuarios` (`ID_U`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
