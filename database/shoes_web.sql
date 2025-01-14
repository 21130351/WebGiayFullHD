-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for shoes_web
CREATE DATABASE IF NOT EXISTS `shoes_web` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `shoes_web`;

-- Dumping structure for table shoes_web.addresses
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phoneNumber` int(11) DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `commune` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `hamlet` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table shoes_web.addresses: ~2 rows (approximately)
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` (`id`, `fullName`, `phoneNumber`, `province`, `district`, `commune`, `hamlet`, `createAt`, `updateAt`, `isDeleted`) VALUES
	(3, 'Trần V&otilde; Ho&agrave;ng Huy', 702315160, 'An Giang', 'An Ph&uacute;', 'An Ph&uacute;', 'Khu E Nhà Máy Gạch Tunel 2 An Phú', '2024-01-19 23:16:21', '2024-01-19 23:16:21', 0),
	(4, 'Trần V&otilde; Ho&agrave;ng Huy', 727381934, 'An Giang', 'An Ph&uacute;', 'Kh&aacute;nh An', 'Ngã 3 cây thông ấp Khánh Hòa', '2024-01-19 23:20:09', '2024-01-19 23:20:09', 0);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;

-- Dumping structure for table shoes_web.carts
CREATE TABLE IF NOT EXISTS `carts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `orderDetailsId` bigint(20) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Cart_fk0` (`userId`),
  KEY `Cart_fk1` (`orderDetailsId`),
  CONSTRAINT `Cart_fk0` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `Cart_fk1` FOREIGN KEY (`orderDetailsId`) REFERENCES `order_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table shoes_web.carts: ~4 rows (approximately)
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` (`id`, `userId`, `orderDetailsId`, `createAt`, `updateAt`, `isDeleted`) VALUES
	(12, 8, 15, '2024-01-19 23:15:35', '2024-01-19 23:15:35', 0),
	(13, 8, 16, '2024-01-19 23:15:39', '2024-01-19 23:15:39', 0),
	(16, 14, 22, '2024-03-29 10:07:54', '2024-03-29 10:07:54', 0),
	(17, 14, 23, '2024-03-29 10:07:59', '2024-03-29 10:07:59', 0);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;

-- Dumping structure for table shoes_web.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_pk` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table shoes_web.categories: ~7 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `code`, `createAt`, `updateAt`, `isDeleted`) VALUES
	(1, 'Lifestyle', 'lifestyle', '2024-01-02 03:24:34', '2024-01-08 14:43:04', 0),
	(2, 'Basketball', 'basketball', '2024-01-02 03:24:34', '2024-01-02 03:24:34', 0),
	(3, 'Football', 'football', '2024-01-02 03:24:34', '2024-01-02 03:24:34', 0),
	(4, 'Baseball', 'baseball', '2024-01-02 03:24:34', '2024-01-02 03:24:34', 0),
	(5, 'Volleyball', 'volleyball', '2024-01-02 03:24:34', '2024-01-02 03:24:34', 0),
	(6, 'Golf', 'golf', '2024-01-02 03:24:34', '2024-01-02 03:24:34', 0),
	(7, 'Running', 'running', '2024-01-02 03:24:34', '2024-01-02 03:24:34', 0);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table shoes_web.import_orders
CREATE TABLE IF NOT EXISTS `import_orders` (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `supplierName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isDeleted` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shoes_web.import_orders: ~0 rows (approximately)
/*!40000 ALTER TABLE `import_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_orders` ENABLE KEYS */;

-- Dumping structure for table shoes_web.import_order_details
CREATE TABLE IF NOT EXISTS `import_order_details` (
  `id` bigint(20) NOT NULL,
  `purchaseOrderId` bigint(20) NOT NULL,
  `productId` bigint(20) NOT NULL,
  `quantityPurchase` int(11) NOT NULL DEFAULT 0,
  `pricePurchase` decimal(20,1) NOT NULL DEFAULT 0.0,
  `isDeleted` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK__product` (`productId`),
  KEY `FK_purchase_order_details_purchase_order_details` (`purchaseOrderId`),
  CONSTRAINT `FK__product` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_purchase_order_details_purchase_order_details` FOREIGN KEY (`purchaseOrderId`) REFERENCES `import_order_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shoes_web.import_order_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `import_order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_order_details` ENABLE KEYS */;

