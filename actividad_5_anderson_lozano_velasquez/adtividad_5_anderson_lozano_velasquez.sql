-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para heladeria_y_pizzeria_la_65_2
DROP DATABASE IF EXISTS `heladeria_y_pizzeria_la_65_2`;
CREATE DATABASE IF NOT EXISTS `heladeria_y_pizzeria_la_65_2` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `heladeria_y_pizzeria_la_65_2`;

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65_2.customers
DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `age` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='este campo contendra los clientes ';

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65_2.customers: ~6 rows (aproximadamente)
DELETE FROM `customers`;
INSERT INTO `customers` (`id`, `name`, `age`) VALUES
	(1, 'Camila Alejandra Florencia Torrez', 32),
	(2, 'Alex Estiven Upegui Rodaez', 27),
	(3, 'Alejandra Espinoza', 31),
	(4, 'Daniel Camilo Esmiht', 22),
	(5, 'Sandra Daniela Alvarez', 23),
	(6, 'Sofia Melisa Olarte', 22);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65_2.discoints
DROP TABLE IF EXISTS `discoints`;
CREATE TABLE IF NOT EXISTS `discoints` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` float(12,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='este campo contendra la tabla de descuentos a realizar';

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65_2.discoints: ~5 rows (aproximadamente)
DELETE FROM `discoints`;
INSERT INTO `discoints` (`id`, `name`, `value`) VALUES
	(1, 'Cumpleaños', 0.05),
	(2, '14 de Febrero ', 0.10),
	(3, 'Sabado Fiestero', 0.03),
	(4, 'Día de las Madres', 0.12),
	(5, 'Viernes de Amigos', 0.02);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65_2.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` float(12,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65_2.products: ~5 rows (aproximadamente)
DELETE FROM `products`;
INSERT INTO `products` (`id`, `name`, `price`) VALUES
	(1, 'pizza', 35000.00),
	(2, 'pollo', 29000.00),
	(3, 'helado', 20000.00),
	(4, 'pasteles de pollo', 9000.00),
	(5, 'cerveza', 7900.00);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65_2.sales
DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `value` float(12,2) NOT NULL DEFAULT 0.00,
  `customer_id` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='Esta tabla contendra las ventas realizadas ';

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65_2.sales: ~6 rows (aproximadamente)
DELETE FROM `sales`;
INSERT INTO `sales` (`id`, `date`, `value`, `customer_id`) VALUES
	(1, '2022-06-15', 105000.00, 2),
	(2, '2022-06-16', 27000.00, 4),
	(3, '2022-06-17', 116000.00, 3),
	(4, '2022-06-18', 40000.00, 5),
	(5, '2022-06-19', 237000.00, 6),
	(6, '2022-06-20', 100000.00, 1);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65_2.sales_discoints
DROP TABLE IF EXISTS `sales_discoints`;
CREATE TABLE IF NOT EXISTS `sales_discoints` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` smallint(5) unsigned NOT NULL,
  `discoint_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='Este campo contendra la unión de la tabla ventas y la tabla descuento ';

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65_2.sales_discoints: ~5 rows (aproximadamente)
DELETE FROM `sales_discoints`;
INSERT INTO `sales_discoints` (`id`, `sale_id`, `discoint_id`) VALUES
	(1, 2, 1),
	(2, 4, 2),
	(3, 1, 4),
	(4, 5, 5),
	(5, 3, 3),
	(6, 6, 1);

-- Volcando estructura para tabla heladeria_y_pizzeria_la_65_2.sales_produts
DROP TABLE IF EXISTS `sales_produts`;
CREATE TABLE IF NOT EXISTS `sales_produts` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` smallint(6) unsigned NOT NULL,
  `product_id` smallint(6) unsigned NOT NULL,
  `quantity` smallint(6) unsigned NOT NULL,
  `value` float(12,2) unsigned NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='esta campo contendra la union de las tablas ventas y productos ';

-- Volcando datos para la tabla heladeria_y_pizzeria_la_65_2.sales_produts: ~6 rows (aproximadamente)
DELETE FROM `sales_produts`;
INSERT INTO `sales_produts` (`id`, `sale_id`, `product_id`, `quantity`, `value`) VALUES
	(1, 1, 1, 3, 35000.00),
	(2, 3, 2, 4, 29000.00),
	(3, 2, 4, 3, 9000.00),
	(4, 4, 3, 2, 20000.00),
	(5, 5, 5, 3, 79000.00),
	(6, 6, 3, 5, 20000.00);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