-- Dumping structure for table shoes_web.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preValue` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isDeleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shoes_web.logs: ~67 rows (approximately)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`id`, `ip`, `level`, `action`, `resource`, `preValue`, `value`, `createAt`, `updateAt`, `isDeleted`) VALUES
	(89, '0:0:0:0:0:0:0:1', 'WARN', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:78', NULL, '{"value":{"email":"vophihoang252003@gmail.com"},"status":"Authentication Failure. Email or password is invalid"}', '2024-03-24 22:38:17', '2024-03-24 22:38:17', 0),
	(90, '0:0:0:0:0:0:0:1', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.UserService:63', '{"value":{"isDeleted":false,"lastLogged":"2024-03-24 20:01:12.0","fullName":"Vo Hoang","association":"none","updateAt":"2024-03-24 20:01:12.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"}}', '{"value":{"isDeleted":false,"lastLogged":"2024-03-24 22:38:22.0","fullName":"Vo Hoang","association":"none","updateAt":"2024-03-24 22:38:22.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"},"status":"UpdatedAt and lastLogged fields successfully updated"}', '2024-03-24 22:38:22', '2024-03-24 22:38:22', 0),
	(91, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:68', NULL, '{"value":{"id":14,"email":"vophihoang252003@gmail.com"},"status":"Authentication successful"}', '2024-03-24 22:38:24', '2024-03-24 22:38:24', 0),
	(92, '0:0:0:0:0:0:0:1', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.UserService:63', '{"value":{"isDeleted":false,"lastLogged":"2024-03-24 22:38:22.0","fullName":"Vo Hoang","association":"none","updateAt":"2024-03-24 22:38:22.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"}}', '{"value":{"isDeleted":false,"lastLogged":"2024-03-24 22:43:04.0","fullName":"Vo Hoang","association":"none","updateAt":"2024-03-24 22:43:04.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"},"status":"UpdatedAt and lastLogged fields successfully updated"}', '2024-03-24 22:43:04', '2024-03-24 22:43:04', 0),
	(93, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:68', NULL, '{"value":{"id":14,"email":"vophihoang252003@gmail.com"},"status":"Authentication successful"}', '2024-03-24 22:43:06', '2024-03-24 22:43:06', 0),
	(94, '0:0:0:0:0:0:0:1', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.UserService:63', '{"value":{"isDeleted":false,"lastLogged":"2024-03-24 22:43:04.0","fullName":"Vo Hoang","association":"none","updateAt":"2024-03-24 22:43:04.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"}}', '{"value":{"isDeleted":false,"lastLogged":"2024-03-24 22:44:39.0","fullName":"Vo Hoang","association":"none","updateAt":"2024-03-24 22:44:39.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"},"status":"UpdatedAt and lastLogged fields successfully updated"}', '2024-03-24 22:44:39', '2024-03-24 22:44:39', 0),
	(95, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:68', NULL, '{"value":{"id":14,"email":"vophihoang252003@gmail.com"},"status":"Authentication successful"}', '2024-03-24 22:44:41', '2024-03-24 22:44:41', 0),
	(96, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:71', NULL, '{"status":"Access the path http://localhost:8080/cart"}', '2024-03-24 22:45:19', '2024-03-24 22:45:19', 0),
	(97, '0:0:0:0:0:0:0:1', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.UserService:63', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-24 22:44:39.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-24 22:44:39.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"}}', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 10:03:28.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-29 10:03:28.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"},"status":"UpdatedAt and lastLogged fields successfully updated"}', '2024-03-29 10:03:31', '2024-03-29 10:03:31', 0),
	(98, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:68', NULL, '{"value":{"id":14,"email":"vophihoang252003@gmail.com"},"status":"Authentication successful"}', '2024-03-29 10:03:31', '2024-03-29 10:03:31', 0),
	(99, '0:0:0:0:0:0:0:1', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.UserService:63', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 10:03:28.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-29 10:03:28.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"}}', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 10:06:38.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-29 10:06:38.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"},"status":"UpdatedAt and lastLogged fields successfully updated"}', '2024-03-29 10:06:40', '2024-03-29 10:06:40', 0),
	(100, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:68', NULL, '{"value":{"id":14,"email":"vophihoang252003@gmail.com"},"status":"Authentication successful"}', '2024-03-29 10:06:40', '2024-03-29 10:06:40', 0),
	(101, '0:0:0:0:0:0:0:1', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.UserService:63', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 10:06:38.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-29 10:06:38.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"}}', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 10:07:01.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-29 10:07:01.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"},"status":"UpdatedAt and lastLogged fields successfully updated"}', '2024-03-29 10:07:01', '2024-03-29 10:07:01', 0),
	(102, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:68', NULL, '{"value":{"id":14,"email":"vophihoang252003@gmail.com"},"status":"Authentication successful"}', '2024-03-29 10:07:03', '2024-03-29 10:07:03', 0),
	(103, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:71', NULL, '{"status":"Access the path http://localhost:8080/cart"}', '2024-03-29 10:07:43', '2024-03-29 10:07:43', 0),
	(104, '0:0:0:0:0:0:0:1', 'INFO', 'INSERT', 'com.ltweb_servlet_ecommerce.service.impl.OrderDetailsService:100', NULL, '{"value":{"productSizeId":49,"quantity":1,"isDeleted":false,"updateAt":"2024-03-29 10:07:54.0","subTotal":150,"id":22,"createAt":"2024-03-29 10:07:54.0"},"status":"Saved orderDetails successfully"}', '2024-03-29 10:07:54', '2024-03-29 10:07:54', 0),
	(105, '0:0:0:0:0:0:0:1', 'INFO', 'INSERT', 'com.ltweb_servlet_ecommerce.service.impl.CartSevice:110', NULL, '{"value":{"orderDetailsId":22,"isDeleted":false,"updateAt":"2024-03-29 10:07:54.0","id":16,"userId":14,"createAt":"2024-03-29 10:07:54.0"},"status":"Saved cart successfully"}', '2024-03-29 10:07:56', '2024-03-29 10:07:56', 0),
	(106, '0:0:0:0:0:0:0:1', 'INFO', 'INSERT', 'com.ltweb_servlet_ecommerce.service.impl.OrderDetailsService:100', NULL, '{"value":{"productSizeId":5,"quantity":1,"isDeleted":false,"updateAt":"2024-03-29 10:07:59.0","subTotal":110,"id":23,"createAt":"2024-03-29 10:07:59.0"},"status":"Saved orderDetails successfully"}', '2024-03-29 10:07:59', '2024-03-29 10:07:59', 0),
	(107, '0:0:0:0:0:0:0:1', 'INFO', 'INSERT', 'com.ltweb_servlet_ecommerce.service.impl.CartSevice:110', NULL, '{"value":{"orderDetailsId":23,"isDeleted":false,"updateAt":"2024-03-29 10:07:59.0","id":17,"userId":14,"createAt":"2024-03-29 10:07:59.0"},"status":"Saved cart successfully"}', '2024-03-29 10:08:02', '2024-03-29 10:08:02', 0),
	(108, '0:0:0:0:0:0:0:1', 'INFO', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.OrderDetailsService:57', '{"value":{"productSizeId":5,"quantity":1,"isDeleted":false,"updateAt":"2024-03-29 10:07:59.0","subTotal":110,"id":23,"createAt":"2024-03-29 10:07:59.0"}}', '{"value":{"productSizeId":5,"quantity":1,"isDeleted":false,"updateAt":"2024-03-29 10:08:01.0","subTotal":110,"id":23,"createAt":"2024-03-29 10:07:59.0"},"status":"Updated orderDetails with id = 23 successfully"}', '2024-03-29 10:08:02', '2024-03-29 10:08:02', 0),
	(109, '0:0:0:0:0:0:0:1', 'INFO', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.OrderDetailsService:57', '{"value":{"productSizeId":5,"quantity":1,"isDeleted":false,"updateAt":"2024-03-29 10:08:01.0","subTotal":110,"id":23,"createAt":"2024-03-29 10:07:59.0"}}', '{"value":{"productSizeId":5,"quantity":1,"isDeleted":false,"updateAt":"2024-03-29 10:08:01.0","subTotal":110,"id":23,"createAt":"2024-03-29 10:07:59.0"},"status":"Updated orderDetails with id = 23 successfully"}', '2024-03-29 10:08:02', '2024-03-29 10:08:02', 0),
	(110, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:71', NULL, '{"status":"Access the path http://localhost:8080/cart"}', '2024-03-29 10:08:04', '2024-03-29 10:08:04', 0),
	(111, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:71', NULL, '{"status":"Access the path http://localhost:8080/cart"}', '2024-03-29 10:08:06', '2024-03-29 10:08:06', 0),
	(112, '0:0:0:0:0:0:0:1', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.UserService:63', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 10:07:01.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-29 10:07:01.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"}}', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 10:15:52.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-29 10:15:52.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"},"status":"UpdatedAt and lastLogged fields successfully updated"}', '2024-03-29 10:15:52', '2024-03-29 10:15:52', 0),
	(113, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:68', NULL, '{"value":{"id":14,"email":"vophihoang252003@gmail.com"},"status":"Authentication successful"}', '2024-03-29 10:15:54', '2024-03-29 10:15:54', 0),
	(114, '0:0:0:0:0:0:0:1', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.UserService:63', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 10:15:52.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-29 10:15:52.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"}}', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 10:15:52.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-29 10:15:52.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"},"status":"UpdatedAt and lastLogged fields successfully updated"}', '2024-03-29 10:15:54', '2024-03-29 10:15:54', 0),
	(115, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:68', NULL, '{"value":{"id":14,"email":"vophihoang252003@gmail.com"},"status":"Authentication successful"}', '2024-03-29 10:15:54', '2024-03-29 10:15:54', 0),
	(116, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:71', NULL, '{"status":"Access the path http://localhost:8080/cart"}', '2024-03-29 10:15:54', '2024-03-29 10:15:54', 0),
	(117, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:68', NULL, '{"value":{"id":14,"email":"vophihoang252003@gmail.com"},"status":"Authentication successful"}', '2024-03-29 10:21:00', '2024-03-29 10:21:00', 0),
	(118, '0:0:0:0:0:0:0:1', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.UserService:63', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 10:15:52.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-29 10:15:52.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"}}', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 10:20:21.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-29 10:20:21.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"},"status":"UpdatedAt and lastLogged fields successfully updated"}', '2024-03-29 10:21:00', '2024-03-29 10:21:00', 0),
	(119, '0:0:0:0:0:0:0:1', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.UserService:63', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 10:20:21.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-29 10:20:21.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"}}', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 10:25:49.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-29 10:25:49.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"},"status":"UpdatedAt and lastLogged fields successfully updated"}', '2024-03-29 10:25:51', '2024-03-29 10:25:51', 0),
	(120, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:68', NULL, '{"value":{"id":14,"email":"vophihoang252003@gmail.com"},"status":"Authentication successful"}', '2024-03-29 10:25:51', '2024-03-29 10:25:51', 0),
	(121, '0:0:0:0:0:0:0:1', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.UserService:63', '{"value":{"role":"user","isDeleted":false,"lastLogged":"2024-03-29 10:25:49.0","fullName":"Vo Hoang","admin":false,"association":"none","updateAt":"2024-03-29 10:25:49.0","id":16,"email":"vophihoang@gmail.com","createAt":"2024-03-13 15:14:47.0"}}', '{"value":{"role":"user","isDeleted":false,"lastLogged":"2024-03-29 10:31:49.0","fullName":"Vo Hoang","admin":false,"association":"none","updateAt":"2024-03-29 10:31:49.0","id":16,"email":"vophihoang@gmail.com","createAt":"2024-03-13 15:14:47.0"},"status":"UpdatedAt and lastLogged fields successfully updated"}', '2024-03-29 10:31:53', '2024-03-29 10:31:53', 0),
	(122, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:68', NULL, '{"value":{"id":16,"email":"vophihoang@gmail.com"},"status":"Authentication successful"}', '2024-03-29 10:31:55', '2024-03-29 10:31:55', 0),
	(123, '0:0:0:0:0:0:0:1', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.UserService:63', '{"value":{"role":"user","isDeleted":false,"lastLogged":"2024-03-29 10:31:49.0","fullName":"Vo Hoang","admin":false,"association":"none","updateAt":"2024-03-29 10:31:49.0","id":16,"email":"vophihoang@gmail.com","createAt":"2024-03-13 15:14:47.0"}}', '{"value":{"role":"user","isDeleted":false,"lastLogged":"2024-03-29 10:56:05.0","fullName":"Vo Hoang","admin":false,"association":"none","updateAt":"2024-03-29 10:56:05.0","id":16,"email":"vophihoang@gmail.com","createAt":"2024-03-13 15:14:47.0"},"status":"UpdatedAt and lastLogged fields successfully updated"}', '2024-03-29 10:56:07', '2024-03-29 10:56:07', 0),
	(124, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:68', NULL, '{"value":{"id":16,"email":"vophihoang@gmail.com"},"status":"Authentication successful"}', '2024-03-29 10:56:07', '2024-03-29 10:56:07', 0),
	(125, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:68', NULL, '{"value":{"id":16,"email":"vophihoang@gmail.com"},"status":"Authentication successful"}', '2024-03-29 10:58:16', '2024-03-29 10:58:16', 0),
	(126, '0:0:0:0:0:0:0:1', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.UserService:63', '{"value":{"role":"user","isDeleted":false,"lastLogged":"2024-03-29 10:56:05.0","fullName":"Vo Hoang","admin":false,"association":"none","updateAt":"2024-03-29 10:56:05.0","id":16,"email":"vophihoang@gmail.com","createAt":"2024-03-13 15:14:47.0"}}', '{"value":{"role":"user","isDeleted":false,"lastLogged":"2024-03-29 10:58:10.0","fullName":"Vo Hoang","admin":false,"association":"none","updateAt":"2024-03-29 10:58:10.0","id":16,"email":"vophihoang@gmail.com","createAt":"2024-03-13 15:14:47.0"},"status":"UpdatedAt and lastLogged fields successfully updated"}', '2024-03-29 10:58:16', '2024-03-29 10:58:16', 0),
	(127, '0:0:0:0:0:0:0:1', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.UserService:63', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 10:25:49.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-29 10:25:49.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"}}', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 10:58:33.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-29 10:58:33.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"},"status":"UpdatedAt and lastLogged fields successfully updated"}', '2024-03-29 10:58:33', '2024-03-29 10:58:33', 0),
	(128, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:68', NULL, '{"value":{"id":14,"email":"vophihoang252003@gmail.com"},"status":"Authentication successful"}', '2024-03-29 10:58:35', '2024-03-29 10:58:35', 0),
	(129, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:68', NULL, '{"value":{"id":14,"email":"vophihoang252003@gmail.com"},"status":"Authentication successful"}', '2024-03-29 11:01:01', '2024-03-29 11:01:01', 0),
	(130, '0:0:0:0:0:0:0:1', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.UserService:63', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 10:58:33.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-29 10:58:33.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"}}', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 11:00:32.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-29 11:00:32.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"},"status":"UpdatedAt and lastLogged fields successfully updated"}', '2024-03-29 11:01:01', '2024-03-29 11:01:01', 0),
	(131, '0:0:0:0:0:0:0:1', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.UserService:63', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 11:00:32.0","fullName":"Vo Hoang","association":"none","admin":true,"updateAt":"2024-03-29 11:00:32.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"}}', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 11:03:31.0","fullName":"Vo Hoang","association":"none","admin":true,"updateAt":"2024-03-29 11:03:31.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"},"status":"UpdatedAt and lastLogged fields successfully updated"}', '2024-03-29 11:03:39', '2024-03-29 11:03:39', 0),
	(132, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:67', NULL, '{"value":{"id":14,"email":"vophihoang252003@gmail.com"},"status":"Authentication successful"}', '2024-03-29 11:03:39', '2024-03-29 11:03:39', 0),
	(133, '0:0:0:0:0:0:0:1', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.UserService:63', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 11:03:31.0","fullName":"Vo Hoang","association":"none","admin":true,"updateAt":"2024-03-29 11:03:31.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"}}', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 11:06:51.0","fullName":"Vo Hoang","association":"none","admin":true,"updateAt":"2024-03-29 11:06:51.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"},"status":"UpdatedAt and lastLogged fields successfully updated"}', '2024-03-29 11:06:53', '2024-03-29 11:06:53', 0),
	(134, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:67', NULL, '{"value":{"id":14,"email":"vophihoang252003@gmail.com"},"status":"Authentication successful"}', '2024-03-29 11:06:53', '2024-03-29 11:06:53', 0),
	(135, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:71', NULL, '{"status":"Access the path http://localhost:8080/cart"}', '2024-03-29 11:07:00', '2024-03-29 11:07:00', 0),
	(136, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:71', NULL, '{"status":"Access the path http://localhost:8080/cart"}', '2024-03-29 11:07:03', '2024-03-29 11:07:03', 0),
	(137, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:71', NULL, '{"status":"Access the path http://localhost:8080/cart"}', '2024-03-29 11:07:15', '2024-03-29 11:07:15', 0),
	(138, '0:0:0:0:0:0:0:1', 'INFO', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.OrderDetailsService:57', '{"value":{"productSizeId":5,"quantity":1,"isDeleted":false,"updateAt":"2024-03-29 10:08:01.0","subTotal":110,"id":23,"createAt":"2024-03-29 10:07:59.0"}}', '{"value":{"productSizeId":5,"quantity":10,"isDeleted":false,"updateAt":"2024-03-29 11:07:15.0","subTotal":1100,"id":23,"createAt":"2024-03-29 10:07:59.0"},"status":"Updated orderDetails with id = 23 successfully"}', '2024-03-29 11:07:17', '2024-03-29 11:07:17', 0),
	(139, '0:0:0:0:0:0:0:1', 'INFO', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.OrderDetailsService:57', '{"value":{"productSizeId":5,"quantity":10,"isDeleted":false,"updateAt":"2024-03-29 11:07:15.0","subTotal":1100,"id":23,"createAt":"2024-03-29 10:07:59.0"}}', '{"value":{"productSizeId":5,"quantity":10,"isDeleted":false,"updateAt":"2024-03-29 11:07:20.0","subTotal":1100,"id":23,"createAt":"2024-03-29 10:07:59.0"},"status":"Updated orderDetails with id = 23 successfully"}', '2024-03-29 11:07:20', '2024-03-29 11:07:20', 0),
	(140, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:71', NULL, '{"status":"Access the path http://localhost:8080/cart"}', '2024-03-29 11:07:22', '2024-03-29 11:07:22', 0),
	(141, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:71', NULL, '{"status":"Access the path http://localhost:8080/cart"}', '2024-03-29 14:22:49', '2024-03-29 14:22:49', 0),
	(142, '0:0:0:0:0:0:0:1', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.UserService:63', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 11:06:51.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-29 11:06:51.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"}}', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 14:22:54.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-29 14:22:54.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"},"status":"UpdatedAt and lastLogged fields successfully updated"}', '2024-03-29 14:22:55', '2024-03-29 14:22:55', 0),
	(143, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:67', NULL, '{"value":{"id":14,"email":"vophihoang252003@gmail.com"},"status":"Authentication successful"}', '2024-03-29 14:22:57', '2024-03-29 14:22:57', 0),
	(144, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:71', NULL, '{"status":"Access the path http://localhost:8080/cart"}', '2024-03-29 14:23:02', '2024-03-29 14:23:02', 0),
	(145, '127.0.0.1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:41', NULL, '{"status":"Access the path http://localhost:8080/home;jsessionid=63CC41A65E60AB7994ACA01472DD41D0"}', '2024-03-29 15:02:00', '2024-03-29 15:02:00', 0),
	(146, '127.0.0.1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:41', NULL, '{"status":"Access the path http://localhost:8080/home;jsessionid=349916BA978D629CE982AD9283D717D9"}', '2024-03-29 15:02:00', '2024-03-29 15:02:00', 0),
	(147, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:41', NULL, '{"status":"Access the path http://localhost:8080/home"}', '2024-03-29 15:02:00', '2024-03-29 15:02:00', 0),
	(148, '0:0:0:0:0:0:0:1', 'INFO', NULL, 'com.ltweb_servlet_ecommerce.controller.web.shared.AboutController:29', NULL, '{"status":"Access the path http://localhost:8080/about"}', '2024-03-29 15:03:38', '2024-03-29 15:03:38', 0),
	(149, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:41', NULL, '{"status":"Access the path http://localhost:8080/home"}', '2024-03-29 15:04:18', '2024-03-29 15:04:18', 0),
	(150, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:41', NULL, '{"status":"Access the path http://localhost:8080/home"}', '2024-03-29 15:05:25', '2024-03-29 15:05:25', 0),
	(151, '127.0.0.1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:41', NULL, '{"status":"Access the path http://localhost:8080/home;jsessionid=8BC7E8C1B2EF543847D0150BE1CE94B8"}', '2024-03-29 15:07:48', '2024-03-29 15:07:48', 0),
	(152, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:41', NULL, '{"status":"Access the path http://localhost:8080/home"}', '2024-03-29 15:07:48', '2024-03-29 15:07:48', 0),
	(153, '127.0.0.1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:41', NULL, '{"status":"Access the path http://localhost:8080/home;jsessionid=BF0FDAD50CBEF691079074549EB6DE4B"}', '2024-03-29 15:07:51', '2024-03-29 15:07:51', 0),
	(154, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:41', NULL, '{"status":"Access the path http://localhost:8080/home"}', '2024-03-29 15:07:51', '2024-03-29 15:07:51', 0),
	(155, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:41', NULL, '{"status":"Access the path http://localhost:8080/home"}', '2024-03-29 15:08:38', '2024-03-29 15:08:38', 0),
	(156, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:41', NULL, '{"status":"Access the path http://localhost:8080/home"}', '2024-03-29 15:09:08', '2024-03-29 15:09:08', 0),
	(157, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:71', NULL, '{"status":"Access the path http://localhost:8080/cart"}', '2024-03-29 15:09:20', '2024-03-29 15:09:20', 0),
	(158, '0:0:0:0:0:0:0:1', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.UserService:63', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 14:22:54.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-29 14:22:54.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"}}', '{"value":{"role":"admin","isDeleted":false,"lastLogged":"2024-03-29 15:09:26.0","fullName":"Vo Hoang","admin":true,"association":"none","updateAt":"2024-03-29 15:09:26.0","id":14,"email":"vophihoang252003@gmail.com","createAt":"2024-03-13 15:14:47.0"},"status":"UpdatedAt and lastLogged fields successfully updated"}', '2024-03-29 15:09:26', '2024-03-29 15:09:26', 0),
	(159, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:67', NULL, '{"value":{"id":14,"email":"vophihoang252003@gmail.com"},"status":"Authentication successful"}', '2024-03-29 15:09:28', '2024-03-29 15:09:28', 0),
	(160, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:41', NULL, '{"status":"Access the path http://localhost:8080/home"}', '2024-03-29 15:09:31', '2024-03-29 15:09:31', 0),
	(161, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:71', NULL, '{"status":"Access the path http://localhost:8080/cart"}', '2024-03-29 15:09:41', '2024-03-29 15:09:41', 0),
	(162, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CheckoutController:85', NULL, '{"status":"Access the path http://localhost:8080/checkout"}', '2024-03-29 15:09:44', '2024-03-29 15:09:44', 0),
	(163, '0:0:0:0:0:0:0:1', 'DANGER', NULL, 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:46', NULL, '{"value":{"error_message":"Get connection is error!"},"status":"Get connection is error!"}', '2024-03-29 16:45:04', '2024-03-29 16:45:51', 0),
	(164, '127.0.0.1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:41', NULL, '{"status":"Access the path http://localhost:8080/home;jsessionid=A30ED09A7622FB710DA911640B33F85C"}', '2024-03-29 22:15:09', '2024-03-29 22:15:12', 0),
	(165, '127.0.0.1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:41', NULL, '{"status":"Access the path http://localhost:8080/home;jsessionid=608BB186A93B28083C5396A98B899577"}', '2024-03-29 22:15:10', '2024-03-29 22:15:12', 0),
	(166, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:41', NULL, '{"status":"Access the path http://localhost:8080/home;jsessionid=BD010CA2D0C51B84ED77E1846F75CD2B"}', '2024-03-29 22:15:10', '2024-03-29 22:15:12', 0),
	(167, '0:0:0:0:0:0:0:1', 'DANGER', 'SELECT', 'com.ltweb_servlet_ecommerce.log.LoggerHelper:31', NULL, '{"value":{"error_message":"Table \'shoes_web.user\' doesn\'t exist<br>&emsp;&emsp;com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:120)<br>&emsp;&emsp;com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)<br>&emsp;&emsp;com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:916)<br>&emsp;&emsp;com.mysql.cj.jdbc.ClientPreparedStatement.executeQuery(ClientPreparedStatement.java:972)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.dao.impl.AbstractDAO.queryCustom(AbstractDAO.java:47)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.dao.impl.UserDAO.findWithCustomSQL(UserDAO.java:92)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.service.impl.UserService.findWithCustomSQL(UserService.java:41)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.controller.web.ajax.opinion.OpinionAjax.doGet(OpinionAjax.java:51)<br>&emsp;&emsp;javax.servlet.http.HttpServlet.service(HttpServlet.java:529)<br>&emsp;&emsp;javax.servlet.http.HttpServlet.service(HttpServlet.java:623)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:209)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.filter.IPAddressFilter.doFilter(IPAddressFilter.java:29)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.filter.AuthorizationFilter.doFilter(AuthorizationFilter.java:31)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.filter.CORSFilter.doFilter(CORSFilter.java:24)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)<br>&emsp;&emsp;com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:168)<br>&emsp;&emsp;org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)<br>&emsp;&emsp;org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:481)<br>&emsp;&emsp;org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:130)<br>&emsp;&emsp;org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)<br>&emsp;&emsp;org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:670)<br>&emsp;&emsp;org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)<br>&emsp;&emsp;org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)<br>&emsp;&emsp;org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:390)<br>&emsp;&emsp;org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)<br>&emsp;&emsp;org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:928)<br>&emsp;&emsp;org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1794)<br>&emsp;&emsp;org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)<br>&emsp;&emsp;org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)<br>&emsp;&emsp;org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)<br>&emsp;&emsp;org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)<br>&emsp;&emsp;java.base/java.lang.Thread.run(Thread.java:833)<br>"},"status":"A serious error occurred!"}', '2024-03-29 22:15:40', '2024-03-29 22:15:40', 0),
	(168, '0:0:0:0:0:0:0:1', 'DANGER', 'SELECT', 'com.ltweb_servlet_ecommerce.log.LoggerHelper:31', NULL, '{"value":{"error_message":"Table \'shoes_web.opinion\' doesn\'t exist<br>&emsp;&emsp;com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:120)<br>&emsp;&emsp;com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)<br>&emsp;&emsp;com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:916)<br>&emsp;&emsp;com.mysql.cj.jdbc.ClientPreparedStatement.executeQuery(ClientPreparedStatement.java:972)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.dao.impl.AbstractDAO.queryCustom(AbstractDAO.java:47)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.dao.impl.OpinionDAO.findWithCustomSQL(OpinionDAO.java:100)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.service.impl.OpinionService.findWithCustomSQL(OpinionService.java:36)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.controller.web.ajax.opinion.OpinionAjax.doGet(OpinionAjax.java:62)<br>&emsp;&emsp;javax.servlet.http.HttpServlet.service(HttpServlet.java:529)<br>&emsp;&emsp;javax.servlet.http.HttpServlet.service(HttpServlet.java:623)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:209)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.filter.IPAddressFilter.doFilter(IPAddressFilter.java:29)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.filter.AuthorizationFilter.doFilter(AuthorizationFilter.java:31)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.filter.CORSFilter.doFilter(CORSFilter.java:24)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)<br>&emsp;&emsp;com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:168)<br>&emsp;&emsp;org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)<br>&emsp;&emsp;org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:481)<br>&emsp;&emsp;org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:130)<br>&emsp;&emsp;org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)<br>&emsp;&emsp;org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:670)<br>&emsp;&emsp;org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)<br>&emsp;&emsp;org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)<br>&emsp;&emsp;org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:390)<br>&emsp;&emsp;org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)<br>&emsp;&emsp;org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:928)<br>&emsp;&emsp;org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1794)<br>&emsp;&emsp;org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)<br>&emsp;&emsp;org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)<br>&emsp;&emsp;org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)<br>&emsp;&emsp;org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)<br>&emsp;&emsp;java.base/java.lang.Thread.run(Thread.java:833)<br>"},"status":"A serious error occurred!"}', '2024-03-29 22:15:55', '2024-03-29 22:15:55', 0),
	(169, '0:0:0:0:0:0:0:1', 'DANGER', 'SELECT', 'com.ltweb_servlet_ecommerce.log.LoggerHelper:31', NULL, '{"value":{"error_message":"Table \'shoes_web.user\' doesn\'t exist<br>&emsp;&emsp;com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:120)<br>&emsp;&emsp;com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)<br>&emsp;&emsp;com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:916)<br>&emsp;&emsp;com.mysql.cj.jdbc.ClientPreparedStatement.executeQuery(ClientPreparedStatement.java:972)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.dao.impl.AbstractDAO.queryCustom(AbstractDAO.java:47)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.dao.impl.UserDAO.findWithCustomSQL(UserDAO.java:92)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.service.impl.UserService.findWithCustomSQL(UserService.java:41)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.controller.web.ajax.opinion.OpinionAjax.doGet(OpinionAjax.java:51)<br>&emsp;&emsp;javax.servlet.http.HttpServlet.service(HttpServlet.java:529)<br>&emsp;&emsp;javax.servlet.http.HttpServlet.service(HttpServlet.java:623)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:209)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.filter.IPAddressFilter.doFilter(IPAddressFilter.java:29)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.filter.AuthorizationFilter.doFilter(AuthorizationFilter.java:31)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.filter.CORSFilter.doFilter(CORSFilter.java:24)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)<br>&emsp;&emsp;com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:168)<br>&emsp;&emsp;org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)<br>&emsp;&emsp;org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:481)<br>&emsp;&emsp;org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:130)<br>&emsp;&emsp;org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)<br>&emsp;&emsp;org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:670)<br>&emsp;&emsp;org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)<br>&emsp;&emsp;org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)<br>&emsp;&emsp;org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:390)<br>&emsp;&emsp;org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)<br>&emsp;&emsp;org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:928)<br>&emsp;&emsp;org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1794)<br>&emsp;&emsp;org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)<br>&emsp;&emsp;org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)<br>&emsp;&emsp;org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)<br>&emsp;&emsp;org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)<br>&emsp;&emsp;java.base/java.lang.Thread.run(Thread.java:833)<br>"},"status":"A serious error occurred!"}', '2024-03-29 22:16:09', '2024-03-29 22:16:09', 0),
	(170, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CheckoutController:85', NULL, '{"status":"Access the path http://localhost:8080/checkout"}', '2024-03-29 22:16:18', '2024-03-29 22:16:18', 0),
	(171, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:41', NULL, '{"status":"Access the path http://localhost:8080/home"}', '2024-03-29 22:18:49', '2024-03-29 22:18:50', 0),
	(172, '0:0:0:0:0:0:0:1', 'DANGER', 'SELECT', 'com.ltweb_servlet_ecommerce.log.LoggerHelper:31', NULL, '{"value":{"error_message":"Table \'shoes_web.user\' doesn\'t exist<br>&emsp;&emsp;com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:120)<br>&emsp;&emsp;com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)<br>&emsp;&emsp;com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:916)<br>&emsp;&emsp;com.mysql.cj.jdbc.ClientPreparedStatement.executeQuery(ClientPreparedStatement.java:972)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.dao.impl.AbstractDAO.queryCustom(AbstractDAO.java:47)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.dao.impl.UserDAO.findWithCustomSQL(UserDAO.java:92)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.service.impl.UserService.findWithCustomSQL(UserService.java:41)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.controller.web.ajax.opinion.OpinionAjax.doGet(OpinionAjax.java:51)<br>&emsp;&emsp;javax.servlet.http.HttpServlet.service(HttpServlet.java:529)<br>&emsp;&emsp;javax.servlet.http.HttpServlet.service(HttpServlet.java:623)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:209)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.filter.IPAddressFilter.doFilter(IPAddressFilter.java:29)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.filter.AuthorizationFilter.doFilter(AuthorizationFilter.java:31)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.filter.CORSFilter.doFilter(CORSFilter.java:24)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)<br>&emsp;&emsp;com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:168)<br>&emsp;&emsp;org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)<br>&emsp;&emsp;org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:481)<br>&emsp;&emsp;org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:130)<br>&emsp;&emsp;org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)<br>&emsp;&emsp;org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:670)<br>&emsp;&emsp;org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)<br>&emsp;&emsp;org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)<br>&emsp;&emsp;org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:390)<br>&emsp;&emsp;org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)<br>&emsp;&emsp;org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:928)<br>&emsp;&emsp;org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1794)<br>&emsp;&emsp;org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)<br>&emsp;&emsp;org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)<br>&emsp;&emsp;org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)<br>&emsp;&emsp;org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)<br>&emsp;&emsp;java.base/java.lang.Thread.run(Thread.java:833)<br>"},"status":"A serious error occurred!"}', '2024-03-29 22:18:51', '2024-03-29 22:18:52', 0),
	(173, '0:0:0:0:0:0:0:1', 'DANGER', 'SELECT', 'com.ltweb_servlet_ecommerce.log.LoggerHelper:31', NULL, '{"value":{"error_message":"Table \'shoes_web.user\' doesn\'t exist<br>&emsp;&emsp;com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:120)<br>&emsp;&emsp;com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)<br>&emsp;&emsp;com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:916)<br>&emsp;&emsp;com.mysql.cj.jdbc.ClientPreparedStatement.executeQuery(ClientPreparedStatement.java:972)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.dao.impl.AbstractDAO.queryCustom(AbstractDAO.java:47)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.dao.impl.UserDAO.findWithCustomSQL(UserDAO.java:92)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.service.impl.UserService.findWithCustomSQL(UserService.java:41)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.controller.web.ajax.opinion.OpinionAjax.doGet(OpinionAjax.java:51)<br>&emsp;&emsp;javax.servlet.http.HttpServlet.service(HttpServlet.java:529)<br>&emsp;&emsp;javax.servlet.http.HttpServlet.service(HttpServlet.java:623)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:209)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.filter.IPAddressFilter.doFilter(IPAddressFilter.java:29)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.filter.AuthorizationFilter.doFilter(AuthorizationFilter.java:31)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;com.ltweb_servlet_ecommerce.filter.CORSFilter.doFilter(CORSFilter.java:24)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)<br>&emsp;&emsp;com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)<br>&emsp;&emsp;org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)<br>&emsp;&emsp;org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:168)<br>&emsp;&emsp;org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)<br>&emsp;&emsp;org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:481)<br>&emsp;&emsp;org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:130)<br>&emsp;&emsp;org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)<br>&emsp;&emsp;org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:670)<br>&emsp;&emsp;org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)<br>&emsp;&emsp;org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)<br>&emsp;&emsp;org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:390)<br>&emsp;&emsp;org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)<br>&emsp;&emsp;org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:928)<br>&emsp;&emsp;org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1794)<br>&emsp;&emsp;org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)<br>&emsp;&emsp;org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)<br>&emsp;&emsp;org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)<br>&emsp;&emsp;org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)<br>&emsp;&emsp;java.base/java.lang.Thread.run(Thread.java:833)<br>"},"status":"A serious error occurred!"}', '2024-03-29 22:19:01', '2024-03-29 22:19:01', 0),
	(174, '127.0.0.1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:41', NULL, '{"status":"Access the path http://localhost:8080/home;jsessionid=6B6C2622C0C44179C42AE1FEAFDE0B17"}', '2024-03-29 22:29:39', '2024-03-29 22:29:42', 0),
	(175, '127.0.0.1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:41', NULL, '{"status":"Access the path http://localhost:8080/home;jsessionid=EACEB78C35C769674BFA27A90139FF93"}', '2024-03-29 22:29:40', '2024-03-29 22:29:42', 0),
	(176, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:41', NULL, '{"status":"Access the path http://localhost:8080/home"}', '2024-03-29 22:29:40', '2024-03-29 22:29:42', 0),
	(177, '0:0:0:0:0:0:0:1', 'WARN', 'INSERT', 'com.ltweb_servlet_ecommerce.controller.web.ajax.cart.CartAjax:170', '{"value":{"empty":true}}', '{"value":{"productSizeId":5,"quantity":1,"isDeleted":false,"subTotal":110},"status":"Added into cart"}', '2024-03-29 22:29:55', '2024-03-29 22:29:55', 0),
	(178, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:71', NULL, '{"status":"Access the path http://localhost:8080/cart"}', '2024-03-29 22:29:55', '2024-03-29 22:29:57', 0),
	(179, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:71', NULL, '{"status":"Access the path http://localhost:8080/cart"}', '2024-03-29 22:31:31', '2024-03-29 22:31:31', 0),
	(180, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:71', NULL, '{"status":"Access the path http://localhost:8080/cart"}', '2024-03-29 22:31:34', '2024-03-29 22:31:34', 0),
	(181, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:71', NULL, '{"status":"Access the path http://localhost:8080/cart"}', '2024-03-29 22:31:34', '2024-03-29 22:31:36', 0),
	(182, '0:0:0:0:0:0:0:1', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.controller.web.ajax.cart.CartAjax:170', '{"value":{"empty":false}}', '{"value":{"productSizeId":5,"quantity":1,"isDeleted":false,"subTotal":110},"status":"Updated cart"}', '2024-03-29 22:31:36', '2024-03-29 22:31:36', 0),
	(183, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:71', NULL, '{"status":"Access the path http://localhost:8080/cart"}', '2024-03-29 22:31:36', '2024-03-29 22:31:38', 0),
	(184, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:71', NULL, '{"status":"Access the path http://localhost:8080/cart"}', '2024-03-29 22:31:37', '2024-03-29 22:31:38', 0),
	(185, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:41', NULL, '{"status":"Access the path http://localhost:8080/home"}', '2024-03-29 22:31:38', '2024-03-29 22:31:40', 0),
	(186, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:71', NULL, '{"status":"Access the path http://localhost:8080/cart"}', '2024-03-29 22:31:44', '2024-03-29 22:31:44', 0),
	(187, '0:0:0:0:0:0:0:1', 'WARN', 'INSERT', 'com.ltweb_servlet_ecommerce.controller.web.ajax.cart.CartAjax:170', '{"value":{"empty":true}}', '{"value":{"productSizeId":5,"quantity":1,"isDeleted":false,"subTotal":110},"status":"Added into cart"}', '2024-03-29 22:31:47', '2024-03-29 22:31:47', 0),
	(188, '0:0:0:0:0:0:0:1', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:71', NULL, '{"status":"Access the path http://localhost:8080/cart"}', '2024-03-29 22:31:50', '2024-03-29 22:31:50', 0);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Dumping structure for table shoes_web.opinions
CREATE TABLE IF NOT EXISTS `opinions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `productId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `comment_product_id_fk` (`productId`),
  KEY `opinion_user_id_fk` (`userId`),
  CONSTRAINT `comment_product_id_fk` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  CONSTRAINT `opinion_user_id_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table shoes_web.opinions: ~5 rows (approximately)
/*!40000 ALTER TABLE `opinions` DISABLE KEYS */;
INSERT INTO `opinions` (`id`, `title`, `content`, `rating`, `productId`, `userId`, `createAt`, `updateAt`, `isDeleted`) VALUES
	(1, 'Good', 'A very nice shoes, perfect for festive occasions', 4, 1, 8, '2024-01-04 03:30:07', '2024-01-04 03:30:07', 1),
	(2, 'It\'s Awesome', 'You should buy this!!!', 5, 1, 6, '2024-01-04 03:34:59', '2024-01-04 03:34:59', 0),
	(3, 'Ok', 'Material is good, but design is not', 2, 1, 8, '2024-01-04 15:46:17', '2024-01-04 15:46:17', 0),
	(36, '&lt;div&gt;Huy&lt;/div&gt;', '&lt;script&gt;alert(\'Huy\');&lt;/script&gt;', 4, 1, 8, '2024-01-04 18:44:17', '2024-01-04 18:44:17', 0),
	(59, 'Awesome', 'This\'s the best shoes of 2024', 4, 2, 8, '2024-01-09 01:23:32', '2024-01-09 01:23:32', 0);
/*!40000 ALTER TABLE `opinions` ENABLE KEYS */;

-- Dumping structure for table shoes_web.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) DEFAULT NULL,
  `note` varchar(1000) CHARACTER SET utf8 DEFAULT '',
  `totalAmount` decimal(10,1) DEFAULT 0.0,
  `addressId` bigint(20) DEFAULT NULL,
  `isPaid` tinyint(1) DEFAULT 0,
  `slug` varchar(20) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_pk` (`slug`),
  KEY `Order_fk0` (`addressId`),
  CONSTRAINT `Order_fk0` FOREIGN KEY (`addressId`) REFERENCES `addresses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table shoes_web.orders: ~2 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `status`, `note`, `totalAmount`, `addressId`, `isPaid`, `slug`, `createAt`, `updateAt`, `isDeleted`) VALUES
	(3, 'PROCESSING', 'Giao vào lúc 8-19h', 315.0, 3, 1, 'q2sxe8zuZN', '2024-01-19 23:16:21', '2024-01-22 16:05:12', 0),
	(4, 'TRANSPORTING', 'Test note', 85.9, 4, 1, 'm0b6P5FsEF', '2024-01-19 23:20:12', '2024-01-21 03:25:59', 0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table shoes_web.order_details
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `subTotal` decimal(10,1) DEFAULT NULL,
  `orderId` bigint(20) DEFAULT NULL,
  `productSizeId` bigint(20) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `orderDetails_fk0` (`orderId`),
  KEY `orderDetails_fk1` (`productSizeId`),
  CONSTRAINT `orderDetails_fk0` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `orderDetails_fk1` FOREIGN KEY (`productSizeId`) REFERENCES `product_sizes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table shoes_web.order_details: ~7 rows (approximately)
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` (`id`, `quantity`, `subTotal`, `orderId`, `productSizeId`, `createAt`, `updateAt`, `isDeleted`) VALUES
	(15, 2, 200.0, NULL, 1, '2024-01-19 23:15:35', '2024-01-19 23:15:43', 0),
	(16, 1, 110.0, NULL, 5, '2024-01-19 23:15:39', '2024-01-19 23:15:39', 0),
	(17, 2, 200.0, 3, 1, '2024-01-19 23:16:21', '2024-01-19 23:16:21', 0),
	(18, 1, 110.0, 3, 5, '2024-01-19 23:16:21', '2024-01-19 23:16:21', 0),
	(19, 1, 80.9, 4, 11, '2024-01-19 23:20:19', '2024-01-19 23:20:19', 0),
	(22, 1, 150.0, NULL, 49, '2024-03-29 10:07:54', '2024-03-29 10:07:54', 0),
	(23, 10, 1100.0, NULL, 5, '2024-03-29 10:07:59', '2024-03-29 11:07:20', 0);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;

-- Dumping structure for table shoes_web.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(350) CHARACTER SET utf8 DEFAULT NULL,
  `content` text CHARACTER SET utf8 DEFAULT NULL,
  `thumbnail` varchar(3000) NOT NULL,
  `shortDescription` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `price` decimal(10,1) DEFAULT NULL,
  `modelUrl` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0,
  `totalViewAndSearch` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `product_category_id_fk` (`categoryId`),
  CONSTRAINT `product_category_id_fk` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table shoes_web.products: ~12 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `name`, `content`, `thumbnail`, `shortDescription`, `price`, `modelUrl`, `slug`, `categoryId`, `createAt`, `updateAt`, `isDeleted`, `totalViewAndSearch`) VALUES
	(1, 'Nike Air Max 90', '&lt;p&gt;You tryna be comfortable all day, every day? We got you. The AJ1 Low has all the looks of the hoops original, with less weight and a sleek profile. Plus, they go with any \'fit&mdash;just lace up and go.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Benefits&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Nike Air technology absorbs impact for cushioning with every step.&lt;/li&gt;&lt;li&gt;Genuine and synthetic leather and textile materials combine for lightweight durability and a great fit.&lt;/li&gt;&lt;li&gt;Rubber outsole provides ample traction.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Product Details&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Jumpman logo on tongue&lt;/li&gt;&lt;li&gt;Stitched-down Swoosh logo&lt;ul&gt;&lt;li&gt;Shown: Black/Black/White&lt;/li&gt;&lt;li&gt;Style: DV0990-001&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704212059/zdyy9vcookwn8pe9cgh6.png', 'Inspired by the original that debuted in 1985, the Air Jordan 1 Low offers a clean, classic look that\'s familiar yet always fresh.', 100.0, NULL, NULL, 1, '2024-01-02 23:14:19', '2024-01-02 23:14:19', 0, NULL),
	(2, 'Nike Tech Hera', '&lt;p&gt;Rooted in early 2000s running, the Tech Hera is here to fulfill all of your chunky sneaker wishes. The wavy lifted midsole and aged neutral palette level up your look while keeping you comfortable. Its durable design holds up beautifully to everyday wear&mdash;which is perfect, because you will definitely want to wear these every day.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Benefits&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Upper combines airy mesh with real and synthetic leather for dimension and durability.&lt;/li&gt;&lt;li&gt;Chunky design has a subtle platform to give you a little extra height.&lt;/li&gt;&lt;li&gt;Full-length rubber outsole delivers durable traction.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Product Details&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Padded collar&lt;/li&gt;&lt;li&gt;Pull tab on heel&lt;/li&gt;&lt;li&gt;Embroidered Swoosh logo&lt;ul&gt;&lt;li&gt;Shown: Sail/Light Orewood Brown/Coconut Milk/Campfire Orange&lt;/li&gt;&lt;li&gt;Style: FQ8107-133&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704215356/nw9wcfdali4xqcvysmlm.png', 'Rooted in early 2000s running, the Tech Hera is here to fulfill all of your chunky sneaker wishes.', 110.0, NULL, NULL, 1, '2024-01-03 00:09:16', '2024-01-03 00:09:16', 0, NULL),
	(3, 'Nike Mercurial Superfly 9 Club', '&lt;p&gt;Instantly tilt the pitch in the bold design of the light and low-to-the-ground Superfly 9 Club MG. Fast is in the Air.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Drive your speed&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;The speed cage inside the structure is made from a thin but strong material that secures the foot to the outsole without adding additional weight for optimal lockdown.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Dig in, take off&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Unique traction pattern offers super-charged traction with quick release to create separation.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Improved fit&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Flyknit wraps your ankle in soft, stretchy fabric for a secure feel. A redone design improves the fit, so that it better simulates the foot. We did this by conducting multiple wear tests on hundreds of athletes. The result is a more contoured toe box and better lockdown in the heel.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Feel the ball&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;A moulded, synthetic upper has a textured pattern for better ball control when dribbling at high speeds.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Product details&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;For use on natural and synthetic surfaces&lt;/li&gt;&lt;li&gt;Cushioned insole&lt;/li&gt;&lt;li&gt;Colour Shown: Black/Hyper Royal/Chrome&lt;/li&gt;&lt;li&gt;Style: DJ5961-040&lt;/li&gt;&lt;li&gt;Country/Region of Origin: Vietnam&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704233310/eqmlo8nlmbifxinsegpf.png', 'Instantly tilt the pitch in the bold design of the light and low-to-the-ground Superfly 9 Club MG.', 80.9, NULL, NULL, 7, '2024-01-03 05:08:47', '2024-01-03 05:08:47', 0, NULL),
	(4, 'Nike Go FlyEase', '&lt;p&gt;Ditch the laces and get outside. These kicks feature Nike\'s revolutionary FlyEase technology, making on-and-off a breeze. With a heel that pivots open for a totally hands-free entry, they\'re great for people with limited mobility&mdash;or anyone who wants a quicker way to get going.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Step In and Go&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;The entire heel (including the sole) hinges open and stays open until you\'re ready. Just slip in and step down to make the heel move back into place and secure your foot.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&quot;CushIon&quot; Every Step&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Plush Cushlon foam gives each heel-to-toe transition a smooth, cushioned feeling.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lightweight Structure&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Airy fabric in the upper lets your feet breathe while durable, no-sew overlays provide structure and stability.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Product Details&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Grippy rubber outsole&lt;/li&gt;&lt;li&gt;Swoosh design&lt;/li&gt;&lt;li&gt;Colour Shown: Sea Glass/Guava Ice/Luminous Green/Light Silver&lt;/li&gt;&lt;li&gt;Style: DR5540-005&lt;/li&gt;&lt;li&gt;Country/Region of Origin: Vietnam&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704233684/ahtnmfvovwgx38bgt2d6.png', 'Ditch the laces and get outside. These kicks feature Nike\'s revolutionary FlyEase technology, making on-and-off a breeze', 155.8, NULL, NULL, 6, '2024-01-03 05:14:43', '2024-01-03 05:14:43', 0, NULL),
	(5, 'Nike Air Huarache Runner', '&lt;p&gt;When it fits this well and looks this good, it doesn\'t need a Swoosh logo. The Air Huarache takes on a classic silhouette with a runner-inspired design, mixed materials and rich neutrals for a look that is both nostalgic and brand new. With its stretchy, foot-hugging fabric and futuristic heel cage, it\'s still everything you love about the Huarache.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Benefits&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Inspired by water skiing, the stretchy upper and cushioned inner sleeve create a snug fit for an incredible feel.&lt;/li&gt;&lt;li&gt;Originally designed for performance running, Nike Air cushioning delivers lasting comfort.&lt;/li&gt;&lt;li&gt;A caged heel adds support and is paired with an elongated tongue to keep the early \'90s look you love.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;strong&gt;Product details&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Rubber sole&lt;/li&gt;&lt;li&gt;Variable-width lacing&lt;/li&gt;&lt;li&gt;Not intended for use as Personal Protective Equipment (PPE)&lt;/li&gt;&lt;li&gt;Colour Shown: Dark Obsidian/Obsidian/Gum Dark Brown/White&lt;/li&gt;&lt;li&gt;Style: DZ3306-400&lt;/li&gt;&lt;li&gt;Country/Region of Origin: China&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;strong&gt;Huarache Origins&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;The Nike Air Huarache released in 1991. Footwear designer Tinker Hatfield wanted to combine the fit of neoprene water-ski boots with the functionality of South American sandals. The instant hit found its way to basketball courts and then the streets, where it earned its status as an icon.&lt;/p&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704234050/gdrknjwyagdjpxig1yd6.png', 'When it fits this well and looks this good, it doesn\'t need a Swoosh logo.', 200.0, NULL, NULL, 1, '2024-01-03 05:20:50', '2024-01-03 05:20:50', 0, NULL),
	(7, 'Nike Waffle Debut', '&lt;p&gt;Free Shipping*&lt;/p&gt;&lt;p&gt;To get accurate shipping information &lt;a href=&quot;/user/address&quot;&gt;Edit Location&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;Retro gets modernized with these sleek sneaks inspired by the Nike Daybreak. Era-echoing suede and nylon are paired in complementary colors, and the updated wedge midsole gives you an extra lift. Style, comfort, iconic Waffle outsole&mdash;this is a perfect new addition to your daily rotation.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Benefits&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Swoosh wraps around your heel to form a pull tab, adding aesthetic appeal to on-and-off functionality.&lt;/li&gt;&lt;li&gt;Lifted foam midsoles give you an elevated look and all-day comfort.&lt;/li&gt;&lt;li&gt;Soft suede overlays nod to vintage materials while textile underlays add durability.&lt;/li&gt;&lt;li&gt;Rubber Waffle outsole adds durable traction and heritage style.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;strong&gt;Product Details&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Padded collar&lt;/li&gt;&lt;li&gt;Exposed foam tongue&lt;/li&gt;&lt;li&gt;Traditional lacing&lt;/li&gt;&lt;li&gt;Perforations on heel&lt;ul&gt;&lt;li&gt;Shown: White/Light Orewood Brown/Sail/Rush Fuchsia&lt;/li&gt;&lt;li&gt;Style: DH9523-104&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;strong&gt;Waffle Origin&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;In 1971, Nike cofounder Bill Bowerman was watching his wife, Barbra, make breakfast on a waffle iron and inspiration struck. He swapped batter for rubber and the Waffle outsole was born. It not only delivers traction, durability and heritage Nike style&mdash;it proves that greatness is in the everyday. And that old, rusty waffle iron? Well, it now sits on a pedestal at Nike World Headquarters.&lt;/p&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704268740/bkrq1pgyze889v5be2gp.png', 'Retro gets modernized with these sleek sneaks inspired by the Nike Daybreak.', 64.0, NULL, NULL, 2, '2024-01-03 14:58:59', '2024-01-03 14:58:59', 0, NULL),
	(8, 'Nike Elevate 3', '&lt;p&gt;&lt;strong&gt;Free Shipping*&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;To get accurate shipping information &lt;a href=&quot;/user/address&quot;&gt;Edit Location&lt;/a&gt;&lt;/p&gt;&lt;p&gt;Level up your game on both ends of the floor in the Nike Renew Elevate 3. Specifically tuned for 2-way players who want to make an impact offensively and defensively, this shoe helps you optimize your ability with all-game, all-season support and stability. Improved traction and arch support enhance cutting and pivoting, which can make the difference down the stretch.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;On-Point Pivots&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;A generative, athlete-tested traction allows for better pivoting around the forefoot, allowing you to feel more secure and locked in when spinning, stopping and starting.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lace Up&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;We added extra lace holes on the medial midfoot to give you the extra security you need for all-important arch support.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;More Benefits&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Structured mesh in the upper feels plush around your foot. It fits snugly to help reduce in-shoe movement during play.&lt;/li&gt;&lt;li&gt;The padded collar is contoured to provide a precise fit and support around your ankle.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;strong&gt;Product Details&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;No-sew overlays&lt;/li&gt;&lt;li&gt;Foam midsole&lt;/li&gt;&lt;li&gt;Plush tongue&lt;ul&gt;&lt;li&gt;Shown: Black/Wolf Grey/Cool Grey/White&lt;/li&gt;&lt;li&gt;Style: DD9304-002&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269225/qheu2fgefuytcnnzpmgg.png', 'Level up your game on both ends of the floor in the Nike Renew Elevate 3', 85.0, NULL, NULL, 1, '2024-01-03 15:07:05', '2024-01-03 15:07:05', 0, NULL),
	(9, 'Nike Air Max SC', '&lt;p&gt;&lt;strong&gt;Free Shipping*&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;To get accurate shipping information &lt;a href=&quot;/user/address&quot;&gt;Edit Location&lt;/a&gt;&lt;/p&gt;&lt;p&gt;With its familiar design lines, heritage track aesthetic and visible Max Air cushioning, the Nike Air Max SC is the perfect way to finish off any outfit. Smooth leather and lightweight knit textiles add depth and durability while a tinted Air unit in the heel brightens your day with every step.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Benefits&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Leather combines with airy knits and mesh for durable construction that\'s breathable and comfortable enough to wear all day.&lt;/li&gt;&lt;li&gt;Originally designed for running, Max Air unit in heels deliver lightweight cushioning with every step.&lt;/li&gt;&lt;li&gt;Foam midsole adds cushioning that lasts.&lt;/li&gt;&lt;li&gt;Rubber outsole provides traction and durability.&lt;ul&gt;&lt;li&gt;Shown: White/Light Lemon Twist/Fireberry/Blue Tint&lt;/li&gt;&lt;li&gt;Style: FQ8886-100&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;strong&gt;Nike Air Max Origins&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Revolutionary Air technology first made its way into Nike footwear in 1978. In 1987, the Air Max 1 debuted with visible Air technology in its heel, allowing fans more than just the feel of Air cushioning&mdash;suddenly they could see it. Since then, next-generation Air Max shoes have become a hit with athletes and collectors by offering striking color combinations and reliable, lightweight cushioning.&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269655/kut4qnvut5cpwloxgrqy.png', 'With its familiar design lines, heritage track aesthetic and visible Max Air cushioning, the Nike Air Max SC is the perfect way to finish off any outfit', 68.0, NULL, NULL, 5, '2024-01-03 15:14:14', '2024-01-03 15:14:14', 0, NULL),
	(10, 'Nike Air Max 270', '&lt;p&gt;Free Shipping*&lt;/p&gt;&lt;p&gt;To get accurate shipping information &lt;a href=&quot;/user/address&quot;&gt;Edit Location&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;LEGENDARY AIR GETS LIFTED.&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Nike\'s first lifestyle Air Max brings you style, comfort and big Air in the Nike Air Max 270. The design draws inspiration from Air Max icons, showcasing Nike\'s huge innovation with its large window and fresh details.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Benefits&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;The Max Air 270 unit delivers all-day comfort.&lt;/li&gt;&lt;li&gt;Knit and synthetic fabric on the upper provides a lightweight fit and airy feel.&lt;/li&gt;&lt;li&gt;Foam midsole feels soft and comfortable.&lt;/li&gt;&lt;li&gt;Stretchy inner sleeve creates a personalized fit.&lt;/li&gt;&lt;li&gt;Rubber on the outsole adds traction and durability.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;strong&gt;Product Details&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Mesh details for an airy feel&lt;/li&gt;&lt;li&gt;Synthetic and textile&lt;/li&gt;&lt;li&gt;2-piece midsole&lt;ul&gt;&lt;li&gt;Shown: Summit White/Desert Sand/Peach Cream/Black&lt;/li&gt;&lt;li&gt;Style: DH3050-100&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;strong&gt;Nike Air Max Origins&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Revolutionary Air technology first made its way into Nike footwear in 1978. In 1987, the Air Max 1 debuted with visible Air technology in its heel, allowing fans more than just the feel of Air cushioning&mdash;suddenly they could see it. Since then, next-generation Air Max shoes have become a hit with athletes and collectors by offering striking color combinations and reliable, lightweight cushioning.&lt;/p&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269813/ftllqqdrl0sveehjomp9.png', 'Nike\'s first lifestyle Air Max brings you style, comfort and big Air in the Nike Air Max 270.', 160.0, NULL, NULL, 3, '2024-01-03 15:16:52', '2024-01-03 15:16:52', 0, NULL),
	(11, 'Nike Air Max 90', '&lt;p&gt;Free Shipping*&lt;/p&gt;&lt;p&gt;To get accurate shipping information &lt;a href=&quot;/user/address&quot;&gt;Edit Location&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;COMFORT, HERITAGE. NOTHING BETTER.&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Nothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colors celebrate your fresh look while Max Air cushioning adds comfort to the journey.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Performance Comfort&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Originally designed for performance running, the Max Air unit in the heel adds unbelievable cushioning.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Versatile Style&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;The low-top design combines with a padded collar for a sleek look that feels soft and comfortable.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Retro Vibes&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;The stitched overlays and TPU accents add durability, comfort and the iconic \'90s look you love.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Product Details&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Textile upper with leather and synthetic overlays&lt;/li&gt;&lt;li&gt;Foam midsole&lt;/li&gt;&lt;li&gt;Rubber Waffle outsole adds traction and durability&lt;ul&gt;&lt;li&gt;Shown: Wolf Grey/Black/White/Black&lt;/li&gt;&lt;li&gt;Style: CN8490-001&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;strong&gt;Nike Air Max Origins&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Revolutionary Air technology first made its way into Nike footwear in 1978. In 1987, the Air Max 1 debuted with visible Air technology in its heel, allowing fans more than just the feel of Air cushioning&mdash;suddenly they could see it. Since then, next-generation Air Max shoes have become a hit with athletes and collectors by offering striking color combinations and reliable, lightweight cushioning.&lt;/p&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270012/njsatpli7rviso6zqtp1.png', 'Nothing as fly, nothing as comfortable, nothing as proven.', 130.0, NULL, NULL, 4, '2024-01-03 15:20:11', '2024-01-03 15:20:11', 0, NULL),
	(12, 'Jordan Spizike Low', '&lt;p&gt;&lt;strong&gt;Free Shipping*&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;To get accurate shipping information &lt;a href=&quot;/user/address&quot;&gt;Edit Location&lt;/a&gt;&lt;/p&gt;&lt;p&gt;The Spizike takes elements of four classic Jordans, combines them, and gives you one iconic sneaker. It\'s an homage to Spike Lee formally introducing Hollywood and hoops in a culture moment. You get a great looking pair of kicks with some history. What more can you ask for? Ya dig?&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Benefits&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Visible Nike Air-Sole unit provides lightweight cushioning.&lt;/li&gt;&lt;li&gt;Rubber outsole gives you ample traction.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;strong&gt;Product Details&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Not intended for use as Personal Protective Equipment (PPE)&lt;ul&gt;&lt;li&gt;Shown: Legion Green/Military Brown/University Red/Black&lt;/li&gt;&lt;li&gt;Style: FD4653-300&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270190/ucfxuf0zmifaezmbitp0.png', 'The Spizike takes elements of four classic Jordans, combines them, and gives you one iconic sneaker.', 150.0, NULL, NULL, 1, '2024-01-03 15:23:10', '2024-01-03 15:23:10', 0, NULL),
	(13, 'Air Jordan 1 High G NRG', '&lt;p&gt;&lt;strong&gt;Free Shipping*&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;To get accurate shipping information &lt;a href=&quot;/user/address&quot;&gt;Edit Location&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;One of the reasons why MJ loves golf so much: It&rsquo;s like looking into a mirror. The only opponent he sees is staring right back at him. No teammates to play off. No defender to go at. Just him, his swing and the course. This special AJ1 High, with its metallic finishes, chrome aglets and glossy Air Jordan details, takes inspiration from the internal drive that inspires both MJ and us to keep getting better every day.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Original AJ1 Design&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Real and synthetic leather and bold color-blocking recreate the classic look.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Air Cushioning&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Encapsulated Air in the heel cushions every step.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Heritage Traction&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Based on the design of the original outsole, the rubber-integrated traction pattern includes a forefoot pivot circle.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Product Details&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;1-year waterproof warranty&lt;/li&gt;&lt;li&gt;2 sets of laces&lt;ul&gt;&lt;li&gt;Shown: Metallic Silver/Photon Dust/White/Metallic Silver&lt;/li&gt;&lt;li&gt;Style: FD6815-001&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270515/vzqfnuxgyczzazte698u.png', 'One of the reasons why MJ loves golf so much: It&rsquo;s like looking into a mirror.', 210.0, NULL, NULL, 1, '2024-01-03 15:28:34', '2024-01-03 15:28:34', 0, NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table shoes_web.product_images
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `imageUrl` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `productId` bigint(20) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `productImage_fk0` (`productId`),
  CONSTRAINT `productImage_fk0` FOREIGN KEY (`productId`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table shoes_web.product_images: ~40 rows (approximately)
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` (`id`, `imageUrl`, `productId`, `createAt`, `updateAt`, `isDeleted`) VALUES
	(1, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704212062/tud3vdjpcvo3xduowkki.webp', 1, '2024-01-02 23:14:22', '2024-01-02 23:14:22', 0),
	(2, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704212065/d9lzteivb6jvhloba09t.webp', 1, '2024-01-02 23:14:25', '2024-01-02 23:14:25', 0),
	(3, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704212068/bdtrn5m3yauabs0auwzu.jpg', 1, '2024-01-02 23:14:28', '2024-01-02 23:14:28', 0),
	(5, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704215359/no6sjoahkjvgvzqnypte.webp', 2, '2024-01-03 00:09:19', '2024-01-03 00:09:19', 0),
	(6, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704215362/sbdjsryaqkczs9ouyaeb.webp', 2, '2024-01-03 00:09:22', '2024-01-03 00:09:22', 0),
	(7, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704215365/ims67scqedezkkjevsya.webp', 2, '2024-01-03 00:09:24', '2024-01-03 00:09:24', 0),
	(8, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704215367/v4wa22furczvc5zj5ed6.webp', 2, '2024-01-03 00:09:27', '2024-01-03 00:09:27', 0),
	(9, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704233335/mcq62nibcg9aebukyikx.png', 3, '2024-01-03 05:08:55', '2024-01-03 05:08:55', 0),
	(10, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704233341/c9aqzef3nflaxp5b3qgq.png', 3, '2024-01-03 05:09:01', '2024-01-03 05:09:01', 0),
	(11, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704233693/ay0yiik1p3gtzr8qph8y.png', 4, '2024-01-03 05:15:00', '2024-01-03 05:15:00', 0),
	(12, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704233707/ujlef0wvnlbqmzjmtpxr.png', 4, '2024-01-03 05:15:15', '2024-01-03 05:15:15', 0),
	(13, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704234104/ayvcche62iszn9gbqsxn.png', 5, '2024-01-03 05:21:44', '2024-01-03 05:21:44', 0),
	(14, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704268743/nglns6zs8lh6fr2mpsar.png', 7, '2024-01-03 14:59:03', '2024-01-03 14:59:03', 0),
	(15, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704268747/dxyghctoerajrh9qebty.png', 7, '2024-01-03 14:59:06', '2024-01-03 14:59:06', 0),
	(16, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704268750/e31sfo9gpvxmirpopgms.png', 7, '2024-01-03 14:59:09', '2024-01-03 14:59:09', 0),
	(17, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704268754/b4uafpa8odfhxcanqx4j.png', 7, '2024-01-03 14:59:13', '2024-01-03 14:59:13', 0),
	(18, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269229/viqoo2otlqc4tbfcxpdu.png', 8, '2024-01-03 15:07:09', '2024-01-03 15:07:09', 0),
	(19, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269233/p5b9mdrfl18e3vb4d5zk.png', 8, '2024-01-03 15:07:13', '2024-01-03 15:07:13', 0),
	(20, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269237/d9dxsjdtvwot9bjuqvtq.png', 8, '2024-01-03 15:07:16', '2024-01-03 15:07:16', 0),
	(21, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269239/dw4kkchcfhb8c4tf9swd.jpg', 8, '2024-01-03 15:07:19', '2024-01-03 15:07:19', 0),
	(22, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269659/inqwkloa7kbldec3e9i6.png', 9, '2024-01-03 15:14:18', '2024-01-03 15:14:18', 0),
	(23, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269662/wifzbnkbnldppiuq7pfx.png', 9, '2024-01-03 15:14:21', '2024-01-03 15:14:21', 0),
	(24, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269665/brh9alf2n6xlewb58zm3.png', 9, '2024-01-03 15:14:24', '2024-01-03 15:14:24', 0),
	(25, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269669/ryem7cnz69qci1jj7dc6.png', 9, '2024-01-03 15:14:29', '2024-01-03 15:14:29', 0),
	(26, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269815/ansruelqmpfxxvtmohlh.jpg', 10, '2024-01-03 15:16:55', '2024-01-03 15:16:55', 0),
	(27, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269819/bmp8jxw0sghq1cnxlptp.png', 10, '2024-01-03 15:16:58', '2024-01-03 15:16:58', 0),
	(28, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269822/hrf99ku4d0kzgskr6nqw.png', 10, '2024-01-03 15:17:01', '2024-01-03 15:17:01', 0),
	(29, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269825/bizm5uhyidrr0cbv3cg7.png', 10, '2024-01-03 15:17:05', '2024-01-03 15:17:05', 0),
	(30, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270015/gcrgvjswi9edw6ahwlnl.png', 11, '2024-01-03 15:20:15', '2024-01-03 15:20:15', 0),
	(31, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270019/j51ih79g25jstnrzgplg.png', 11, '2024-01-03 15:20:18', '2024-01-03 15:20:18', 0),
	(32, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270023/tvetag7hynmzzjxf8bs8.png', 11, '2024-01-03 15:20:22', '2024-01-03 15:20:22', 0),
	(33, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270026/rlnarvzyezg7nv1hq1cr.png', 11, '2024-01-03 15:20:26', '2024-01-03 15:20:26', 0),
	(34, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270194/nokr31avojva7z85nwof.png', 12, '2024-01-03 15:23:14', '2024-01-03 15:23:14', 0),
	(35, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270198/gratmjohlb8iw5cxkvth.png', 12, '2024-01-03 15:23:17', '2024-01-03 15:23:17', 0),
	(36, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270201/jdsgvumbcjlwjojhznos.png', 12, '2024-01-03 15:23:20', '2024-01-03 15:23:20', 0),
	(37, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270204/phhorvcbk7ano1dviyqy.jpg', 12, '2024-01-03 15:23:23', '2024-01-03 15:23:23', 0),
	(38, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270518/fgotplqnjlr9ybsjtntd.jpg', 13, '2024-01-03 15:28:37', '2024-01-03 15:28:37', 0),
	(39, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270521/ta793baehabbjuitflqc.jpg', 13, '2024-01-03 15:28:40', '2024-01-03 15:28:40', 0),
	(40, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270524/etuas4oioeiekancagio.jpg', 13, '2024-01-03 15:28:44', '2024-01-03 15:28:44', 0),
	(41, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270527/j6ac5uvwlw1phf5uqdch.jpg', 13, '2024-01-03 15:28:47', '2024-01-03 15:28:47', 0);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;

-- Dumping structure for table shoes_web.product_sizes
CREATE TABLE IF NOT EXISTS `product_sizes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sizeId` bigint(20) DEFAULT NULL,
  `productId` bigint(20) DEFAULT NULL,
  `price` decimal(20,1) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `productSize_fk0` (`sizeId`),
  KEY `productSize_fk1` (`productId`),
  CONSTRAINT `productSize_fk0` FOREIGN KEY (`sizeId`) REFERENCES `sizes` (`id`),
  CONSTRAINT `productSize_fk1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table shoes_web.product_sizes: ~55 rows (approximately)
/*!40000 ALTER TABLE `product_sizes` DISABLE KEYS */;
INSERT INTO `product_sizes` (`id`, `sizeId`, `productId`, `price`, `createAt`, `updateAt`, `isDeleted`) VALUES
	(1, 22, 1, 180.8, '2024-01-02 23:14:19', '2024-01-02 23:14:19', 0),
	(2, 23, 1, 180.1, '2024-01-02 23:14:19', '2024-01-02 23:14:19', 0),
	(3, 24, 1, 158.5, '2024-01-02 23:14:19', '2024-01-02 23:14:19', 0),
	(4, 25, 1, 151.9, '2024-01-02 23:14:19', '2024-01-02 23:14:19', 0),
	(5, 1, 2, 183.9, '2024-01-03 00:09:17', '2024-01-03 00:09:17', 0),
	(6, 2, 2, 164.1, '2024-01-03 00:09:17', '2024-01-03 00:09:17', 0),
	(7, 3, 2, 168.8, '2024-01-03 00:09:17', '2024-01-03 00:09:17', 0),
	(8, 4, 2, 151.4, '2024-01-03 00:09:17', '2024-01-03 00:09:17', 0),
	(9, 5, 2, 150.8, '2024-01-03 00:09:17', '2024-01-03 00:09:17', 0),
	(10, 6, 2, 199.7, '2024-01-03 00:09:17', '2024-01-03 00:09:17', 0),
	(11, 2, 3, 146.1, '2024-01-03 05:08:47', '2024-01-03 05:08:47', 0),
	(12, 3, 3, 131.4, '2024-01-03 05:08:50', '2024-01-03 05:08:50', 0),
	(13, 4, 3, 118.9, '2024-01-03 05:08:50', '2024-01-03 05:08:50', 0),
	(14, 5, 3, 100.1, '2024-01-03 05:08:50', '2024-01-03 05:08:50', 0),
	(15, 6, 3, 143.8, '2024-01-03 05:08:50', '2024-01-03 05:08:50', 0),
	(16, 5, 4, 118.7, '2024-01-03 05:14:43', '2024-01-03 05:14:43', 0),
	(17, 6, 4, 162.0, '2024-01-03 05:14:43', '2024-01-03 05:14:43', 0),
	(18, 7, 4, 154.1, '2024-01-03 05:14:43', '2024-01-03 05:14:43', 0),
	(19, 8, 4, 184.5, '2024-01-03 05:14:43', '2024-01-03 05:14:43', 0),
	(20, 9, 4, 160.1, '2024-01-03 05:14:43', '2024-01-03 05:14:43', 0),
	(21, 1, 5, 146.8, '2024-01-03 05:20:50', '2024-01-03 05:20:50', 0),
	(22, 2, 5, 153.9, '2024-01-03 05:20:50', '2024-01-03 05:20:50', 0),
	(23, 3, 5, 128.9, '2024-01-03 05:20:50', '2024-01-03 05:20:50', 0),
	(25, 19, 7, 183.0, '2024-01-03 14:58:59', '2024-01-03 14:58:59', 0),
	(26, 20, 7, 128.1, '2024-01-03 14:58:59', '2024-01-03 14:58:59', 0),
	(27, 21, 7, 191.7, '2024-01-03 14:58:59', '2024-01-03 14:58:59', 0),
	(28, 22, 7, 174.3, '2024-01-03 14:58:59', '2024-01-03 14:58:59', 0),
	(29, 1, 8, 196.3, '2024-01-03 15:07:05', '2024-01-03 15:07:05', 0),
	(30, 2, 8, 158.5, '2024-01-03 15:07:05', '2024-01-03 15:07:05', 0),
	(31, 3, 8, 103.8, '2024-01-03 15:07:05', '2024-01-03 15:07:05', 0),
	(32, 4, 8, 143.4, '2024-01-03 15:07:05', '2024-01-03 15:07:05', 0),
	(33, 5, 8, 105.4, '2024-01-03 15:07:05', '2024-01-03 15:07:05', 0),
	(34, 6, 8, 196.8, '2024-01-03 15:07:05', '2024-01-03 15:07:05', 0),
	(35, 1, 9, 167.9, '2024-01-03 15:14:14', '2024-01-03 15:14:14', 0),
	(36, 2, 9, 149.0, '2024-01-03 15:14:14', '2024-01-03 15:14:14', 0),
	(37, 3, 9, 141.2, '2024-01-03 15:14:14', '2024-01-03 15:14:14', 0),
	(38, 4, 9, 159.1, '2024-01-03 15:14:14', '2024-01-03 15:14:14', 0),
	(39, 19, 10, 172.0, '2024-01-03 15:16:52', '2024-01-03 15:16:52', 0),
	(40, 20, 10, 182.5, '2024-01-03 15:16:52', '2024-01-03 15:16:52', 0),
	(41, 21, 10, 196.6, '2024-01-03 15:16:52', '2024-01-03 15:16:52', 0),
	(42, 22, 10, 135.3, '2024-01-03 15:16:52', '2024-01-03 15:16:52', 0),
	(43, 23, 10, 186.7, '2024-01-03 15:16:52', '2024-01-03 15:16:52', 0),
	(44, 24, 10, 127.6, '2024-01-03 15:16:52', '2024-01-03 15:16:52', 0),
	(45, 1, 11, 177.9, '2024-01-03 15:20:11', '2024-01-03 15:20:11', 0),
	(46, 2, 11, 106.7, '2024-01-03 15:20:11', '2024-01-03 15:20:11', 0),
	(47, 3, 11, 200.0, '2024-01-03 15:20:11', '2024-01-03 15:20:11', 0),
	(48, 4, 11, 179.6, '2024-01-03 15:20:11', '2024-01-03 15:20:11', 0),
	(49, 1, 12, 198.0, '2024-01-03 15:23:10', '2024-01-03 15:23:10', 0),
	(50, 2, 12, 151.3, '2024-01-03 15:23:10', '2024-01-03 15:23:10', 0),
	(51, 3, 12, 162.4, '2024-01-03 15:23:10', '2024-01-03 15:23:10', 0),
	(52, 4, 12, 158.2, '2024-01-03 15:23:10', '2024-01-03 15:23:10', 0),
	(53, 1, 13, 103.9, '2024-01-03 15:28:34', '2024-01-03 15:28:34', 0),
	(54, 2, 13, 145.0, '2024-01-03 15:28:34', '2024-01-03 15:28:34', 0),
	(55, 3, 13, 113.0, '2024-01-03 15:28:34', '2024-01-03 15:28:34', 0),
	(56, 4, 13, 129.9, '2024-01-03 15:28:34', '2024-01-03 15:28:34', 0);
/*!40000 ALTER TABLE `product_sizes` ENABLE KEYS */;

-- Dumping structure for table shoes_web.sizes
CREATE TABLE IF NOT EXISTS `sizes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `size_pk` (`name`),
  UNIQUE KEY `size_pk2` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table shoes_web.sizes: ~25 rows (approximately)
/*!40000 ALTER TABLE `sizes` DISABLE KEYS */;
INSERT INTO `sizes` (`id`, `name`, `createAt`, `updateAt`, `isDeleted`) VALUES
	(1, 'M 7 / W 8.5', '2024-01-02 03:31:05', '2024-01-08 14:22:33', 0),
	(2, 'M 7.5 / W 9', '2024-01-02 03:31:06', '2024-01-02 03:31:06', 0),
	(3, 'M 8 / W 9.5', '2024-01-02 03:31:06', '2024-01-02 03:31:06', 0),
	(4, 'M 8.5 / W 10', '2024-01-02 03:31:06', '2024-01-02 03:31:06', 0),
	(5, 'M 9 / W 10.5', '2024-01-02 03:31:06', '2024-01-02 03:31:06', 0),
	(6, 'M 9.5 / W 11', '2024-01-02 03:31:06', '2024-01-02 03:31:06', 0),
	(7, 'M 10 / W 11.5', '2024-01-02 03:31:06', '2024-01-02 03:31:06', 0),
	(8, 'M 10.5 / W 12', '2024-01-02 03:31:06', '2024-01-02 03:31:06', 0),
	(9, 'M 11 / W 12.5', '2024-01-02 03:31:06', '2024-01-02 03:31:06', 0),
	(10, 'M 11.5 / W 13', '2024-01-02 03:31:06', '2024-01-02 03:31:06', 0),
	(11, 'M 12 / W 13.5', '2024-01-02 03:31:06', '2024-01-02 03:31:06', 0),
	(12, 'M 12.5 / W 14', '2024-01-02 03:31:06', '2024-01-02 03:31:06', 0),
	(13, 'M 13 / W 14.5', '2024-01-02 03:31:06', '2024-01-02 03:31:06', 0),
	(14, 'M 14 / W 15.5', '2024-01-02 03:31:06', '2024-01-02 03:31:06', 0),
	(15, 'M 15 / W 16.5', '2024-01-02 03:31:06', '2024-01-02 03:31:06', 0),
	(16, 'M 16 / W 17.5', '2024-01-02 03:31:06', '2024-01-02 03:31:06', 0),
	(17, 'M 17 / W 18.5', '2024-01-02 03:31:06', '2024-01-02 03:31:06', 0),
	(18, 'M 18 / W 19.5', '2024-01-02 03:31:06', '2024-01-02 03:31:06', 0),
	(19, 'M 3.5 / W 5', '2024-01-02 03:34:41', '2024-01-02 03:34:41', 0),
	(20, 'M 4 / W 5.5', '2024-01-02 03:34:41', '2024-01-02 03:34:41', 0),
	(21, 'M 4.5 / W 6', '2024-01-02 03:34:41', '2024-01-02 03:34:41', 0),
	(22, 'M 5 / W 6.5', '2024-01-02 03:34:41', '2024-01-02 03:34:41', 0),
	(23, 'M 5.5 / W 7', '2024-01-02 03:34:41', '2024-01-02 03:34:41', 0),
	(24, 'M 6 / W 7.5', '2024-01-02 03:34:41', '2024-01-02 03:34:41', 0),
	(25, 'M 6.5 / W 8', '2024-01-02 03:34:41', '2024-01-02 03:34:41', 0);
/*!40000 ALTER TABLE `sizes` ENABLE KEYS */;

-- Dumping structure for table shoes_web.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `fullName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `birthDay` date DEFAULT NULL,
  `role` char(50) NOT NULL,
  `association` varchar(20) DEFAULT 'none',
  `lastLogged` timestamp NULL DEFAULT current_timestamp(),
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table shoes_web.users: ~4 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `userName`, `email`, `password`, `fullName`, `birthDay`, `role`, `association`, `lastLogged`, `createAt`, `updateAt`, `isDeleted`) VALUES
	(6, 'hoanghuydev', 'tranvohoanghuy12ab@gmail.com', '$2a$12$n1ZRw5rmlRGU0uqK6USVR.p8i66degNqeanwUZK9j0hdgDF8gfvVm', 'Tran Vo Hoang Huy', NULL, 'admin', 'none', '2024-01-22 16:39:09', '2023-12-27 15:23:38', '2024-01-22 16:39:09', 0),
	(8, '111635119529567317993', '21130386@st.hcmuaf.edu.vn', NULL, 'Trần Võ Hoàng Huy', NULL, 'admin', 'google', '2024-01-21 21:22:17', '2023-12-28 11:21:13', '2024-01-21 21:22:17', 0),
	(14, 'a', 'vophihoang252003@gmail.com', '$2a$12$9szEjqLykjaQVvPTnccyRuPLqAfBwCUMRNut8OECjLXLS4HW0LyiG', 'Vo Hoang', NULL, 'admin', 'none', '2024-03-29 15:09:26', '2024-03-13 15:14:47', '2024-03-29 15:09:26', 0),
	(16, 'b', 'vophihoang@gmail.com', '$2a$12$9szEjqLykjaQVvPTnccyRuPLqAfBwCUMRNut8OECjLXLS4HW0LyiG', 'Vo Hoang', NULL, 'user', 'none', '2024-03-29 10:58:10', '2024-03-13 15:14:47', '2024-03-29 10:58:10', 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table shoes_web.user_addresses
CREATE TABLE IF NOT EXISTS `user_addresses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addressId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `userAddress_fk0` (`addressId`),
  KEY `userAddress_fk1` (`userId`),
  CONSTRAINT `userAddress_fk0` FOREIGN KEY (`addressId`) REFERENCES `addresses` (`id`),
  CONSTRAINT `userAddress_fk1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table shoes_web.user_addresses: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_addresses` ENABLE KEYS */;

-- Dumping structure for table shoes_web.user_orders
CREATE TABLE IF NOT EXISTS `user_orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `orderId` bigint(20) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `userOrder_fk0` (`userId`),
  KEY `userOrder_fk1` (`orderId`),
  CONSTRAINT `userOrder_fk0` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `userOrder_fk1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table shoes_web.user_orders: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_orders` DISABLE KEYS */;
INSERT INTO `user_orders` (`id`, `userId`, `orderId`, `createAt`, `updateAt`, `isDeleted`) VALUES
	(2, 8, 3, '2024-01-19 23:17:38', '2024-01-19 23:17:38', 0);
/*!40000 ALTER TABLE `user_orders` ENABLE KEYS */;

-- Dumping structure for table shoes_web.vouchers
CREATE TABLE IF NOT EXISTS `vouchers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discountType` enum('percent','amount') COLLATE utf8mb4_unicode_ci NOT NULL,
  `discountValue` decimal(10,2) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isDeleted` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='discount_type: Loại giảm giá (phần trăm hoặc số tiền cố định).\r\ndiscount_value: Giá trị giảm giá, có thể là phần trăm hoặc số tiền cố định.';

-- Dumping data for table shoes_web.vouchers: ~10 rows (approximately)
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
INSERT INTO `vouchers` (`id`, `code`, `discountType`, `discountValue`, `startDate`, `endDate`, `description`, `isDeleted`) VALUES
	(1, 'VOUCHER01', 'amount', 11.02, '2024-03-29 21:57:05', '2025-03-29 21:57:05', NULL, NULL),
	(2, 'VOUCHER02', 'percent', 15.00, '2024-03-29 21:57:05', '2025-03-29 21:57:05', NULL, NULL),
	(3, 'VOUCHER03', 'amount', 30.00, '2024-03-29 21:57:05', '2025-03-29 21:57:05', NULL, NULL),
	(4, 'VOUCHER04', 'percent', 15.00, '2024-03-29 21:57:05', '2025-03-29 21:57:05', NULL, NULL),
	(5, 'VOUCHER05', 'amount', 1.36, '2024-03-29 21:57:05', '2025-03-29 21:57:05', NULL, NULL),
	(6, 'VOUCHER06', 'percent', 10.00, '2024-03-29 21:57:05', '2025-03-29 21:57:05', NULL, NULL),
	(7, 'VOUCHER07', 'amount', 3.66, '2024-03-29 21:57:05', '2025-03-29 21:57:05', NULL, NULL),
	(8, 'VOUCHER08', 'percent', 20.00, '2024-03-29 21:57:05', '2025-03-29 21:57:05', NULL, NULL),
	(9, 'VOUCHER09', 'amount', 31.58, '2024-03-29 21:57:05', '2025-03-29 21:57:05', NULL, NULL),
	(10, 'VOUCHER10', 'percent', 26.11, '2024-03-29 21:57:05', '2025-03-29 21:57:05', NULL, NULL);
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;

-- Dumping structure for table shoes_web.voucher_categories
CREATE TABLE IF NOT EXISTS `voucher_categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `voucherId` bigint(20) DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `voucherId` (`voucherId`,`categoryId`),
  KEY `categoryId` (`categoryId`),
  CONSTRAINT `voucher_categories_ibfk_1` FOREIGN KEY (`voucherId`) REFERENCES `vouchers` (`id`),
  CONSTRAINT `voucher_categories_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shoes_web.voucher_categories: ~6 rows (approximately)
/*!40000 ALTER TABLE `voucher_categories` DISABLE KEYS */;
INSERT INTO `voucher_categories` (`id`, `voucherId`, `categoryId`) VALUES
	(1, 1, 5),
	(3, 3, 6),
	(4, 4, 4),
	(5, 5, 3),
	(6, 6, 1),
	(8, 8, 2);
/*!40000 ALTER TABLE `voucher_categories` ENABLE KEYS */;

-- Dumping structure for table shoes_web.voucher_products
CREATE TABLE IF NOT EXISTS `voucher_products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `voucherId` bigint(20) DEFAULT NULL,
  `productId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `voucherId` (`voucherId`,`productId`),
  KEY `productId` (`productId`),
  CONSTRAINT `voucher_products_ibfk_1` FOREIGN KEY (`voucherId`) REFERENCES `vouchers` (`id`),
  CONSTRAINT `voucher_products_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shoes_web.voucher_products: ~10 rows (approximately)
/*!40000 ALTER TABLE `voucher_products` DISABLE KEYS */;
INSERT INTO `voucher_products` (`id`, `voucherId`, `productId`) VALUES
	(1, 1, 2),
	(2, 2, 9),
	(3, 3, 8),
	(4, 4, 4),
	(5, 5, 13),
	(6, 6, 5),
	(7, 7, 7),
	(8, 8, 1),
	(9, 9, 10),
	(10, 10, 3);
/*!40000 ALTER TABLE `voucher_products` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
