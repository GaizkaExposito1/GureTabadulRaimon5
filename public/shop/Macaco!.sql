-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.23 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para guretabadul
CREATE DATABASE IF NOT EXISTS `guretabadul` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `guretabadul`;

-- Volcando estructura para tabla guretabadul.carts
CREATE TABLE IF NOT EXISTS `carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_user_id_foreign` (`user_id`),
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.carts: ~5 rows (aproximadamente)
DELETE FROM `carts`;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 2, NULL, NULL),
	(2, 19, NULL, NULL),
	(3, 18, NULL, NULL),
	(4, 1, NULL, NULL),
	(5, 3, NULL, NULL);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.cart_lines
CREATE TABLE IF NOT EXISTS `cart_lines` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_lines_cart_id_foreign` (`cart_id`),
  KEY `cart_lines_product_id_foreign` (`product_id`),
  CONSTRAINT `cart_lines_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  CONSTRAINT `cart_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.cart_lines: ~0 rows (aproximadamente)
DELETE FROM `cart_lines`;
/*!40000 ALTER TABLE `cart_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_lines` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.categories: ~0 rows (aproximadamente)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.chats
CREATE TABLE IF NOT EXISTS `chats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `imgChat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'users/default.png',
  `nuevoMensaje` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chats_user_id_foreign` (`user_id`),
  CONSTRAINT `chats_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.chats: ~0 rows (aproximadamente)
DELETE FROM `chats`;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.data_rows
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int unsigned NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.data_rows: ~76 rows (aproximadamente)
DELETE FROM `data_rows`;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
	(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
	(2, 1, 'name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 2),
	(3, 1, 'email', 'text', 'Correo Electrónico', 1, 1, 1, 1, 1, 1, '{}', 3),
	(4, 1, 'password', 'password', 'Constraseña', 1, 0, 0, 1, 1, 0, '{}', 4),
	(5, 1, 'remember_token', 'text', 'Token de Recuerdo', 0, 0, 0, 0, 0, 0, '{}', 5),
	(6, 1, 'created_at', 'timestamp', 'Creado a', 0, 1, 1, 0, 0, 0, '{}', 6),
	(7, 1, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 0, 0, 0, 0, '{}', 8),
	(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 9),
	(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Rol', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":"0","taggable":"0"}', 11),
	(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 0, 0, 0, 0, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 12),
	(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 14),
	(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
	(13, 2, 'name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 2),
	(14, 2, 'created_at', 'timestamp', 'Creado', 0, 0, 0, 0, 0, 0, '{}', 3),
	(15, 2, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 0, 0, 0, 0, '{}', 4),
	(21, 1, 'role_id', 'text', 'Rango', 0, 1, 1, 1, 1, 1, '{}', 10),
	(29, 1, 'email_verified_at', 'timestamp', 'Email verificado a', 0, 1, 1, 0, 0, 1, '{}', 7),
	(30, 1, 'banned', 'select_dropdown', '¿Vetado?', 1, 1, 1, 1, 1, 1, '{"default":"0","options":{"0":"No","1":"Si"}}', 13),
	(31, 1, 'phone', 'number', 'Telefono', 0, 1, 1, 1, 1, 1, '{}', 15),
	(32, 1, 'country', 'text', 'Pais', 0, 1, 1, 1, 1, 1, '{}', 16),
	(33, 1, 'village', 'text', 'Ciudad', 0, 1, 1, 1, 1, 1, '{}', 17),
	(34, 1, 'address', 'text', 'Dirección', 0, 1, 1, 1, 1, 1, '{}', 18),
	(67, 3, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(68, 3, 'name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 2),
	(69, 3, 'display_name', 'text', 'Nombre Publico', 1, 1, 1, 1, 1, 1, '{}', 3),
	(70, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 4),
	(71, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
	(72, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(73, 20, 'name', 'text', 'Nombre Patrocinador', 1, 1, 1, 1, 1, 1, '{}', 2),
	(74, 20, 'url', 'text', 'Dirección Web', 1, 1, 1, 1, 1, 1, '{}', 3),
	(75, 20, 'description', 'text', 'Descripción', 1, 1, 1, 1, 1, 1, '{}', 4),
	(76, 20, 'imgUrl', 'image', 'Imagen', 1, 1, 1, 1, 1, 1, '{}', 5),
	(77, 20, 'created_at', 'timestamp', 'Creado a', 0, 1, 1, 0, 0, 0, '{}', 6),
	(78, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
	(79, 21, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(80, 21, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 2),
	(81, 21, 'created_at', 'timestamp', 'Creado a', 0, 1, 1, 0, 0, 0, '{}', 3),
	(82, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
	(83, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(84, 22, 'user1_id', 'text', 'User1 Id', 1, 1, 1, 1, 1, 1, '{}', 2),
	(85, 22, 'user2_id', 'text', 'User2 Id', 1, 1, 1, 1, 1, 1, '{}', 3),
	(86, 22, 'created_at', 'timestamp', 'Creado a', 0, 1, 1, 0, 0, 0, '{}', 6),
	(87, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
	(88, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(89, 19, 'name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 2),
	(90, 19, 'date', 'date', 'Fecha', 1, 1, 1, 1, 1, 1, '{}', 3),
	(91, 19, 'description', 'text', 'Descripción (Max 156 caracteres)', 1, 1, 1, 1, 1, 1, '{}', 4),
	(92, 19, 'imgUrl', 'image', 'Imagen', 1, 1, 1, 1, 1, 1, '{}', 5),
	(93, 19, 'created_at', 'timestamp', 'Creado a', 0, 1, 1, 0, 0, 1, '{}', 6),
	(94, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
	(95, 19, 'precio', 'number', 'Precio', 1, 1, 1, 1, 1, 1, '{}', 8),
	(96, 22, 'match_hasmany_user_relationship', 'relationship', 'Usuario 1', 1, 1, 1, 1, 1, 0, '{"model":"App\\\\Models\\\\User","table":"users","type":"belongsTo","column":"user1_id","key":"id","label":"name","pivot_table":"cart_lines","pivot":"0","taggable":"0"}', 4),
	(97, 22, 'match_hasmany_user_relationship_1', 'relationship', 'Usuario 2', 1, 1, 1, 1, 1, 0, '{"model":"App\\\\Models\\\\User","table":"users","type":"belongsTo","column":"user2_id","key":"id","label":"name","pivot_table":"cart_lines","pivot":"0","taggable":"on"}', 5),
	(99, 22, 'estado', 'select_dropdown', 'Estado', 1, 1, 1, 1, 1, 1, '{"default":"0","options":{"0":"No procesado","1":"En proceso","2":"Aceptado","3":"Denegado"}}', 6),
	(100, 27, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(101, 27, 'name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 2),
	(102, 22, 'match_belongsto_state_relationship', 'relationship', 'Estado', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\State","table":"states","type":"belongsTo","column":"estado","key":"id","label":"name","pivot_table":"cart_lines","pivot":"0","taggable":"0"}', 8),
	(103, 28, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(104, 28, 'name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 2),
	(105, 28, 'created_at', 'timestamp', 'Creado a', 0, 1, 1, 1, 0, 1, '{}', 3),
	(106, 28, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
	(107, 21, 'imgChat', 'text', 'Imagen del Chat', 1, 1, 1, 1, 1, 1, '{}', 5),
	(108, 21, 'nuevoMensaje', 'text', 'NuevoMensaje', 1, 1, 1, 1, 1, 1, '{}', 6),
	(109, 21, 'ordenMensajeChat', 'text', 'OrdenMensajeChat', 0, 1, 1, 1, 1, 1, '{}', 7),
	(110, 27, 'created_at', 'text', 'Creado a', 0, 1, 1, 0, 0, 0, '{}', 3),
	(111, 27, 'updated_at', 'text', 'Actualizado a', 0, 0, 0, 0, 0, 0, '{}', 4),
	(117, 31, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(118, 31, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 2),
	(119, 31, 'workshop_id', 'text', 'Workshop Id', 1, 1, 1, 1, 1, 1, '{}', 4),
	(120, 31, 'created_at', 'timestamp', 'Apuntado a', 0, 1, 1, 1, 0, 1, '{}', 6),
	(121, 31, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
	(122, 31, 'workshop_user_belongsto_user_relationship', 'relationship', 'Usuario', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\User","table":"users","type":"belongsTo","column":"user_id","key":"id","label":"name","pivot_table":"cart_lines","pivot":"0","taggable":"0"}', 3),
	(123, 31, 'workshop_user_belongsto_workshop_relationship', 'relationship', 'Taller o Curso', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\Workshop","table":"workshops","type":"belongsTo","column":"workshop_id","key":"id","label":"name","pivot_table":"cart_lines","pivot":"0","taggable":"0"}', 5),
	(124, 19, 'plazas', 'number', 'Plazas', 0, 1, 1, 1, 1, 1, '{}', 9),
	(125, 1, 'acepted', 'select_dropdown', 'Aceptado', 1, 1, 1, 1, 1, 1, '{"default":"0","options":{"0":"No","1":"Si"}}', 19),
	(126, 1, 'deleted_at', 'timestamp', 'Usuario borrado a', 0, 1, 1, 0, 0, 0, '{}', 20);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.data_types
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.data_types: ~10 rows (aproximadamente)
DELETE FROM `data_types`;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'users', 'users', 'Usuario', 'Usuarios', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null,"scope":null}', '2022-02-01 07:35:02', '2022-02-08 12:30:58'),
	(2, 'menus', 'menus', 'Menú', 'Menús', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null,"scope":null}', '2022-02-01 07:35:02', '2022-02-02 08:50:15'),
	(3, 'roles', 'roles', 'Rol', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null,"scope":null}', '2022-02-01 08:24:38', '2022-02-02 08:50:38'),
	(19, 'workshops', 'workshops', 'Curso y Taller', 'Cursos y Talleres', NULL, 'App\\Models\\Workshop', NULL, NULL, NULL, 1, 0, '{"0":"{\\"order_column\\":\\"null\\",\\"order_display_column\\":\\"null\\",\\"order_direction\\":\\"asc\\",\\"default_search_key\\":\\"null\\"}","order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null,"scope":null}', '2022-02-01 08:39:41', '2022-02-08 07:21:35'),
	(20, 'sponsors', 'sponsors', 'Patrocunador', 'Patrocunadores', NULL, 'App\\Models\\Sponsor', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-02-01 08:44:26', '2022-02-02 08:51:08'),
	(21, 'chats', 'chats', 'Chat', 'Chats', NULL, 'App\\Models\\Chat', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-02-01 08:44:47', '2022-02-02 08:52:12'),
	(22, 'matches', 'matches', 'Intercambio', 'Intercambios', NULL, 'App\\Models\\Match', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-02-01 08:45:33', '2022-02-02 08:52:58'),
	(27, 'states', 'states', 'Estado', 'Estados', NULL, 'App\\Models\\State', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-02-02 07:30:12', '2022-02-02 08:51:43'),
	(28, 'likes', 'likes', 'Like', 'Likes', NULL, 'App\\Models\\Like', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-02-02 08:43:03', '2022-02-02 08:52:41'),
	(31, 'workshop_users', 'workshop-users', 'Apuntado Taller', 'Apuntados Talleres', NULL, 'App\\Models\\WorkshopUser', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-02-07 08:09:06', '2022-02-07 08:51:16');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.denied_matchs
CREATE TABLE IF NOT EXISTS `denied_matchs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user1_id` bigint unsigned NOT NULL,
  `user2_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `denied_matchs_user1_id_foreign` (`user1_id`),
  KEY `denied_matchs_user2_id_foreign` (`user2_id`),
  CONSTRAINT `denied_matchs_user1_id_foreign` FOREIGN KEY (`user1_id`) REFERENCES `users` (`id`),
  CONSTRAINT `denied_matchs_user2_id_foreign` FOREIGN KEY (`user2_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.denied_matchs: ~0 rows (aproximadamente)
DELETE FROM `denied_matchs`;
/*!40000 ALTER TABLE `denied_matchs` DISABLE KEYS */;
/*!40000 ALTER TABLE `denied_matchs` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.failed_jobs: ~0 rows (aproximadamente)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.languages
CREATE TABLE IF NOT EXISTS `languages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(150) DEFAULT NULL,
  `lang` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla guretabadul.languages: ~3 rows (aproximadamente)
DELETE FROM `languages`;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` (`id`, `language`, `lang`) VALUES
	(1, 'Español', 'es'),
	(2, 'English', 'en'),
	(3, 'Euskara', 'eus');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.likes
CREATE TABLE IF NOT EXISTS `likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.likes: ~4 rows (aproximadamente)
DELETE FROM `likes`;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'cocinar', '2022-02-01 07:35:13', '2022-02-01 07:35:13'),
	(2, 'bailar', '2022-02-01 07:35:13', '2022-02-01 07:35:13'),
	(3, 'leer', '2022-02-01 07:35:13', '2022-02-01 07:35:13'),
	(4, 'escribir', '2022-02-01 07:35:13', '2022-02-01 07:35:13');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.like_users
CREATE TABLE IF NOT EXISTS `like_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `like_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `isAprender` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `like_users_user_id_foreign` (`user_id`),
  KEY `like_users_like_id_foreign` (`like_id`),
  CONSTRAINT `like_users_like_id_foreign` FOREIGN KEY (`like_id`) REFERENCES `likes` (`id`),
  CONSTRAINT `like_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.like_users: ~10 rows (aproximadamente)
DELETE FROM `like_users`;
/*!40000 ALTER TABLE `like_users` DISABLE KEYS */;
INSERT INTO `like_users` (`id`, `user_id`, `like_id`, `created_at`, `updated_at`, `isAprender`) VALUES
	(1, 1, 1, '2022-02-01 07:35:13', '2022-02-01 07:35:13', 0),
	(2, 1, 2, '2022-02-01 07:35:14', '2022-02-01 07:35:14', 0),
	(4, 1, 3, '2022-02-01 07:35:14', '2022-02-01 07:35:14', 0),
	(5, 2, 2, '2022-02-08 10:38:56', '2022-02-08 10:38:56', 1),
	(6, 2, 4, '2022-02-08 10:38:57', '2022-02-08 10:38:57', 1),
	(7, 2, 1, '2022-02-08 10:39:19', '2022-02-08 10:39:19', 0),
	(8, 2, 3, '2022-02-08 10:39:19', '2022-02-08 10:39:19', 0),
	(9, 2, 1, '2022-02-08 10:39:20', '2022-02-08 10:39:20', 0),
	(10, 1, 1, '2022-02-09 16:10:37', '2022-02-09 16:10:37', 1),
	(11, 1, 3, '2022-02-09 16:10:37', '2022-02-09 16:10:37', 1);
/*!40000 ALTER TABLE `like_users` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.madmin_cache
CREATE TABLE IF NOT EXISTS `madmin_cache` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire` datetime DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_majob_expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.madmin_cache: ~0 rows (aproximadamente)
DELETE FROM `madmin_cache`;
/*!40000 ALTER TABLE `madmin_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `madmin_cache` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.madmin_cache_tag
CREATE TABLE IF NOT EXISTS `madmin_cache_tag` (
  `tid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `unq_macacta_tid_tname` (`tid`,`tname`),
  KEY `fk_macac_tid` (`tid`),
  CONSTRAINT `fk_macacta_tid` FOREIGN KEY (`tid`) REFERENCES `madmin_cache` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.madmin_cache_tag: ~0 rows (aproximadamente)
DELETE FROM `madmin_cache_tag`;
/*!40000 ALTER TABLE `madmin_cache_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `madmin_cache_tag` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.madmin_job
CREATE TABLE IF NOT EXISTS `madmin_job` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL,
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_majob_sid_ctime` (`siteid`,`ctime`),
  KEY `idx_majob_sid_status` (`siteid`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.madmin_job: ~0 rows (aproximadamente)
DELETE FROM `madmin_job`;
/*!40000 ALTER TABLE `madmin_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `madmin_job` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.madmin_log
CREATE TABLE IF NOT EXISTS `madmin_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `facility` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  `priority` smallint NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_malog_sid_time_facility_prio` (`siteid`,`timestamp`,`facility`,`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.madmin_log: ~0 rows (aproximadamente)
DELETE FROM `madmin_log`;
/*!40000 ALTER TABLE `madmin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `madmin_log` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.madmin_queue
CREATE TABLE IF NOT EXISTS `madmin_queue` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rtime` datetime NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_maque_queue_rtime_cname` (`queue`,`rtime`,`cname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.madmin_queue: ~0 rows (aproximadamente)
DELETE FROM `madmin_queue`;
/*!40000 ALTER TABLE `madmin_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `madmin_queue` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.matches
CREATE TABLE IF NOT EXISTS `matches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user1_id` bigint unsigned NOT NULL,
  `user2_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `estado` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `matches_user1_id_foreign` (`user1_id`),
  KEY `matches_user2_id_foreign` (`user2_id`),
  CONSTRAINT `matches_user1_id_foreign` FOREIGN KEY (`user1_id`) REFERENCES `users` (`id`),
  CONSTRAINT `matches_user2_id_foreign` FOREIGN KEY (`user2_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.matches: ~0 rows (aproximadamente)
DELETE FROM `matches`;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.menus: ~1 rows (aproximadamente)
DELETE FROM `menus`;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2022-02-01 07:35:05', '2022-02-01 07:35:05');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.menu_items
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.menu_items: ~17 rows (aproximadamente)
DELETE FROM `menu_items`;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
	(1, 1, 'Tablero', '', '_self', 'voyager-bookmark', '#000000', NULL, 1, '2022-02-01 07:35:05', '2022-02-07 08:59:16', 'voyager.dashboard', 'null'),
	(2, 1, 'Multimedia', '', '_self', 'voyager-images', NULL, 5, 5, '2022-02-01 07:35:05', '2022-02-02 10:43:12', 'voyager.media.index', NULL),
	(3, 1, 'Usuarias', '', '_self', 'voyager-person', '#000000', NULL, 3, '2022-02-01 07:35:05', '2022-02-03 08:26:04', 'voyager.users.index', 'null'),
	(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2022-02-01 07:35:05', '2022-02-01 07:35:05', 'voyager.roles.index', NULL),
	(5, 1, 'Herramientas', '', '_self', 'voyager-tools', NULL, NULL, 11, '2022-02-01 07:35:05', '2022-02-07 08:51:35', NULL, NULL),
	(6, 1, 'Diseñador de Menús', '', '_self', 'voyager-list', NULL, 5, 1, '2022-02-01 07:35:05', '2022-02-02 10:43:12', 'voyager.menus.index', NULL),
	(7, 1, 'Base de Datos', '', '_self', 'voyager-data', NULL, 5, 2, '2022-02-01 07:35:05', '2022-02-02 10:43:12', 'voyager.database.index', NULL),
	(8, 1, 'Compás', '', '_self', 'voyager-compass', NULL, 5, 3, '2022-02-01 07:35:05', '2022-02-02 10:43:12', 'voyager.compass.index', NULL),
	(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2022-02-01 07:35:05', '2022-02-02 10:43:12', 'voyager.bread.index', NULL),
	(10, 1, 'Parámetros', '', '_self', 'voyager-settings', NULL, NULL, 12, '2022-02-01 07:35:06', '2022-02-07 08:51:35', 'voyager.settings.index', NULL),
	(13, 1, 'Talleres y Cursos', '', '_self', 'voyager-study', '#000000', NULL, 5, '2022-02-01 08:34:38', '2022-02-03 08:26:44', 'voyager.workshops.index', 'null'),
	(14, 1, 'Patrocinadores', '', '_self', 'voyager-star-two', '#000000', NULL, 9, '2022-02-01 08:44:26', '2022-02-07 08:51:35', 'voyager.sponsors.index', 'null'),
	(15, 1, 'Chats', 'chat', '_self', 'voyager-bubble', '#000000', NULL, 10, '2022-02-01 08:44:48', '2022-02-07 08:51:35', NULL, ''),
	(16, 1, 'Intercambios', 'match', '_self', 'voyager-bubble-hear', '#000000', NULL, 7, '2022-02-01 08:45:34', '2022-02-07 08:51:35', NULL, ''),
	(20, 1, 'Likes', '', '_self', 'voyager-thumbs-up', '#000000', NULL, 8, '2022-02-02 08:43:03', '2022-02-07 08:51:35', 'voyager.likes.index', 'null'),
	(22, 1, 'Administrar Usuarias', 'adminUsers', '_self', 'voyager-smile', '#000000', NULL, 4, '2022-02-02 10:36:06', '2022-02-03 08:26:04', NULL, ''),
	(25, 1, 'Apuntados A talleres', '', '_self', 'voyager-receipt', '#000000', NULL, 6, '2022-02-07 08:09:07', '2022-02-07 08:58:19', 'voyager.workshop-users.index', 'null');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `isAdmin` tinyint(1) NOT NULL,
  `chat_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `text` varchar(175) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_chat_id_foreign` (`chat_id`),
  CONSTRAINT `messages_chat_id_foreign` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.messages: ~0 rows (aproximadamente)
DELETE FROM `messages`;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.migrations: ~45 rows (aproximadamente)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2015_01_21_084455_carts', 1),
	(4, '2015_01_21_084551_chats', 1),
	(5, '2016_01_01_000000_add_voyager_user_fields', 1),
	(6, '2016_01_01_000000_create_data_types_table', 1),
	(7, '2016_01_01_000000_create_pages_table', 1),
	(8, '2016_01_01_000000_create_posts_table', 1),
	(9, '2016_02_15_204651_create_categories_table', 1),
	(10, '2016_05_19_173453_create_menu_table', 1),
	(11, '2016_10_21_190000_create_roles_table', 1),
	(12, '2016_10_21_190000_create_settings_table', 1),
	(13, '2016_11_30_135954_create_permission_table', 1),
	(14, '2016_11_30_141208_create_permission_role_table', 1),
	(15, '2016_12_26_201236_data_types__add__server_side', 1),
	(16, '2017_01_13_000000_add_route_to_menu_items_table', 1),
	(17, '2017_01_14_005015_create_translations_table', 1),
	(18, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
	(19, '2017_03_06_000000_add_controller_to_data_types_table', 1),
	(20, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
	(21, '2017_04_21_000000_add_order_to_data_rows_table', 1),
	(22, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
	(23, '2017_08_05_000000_add_group_to_settings_table', 1),
	(24, '2017_11_26_013050_add_user_role_relationship', 1),
	(25, '2017_11_26_015000_create_user_roles_table', 1),
	(26, '2018_03_11_000000_add_user_settings', 1),
	(27, '2018_03_14_000000_add_details_to_data_types_table', 1),
	(28, '2018_03_16_000000_make_settings_value_nullable', 1),
	(29, '2019_08_19_000000_create_failed_jobs_table', 1),
	(30, '2022_01_21_083759_sponsors', 1),
	(31, '2022_01_21_084010_workshops', 1),
	(32, '2022_01_21_084052_matches', 1),
	(33, '2022_01_21_084124_denied_matchs', 1),
	(34, '2022_01_21_084139_likes', 1),
	(35, '2022_01_21_084207_messages', 1),
	(36, '2022_01_21_084233_purchases', 1),
	(37, '2022_01_21_084256_products', 1),
	(38, '2022_01_21_084436_workshop_users', 1),
	(39, '2022_01_21_084541_cart_lines', 1),
	(40, '2022_01_21_084607_like_users', 1),
	(41, '2022_01_26_081801_add_some_collums', 1),
	(42, '2022_02_01_074729_add_precio_to_work_shops', 2),
	(43, '2022_02_02_072130_create_estado_table', 2),
	(44, '2022_02_02_072742_states', 3),
	(45, '2022_02_03_104455_add_user_activate_to_users', 4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_attribute
CREATE TABLE IF NOT EXISTS `mshop_attribute` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varbinary(32) NOT NULL DEFAULT '',
  `type` varbinary(64) NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(255) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msatt_dom_sid_type_code` (`domain`,`siteid`,`type`,`code`),
  KEY `idx_msatt_dom_sid_stat_typ_pos` (`domain`,`siteid`,`status`,`type`,`pos`),
  KEY `idx_msatt_sid_status` (`siteid`,`status`),
  KEY `idx_msatt_sid_label` (`siteid`,`label`),
  KEY `idx_msatt_sid_code` (`siteid`,`code`),
  KEY `idx_msatt_sid_type` (`siteid`,`type`),
  KEY `idx_msatt_key_sid` (`key`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_attribute: ~19 rows (aproximadamente)
DELETE FROM `mshop_attribute`;
/*!40000 ALTER TABLE `mshop_attribute` DISABLE KEYS */;
INSERT INTO `mshop_attribute` (`id`, `siteid`, `key`, `type`, `domain`, `code`, `label`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(15, '1.', _binary 0x3263316530633464356165646462363336303335306230343832643061383932, _binary 0x7072696365, 'product', _binary 0x637573746f6d, 'Custom price', 0, 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(18, '1.', _binary 0x6638353933643464326436383765353665636234633337666339386161316164, _binary 0x64617465, 'product', _binary 0x637573746f6d, 'Custom date', 0, 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(19, '1.', _binary 0x6130353833303730366231346631636562363932353332396431666437643862, _binary 0x74657874, 'product', _binary 0x637573746f6d, 'Custom text', 0, 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(20, '1.', _binary 0x6334393531313037616330396537316339393331303636353538633339343532, _binary 0x75706c6f6164, 'product', _binary 0x637573746f6d, 'Custom upload', 0, 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(101, '1.', _binary 0x3032613032343366343562653137343162343230653364666263356438646464, _binary 0x636f6c6f72, 'product', _binary 0x64656d6f2d626c61636b, 'Demo: Black', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(102, '1.', _binary 0x3638363139346533663434373561626564623638616565343736376463333139, _binary 0x7072696e74, 'product', _binary 0x64656d6f2d7072696e742d736d616c6c, 'Demo: Small print', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(103, '1.', _binary 0x6639653365643030636562343339303565666136623434626463616430373035, _binary 0x74657874, 'product', _binary 0x64656d6f2d7072696e742d74657874, 'Demo: Text for print', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(104, '1.', _binary 0x6231346336633166613034313762633931346139353135613936613235626165, _binary 0x696e74657276616c, 'product', _binary 0x503059314d30573044, 'Demo: One month', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(105, '1.', _binary 0x3961313433626239646433333061666466653235623666363966336234323732, _binary 0x696e74657276616c, 'product', _binary 0x503159304d30573044, 'Demo: One year', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(106, '1.', _binary 0x6534346132333639653233613162663530616239316634313763623630343137, _binary 0x7072696e74, 'product', _binary 0x64656d6f2d7072696e742d6c61726765, 'Demo: Large print', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(107, '1.', _binary 0x6331393866343164623961663836636630343364306464343833613961303961, _binary 0x636f6c6f72, 'product', _binary 0x64656d6f2d626c7565, 'Demo: Blue', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(108, '1.', _binary 0x3663326439363662313266663137343461656130333035393262373733373837, _binary 0x7769647468, 'product', _binary 0x64656d6f2d77696474682d3332, 'Demo: Width 32', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(109, '1.', _binary 0x3864613133646465356631626161353265323834386530393330323039653730, _binary 0x6c656e677468, 'product', _binary 0x64656d6f2d6c656e6774682d3334, 'Demo: Length 34', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(110, '1.', _binary 0x3032653332333835613038383566303263643165323030663432393033346162, _binary 0x636f6c6f72, 'product', _binary 0x64656d6f2d6265696765, 'Demo: Beige', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(111, '1.', _binary 0x6635613932653535643438396361663637373764333262366430333931343435, _binary 0x7769647468, 'product', _binary 0x64656d6f2d77696474682d3333, 'Demo: Width 33', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(112, '1.', _binary 0x3134626564313436393537663930623964613266613834313531313535653162, _binary 0x6c656e677468, 'product', _binary 0x64656d6f2d6c656e6774682d3336, 'Demo: Length 36', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(113, '1.', _binary 0x6434653539306330643163396438646663396537333234623764643233336661, _binary 0x737469636b6572, 'product', _binary 0x64656d6f2d737469636b65722d736d616c6c, 'Demo: Small sticker', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(114, '1.', _binary 0x6530326537393632323163613765613263346231663866346464623231616134, _binary 0x737469636b6572, 'product', _binary 0x64656d6f2d737469636b65722d6c61726765, 'Demo: Large sticker', 3, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(115, '1.', _binary 0x3863323231623462373434393764323365613232646237643765346537646335, _binary 0x64617465, 'product', _binary 0x64656d6f2d637573746f6d2d64617465, 'Demo: Custom date', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup');
/*!40000 ALTER TABLE `mshop_attribute` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_attribute_list
CREATE TABLE IF NOT EXISTS `mshop_attribute_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` int NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varbinary(134) NOT NULL DEFAULT '',
  `type` varbinary(64) NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refid` varbinary(36) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msattli_pid_dm_sid_ty_rid` (`parentid`,`domain`,`siteid`,`type`,`refid`),
  KEY `idx_msattli_key_sid` (`key`,`siteid`),
  KEY `fk_msattli_pid` (`parentid`),
  CONSTRAINT `fk_msattli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_attribute_list: ~71 rows (aproximadamente)
DELETE FROM `mshop_attribute_list`;
/*!40000 ALTER TABLE `mshop_attribute_list` DISABLE KEYS */;
INSERT INTO `mshop_attribute_list` (`id`, `parentid`, `siteid`, `key`, `type`, `domain`, `refid`, `start`, `end`, `config`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(58, 15, '1.', _binary 0x746578747c64656661756c747c3730, _binary 0x64656661756c74, 'text', _binary 0x3730, NULL, NULL, '[]', 0, 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(59, 15, '1.', _binary 0x746578747c64656661756c747c3731, _binary 0x64656661756c74, 'text', _binary 0x3731, NULL, NULL, '[]', 0, 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(119, 15, '1.', _binary 0x746578747c64656661756c747c323733, _binary 0x64656661756c74, 'text', _binary 0x323733, NULL, NULL, '[]', 0, 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(120, 15, '1.', _binary 0x746578747c64656661756c747c323734, _binary 0x64656661756c74, 'text', _binary 0x323734, NULL, NULL, '[]', 0, 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(180, 15, '1.', _binary 0x746578747c64656661756c747c343736, _binary 0x64656661756c74, 'text', _binary 0x343736, NULL, NULL, '[]', 0, 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(181, 15, '1.', _binary 0x746578747c64656661756c747c343737, _binary 0x64656661756c74, 'text', _binary 0x343737, NULL, NULL, '[]', 0, 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(241, 15, '1.', _binary 0x746578747c64656661756c747c363739, _binary 0x64656661756c74, 'text', _binary 0x363739, NULL, NULL, '[]', 0, 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(242, 15, '1.', _binary 0x746578747c64656661756c747c363830, _binary 0x64656661756c74, 'text', _binary 0x363830, NULL, NULL, '[]', 0, 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(302, 15, '1.', _binary 0x746578747c64656661756c747c383832, _binary 0x64656661756c74, 'text', _binary 0x383832, NULL, NULL, '[]', 0, 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(303, 15, '1.', _binary 0x746578747c64656661756c747c383833, _binary 0x64656661756c74, 'text', _binary 0x383833, NULL, NULL, '[]', 0, 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(306, 101, '1.', _binary 0x6d656469617c64656661756c747c323031, _binary 0x64656661756c74, 'media', _binary 0x323031, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(307, 101, '1.', _binary 0x746578747c64656661756c747c31303136, _binary 0x64656661756c74, 'text', _binary 0x31303136, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(308, 101, '1.', _binary 0x746578747c64656661756c747c31303137, _binary 0x64656661756c74, 'text', _binary 0x31303137, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(309, 101, '1.', _binary 0x746578747c64656661756c747c31303138, _binary 0x64656661756c74, 'text', _binary 0x31303138, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(310, 101, '1.', _binary 0x746578747c64656661756c747c31303139, _binary 0x64656661756c74, 'text', _binary 0x31303139, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(311, 102, '1.', _binary 0x70726963657c64656661756c747c333031, _binary 0x64656661756c74, 'price', _binary 0x333031, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(312, 102, '1.', _binary 0x70726963657c64656661756c747c333032, _binary 0x64656661756c74, 'price', _binary 0x333032, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(313, 102, '1.', _binary 0x746578747c64656661756c747c31303230, _binary 0x64656661756c74, 'text', _binary 0x31303230, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(314, 102, '1.', _binary 0x746578747c64656661756c747c31303231, _binary 0x64656661756c74, 'text', _binary 0x31303231, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(315, 102, '1.', _binary 0x746578747c64656661756c747c31303232, _binary 0x64656661756c74, 'text', _binary 0x31303232, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(316, 102, '1.', _binary 0x746578747c64656661756c747c31303233, _binary 0x64656661756c74, 'text', _binary 0x31303233, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(317, 103, '1.', _binary 0x746578747c64656661756c747c31303234, _binary 0x64656661756c74, 'text', _binary 0x31303234, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(318, 103, '1.', _binary 0x746578747c64656661756c747c31303235, _binary 0x64656661756c74, 'text', _binary 0x31303235, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(319, 104, '1.', _binary 0x746578747c64656661756c747c31303236, _binary 0x64656661756c74, 'text', _binary 0x31303236, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(320, 104, '1.', _binary 0x746578747c64656661756c747c31303237, _binary 0x64656661756c74, 'text', _binary 0x31303237, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(321, 105, '1.', _binary 0x746578747c64656661756c747c31303238, _binary 0x64656661756c74, 'text', _binary 0x31303238, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(322, 105, '1.', _binary 0x746578747c64656661756c747c31303239, _binary 0x64656661756c74, 'text', _binary 0x31303239, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(323, 106, '1.', _binary 0x70726963657c64656661756c747c333033, _binary 0x64656661756c74, 'price', _binary 0x333033, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(324, 106, '1.', _binary 0x70726963657c64656661756c747c333034, _binary 0x64656661756c74, 'price', _binary 0x333034, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(325, 106, '1.', _binary 0x746578747c64656661756c747c31303330, _binary 0x64656661756c74, 'text', _binary 0x31303330, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(326, 106, '1.', _binary 0x746578747c64656661756c747c31303331, _binary 0x64656661756c74, 'text', _binary 0x31303331, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(327, 106, '1.', _binary 0x746578747c64656661756c747c31303332, _binary 0x64656661756c74, 'text', _binary 0x31303332, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(328, 106, '1.', _binary 0x746578747c64656661756c747c31303333, _binary 0x64656661756c74, 'text', _binary 0x31303333, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(329, 107, '1.', _binary 0x6d656469617c64656661756c747c323034, _binary 0x64656661756c74, 'media', _binary 0x323034, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(330, 107, '1.', _binary 0x746578747c64656661756c747c31303431, _binary 0x64656661756c74, 'text', _binary 0x31303431, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(331, 107, '1.', _binary 0x746578747c64656661756c747c31303432, _binary 0x64656661756c74, 'text', _binary 0x31303432, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(332, 107, '1.', _binary 0x746578747c64656661756c747c31303433, _binary 0x64656661756c74, 'text', _binary 0x31303433, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(333, 107, '1.', _binary 0x746578747c64656661756c747c31303434, _binary 0x64656661756c74, 'text', _binary 0x31303434, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(334, 108, '1.', _binary 0x746578747c64656661756c747c31303435, _binary 0x64656661756c74, 'text', _binary 0x31303435, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(335, 108, '1.', _binary 0x746578747c64656661756c747c31303436, _binary 0x64656661756c74, 'text', _binary 0x31303436, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(336, 108, '1.', _binary 0x746578747c64656661756c747c31303437, _binary 0x64656661756c74, 'text', _binary 0x31303437, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(337, 109, '1.', _binary 0x746578747c64656661756c747c31303438, _binary 0x64656661756c74, 'text', _binary 0x31303438, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(338, 109, '1.', _binary 0x746578747c64656661756c747c31303439, _binary 0x64656661756c74, 'text', _binary 0x31303439, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(339, 109, '1.', _binary 0x746578747c64656661756c747c31303530, _binary 0x64656661756c74, 'text', _binary 0x31303530, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(340, 110, '1.', _binary 0x6d656469617c64656661756c747c323035, _binary 0x64656661756c74, 'media', _binary 0x323035, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(341, 110, '1.', _binary 0x746578747c64656661756c747c31303531, _binary 0x64656661756c74, 'text', _binary 0x31303531, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(342, 110, '1.', _binary 0x746578747c64656661756c747c31303532, _binary 0x64656661756c74, 'text', _binary 0x31303532, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(343, 110, '1.', _binary 0x746578747c64656661756c747c31303533, _binary 0x64656661756c74, 'text', _binary 0x31303533, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(344, 110, '1.', _binary 0x746578747c64656661756c747c31303534, _binary 0x64656661756c74, 'text', _binary 0x31303534, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(345, 111, '1.', _binary 0x746578747c64656661756c747c31303535, _binary 0x64656661756c74, 'text', _binary 0x31303535, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(346, 111, '1.', _binary 0x746578747c64656661756c747c31303536, _binary 0x64656661756c74, 'text', _binary 0x31303536, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(347, 111, '1.', _binary 0x746578747c64656661756c747c31303537, _binary 0x64656661756c74, 'text', _binary 0x31303537, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(348, 112, '1.', _binary 0x746578747c64656661756c747c31303538, _binary 0x64656661756c74, 'text', _binary 0x31303538, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(349, 112, '1.', _binary 0x746578747c64656661756c747c31303539, _binary 0x64656661756c74, 'text', _binary 0x31303539, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(350, 112, '1.', _binary 0x746578747c64656661756c747c31303630, _binary 0x64656661756c74, 'text', _binary 0x31303630, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(351, 113, '1.', _binary 0x70726963657c64656661756c747c333135, _binary 0x64656661756c74, 'price', _binary 0x333135, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(352, 113, '1.', _binary 0x70726963657c64656661756c747c333136, _binary 0x64656661756c74, 'price', _binary 0x333136, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(353, 113, '1.', _binary 0x746578747c64656661756c747c31303639, _binary 0x64656661756c74, 'text', _binary 0x31303639, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(354, 113, '1.', _binary 0x746578747c64656661756c747c31303730, _binary 0x64656661756c74, 'text', _binary 0x31303730, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(355, 113, '1.', _binary 0x746578747c64656661756c747c31303731, _binary 0x64656661756c74, 'text', _binary 0x31303731, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(356, 113, '1.', _binary 0x746578747c64656661756c747c31303732, _binary 0x64656661756c74, 'text', _binary 0x31303732, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(357, 114, '1.', _binary 0x70726963657c64656661756c747c333137, _binary 0x64656661756c74, 'price', _binary 0x333137, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(358, 114, '1.', _binary 0x70726963657c64656661756c747c333138, _binary 0x64656661756c74, 'price', _binary 0x333138, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(359, 114, '1.', _binary 0x746578747c64656661756c747c31303733, _binary 0x64656661756c74, 'text', _binary 0x31303733, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(360, 114, '1.', _binary 0x746578747c64656661756c747c31303734, _binary 0x64656661756c74, 'text', _binary 0x31303734, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(361, 114, '1.', _binary 0x746578747c64656661756c747c31303735, _binary 0x64656661756c74, 'text', _binary 0x31303735, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(362, 114, '1.', _binary 0x746578747c64656661756c747c31303736, _binary 0x64656661756c74, 'text', _binary 0x31303736, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(363, 15, '1.', _binary 0x746578747c64656661756c747c31303835, _binary 0x64656661756c74, 'text', _binary 0x31303835, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(364, 15, '1.', _binary 0x746578747c64656661756c747c31303836, _binary 0x64656661756c74, 'text', _binary 0x31303836, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(365, 115, '1.', _binary 0x746578747c64656661756c747c31303837, _binary 0x64656661756c74, 'text', _binary 0x31303837, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(366, 115, '1.', _binary 0x746578747c64656661756c747c31303838, _binary 0x64656661756c74, 'text', _binary 0x31303838, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup');
/*!40000 ALTER TABLE `mshop_attribute_list` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_attribute_list_type
CREATE TABLE IF NOT EXISTS `mshop_attribute_list_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msattlity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msattlity_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msattlity_sid_label` (`siteid`,`label`),
  KEY `idx_msattlity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_attribute_list_type: ~4 rows (aproximadamente)
DELETE FROM `mshop_attribute_list_type`;
/*!40000 ALTER TABLE `mshop_attribute_list_type` DISABLE KEYS */;
INSERT INTO `mshop_attribute_list_type` (`id`, `siteid`, `domain`, `code`, `label`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', 'media', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(2, '1.', 'price', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(3, '1.', 'text', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(4, '1.', 'upload', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup');
/*!40000 ALTER TABLE `mshop_attribute_list_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_attribute_property
CREATE TABLE IF NOT EXISTS `mshop_attribute_property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` int NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varbinary(103) NOT NULL DEFAULT '',
  `type` varbinary(64) NOT NULL,
  `langid` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msattpr_sid_ty_lid_value` (`parentid`,`siteid`,`type`,`langid`,`value`),
  KEY `fk_msattpr_key_sid` (`key`,`siteid`),
  KEY `fk_msattpr_pid` (`parentid`),
  CONSTRAINT `fk_msattpr_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_attribute_property: ~0 rows (aproximadamente)
DELETE FROM `mshop_attribute_property`;
/*!40000 ALTER TABLE `mshop_attribute_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_attribute_property` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_attribute_property_type
CREATE TABLE IF NOT EXISTS `mshop_attribute_property_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msattprty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msattprty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msattprty_sid_label` (`siteid`,`label`),
  KEY `idx_msattprty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_attribute_property_type: ~0 rows (aproximadamente)
DELETE FROM `mshop_attribute_property_type`;
/*!40000 ALTER TABLE `mshop_attribute_property_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_attribute_property_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_attribute_type
CREATE TABLE IF NOT EXISTS `mshop_attribute_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msattty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msattty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msattty_sid_label` (`siteid`,`label`),
  KEY `idx_msattty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_attribute_type: ~12 rows (aproximadamente)
DELETE FROM `mshop_attribute_type`;
/*!40000 ALTER TABLE `mshop_attribute_type` DISABLE KEYS */;
INSERT INTO `mshop_attribute_type` (`id`, `siteid`, `domain`, `code`, `label`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', 'product', _binary 0x646f776e6c6f6164, 'Download', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(2, '1.', 'product', _binary 0x7072696365, 'Price', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(3, '1.', 'product', _binary 0x74657874, 'Text', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(4, '1.', 'product', _binary 0x64617465, 'Date', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(5, '1.', 'product', _binary 0x696e74657276616c, 'Interval', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(6, '1.', 'product', _binary 0x637573746f6d65722f67726f7570, 'Customer group ID', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(7, '1.', 'product', _binary 0x636f6c6f72, 'Color', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(8, '1.', 'product', _binary 0x73697a65, 'Size', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(9, '1.', 'product', _binary 0x7769647468, 'Width', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(10, '1.', 'product', _binary 0x6c656e677468, 'Length', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(11, '1.', 'product', _binary 0x7072696e74, 'Print', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(12, '1.', 'product', _binary 0x737469636b6572, 'Sticker', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup');
/*!40000 ALTER TABLE `mshop_attribute_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_catalog
CREATE TABLE IF NOT EXISTS `mshop_catalog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` int DEFAULT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` smallint NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nleft` int NOT NULL,
  `nright` int NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscat_sid_code` (`siteid`,`code`),
  KEY `idx_mscat_sid_nlt_nrt_lvl_pid` (`siteid`,`nleft`,`nright`,`level`,`parentid`),
  KEY `idx_mscat_sid_status` (`siteid`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_catalog: ~4 rows (aproximadamente)
DELETE FROM `mshop_catalog`;
/*!40000 ALTER TABLE `mshop_catalog` DISABLE KEYS */;
INSERT INTO `mshop_catalog` (`id`, `parentid`, `siteid`, `level`, `code`, `label`, `url`, `config`, `nleft`, `nright`, `status`, `mtime`, `ctime`, `editor`, `target`) VALUES
	(1, 0, '1.', 0, _binary 0x686f6d65, 'Home', 'Home', '[]', 1, 8, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup', ''),
	(17, 1, '1.', 1, _binary 0x64656d6f2d62657374, 'Best sellers', 'Best-sellers', '[]', 2, 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup', ''),
	(18, 1, '1.', 1, _binary 0x64656d6f2d6e6577, 'New arrivals', 'New-arrivals', '[]', 4, 5, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup', ''),
	(19, 1, '1.', 1, _binary 0x64656d6f2d6465616c73, 'Hot deals', 'Hot-deals', '[]', 6, 7, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup', '');
/*!40000 ALTER TABLE `mshop_catalog` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_catalog_list
CREATE TABLE IF NOT EXISTS `mshop_catalog_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` int NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varbinary(134) NOT NULL DEFAULT '',
  `type` varbinary(64) NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refid` varbinary(36) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscatli_pid_dm_sid_ty_rid` (`parentid`,`domain`,`siteid`,`type`,`refid`),
  KEY `idx_mscatli_pid_dm_sid_pos_rid` (`parentid`,`domain`,`siteid`,`pos`,`refid`),
  KEY `idx_mscatli_rid_dom_sid_ty` (`refid`,`domain`,`siteid`,`type`),
  KEY `idx_mscatli_key_sid` (`key`,`siteid`),
  KEY `fk_mscatli_pid` (`parentid`),
  CONSTRAINT `fk_mscatli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_catalog_list: ~57 rows (aproximadamente)
DELETE FROM `mshop_catalog_list`;
/*!40000 ALTER TABLE `mshop_catalog_list` DISABLE KEYS */;
INSERT INTO `mshop_catalog_list` (`id`, `parentid`, `siteid`, `key`, `type`, `domain`, `refid`, `start`, `end`, `config`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(286, 1, '1.', _binary 0x70726f647563747c70726f6d6f74696f6e7c3731, _binary 0x70726f6d6f74696f6e, 'product', _binary 0x3731, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(287, 1, '1.', _binary 0x70726f647563747c70726f6d6f74696f6e7c3738, _binary 0x70726f6d6f74696f6e, 'product', _binary 0x3738, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(288, 1, '1.', _binary 0x70726f647563747c70726f6d6f74696f6e7c3832, _binary 0x70726f6d6f74696f6e, 'product', _binary 0x3832, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(289, 1, '1.', _binary 0x70726f647563747c70726f6d6f74696f6e7c3834, _binary 0x70726f6d6f74696f6e, 'product', _binary 0x3834, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(290, 1, '1.', _binary 0x70726f647563747c64656661756c747c3731, _binary 0x64656661756c74, 'product', _binary 0x3731, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(291, 1, '1.', _binary 0x70726f647563747c64656661756c747c3734, _binary 0x64656661756c74, 'product', _binary 0x3734, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(292, 1, '1.', _binary 0x70726f647563747c64656661756c747c3735, _binary 0x64656661756c74, 'product', _binary 0x3735, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(293, 1, '1.', _binary 0x70726f647563747c64656661756c747c3736, _binary 0x64656661756c74, 'product', _binary 0x3736, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(294, 1, '1.', _binary 0x70726f647563747c64656661756c747c3830, _binary 0x64656661756c74, 'product', _binary 0x3830, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(295, 1, '1.', _binary 0x70726f647563747c64656661756c747c3831, _binary 0x64656661756c74, 'product', _binary 0x3831, NULL, NULL, '[]', 5, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(296, 1, '1.', _binary 0x70726f647563747c64656661756c747c3832, _binary 0x64656661756c74, 'product', _binary 0x3832, NULL, NULL, '[]', 6, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(297, 1, '1.', _binary 0x70726f647563747c64656661756c747c3833, _binary 0x64656661756c74, 'product', _binary 0x3833, NULL, NULL, '[]', 7, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(298, 1, '1.', _binary 0x70726f647563747c64656661756c747c3834, _binary 0x64656661756c74, 'product', _binary 0x3834, NULL, NULL, '[]', 8, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(299, 1, '1.', _binary 0x746578747c64656661756c747c31313436, _binary 0x64656661756c74, 'text', _binary 0x31313436, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(300, 1, '1.', _binary 0x746578747c64656661756c747c31313437, _binary 0x64656661756c74, 'text', _binary 0x31313437, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(301, 1, '1.', _binary 0x746578747c64656661756c747c31313438, _binary 0x64656661756c74, 'text', _binary 0x31313438, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(302, 1, '1.', _binary 0x746578747c64656661756c747c31313439, _binary 0x64656661756c74, 'text', _binary 0x31313439, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(303, 1, '1.', _binary 0x746578747c64656661756c747c31313530, _binary 0x64656661756c74, 'text', _binary 0x31313530, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(304, 1, '1.', _binary 0x746578747c64656661756c747c31313531, _binary 0x64656661756c74, 'text', _binary 0x31313531, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(305, 1, '1.', _binary 0x746578747c64656661756c747c31313532, _binary 0x64656661756c74, 'text', _binary 0x31313532, NULL, NULL, '[]', 5, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(306, 17, '1.', _binary 0x6d656469617c64656661756c747c323235, _binary 0x64656661756c74, 'media', _binary 0x323235, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(307, 17, '1.', _binary 0x70726f647563747c64656661756c747c3736, _binary 0x64656661756c74, 'product', _binary 0x3736, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(308, 17, '1.', _binary 0x70726f647563747c64656661756c747c3731, _binary 0x64656661756c74, 'product', _binary 0x3731, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(309, 17, '1.', _binary 0x70726f647563747c64656661756c747c3734, _binary 0x64656661756c74, 'product', _binary 0x3734, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(310, 17, '1.', _binary 0x70726f647563747c64656661756c747c3735, _binary 0x64656661756c74, 'product', _binary 0x3735, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(311, 17, '1.', _binary 0x70726f647563747c64656661756c747c3738, _binary 0x64656661756c74, 'product', _binary 0x3738, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(312, 17, '1.', _binary 0x70726f647563747c64656661756c747c3739, _binary 0x64656661756c74, 'product', _binary 0x3739, NULL, NULL, '[]', 5, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(313, 17, '1.', _binary 0x70726f647563747c64656661756c747c3831, _binary 0x64656661756c74, 'product', _binary 0x3831, NULL, NULL, '[]', 6, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(314, 17, '1.', _binary 0x70726f647563747c64656661756c747c3834, _binary 0x64656661756c74, 'product', _binary 0x3834, NULL, NULL, '[]', 7, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(315, 17, '1.', _binary 0x70726f647563747c64656661756c747c3833, _binary 0x64656661756c74, 'product', _binary 0x3833, NULL, NULL, '[]', 8, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(316, 17, '1.', _binary 0x746578747c64656661756c747c31313533, _binary 0x64656661756c74, 'text', _binary 0x31313533, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(317, 17, '1.', _binary 0x746578747c64656661756c747c31313534, _binary 0x64656661756c74, 'text', _binary 0x31313534, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(318, 17, '1.', _binary 0x746578747c64656661756c747c31313535, _binary 0x64656661756c74, 'text', _binary 0x31313535, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(319, 18, '1.', _binary 0x6d656469617c64656661756c747c323236, _binary 0x64656661756c74, 'media', _binary 0x323236, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(320, 18, '1.', _binary 0x70726f647563747c64656661756c747c3832, _binary 0x64656661756c74, 'product', _binary 0x3832, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(321, 18, '1.', _binary 0x70726f647563747c64656661756c747c3831, _binary 0x64656661756c74, 'product', _binary 0x3831, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(322, 18, '1.', _binary 0x70726f647563747c64656661756c747c3739, _binary 0x64656661756c74, 'product', _binary 0x3739, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(323, 18, '1.', _binary 0x70726f647563747c64656661756c747c3834, _binary 0x64656661756c74, 'product', _binary 0x3834, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(324, 18, '1.', _binary 0x70726f647563747c64656661756c747c3738, _binary 0x64656661756c74, 'product', _binary 0x3738, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(325, 18, '1.', _binary 0x70726f647563747c64656661756c747c3731, _binary 0x64656661756c74, 'product', _binary 0x3731, NULL, NULL, '[]', 5, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(326, 18, '1.', _binary 0x70726f647563747c64656661756c747c3734, _binary 0x64656661756c74, 'product', _binary 0x3734, NULL, NULL, '[]', 6, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(327, 18, '1.', _binary 0x70726f647563747c64656661756c747c3735, _binary 0x64656661756c74, 'product', _binary 0x3735, NULL, NULL, '[]', 7, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(328, 18, '1.', _binary 0x746578747c64656661756c747c31313536, _binary 0x64656661756c74, 'text', _binary 0x31313536, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(329, 18, '1.', _binary 0x746578747c64656661756c747c31313537, _binary 0x64656661756c74, 'text', _binary 0x31313537, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(330, 18, '1.', _binary 0x746578747c64656661756c747c31313538, _binary 0x64656661756c74, 'text', _binary 0x31313538, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(331, 19, '1.', _binary 0x6d656469617c64656661756c747c323237, _binary 0x64656661756c74, 'media', _binary 0x323237, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(332, 19, '1.', _binary 0x70726f647563747c64656661756c747c3731, _binary 0x64656661756c74, 'product', _binary 0x3731, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(333, 19, '1.', _binary 0x70726f647563747c64656661756c747c3834, _binary 0x64656661756c74, 'product', _binary 0x3834, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(334, 19, '1.', _binary 0x70726f647563747c64656661756c747c3738, _binary 0x64656661756c74, 'product', _binary 0x3738, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(335, 19, '1.', _binary 0x70726f647563747c64656661756c747c3833, _binary 0x64656661756c74, 'product', _binary 0x3833, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(336, 19, '1.', _binary 0x70726f647563747c64656661756c747c3831, _binary 0x64656661756c74, 'product', _binary 0x3831, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(337, 19, '1.', _binary 0x70726f647563747c64656661756c747c3739, _binary 0x64656661756c74, 'product', _binary 0x3739, NULL, NULL, '[]', 5, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(338, 19, '1.', _binary 0x70726f647563747c64656661756c747c3830, _binary 0x64656661756c74, 'product', _binary 0x3830, NULL, NULL, '[]', 6, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(339, 19, '1.', _binary 0x70726f647563747c64656661756c747c3832, _binary 0x64656661756c74, 'product', _binary 0x3832, NULL, NULL, '[]', 7, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(340, 19, '1.', _binary 0x746578747c64656661756c747c31313539, _binary 0x64656661756c74, 'text', _binary 0x31313539, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(341, 19, '1.', _binary 0x746578747c64656661756c747c31313630, _binary 0x64656661756c74, 'text', _binary 0x31313630, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(342, 19, '1.', _binary 0x746578747c64656661756c747c31313631, _binary 0x64656661756c74, 'text', _binary 0x31313631, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup');
/*!40000 ALTER TABLE `mshop_catalog_list` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_catalog_list_type
CREATE TABLE IF NOT EXISTS `mshop_catalog_list_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscatlity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mscatlity_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_mscatlity_sid_label` (`siteid`,`label`),
  KEY `idx_mscatlity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_catalog_list_type: ~5 rows (aproximadamente)
DELETE FROM `mshop_catalog_list_type`;
/*!40000 ALTER TABLE `mshop_catalog_list_type` DISABLE KEYS */;
INSERT INTO `mshop_catalog_list_type` (`id`, `siteid`, `domain`, `code`, `label`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', 'media', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(2, '1.', 'price', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(3, '1.', 'product', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(4, '1.', 'product', _binary 0x70726f6d6f74696f6e, 'Promotion', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(5, '1.', 'text', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup');
/*!40000 ALTER TABLE `mshop_catalog_list_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_coupon
CREATE TABLE IF NOT EXISTS `mshop_coupon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mscou_sid_stat_start_end` (`siteid`,`status`,`start`,`end`),
  KEY `idx_mscou_sid_provider` (`siteid`,`provider`),
  KEY `idx_mscou_sid_label` (`siteid`,`label`),
  KEY `idx_mscou_sid_start` (`siteid`,`start`),
  KEY `idx_mscou_sid_end` (`siteid`,`end`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_coupon: ~3 rows (aproximadamente)
DELETE FROM `mshop_coupon`;
/*!40000 ALTER TABLE `mshop_coupon` DISABLE KEYS */;
INSERT INTO `mshop_coupon` (`id`, `siteid`, `label`, `provider`, `config`, `start`, `end`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(16, '1.', 'demo-voucher', 'Voucher', '{"voucher.productcode":"demo-rebate"}', NULL, NULL, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(17, '1.', 'demo-fixed', 'FixedRebate,BasketValues', '{"fixedrebate.productcode":"demo-rebate","fixedrebate.rebate":{"EUR":125,"USD":150},"basketvalues.total-value-min":{"EUR":125,"USD":150}}', NULL, NULL, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(18, '1.', 'demo-percent', 'PercentRebate', '{"percentrebate.productcode":"demo-rebate","percentrebate.rebate":"10"}', NULL, NULL, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup');
/*!40000 ALTER TABLE `mshop_coupon` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_coupon_code
CREATE TABLE IF NOT EXISTS `mshop_coupon_code` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` int NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `count` int DEFAULT '0',
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `ref` varbinary(36) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscouco_sid_code` (`siteid`,`code`),
  KEY `idx_mscouco_sid_ct_start_end` (`siteid`,`count`,`start`,`end`),
  KEY `idx_mscouco_sid_start` (`siteid`,`start`),
  KEY `idx_mscouco_sid_end` (`siteid`,`end`),
  KEY `fk_mscouco_pid` (`parentid`),
  CONSTRAINT `fk_mscouco_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_coupon` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_coupon_code: ~2 rows (aproximadamente)
DELETE FROM `mshop_coupon_code`;
/*!40000 ALTER TABLE `mshop_coupon_code` DISABLE KEYS */;
INSERT INTO `mshop_coupon_code` (`id`, `parentid`, `siteid`, `code`, `count`, `start`, `end`, `ref`, `mtime`, `ctime`, `editor`) VALUES
	(11, 17, '1.', _binary 0x6669786564, 1000, NULL, NULL, _binary '', '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(12, 18, '1.', _binary 0x70657263656e74, 1000, NULL, NULL, _binary '', '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup');
/*!40000 ALTER TABLE `mshop_coupon_code` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_customer
CREATE TABLE IF NOT EXISTS `mshop_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salutation` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vatid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address3` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `countryid` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefax` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `vdate` date DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscus_sid_code` (`siteid`,`code`),
  KEY `idx_mscus_sid_langid` (`siteid`,`langid`),
  KEY `idx_mscus_sid_last_first` (`siteid`,`lastname`,`firstname`),
  KEY `idx_mscus_sid_post_addr1` (`siteid`,`postal`,`address1`),
  KEY `idx_mscus_sid_post_city` (`siteid`,`postal`,`city`),
  KEY `idx_mscus_sid_city` (`siteid`,`city`),
  KEY `idx_mscus_sid_email` (`siteid`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_customer: ~0 rows (aproximadamente)
DELETE FROM `mshop_customer`;
/*!40000 ALTER TABLE `mshop_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_customer` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_customer_address
CREATE TABLE IF NOT EXISTS `mshop_customer_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` int NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `company` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vatid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salutation` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address3` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `countryid` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefax` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `pos` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mscusad_pid` (`parentid`),
  KEY `idx_mscusad_langid` (`langid`),
  KEY `idx_mscusad_sid_last_first` (`siteid`,`lastname`,`firstname`),
  KEY `idx_mscusad_sid_post_addr1` (`siteid`,`postal`,`address1`),
  KEY `idx_mscusad_sid_post_ci` (`siteid`,`postal`,`city`),
  KEY `idx_mscusad_sid_city` (`siteid`,`city`),
  KEY `idx_mscusad_sid_email` (`siteid`,`email`),
  CONSTRAINT `fk_mscusad_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_customer_address: ~0 rows (aproximadamente)
DELETE FROM `mshop_customer_address`;
/*!40000 ALTER TABLE `mshop_customer_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_customer_address` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_customer_group
CREATE TABLE IF NOT EXISTS `mshop_customer_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscusgr_sid_code` (`siteid`,`code`),
  KEY `idx_mscusgr_sid_label` (`siteid`,`label`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_customer_group: ~2 rows (aproximadamente)
DELETE FROM `mshop_customer_group`;
/*!40000 ALTER TABLE `mshop_customer_group` DISABLE KEYS */;
INSERT INTO `mshop_customer_group` (`id`, `siteid`, `code`, `label`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', _binary 0x61646d696e, 'Administrator', '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(2, '1.', _binary 0x656469746f72, 'Editor', '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup');
/*!40000 ALTER TABLE `mshop_customer_group` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_customer_list
CREATE TABLE IF NOT EXISTS `mshop_customer_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` int NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varbinary(134) NOT NULL DEFAULT '',
  `type` varbinary(64) NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refid` varbinary(36) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscusli_pid_dm_sid_ty_rid` (`parentid`,`domain`,`siteid`,`type`,`refid`),
  KEY `idx_mscusli_key_sid` (`key`,`siteid`),
  KEY `fk_mscusli_pid` (`parentid`),
  CONSTRAINT `fk_mscusli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_customer_list: ~0 rows (aproximadamente)
DELETE FROM `mshop_customer_list`;
/*!40000 ALTER TABLE `mshop_customer_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_customer_list` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_customer_list_type
CREATE TABLE IF NOT EXISTS `mshop_customer_list_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscuslity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mscuslity_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_mscuslity_sid_label` (`siteid`,`label`),
  KEY `idx_mscuslity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_customer_list_type: ~0 rows (aproximadamente)
DELETE FROM `mshop_customer_list_type`;
/*!40000 ALTER TABLE `mshop_customer_list_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_customer_list_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_customer_property
CREATE TABLE IF NOT EXISTS `mshop_customer_property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` int NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varbinary(103) NOT NULL DEFAULT '',
  `type` varbinary(64) NOT NULL,
  `langid` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mcuspr_sid_ty_lid_value` (`parentid`,`siteid`,`type`,`langid`,`value`),
  KEY `fk_mscuspr_key_sid` (`key`,`siteid`),
  KEY `fk_mcuspr_pid` (`parentid`),
  CONSTRAINT `fk_mcuspr_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_customer_property: ~0 rows (aproximadamente)
DELETE FROM `mshop_customer_property`;
/*!40000 ALTER TABLE `mshop_customer_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_customer_property` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_customer_property_type
CREATE TABLE IF NOT EXISTS `mshop_customer_property_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mcusprty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mcusprty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_mcusprty_sid_label` (`siteid`,`label`),
  KEY `idx_mcusprty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_customer_property_type: ~0 rows (aproximadamente)
DELETE FROM `mshop_customer_property_type`;
/*!40000 ALTER TABLE `mshop_customer_property_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_customer_property_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_index_attribute
CREATE TABLE IF NOT EXISTS `mshop_index_attribute` (
  `prodid` int NOT NULL,
  `artid` int DEFAULT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attrid` varbinary(36) NOT NULL,
  `listtype` varbinary(64) NOT NULL,
  `type` varbinary(64) NOT NULL,
  `code` varbinary(255) NOT NULL,
  `mtime` datetime NOT NULL,
  UNIQUE KEY `unq_msindat_p_s_aid_lt` (`prodid`,`siteid`,`attrid`,`listtype`),
  KEY `idx_msindat_p_s_lt_t_c` (`prodid`,`siteid`,`listtype`,`type`,`code`),
  KEY `idx_msindat_s_at_lt` (`siteid`,`attrid`,`listtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_index_attribute: ~22 rows (aproximadamente)
DELETE FROM `mshop_index_attribute`;
/*!40000 ALTER TABLE `mshop_index_attribute` DISABLE KEYS */;
INSERT INTO `mshop_index_attribute` (`prodid`, `artid`, `siteid`, `attrid`, `listtype`, `type`, `code`, `mtime`) VALUES
	(71, 71, '1.', _binary 0x313031, _binary 0x64656661756c74, _binary 0x636f6c6f72, _binary 0x64656d6f2d626c61636b, '2022-03-10 02:07:32'),
	(71, 71, '1.', _binary 0x313032, _binary 0x636f6e666967, _binary 0x7072696e74, _binary 0x64656d6f2d7072696e742d736d616c6c, '2022-03-10 02:07:32'),
	(71, 71, '1.', _binary 0x313033, _binary 0x637573746f6d, _binary 0x74657874, _binary 0x64656d6f2d7072696e742d74657874, '2022-03-10 02:07:32'),
	(71, 71, '1.', _binary 0x313034, _binary 0x636f6e666967, _binary 0x696e74657276616c, _binary 0x503059314d30573044, '2022-03-10 02:07:32'),
	(71, 71, '1.', _binary 0x313035, _binary 0x636f6e666967, _binary 0x696e74657276616c, _binary 0x503159304d30573044, '2022-03-10 02:07:32'),
	(71, 71, '1.', _binary 0x313036, _binary 0x636f6e666967, _binary 0x7072696e74, _binary 0x64656d6f2d7072696e742d6c61726765, '2022-03-10 02:07:32'),
	(72, 72, '1.', _binary 0x313037, _binary 0x76617269616e74, _binary 0x636f6c6f72, _binary 0x64656d6f2d626c7565, '2022-03-10 02:07:32'),
	(72, 72, '1.', _binary 0x313038, _binary 0x76617269616e74, _binary 0x7769647468, _binary 0x64656d6f2d77696474682d3332, '2022-03-10 02:07:32'),
	(72, 72, '1.', _binary 0x313039, _binary 0x76617269616e74, _binary 0x6c656e677468, _binary 0x64656d6f2d6c656e6774682d3334, '2022-03-10 02:07:32'),
	(73, 73, '1.', _binary 0x313130, _binary 0x76617269616e74, _binary 0x636f6c6f72, _binary 0x64656d6f2d6265696765, '2022-03-10 02:07:32'),
	(73, 73, '1.', _binary 0x313131, _binary 0x76617269616e74, _binary 0x7769647468, _binary 0x64656d6f2d77696474682d3333, '2022-03-10 02:07:32'),
	(73, 73, '1.', _binary 0x313132, _binary 0x76617269616e74, _binary 0x6c656e677468, _binary 0x64656d6f2d6c656e6774682d3336, '2022-03-10 02:07:32'),
	(74, 72, '1.', _binary 0x313037, _binary 0x76617269616e74, _binary 0x636f6c6f72, _binary 0x64656d6f2d626c7565, '2022-03-10 02:07:32'),
	(74, 72, '1.', _binary 0x313038, _binary 0x76617269616e74, _binary 0x7769647468, _binary 0x64656d6f2d77696474682d3332, '2022-03-10 02:07:32'),
	(74, 72, '1.', _binary 0x313039, _binary 0x76617269616e74, _binary 0x6c656e677468, _binary 0x64656d6f2d6c656e6774682d3334, '2022-03-10 02:07:32'),
	(74, 73, '1.', _binary 0x313130, _binary 0x76617269616e74, _binary 0x636f6c6f72, _binary 0x64656d6f2d6265696765, '2022-03-10 02:07:32'),
	(74, 73, '1.', _binary 0x313131, _binary 0x76617269616e74, _binary 0x7769647468, _binary 0x64656d6f2d77696474682d3333, '2022-03-10 02:07:32'),
	(74, 73, '1.', _binary 0x313132, _binary 0x76617269616e74, _binary 0x6c656e677468, _binary 0x64656d6f2d6c656e6774682d3336, '2022-03-10 02:07:32'),
	(75, 75, '1.', _binary 0x313133, _binary 0x636f6e666967, _binary 0x737469636b6572, _binary 0x64656d6f2d737469636b65722d736d616c6c, '2022-03-10 02:07:32'),
	(75, 75, '1.', _binary 0x313134, _binary 0x636f6e666967, _binary 0x737469636b6572, _binary 0x64656d6f2d737469636b65722d6c61726765, '2022-03-10 02:07:32'),
	(76, 76, '1.', _binary 0x313135, _binary 0x637573746f6d, _binary 0x64617465, _binary 0x64656d6f2d637573746f6d2d64617465, '2022-03-10 02:07:32'),
	(76, 76, '1.', _binary 0x3135, _binary 0x637573746f6d, _binary 0x7072696365, _binary 0x637573746f6d, '2022-03-10 02:07:32');
/*!40000 ALTER TABLE `mshop_index_attribute` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_index_catalog
CREATE TABLE IF NOT EXISTS `mshop_index_catalog` (
  `prodid` int NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `catid` varbinary(36) NOT NULL,
  `listtype` varbinary(64) NOT NULL,
  `pos` int NOT NULL,
  `mtime` datetime NOT NULL,
  UNIQUE KEY `unq_msindca_p_s_cid_lt_po` (`prodid`,`siteid`,`catid`,`listtype`,`pos`),
  KEY `idx_msindca_s_ca_lt_po` (`siteid`,`catid`,`listtype`,`pos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_index_catalog: ~38 rows (aproximadamente)
DELETE FROM `mshop_index_catalog`;
/*!40000 ALTER TABLE `mshop_index_catalog` DISABLE KEYS */;
INSERT INTO `mshop_index_catalog` (`prodid`, `siteid`, `catid`, `listtype`, `pos`, `mtime`) VALUES
	(71, '1.', _binary 0x31, _binary 0x64656661756c74, 0, '2022-03-10 02:07:32'),
	(71, '1.', _binary 0x31, _binary 0x70726f6d6f74696f6e, 0, '2022-03-10 02:07:32'),
	(71, '1.', _binary 0x3137, _binary 0x64656661756c74, 1, '2022-03-10 02:07:32'),
	(71, '1.', _binary 0x3138, _binary 0x64656661756c74, 5, '2022-03-10 02:07:32'),
	(71, '1.', _binary 0x3139, _binary 0x64656661756c74, 0, '2022-03-10 02:07:32'),
	(74, '1.', _binary 0x31, _binary 0x64656661756c74, 1, '2022-03-10 02:07:32'),
	(74, '1.', _binary 0x3137, _binary 0x64656661756c74, 2, '2022-03-10 02:07:32'),
	(74, '1.', _binary 0x3138, _binary 0x64656661756c74, 6, '2022-03-10 02:07:32'),
	(75, '1.', _binary 0x31, _binary 0x64656661756c74, 2, '2022-03-10 02:07:32'),
	(75, '1.', _binary 0x3137, _binary 0x64656661756c74, 3, '2022-03-10 02:07:32'),
	(75, '1.', _binary 0x3138, _binary 0x64656661756c74, 7, '2022-03-10 02:07:32'),
	(76, '1.', _binary 0x31, _binary 0x64656661756c74, 3, '2022-03-10 02:07:32'),
	(76, '1.', _binary 0x3137, _binary 0x64656661756c74, 0, '2022-03-10 02:07:32'),
	(78, '1.', _binary 0x31, _binary 0x70726f6d6f74696f6e, 1, '2022-03-10 02:07:32'),
	(78, '1.', _binary 0x3137, _binary 0x64656661756c74, 4, '2022-03-10 02:07:32'),
	(78, '1.', _binary 0x3138, _binary 0x64656661756c74, 4, '2022-03-10 02:07:32'),
	(78, '1.', _binary 0x3139, _binary 0x64656661756c74, 2, '2022-03-10 02:07:32'),
	(79, '1.', _binary 0x3137, _binary 0x64656661756c74, 5, '2022-03-10 02:07:32'),
	(79, '1.', _binary 0x3138, _binary 0x64656661756c74, 2, '2022-03-10 02:07:32'),
	(79, '1.', _binary 0x3139, _binary 0x64656661756c74, 5, '2022-03-10 02:07:32'),
	(80, '1.', _binary 0x31, _binary 0x64656661756c74, 4, '2022-03-10 02:07:32'),
	(80, '1.', _binary 0x3139, _binary 0x64656661756c74, 6, '2022-03-10 02:07:32'),
	(81, '1.', _binary 0x31, _binary 0x64656661756c74, 5, '2022-03-10 02:07:32'),
	(81, '1.', _binary 0x3137, _binary 0x64656661756c74, 6, '2022-03-10 02:07:32'),
	(81, '1.', _binary 0x3138, _binary 0x64656661756c74, 1, '2022-03-10 02:07:32'),
	(81, '1.', _binary 0x3139, _binary 0x64656661756c74, 4, '2022-03-10 02:07:32'),
	(82, '1.', _binary 0x31, _binary 0x64656661756c74, 6, '2022-03-10 02:07:32'),
	(82, '1.', _binary 0x31, _binary 0x70726f6d6f74696f6e, 2, '2022-03-10 02:07:32'),
	(82, '1.', _binary 0x3138, _binary 0x64656661756c74, 0, '2022-03-10 02:07:32'),
	(82, '1.', _binary 0x3139, _binary 0x64656661756c74, 7, '2022-03-10 02:07:32'),
	(83, '1.', _binary 0x31, _binary 0x64656661756c74, 7, '2022-03-10 02:07:32'),
	(83, '1.', _binary 0x3137, _binary 0x64656661756c74, 8, '2022-03-10 02:07:32'),
	(83, '1.', _binary 0x3139, _binary 0x64656661756c74, 3, '2022-03-10 02:07:32'),
	(84, '1.', _binary 0x31, _binary 0x64656661756c74, 8, '2022-03-10 02:07:32'),
	(84, '1.', _binary 0x31, _binary 0x70726f6d6f74696f6e, 3, '2022-03-10 02:07:32'),
	(84, '1.', _binary 0x3137, _binary 0x64656661756c74, 7, '2022-03-10 02:07:32'),
	(84, '1.', _binary 0x3138, _binary 0x64656661756c74, 3, '2022-03-10 02:07:32'),
	(84, '1.', _binary 0x3139, _binary 0x64656661756c74, 1, '2022-03-10 02:07:32');
/*!40000 ALTER TABLE `mshop_index_catalog` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_index_price
CREATE TABLE IF NOT EXISTS `mshop_index_price` (
  `prodid` int NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currencyid` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(12,2) DEFAULT NULL,
  `mtime` datetime NOT NULL,
  UNIQUE KEY `unq_msindpr_pid_sid_cid` (`prodid`,`siteid`,`currencyid`),
  KEY `idx_msindpr_sid_cid_val` (`siteid`,`currencyid`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_index_price: ~24 rows (aproximadamente)
DELETE FROM `mshop_index_price`;
/*!40000 ALTER TABLE `mshop_index_price` DISABLE KEYS */;
INSERT INTO `mshop_index_price` (`prodid`, `siteid`, `currencyid`, `value`, `mtime`) VALUES
	(71, '1.', 'EUR', 100.00, '2022-03-10 02:07:32'),
	(71, '1.', 'USD', 130.00, '2022-03-10 02:07:32'),
	(72, '1.', 'EUR', 140.00, '2022-03-10 02:07:32'),
	(72, '1.', 'USD', 190.00, '2022-03-10 02:07:32'),
	(74, '1.', 'EUR', 150.00, '2022-03-10 02:07:32'),
	(74, '1.', 'USD', 200.00, '2022-03-10 02:07:32'),
	(75, '1.', 'EUR', 250.00, '2022-03-10 02:07:32'),
	(75, '1.', 'USD', 250.00, '2022-03-10 02:07:32'),
	(76, '1.', 'EUR', 25.00, '2022-03-10 02:07:32'),
	(76, '1.', 'USD', 25.00, '2022-03-10 02:07:32'),
	(78, '1.', 'EUR', 49.00, '2022-03-10 02:07:32'),
	(78, '1.', 'USD', 59.00, '2022-03-10 02:07:32'),
	(79, '1.', 'EUR', 69.00, '2022-03-10 02:07:32'),
	(79, '1.', 'USD', 79.00, '2022-03-10 02:07:32'),
	(80, '1.', 'EUR', 29.00, '2022-03-10 02:07:32'),
	(80, '1.', 'USD', 36.00, '2022-03-10 02:07:32'),
	(81, '1.', 'EUR', 79.00, '2022-03-10 02:07:32'),
	(81, '1.', 'USD', 99.00, '2022-03-10 02:07:32'),
	(82, '1.', 'EUR', 19.00, '2022-03-10 02:07:32'),
	(82, '1.', 'USD', 22.00, '2022-03-10 02:07:32'),
	(83, '1.', 'EUR', 49.00, '2022-03-10 02:07:32'),
	(83, '1.', 'USD', 59.00, '2022-03-10 02:07:32'),
	(84, '1.', 'EUR', 39.00, '2022-03-10 02:07:32'),
	(84, '1.', 'USD', 49.00, '2022-03-10 02:07:32');
/*!40000 ALTER TABLE `mshop_index_price` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_index_supplier
CREATE TABLE IF NOT EXISTS `mshop_index_supplier` (
  `prodid` int NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supid` varbinary(36) NOT NULL,
  `listtype` varbinary(64) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `pos` int NOT NULL,
  `mtime` datetime NOT NULL,
  UNIQUE KEY `unq_msindsup_p_sid_supid_lt_po` (`prodid`,`siteid`,`supid`,`listtype`,`pos`),
  KEY `idx_msindsup_p_lat_lon_sid` (`prodid`,`latitude`,`longitude`,`siteid`),
  KEY `idx_msindsup_sid_supid_lt_po` (`siteid`,`supid`,`listtype`,`pos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_index_supplier: ~4 rows (aproximadamente)
DELETE FROM `mshop_index_supplier`;
/*!40000 ALTER TABLE `mshop_index_supplier` DISABLE KEYS */;
INSERT INTO `mshop_index_supplier` (`prodid`, `siteid`, `supid`, `listtype`, `latitude`, `longitude`, `pos`, `mtime`) VALUES
	(71, '1.', _binary 0x3131, _binary 0x64656661756c74, NULL, NULL, 0, '2022-03-10 02:07:32'),
	(74, '1.', _binary 0x3131, _binary 0x64656661756c74, NULL, NULL, 0, '2022-03-10 02:07:32'),
	(74, '1.', _binary 0x3132, _binary 0x64656661756c74, NULL, NULL, 0, '2022-03-10 02:07:32'),
	(75, '1.', _binary 0x3132, _binary 0x64656661756c74, NULL, NULL, 0, '2022-03-10 02:07:32');
/*!40000 ALTER TABLE `mshop_index_supplier` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_index_text
CREATE TABLE IF NOT EXISTS `mshop_index_text` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prodid` int NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msindte_pid_sid_lid_url` (`prodid`,`siteid`,`langid`,`url`),
  KEY `idx_msindte_pid_sid_lid_name` (`prodid`,`siteid`,`langid`,`name`),
  FULLTEXT KEY `idx_msindte_content` (`content`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_index_text: ~26 rows (aproximadamente)
DELETE FROM `mshop_index_text`;
/*!40000 ALTER TABLE `mshop_index_text` DISABLE KEYS */;
INSERT INTO `mshop_index_text` (`id`, `prodid`, `siteid`, `langid`, `url`, `name`, `content`, `mtime`) VALUES
	(131, 71, '1.', 'de', 'Demo-article', 'Demoartikel', ' demoartikel dies ist die kurzbeschreibung des demoartikels hier folgt eine ausführliche beschreibung des artikels, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32'),
	(132, 71, '1.', 'en', 'Demo-article', 'Demo article', ' demo-article schwarz demo article this is the short description of the demo article. add a detailed description of the demo article that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32'),
	(133, 72, '1.', 'en', 'Demo-variant-article-1', 'Demo variant article 1', ' demo-selection-article-1 blau 32 34 demo variant article 1', '2022-03-10 02:07:32'),
	(134, 73, '1.', 'en', 'Demo-variant-article-2', 'Demo variant article 2', ' demo-selection-article-2 beige 33 36 demo variant article 2', '2022-03-10 02:07:32'),
	(135, 74, '1.', 'de', 'Demoartikel-mit-Auswahl', 'Demoartikel mit Auswahl', ' demoartikel mit auswahl demoartikel-mit-auswahl dies ist die kurzbeschreibung des demoartikels mit auswahl hier folgt eine ausführliche beschreibung des artikels mit auswahl, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32'),
	(136, 74, '1.', 'en', 'Demo-selection-article', 'Demo selection article', ' demo-selection-article-1 blau 32 34 demo-selection-article-2 beige 33 36 demo-selection-article demo selection article this is the short description of the selection demo article. add a detailed description of the selection demo article that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32'),
	(137, 75, '1.', 'de', 'Demoartikel-mit-Bundle', 'Demoartikel mit Bundle', ' demoartikel mit bundle demoartikel-mit-bundle dies ist die kurzbeschreibung des demoartikels mit bundle hier folgt eine ausführliche beschreibung des artikels mit bundle, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32'),
	(138, 75, '1.', 'en', 'Demo-bundle-article', 'Demo bundle article', ' demo-bundle-article demo bundle article this is the short description of the bundle demo article. add a detailed description of the bundle demo article that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32'),
	(139, 76, '1.', 'de', 'Demo-voucher', 'Demo-Gutschein', ' demo-gutschein dies ist die kurzbeschreibung des demo-gutscheins hier folgt eine ausführliche beschreibung des gutscheins, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32'),
	(140, 76, '1.', 'en', 'Demo-voucher', 'Demo voucher', ' demo-voucher demo voucher this is the short description of the demo voucher. add a detailed description of the demo voucher that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32'),
	(141, 77, '1.', 'de', 'Demo-rebate', 'Demorabatt', ' demorabatt', '2022-03-10 02:07:32'),
	(142, 77, '1.', 'en', 'Demo-rebate', 'Demo rebate', ' demo-rebate demo rebate', '2022-03-10 02:07:32'),
	(143, 78, '1.', 'de', 'Demo-article-2', 'Demoartikel 2', ' demoartikel 2 dies ist die kurzbeschreibung des demoartikels hier folgt eine ausführliche beschreibung des artikels, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32'),
	(144, 78, '1.', 'en', 'Demo-article-2', 'Demo article 2', ' demo-article-2 demo article 2 this is the short description of the demo article. add a detailed description of the demo article that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32'),
	(145, 79, '1.', 'de', 'Demo-article-3', 'Demoartikel 3', ' demoartikel 3 dies ist die kurzbeschreibung des demoartikels hier folgt eine ausführliche beschreibung des artikels, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32'),
	(146, 79, '1.', 'en', 'Demo-article-3', 'Demo article 3', ' demo-article-3 demo article 3 this is the short description of the demo article. add a detailed description of the demo article that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32'),
	(147, 80, '1.', 'de', 'Demo-article-4', 'Demoartikel 4', ' demoartikel 4 dies ist die kurzbeschreibung des demoartikels hier folgt eine ausführliche beschreibung des artikels, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32'),
	(148, 80, '1.', 'en', 'Demo-article-4', 'Demo article 4', ' demo-article-4 demo article 4 this is the short description of the demo article. add a detailed description of the demo article that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32'),
	(149, 81, '1.', 'de', 'Demo-article-5', 'Demoartikel 5', ' demoartikel 5 dies ist die kurzbeschreibung des demoartikels hier folgt eine ausführliche beschreibung des artikels, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32'),
	(150, 81, '1.', 'en', 'Demo-article-5', 'Demo article 5', ' demo-article-5 demo article 5 this is the short description of the demo article. add a detailed description of the demo article that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32'),
	(151, 82, '1.', 'de', 'Demo-article-6', 'Demoartikel 6', ' demoartikel 6 dies ist die kurzbeschreibung des demoartikels hier folgt eine ausführliche beschreibung des artikels, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32'),
	(152, 82, '1.', 'en', 'Demo-article-6', 'Demo article 6', ' demo-article-6 demo article 6 this is the short description of the demo article. add a detailed description of the demo article that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32'),
	(153, 83, '1.', 'de', 'Demo-article-7', 'Demoartikel 7', ' demoartikel 7 dies ist die kurzbeschreibung des demoartikels hier folgt eine ausführliche beschreibung des artikels, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32'),
	(154, 83, '1.', 'en', 'Demo-article-7', 'Demo article 7', ' demo-article-7 demo article 7 this is the short description of the demo article. add a detailed description of the demo article that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32'),
	(155, 84, '1.', 'de', 'Demo-article-8', 'Demoartikel 8', ' demoartikel 8 dies ist die kurzbeschreibung des demoartikels hier folgt eine ausführliche beschreibung des artikels, die gerne etwas länger sein darf. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32'),
	(156, 84, '1.', 'en', 'Demo-article-8', 'Demo article 8', ' demo-article-8 demo article 8 this is the short description of the demo article. add a detailed description of the demo article that may be a little bit longer. meta descriptions are important because they are shown in the search engine result page', '2022-03-10 02:07:32');
/*!40000 ALTER TABLE `mshop_index_text` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_locale
CREATE TABLE IF NOT EXISTS `mshop_locale` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currencyid` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msloc_sid_lang_curr` (`siteid`,`langid`,`currencyid`),
  KEY `idx_msloc_sid_curid` (`siteid`,`currencyid`),
  KEY `idx_msloc_sid_status` (`siteid`,`status`),
  KEY `idx_msloc_sid_pos` (`siteid`,`pos`),
  KEY `fk_msloc_siteid` (`siteid`),
  KEY `fk_msloc_langid` (`langid`),
  KEY `fk_msloc_currid` (`currencyid`),
  CONSTRAINT `fk_msloc_currid` FOREIGN KEY (`currencyid`) REFERENCES `mshop_locale_currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_msloc_langid` FOREIGN KEY (`langid`) REFERENCES `mshop_locale_language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_msloc_siteid` FOREIGN KEY (`siteid`) REFERENCES `mshop_locale_site` (`siteid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_locale: ~1 rows (aproximadamente)
DELETE FROM `mshop_locale`;
/*!40000 ALTER TABLE `mshop_locale` DISABLE KEYS */;
INSERT INTO `mshop_locale` (`id`, `siteid`, `langid`, `currencyid`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', 'en', 'EUR', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup');
/*!40000 ALTER TABLE `mshop_locale` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_locale_currency
CREATE TABLE IF NOT EXISTS `mshop_locale_currency` (
  `id` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msloccu_status` (`status`),
  KEY `idx_msloccu_label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_locale_currency: ~156 rows (aproximadamente)
DELETE FROM `mshop_locale_currency`;
/*!40000 ALTER TABLE `mshop_locale_currency` DISABLE KEYS */;
INSERT INTO `mshop_locale_currency` (`id`, `label`, `status`, `mtime`, `ctime`, `editor`) VALUES
	('AED', 'United Arab Emirates dirham', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('AFN', 'Afghan afghani', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ALL', 'Albanian Lek', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('AMD', 'Armenian Dram', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ANG', 'Netherlands Antillean gulden', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('AOA', 'Angolan Kwanza', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ARS', 'Argentine Peso', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('AUD', 'Australian Dollar', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('AWG', 'Aruban Guilder', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('AZN', 'Azerbaijani Manat', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('BAM', 'Bosnia-Herzegovina Conv. Mark', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('BBD', 'Barbados Dollar', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('BDT', 'Bangladeshi taka', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('BGN', 'Bulgarian Lev', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('BHD', 'Bahraini Dinar', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('BIF', 'Burundi Franc', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('BMD', 'Bermuda Dollar', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('BND', 'Brunei Dollar', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('BOB', 'Boliviano', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('BRL', 'Brazilian Real', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('BSD', 'Bahamian Dollar', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('BTN', 'Bhutanese Ngultrum', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('BWP', 'Botswana pula', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('BYR', 'Belarussian Ruble', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('BZD', 'Belize Dollar', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('CAD', 'Canadian Dollar', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('CDF', 'Congolese franc', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('CHF', 'Swiss franc', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('CLP', 'Chilean Peso', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('CNY', 'Chinese Yuan Renminbi', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('COP', 'Colombian Peso', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('CRC', 'Costa Rican colón', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('CUP', 'Cuban peso', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('CVE', 'Cape Verde Escudo', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('CZK', 'Czech koruna', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('DJF', 'Djibouti franc', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('DKK', 'Danish krone', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('DOP', 'Dominican peso', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('DZD', 'Algerian Dinar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('EGP', 'Egyptian pound', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('ERN', 'Eritrean nakfa', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('ETB', 'Ethiopian birr', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('EUR', 'Euro', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('FJD', 'Fijian dollar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('FKP', 'Falkland Islands pound', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('GBP', 'Pound sterling', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('GEL', 'Georgian lari', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('GHC', 'Ghanaian cedi', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('GIP', 'Gibraltar pound', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('GMD', 'Gambian dalasi', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('GNF', 'Guinea Franc', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('GTQ', 'Guatemalan quetzal', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('GYD', 'Guyana Dollar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('HKD', 'Hong Kong dollar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('HNL', 'Honduran lempira', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('HRK', 'Croatian kuna', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('HTG', 'Haitian gourde', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('HUF', 'Hungarian forint', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('IDR', 'Indonesian rupiah', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('ILS', 'New Israeli Sheqel', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('INR', 'Indian rupee', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('IQD', 'Iraqi dinar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('IRR', 'Iranian rial', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('ISK', 'Icelandic króna', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('JMD', 'Jamaican dollar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('JOD', 'Jordanian dinar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('JPY', 'Japanese yen', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('KES', 'Kenyan shilling', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('KGS', 'Kyrgyzstani som', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('KHR', 'Cambodian riel', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('KMF', 'Comorian Franc', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('KPW', 'North Korean won', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('KRW', 'South Corean won', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('KWD', 'Kuwaiti dinar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('KYD', 'Cayman Islands Dollar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('KZT', 'Kazakhstani tenge', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('LAK', 'Lao kip', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('LBP', 'Lebanese pound', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('LKR', 'Sri Lankan rupee', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('LRD', 'Liberian dollar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('LSL', 'Lesotho loti', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('LTL', 'Lithuanian litas', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('LVL', 'Latvian lats', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('LYD', 'Libyan dinar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('MAD', 'Moroccan dirham', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('MDL', 'Moldovan leu', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('MGA', 'Malagasy ariary', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('MKD', 'Macedonian denar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('MMK', 'Myanmar kyat', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('MNT', 'Mongolian tugrug', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('MOP', 'Macanese pataca', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('MRO', 'Mauritanian ouguiya', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('MUR', 'Mauritian rupee', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('MVR', 'Maldivian rufiyaa', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('MWK', 'Malawian kwacha', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('MXN', 'Mexican peso', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('MYR', 'Malaysian ringgit', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('MZM', 'Mozambican metical', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('NAD', 'Namibian dollar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('NGN', 'Nigerian naira', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('NIO', 'Nicaraguan córdoba', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('NOK', 'Norvegian krone', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('NPR', 'Nepalese rupee', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('NZD', 'New Zealand dollar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('OMR', 'Omani rial', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('PAB', 'Panamanian balboa', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('PEN', 'Peruvian nuevo sol', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('PGK', 'Papua New Guinean kina', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('PHP', 'Philippine peso', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('PKR', 'Pakistani rupee', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('PLN', 'Polish złoty', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('PYG', 'Paraguayan guaraní', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('QAR', 'Qatari riyal', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('RON', 'Romanian leu', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('RSD', 'Serbian dinar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('RUB', 'Russian ruble', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('RWF', 'Rwandan franc', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('SAR', 'Saudi riyal', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('SBD', 'Solomon Islands dollar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('SCR', 'Seychelles rupee', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('SDG', 'Sudanese pound', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('SEK', 'Swedish krona', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('SGD', 'Singapore dollar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('SHP', 'Saint Helena pound', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('SLL', 'Sierra Leonean leone', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('SOS', 'Somali shilling', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('SRD', 'Suriname dollar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('STD', 'São Tomé and Príncipe dobra', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('SYP', 'Syrian pound', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('SZL', 'Swazi lilangeni', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('THB', 'Baht', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('TJS', 'Tajikistani somoni', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('TMT', 'Turkmenistani manat', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('TND', 'Tunisian dinar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('TOP', 'Tongan pa\'anga', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('TRY', 'Turkish new lira', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('TTD', 'Trinidad and Tobago dollar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('TWD', 'New Taiwan dollar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('TZS', 'Tanzanian shilling', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('UAH', 'Ukrainian hryvnia', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('UGX', 'Ugandan shilling', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('USD', 'US dollar', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('UYU', 'Uruguayan peso', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('UZS', 'Uzbekistani som', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('VEF', 'Venezuelan bolivar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('VND', 'Vietnamese dong', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('VUV', 'Vatu', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('WST', 'Samoan tala', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('XAF', 'CFA Franc BEAC', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('XCD', 'East Caribbean dollar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('XOF', 'CFA Franc BCEAO', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('XPF', 'CFP Franc', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('YER', 'Yemeni rial', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('ZAR', 'South African rand', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('ZMW', 'Zambian kwacha', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup'),
	('ZWL', 'Zimbabwean dollar', 0, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'aimeos:setup');
/*!40000 ALTER TABLE `mshop_locale_currency` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_locale_language
CREATE TABLE IF NOT EXISTS `mshop_locale_language` (
  `id` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mslocla_status` (`status`),
  KEY `idx_mslocla_label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_locale_language: ~183 rows (aproximadamente)
DELETE FROM `mshop_locale_language`;
/*!40000 ALTER TABLE `mshop_locale_language` DISABLE KEYS */;
INSERT INTO `mshop_locale_language` (`id`, `label`, `status`, `mtime`, `ctime`, `editor`) VALUES
	('aa', 'Afar', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ab', 'Abkhazian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('af', 'Afrikaans', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ak', 'Akan', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('am', 'Amharic', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('an', 'Aragonese', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ar', 'Arabic', 1, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('as', 'Assamese', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('av', 'Avar', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ay', 'Aymara', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('az', 'Azerbaijani', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ba', 'Bashkir', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('be', 'Belarusian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('bg', 'Bulgarian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('bh', 'Bihari', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('bi', 'Bislama', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('bm', 'Bambara', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('bn', 'Bengali', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('bo', 'Tibetan', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('br', 'Breton', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('bs', 'Bosnian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ca', 'Catalan', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ce', 'Chechen', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ch', 'Chamorro', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('co', 'Corsican', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('cr', 'Cree', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('cs', 'Czech', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('cu', 'Church Slavonic', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('cv', 'Chuvash', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('cy', 'Welsh', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('da', 'Danish', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('de', 'German', 1, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('dv', 'Dhivehi', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('dz', 'Dzongkha', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ee', 'Ewe', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('el', 'Greek', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('en', 'English', 1, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('eo', 'Esperanto', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('es', 'Spanish', 1, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('et', 'Estonian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('eu', 'Basque', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('fa', 'Persian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ff', 'Fula', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('fi', 'Finnish', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('fj', 'Fijian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('fo', 'Faeroese', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('fr', 'French', 1, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('fy', 'Frisian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ga', 'Irish', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('gd', 'Scottish Gaelic', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('gl', 'Galician', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('gn', 'Guaraní', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('gu', 'Gujarati', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('gv', 'Manx', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ha', 'Hausa', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('he', 'Hebrew', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('hi', 'Hindi', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ho', 'Hiri motu', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('hr', 'Croatian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ht', 'Haïtian Creole', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('hu', 'Hungarian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('hy', 'Armenian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('hz', 'Herero', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ia', 'Interlingua', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('id', 'Indonesian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ie', 'Interlingue', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ig', 'Igbo', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ii', 'Yi', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ik', 'Inupiaq', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('io', 'Ido', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('is', 'Icelandic', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('it', 'Italian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('iu', 'Inuktitut', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ja', 'Japanese', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('jv', 'Javanese', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ka', 'Georgian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('kg', 'Kongo', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ki', 'Kikuyu', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('kj', 'Kuanyama', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('kk', 'Kazakh', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('kl', 'Greenlandic', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('km', 'Khmer', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('kn', 'Kannada', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ko', 'Korean', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('kr', 'Kanuri', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ks', 'Kashmiri', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ku', 'Kurdish', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('kv', 'Komi', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('kw', 'Cornish', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ky', 'Kirghiz', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('lb', 'Luxembourgish', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('lg', 'Luganda', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('li', 'Limburgish', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ln', 'Lingala', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('lo', 'Lao', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('lt', 'Lithuanian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('lu', 'Luba-Katanga', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('lv', 'Latvian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('mg', 'Malagasy', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('mh', 'Marshallese', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('mi', 'Māori', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('mk', 'Macedonian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ml', 'Malayalam', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('mn', 'Mongolian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('mo', 'Moldavian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('mr', 'Marathi', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ms', 'Malay', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('mt', 'Maltese', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('my', 'Burmese', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('na', 'Nauru', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('nb', 'Norwegian Bokmål', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('nd', 'North Ndebele', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ne', 'Nepali', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ng', 'Ndonga', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('nl', 'Dutch', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('nn', 'Norwegian Nynorsk', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('no', 'Norwegian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('nr', 'South Ndebele', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('nv', 'Navajo', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ny', 'Chichewa', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('oc', 'Occitan', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('oj', 'Ojibwa', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('om', 'Oromo', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('or', 'Oriya', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('os', 'Ossetic', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('pa', 'Punjabi', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('pi', 'Pali', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('pl', 'Polish', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ps', 'Pashto', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('pt', 'Portuguese', 1, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('qu', 'Quechua', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('rm', 'Rhaeto-Romance', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('rn', 'Kirundi', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ro', 'Romanian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ru', 'Russian', 1, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('rw', 'Kinyarwanda', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('sa', 'Sanskrit', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('sc', 'Sardinian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('sd', 'Sindhi', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('se', 'Northern Sami', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('sg', 'Sango', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('si', 'Sinhala', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('sk', 'Slovak', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('sl', 'Slovenian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('sm', 'Samoan', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('sn', 'Shona', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('so', 'Somali', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('sq', 'Albanian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('sr', 'Serbian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ss', 'Swati', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('st', 'Sesotho', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('su', 'Sundanese', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('sv', 'Swedish', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('sw', 'Swahili', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ta', 'Tamil', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('te', 'Telugu', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('tg', 'Tajik', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('th', 'Thai', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ti', 'Tigrinya', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('tk', 'Turkmen', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('tl', 'Tagalog', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('tn', 'Setswana', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('to', 'Tongan', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('tr', 'Turkish', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ts', 'Tsonga', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('tt', 'Tatar', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('tw', 'Twi', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ty', 'Tahitian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ug', 'Uyghur', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('uk', 'Ukrainian', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ur', 'Urdu', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('uz', 'Uzbek', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('ve', 'Venda', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('vi', 'Vietnamese', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('vo', 'Volapük', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('wa', 'Walloon', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('wo', 'Wolof', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('xh', 'Xhosa', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('yi', 'Yiddish', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('yo', 'Yoruba', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('za', 'Zhuang', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('zh', 'Chinese', 1, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup'),
	('zu', 'Zulu', 0, '2022-03-10 01:12:48', '2022-03-10 01:12:48', 'aimeos:setup');
/*!40000 ALTER TABLE `mshop_locale_language` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_locale_site
CREATE TABLE IF NOT EXISTS `mshop_locale_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` int DEFAULT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `code` varbinary(255) NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '{}',
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplierid` varbinary(36) NOT NULL DEFAULT '',
  `theme` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `level` smallint NOT NULL,
  `nleft` int NOT NULL,
  `nright` int NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mslocsi_code` (`code`),
  UNIQUE KEY `unq_mslocsi_siteid` (`siteid`),
  UNIQUE KEY `siteid` (`siteid`),
  KEY `idx_mslocsi_nlt_nrt_lvl_pid` (`nleft`,`nright`,`level`,`parentid`),
  KEY `idx_mslocsi_level_status` (`level`,`status`),
  KEY `idx_mslocsi_label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_locale_site: ~1 rows (aproximadamente)
DELETE FROM `mshop_locale_site`;
/*!40000 ALTER TABLE `mshop_locale_site` DISABLE KEYS */;
INSERT INTO `mshop_locale_site` (`id`, `parentid`, `siteid`, `code`, `label`, `icon`, `logo`, `config`, `supplierid`, `theme`, `level`, `nleft`, `nright`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, 0, '1.', _binary 0x64656661756c74, 'default', '', '{}', '{}', _binary '', '', 0, 1, 2, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup');
/*!40000 ALTER TABLE `mshop_locale_site` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_media
CREATE TABLE IF NOT EXISTS `mshop_media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varbinary(64) NOT NULL,
  `langid` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preview` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mimetype` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msmed_sid_dom_langid` (`siteid`,`domain`,`langid`),
  KEY `idx_msmed_sid_dom_label` (`siteid`,`domain`,`label`),
  KEY `idx_msmed_sid_dom_mime` (`siteid`,`domain`,`mimetype`),
  KEY `idx_msmed_sid_dom_link` (`siteid`,`domain`,`link`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_media: ~65 rows (aproximadamente)
DELETE FROM `mshop_media`;
/*!40000 ALTER TABLE `mshop_media` DISABLE KEYS */;
INSERT INTO `mshop_media` (`id`, `siteid`, `type`, `langid`, `domain`, `label`, `link`, `preview`, `mimetype`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', _binary 0x69636f6e, NULL, 'attribute', 'Demo: black.gif', 'data:image/gif;base64,R0lGODdhAQABAIAAAAAAAAAAACwAAAAAAQABAAACAkQBADs=', '{"1":"data:image\\/gif;base64,R0lGODdhAQABAIAAAAAAAAAAACwAAAAAAQABAAACAkQBADs="}', 'image/gif', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(4, '1.', _binary 0x69636f6e, NULL, 'attribute', 'Demo: blue.gif', 'data:image/gif;base64,R0lGODdhAQABAIAAAAAA/wAAACwAAAAAAQABAAACAkQBADs=', '{"1":"data:image\\/gif;base64,R0lGODdhAQABAIAAAAAA\\/wAAACwAAAAAAQABAAACAkQBADs="}', 'image/gif', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(5, '1.', _binary 0x69636f6e, NULL, 'attribute', 'Demo: beige.gif', 'data:image/gif;base64,R0lGODdhAQABAIAAAPX13AAAACwAAAAAAQABAAACAkQBADs=', '{"1":"data:image\\/gif;base64,R0lGODdhAQABAIAAAPX13AAAACwAAAAAAQABAAACAkQBADs="}', 'image/gif', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(39, '1.', _binary 0x64656661756c74, NULL, 'supplier', 'Demo: Article 1.jpg', 'https://aimeos.org/media/default/logo-1.png', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/logo-1.png"}', 'image/jpeg', 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(40, '1.', _binary 0x64656661756c74, NULL, 'supplier', 'Demo: Article 1.jpg', 'https://aimeos.org/media/default/logo-4.png', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/logo-4.png"}', 'image/jpeg', 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(41, '1.', _binary 0x69636f6e, NULL, 'attribute', 'Demo: black.gif', 'data:image/gif;base64,R0lGODdhAQABAIAAAAAAAAAAACwAAAAAAQABAAACAkQBADs=', '{"1":"data:image\\/gif;base64,R0lGODdhAQABAIAAAAAAAAAAACwAAAAAAQABAAACAkQBADs="}', 'image/gif', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(44, '1.', _binary 0x69636f6e, NULL, 'attribute', 'Demo: blue.gif', 'data:image/gif;base64,R0lGODdhAQABAIAAAAAA/wAAACwAAAAAAQABAAACAkQBADs=', '{"1":"data:image\\/gif;base64,R0lGODdhAQABAIAAAAAA\\/wAAACwAAAAAAQABAAACAkQBADs="}', 'image/gif', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(45, '1.', _binary 0x69636f6e, NULL, 'attribute', 'Demo: beige.gif', 'data:image/gif;base64,R0lGODdhAQABAIAAAPX13AAAACwAAAAAAQABAAACAkQBADs=', '{"1":"data:image\\/gif;base64,R0lGODdhAQABAIAAAPX13AAAACwAAAAAAQABAAACAkQBADs="}', 'image/gif', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(79, '1.', _binary 0x64656661756c74, NULL, 'supplier', 'Demo: Article 1.jpg', 'https://aimeos.org/media/default/logo-1.png', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/logo-1.png"}', 'image/jpeg', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(80, '1.', _binary 0x64656661756c74, NULL, 'supplier', 'Demo: Article 1.jpg', 'https://aimeos.org/media/default/logo-4.png', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/logo-4.png"}', 'image/jpeg', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(81, '1.', _binary 0x69636f6e, NULL, 'attribute', 'Demo: black.gif', 'data:image/gif;base64,R0lGODdhAQABAIAAAAAAAAAAACwAAAAAAQABAAACAkQBADs=', '{"1":"data:image\\/gif;base64,R0lGODdhAQABAIAAAAAAAAAAACwAAAAAAQABAAACAkQBADs="}', 'image/gif', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(84, '1.', _binary 0x69636f6e, NULL, 'attribute', 'Demo: blue.gif', 'data:image/gif;base64,R0lGODdhAQABAIAAAAAA/wAAACwAAAAAAQABAAACAkQBADs=', '{"1":"data:image\\/gif;base64,R0lGODdhAQABAIAAAAAA\\/wAAACwAAAAAAQABAAACAkQBADs="}', 'image/gif', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(85, '1.', _binary 0x69636f6e, NULL, 'attribute', 'Demo: beige.gif', 'data:image/gif;base64,R0lGODdhAQABAIAAAPX13AAAACwAAAAAAQABAAACAkQBADs=', '{"1":"data:image\\/gif;base64,R0lGODdhAQABAIAAAPX13AAAACwAAAAAAQABAAACAkQBADs="}', 'image/gif', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(119, '1.', _binary 0x64656661756c74, NULL, 'supplier', 'Demo: Article 1.jpg', 'https://aimeos.org/media/default/logo-1.png', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/logo-1.png"}', 'image/jpeg', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(120, '1.', _binary 0x64656661756c74, NULL, 'supplier', 'Demo: Article 1.jpg', 'https://aimeos.org/media/default/logo-4.png', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/logo-4.png"}', 'image/jpeg', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(121, '1.', _binary 0x69636f6e, NULL, 'attribute', 'Demo: black.gif', 'data:image/gif;base64,R0lGODdhAQABAIAAAAAAAAAAACwAAAAAAQABAAACAkQBADs=', '{"1":"data:image\\/gif;base64,R0lGODdhAQABAIAAAAAAAAAAACwAAAAAAQABAAACAkQBADs="}', 'image/gif', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(124, '1.', _binary 0x69636f6e, NULL, 'attribute', 'Demo: blue.gif', 'data:image/gif;base64,R0lGODdhAQABAIAAAAAA/wAAACwAAAAAAQABAAACAkQBADs=', '{"1":"data:image\\/gif;base64,R0lGODdhAQABAIAAAAAA\\/wAAACwAAAAAAQABAAACAkQBADs="}', 'image/gif', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(125, '1.', _binary 0x69636f6e, NULL, 'attribute', 'Demo: beige.gif', 'data:image/gif;base64,R0lGODdhAQABAIAAAPX13AAAACwAAAAAAQABAAACAkQBADs=', '{"1":"data:image\\/gif;base64,R0lGODdhAQABAIAAAPX13AAAACwAAAAAAQABAAACAkQBADs="}', 'image/gif', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(159, '1.', _binary 0x64656661756c74, NULL, 'supplier', 'Demo: Article 1.jpg', 'https://aimeos.org/media/default/logo-1.png', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/logo-1.png"}', 'image/jpeg', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(160, '1.', _binary 0x64656661756c74, NULL, 'supplier', 'Demo: Article 1.jpg', 'https://aimeos.org/media/default/logo-4.png', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/logo-4.png"}', 'image/jpeg', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(161, '1.', _binary 0x69636f6e, NULL, 'attribute', 'Demo: black.gif', 'data:image/gif;base64,R0lGODdhAQABAIAAAAAAAAAAACwAAAAAAQABAAACAkQBADs=', '{"1":"data:image\\/gif;base64,R0lGODdhAQABAIAAAAAAAAAAACwAAAAAAQABAAACAkQBADs="}', 'image/gif', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(164, '1.', _binary 0x69636f6e, NULL, 'attribute', 'Demo: blue.gif', 'data:image/gif;base64,R0lGODdhAQABAIAAAAAA/wAAACwAAAAAAQABAAACAkQBADs=', '{"1":"data:image\\/gif;base64,R0lGODdhAQABAIAAAAAA\\/wAAACwAAAAAAQABAAACAkQBADs="}', 'image/gif', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(165, '1.', _binary 0x69636f6e, NULL, 'attribute', 'Demo: beige.gif', 'data:image/gif;base64,R0lGODdhAQABAIAAAPX13AAAACwAAAAAAQABAAACAkQBADs=', '{"1":"data:image\\/gif;base64,R0lGODdhAQABAIAAAPX13AAAACwAAAAAAQABAAACAkQBADs="}', 'image/gif', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(199, '1.', _binary 0x64656661756c74, NULL, 'supplier', 'Demo: Article 1.jpg', 'https://aimeos.org/media/default/logo-1.png', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/logo-1.png"}', 'image/jpeg', 1, '2022-03-10 01:54:59', '2022-03-10 01:54:59', 'core:setup'),
	(200, '1.', _binary 0x64656661756c74, NULL, 'supplier', 'Demo: Article 1.jpg', 'https://aimeos.org/media/default/logo-4.png', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/logo-4.png"}', 'image/jpeg', 1, '2022-03-10 01:54:59', '2022-03-10 01:54:59', 'core:setup'),
	(201, '1.', _binary 0x69636f6e, NULL, 'attribute', 'Demo: black.gif', 'data:image/gif;base64,R0lGODdhAQABAIAAAAAAAAAAACwAAAAAAQABAAACAkQBADs=', '{"1":"data:image\\/gif;base64,R0lGODdhAQABAIAAAAAAAAAAACwAAAAAAQABAAACAkQBADs="}', 'image/gif', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(202, '1.', _binary 0x64656661756c74, NULL, 'product', 'Demo: Article 1.jpg', 'https://aimeos.org/media/default/product_01_A-big.jpg', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/product_01_A-low.jpg","720":"https:\\/\\/aimeos.org\\/media\\/default\\/product_01_A-med.jpg","1350":"https:\\/\\/aimeos.org\\/media\\/default\\/product_01_A-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(203, '1.', _binary 0x64656661756c74, NULL, 'product', 'Demo: Article 2.jpg', 'https://aimeos.org/media/default/product_01_B-big.jpg', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/product_01_B-low.jpg","720":"https:\\/\\/aimeos.org\\/media\\/default\\/product_01_B-med.jpg","1350":"https:\\/\\/aimeos.org\\/media\\/default\\/product_01_B-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(204, '1.', _binary 0x69636f6e, NULL, 'attribute', 'Demo: blue.gif', 'data:image/gif;base64,R0lGODdhAQABAIAAAAAA/wAAACwAAAAAAQABAAACAkQBADs=', '{"1":"data:image\\/gif;base64,R0lGODdhAQABAIAAAAAA\\/wAAACwAAAAAAQABAAACAkQBADs="}', 'image/gif', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(205, '1.', _binary 0x69636f6e, NULL, 'attribute', 'Demo: beige.gif', 'data:image/gif;base64,R0lGODdhAQABAIAAAPX13AAAACwAAAAAAQABAAACAkQBADs=', '{"1":"data:image\\/gif;base64,R0lGODdhAQABAIAAAPX13AAAACwAAAAAAQABAAACAkQBADs="}', 'image/gif', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(206, '1.', _binary 0x64656661756c74, NULL, 'product', 'Demo: Selection article 1.jpg', 'https://aimeos.org/media/default/product_04_A-big.jpg', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/product_04_A-low.jpg","720":"https:\\/\\/aimeos.org\\/media\\/default\\/product_04_A-med.jpg","1350":"https:\\/\\/aimeos.org\\/media\\/default\\/product_04_A-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(207, '1.', _binary 0x64656661756c74, NULL, 'product', 'Demo: Selection article 2.jpg', 'https://aimeos.org/media/default/product_04_B-big.jpg', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/product_04_B-low.jpg","720":"https:\\/\\/aimeos.org\\/media\\/default\\/product_04_B-med.jpg","1350":"https:\\/\\/aimeos.org\\/media\\/default\\/product_04_B-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(208, '1.', _binary 0x64656661756c74, NULL, 'product', 'Demo: Bundle article 1.jpg', 'https://aimeos.org/media/default/product_03_A-big.jpg', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/product_03_A-low.jpg","720":"https:\\/\\/aimeos.org\\/media\\/default\\/product_03_A-med.jpg","1350":"https:\\/\\/aimeos.org\\/media\\/default\\/product_03_A-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(209, '1.', _binary 0x64656661756c74, NULL, 'product', 'Demo: Bundle article 2.jpg', 'https://aimeos.org/media/default/product_03_B-big.jpg', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/product_03_B-low.jpg","720":"https:\\/\\/aimeos.org\\/media\\/default\\/product_03_B-med.jpg","1350":"https:\\/\\/aimeos.org\\/media\\/default\\/product_03_B-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(210, '1.', _binary 0x64656661756c74, NULL, 'product', 'Demo: Voucher 0.jpg', 'https://aimeos.org/media/default/voucher-big.jpg', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/voucher-low.jpg","720":"https:\\/\\/aimeos.org\\/media\\/default\\/voucher-med.jpg","1350":"https:\\/\\/aimeos.org\\/media\\/default\\/voucher-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(211, '1.', _binary 0x64656661756c74, NULL, 'product', 'Demo: Article 1.jpg', 'https://aimeos.org/media/default/product_02_A-big.jpg', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/product_02_A-low.jpg","720":"https:\\/\\/aimeos.org\\/media\\/default\\/product_02_A-med.jpg","1350":"https:\\/\\/aimeos.org\\/media\\/default\\/product_02_A-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(212, '1.', _binary 0x64656661756c74, NULL, 'product', 'Demo: Article 2.jpg', 'https://aimeos.org/media/default/product_02_B-big.jpg', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/product_02_B-low.jpg","720":"https:\\/\\/aimeos.org\\/media\\/default\\/product_02_B-med.jpg","1350":"https:\\/\\/aimeos.org\\/media\\/default\\/product_02_B-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(213, '1.', _binary 0x64656661756c74, NULL, 'product', 'Demo: Article 1.jpg', 'https://aimeos.org/media/default/product_05_A-big.jpg', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/product_05_A-low.jpg","720":"https:\\/\\/aimeos.org\\/media\\/default\\/product_05_A-med.jpg","1350":"https:\\/\\/aimeos.org\\/media\\/default\\/product_05_A-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(214, '1.', _binary 0x64656661756c74, NULL, 'product', 'Demo: Article 2.jpg', 'https://aimeos.org/media/default/product_05_B-big.jpg', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/product_05_B-low.jpg","720":"https:\\/\\/aimeos.org\\/media\\/default\\/product_05_B-med.jpg","1350":"https:\\/\\/aimeos.org\\/media\\/default\\/product_05_B-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(215, '1.', _binary 0x64656661756c74, NULL, 'product', 'Demo: Article 1.jpg', 'https://aimeos.org/media/default/product_06_A-big.jpg', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/product_06_A-low.jpg","720":"https:\\/\\/aimeos.org\\/media\\/default\\/product_06_A-med.jpg","1350":"https:\\/\\/aimeos.org\\/media\\/default\\/product_06_A-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(216, '1.', _binary 0x64656661756c74, NULL, 'product', 'Demo: Article 2.jpg', 'https://aimeos.org/media/default/product_06_B-big.jpg', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/product_06_B-low.jpg","720":"https:\\/\\/aimeos.org\\/media\\/default\\/product_06_B-med.jpg","1350":"https:\\/\\/aimeos.org\\/media\\/default\\/product_06_B-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(217, '1.', _binary 0x64656661756c74, NULL, 'product', 'Demo: Article 1.jpg', 'https://aimeos.org/media/default/product_07_A-big.jpg', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/product_07_A-low.jpg","720":"https:\\/\\/aimeos.org\\/media\\/default\\/product_07_A-med.jpg","1350":"https:\\/\\/aimeos.org\\/media\\/default\\/product_07_A-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(218, '1.', _binary 0x64656661756c74, NULL, 'product', 'Demo: Article 2.jpg', 'https://aimeos.org/media/default/product_07_B-big.jpg', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/product_07_B-low.jpg","720":"https:\\/\\/aimeos.org\\/media\\/default\\/product_07_B-med.jpg","1350":"https:\\/\\/aimeos.org\\/media\\/default\\/product_07_B-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(219, '1.', _binary 0x64656661756c74, NULL, 'product', 'Demo: Article 1.jpg', 'https://aimeos.org/media/default/product_08_A-big.jpg', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/product_08_A-low.jpg","720":"https:\\/\\/aimeos.org\\/media\\/default\\/product_08_A-med.jpg","1350":"https:\\/\\/aimeos.org\\/media\\/default\\/product_08_A-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(220, '1.', _binary 0x64656661756c74, NULL, 'product', 'Demo: Article 2.jpg', 'https://aimeos.org/media/default/product_08_B-big.jpg', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/product_08_B-low.jpg","720":"https:\\/\\/aimeos.org\\/media\\/default\\/product_08_B-med.jpg","1350":"https:\\/\\/aimeos.org\\/media\\/default\\/product_08_B-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(221, '1.', _binary 0x64656661756c74, NULL, 'product', 'Demo: Article 1.jpg', 'https://aimeos.org/media/default/product_09_A-big.jpg', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/product_09_A-low.jpg","720":"https:\\/\\/aimeos.org\\/media\\/default\\/product_09_A-med.jpg","1350":"https:\\/\\/aimeos.org\\/media\\/default\\/product_09_A-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(222, '1.', _binary 0x64656661756c74, NULL, 'product', 'Demo: Article 2.jpg', 'https://aimeos.org/media/default/product_09_B-big.jpg', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/product_09_B-low.jpg","720":"https:\\/\\/aimeos.org\\/media\\/default\\/product_09_B-med.jpg","1350":"https:\\/\\/aimeos.org\\/media\\/default\\/product_09_B-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(223, '1.', _binary 0x64656661756c74, NULL, 'product', 'Demo: Article 1.jpg', 'https://aimeos.org/media/default/product_10_A-big.jpg', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/product_10_A-low.jpg","720":"https:\\/\\/aimeos.org\\/media\\/default\\/product_10_A-med.jpg","1350":"https:\\/\\/aimeos.org\\/media\\/default\\/product_10_A-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(224, '1.', _binary 0x64656661756c74, NULL, 'product', 'Demo: Article 2.jpg', 'https://aimeos.org/media/default/product_10_B-big.jpg', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/product_10_B-low.jpg","720":"https:\\/\\/aimeos.org\\/media\\/default\\/product_10_B-med.jpg","1350":"https:\\/\\/aimeos.org\\/media\\/default\\/product_10_B-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(225, '1.', _binary 0x7374616765, NULL, 'catalog', 'Demo: Best seller stage', 'https://aimeos.org/media/default/main-banner-1-big.jpg', '{"480":"https:\\/\\/aimeos.org\\/media\\/default\\/main-banner-1-low.jpg","960":"https:\\/\\/aimeos.org\\/media\\/default\\/main-banner-1-med.jpg","1920":"https:\\/\\/aimeos.org\\/media\\/default\\/main-banner-1-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(226, '1.', _binary 0x7374616765, NULL, 'catalog', 'Demo: New arrivals stage', 'https://aimeos.org/media/default/main-banner-2-big.jpg', '{"480":"https:\\/\\/aimeos.org\\/media\\/default\\/main-banner-2-low.jpg","960":"https:\\/\\/aimeos.org\\/media\\/default\\/main-banner-2-med.jpg","1920":"https:\\/\\/aimeos.org\\/media\\/default\\/main-banner-2-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(227, '1.', _binary 0x7374616765, NULL, 'catalog', 'Demo: Hot deals stage', 'https://aimeos.org/media/default/main-banner-3-big.jpg', '{"480":"https:\\/\\/aimeos.org\\/media\\/default\\/main-banner-3-low.jpg","960":"https:\\/\\/aimeos.org\\/media\\/default\\/main-banner-3-med.jpg","1920":"https:\\/\\/aimeos.org\\/media\\/default\\/main-banner-3-big.jpg"}', 'image/jpeg', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(228, '1.', _binary 0x69636f6e, NULL, 'service', 'Demo: pickup.png', 'https://aimeos.org/media/service/pickup.png', '{"1":"https:\\/\\/aimeos.org\\/media\\/service\\/pickup.png"}', 'image/png', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(229, '1.', _binary 0x69636f6e, NULL, 'service', 'Demo: dhl.png', 'https://aimeos.org/media/service/dhl.png', '{"0":"https:\\/\\/aimeos.org\\/media\\/service\\/dhl.png"}', 'image/png', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(230, '1.', _binary 0x69636f6e, NULL, 'service', 'Demo: dhl-express.png', 'https://aimeos.org/media/service/dhl-express.png', '{"0":"https:\\/\\/aimeos.org\\/media\\/service\\/dhl-express.png"}', 'image/png', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(231, '1.', _binary 0x69636f6e, NULL, 'service', 'Demo: fedex.png', 'https://aimeos.org/media/service/fedex.png', '{"0":"https:\\/\\/aimeos.org\\/media\\/service\\/fedex.png"}', 'image/png', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(232, '1.', _binary 0x69636f6e, NULL, 'service', 'Demo: tnt.png', 'https://aimeos.org/media/service/tnt.png', '{"0":"https:\\/\\/aimeos.org\\/media\\/service\\/tnt.png"}', 'image/png', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(233, '1.', _binary 0x69636f6e, 'de', 'service', 'Demo: payment-in-advance.png', 'https://aimeos.org/media/service/payment-in-advance.png', '{"0":"https:\\/\\/aimeos.org\\/media\\/service\\/payment-in-advance.png"}', 'image/png', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(234, '1.', _binary 0x69636f6e, 'de', 'service', 'Demo: sepa.png', 'https://aimeos.org/media/service/sepa.png', '{"0":"https:\\/\\/aimeos.org\\/media\\/service\\/sepa.png"}', 'image/png', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(235, '1.', _binary 0x69636f6e, 'en', 'service', 'Demo: direct-debit.png', 'https://aimeos.org/media/service/direct-debit.png', '{"0":"https:\\/\\/aimeos.org\\/media\\/service\\/direct-debit.png"}', 'image/png', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(236, '1.', _binary 0x69636f6e, NULL, 'service', 'Demo: paypal.png', 'https://aimeos.org/media/service/paypal.png', '{"0":"https:\\/\\/aimeos.org\\/media\\/service\\/paypal.png"}', 'image/png', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(237, '1.', _binary 0x69636f6e, 'de', 'service', 'Demo: dhl-cod.png', 'https://aimeos.org/media/service/dhl-cod.png', '{"0":"https:\\/\\/aimeos.org\\/media\\/service\\/dhl-cod.png"}', 'image/png', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(238, '1.', _binary 0x69636f6e, 'de', 'service', 'Demo: payment-in-advance-alternative.png', 'https://aimeos.org/media/service/payment-in-advance-alternative.png', '{"0":"https:\\/\\/aimeos.org\\/media\\/service\\/payment-in-advance-alternative.png"}', 'image/png', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(239, '1.', _binary 0x64656661756c74, NULL, 'supplier', 'Demo: Article 1.jpg', 'https://aimeos.org/media/default/logo-1.png', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/logo-1.png"}', 'image/jpeg', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(240, '1.', _binary 0x64656661756c74, NULL, 'supplier', 'Demo: Article 1.jpg', 'https://aimeos.org/media/default/logo-4.png', '{"240":"https:\\/\\/aimeos.org\\/media\\/default\\/logo-4.png"}', 'image/jpeg', 1, '2022-03-10 02:07:32', '2022-03-10 02:07:32', 'core:setup');
/*!40000 ALTER TABLE `mshop_media` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_media_list
CREATE TABLE IF NOT EXISTS `mshop_media_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` int NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varbinary(134) NOT NULL DEFAULT '',
  `type` varbinary(64) NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refid` varbinary(36) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msmedli_pid_dm_sid_ty_rid` (`parentid`,`domain`,`siteid`,`type`,`refid`),
  KEY `idx_msmedli_key_sid` (`key`,`siteid`),
  KEY `fk_msmedli_pid` (`parentid`),
  CONSTRAINT `fk_msmedli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_media_list: ~0 rows (aproximadamente)
DELETE FROM `mshop_media_list`;
/*!40000 ALTER TABLE `mshop_media_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_media_list` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_media_list_type
CREATE TABLE IF NOT EXISTS `mshop_media_list_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msmedlity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msmedlity_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msmedlity_sid_label` (`siteid`,`label`),
  KEY `idx_msmedlity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_media_list_type: ~0 rows (aproximadamente)
DELETE FROM `mshop_media_list_type`;
/*!40000 ALTER TABLE `mshop_media_list_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_media_list_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_media_property
CREATE TABLE IF NOT EXISTS `mshop_media_property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` int NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varbinary(103) NOT NULL DEFAULT '',
  `type` varbinary(64) NOT NULL,
  `langid` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msmedpr_sid_ty_lid_value` (`parentid`,`siteid`,`type`,`langid`,`value`),
  KEY `fk_msmedpr_key_sid` (`key`,`siteid`),
  KEY `fk_msmedpr_pid` (`parentid`),
  CONSTRAINT `fk_msmedpr_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_media_property: ~0 rows (aproximadamente)
DELETE FROM `mshop_media_property`;
/*!40000 ALTER TABLE `mshop_media_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_media_property` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_media_property_type
CREATE TABLE IF NOT EXISTS `mshop_media_property_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msmedprty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msmedprty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msmedprty_sid_label` (`siteid`,`label`),
  KEY `idx_msmedprty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_media_property_type: ~1 rows (aproximadamente)
DELETE FROM `mshop_media_property_type`;
/*!40000 ALTER TABLE `mshop_media_property_type` DISABLE KEYS */;
INSERT INTO `mshop_media_property_type` (`id`, `siteid`, `domain`, `code`, `label`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', 'media', _binary 0x6e616d65, 'Media title', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup');
/*!40000 ALTER TABLE `mshop_media_property_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_media_type
CREATE TABLE IF NOT EXISTS `mshop_media_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msmedty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msmedty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msmedty_sid_label` (`siteid`,`label`),
  KEY `idx_msmedty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_media_type: ~11 rows (aproximadamente)
DELETE FROM `mshop_media_type`;
/*!40000 ALTER TABLE `mshop_media_type` DISABLE KEYS */;
INSERT INTO `mshop_media_type` (`id`, `siteid`, `domain`, `code`, `label`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', 'attribute', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(2, '1.', 'attribute', _binary 0x69636f6e, 'Icon', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(3, '1.', 'catalog', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(4, '1.', 'catalog', _binary 0x7374616765, 'Stage', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(5, '1.', 'catalog', _binary 0x6d656e75, 'Menu', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(6, '1.', 'catalog', _binary 0x69636f6e, 'Icon', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(7, '1.', 'product', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(8, '1.', 'product', _binary 0x646f776e6c6f6164, 'Download', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(9, '1.', 'service', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(10, '1.', 'service', _binary 0x69636f6e, 'Icon', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(11, '1.', 'supplier', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup');
/*!40000 ALTER TABLE `mshop_media_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_order
CREATE TABLE IF NOT EXISTS `mshop_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `baseid` bigint NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `relatedid` varbinary(64) DEFAULT NULL,
  `type` varbinary(64) NOT NULL,
  `datepayment` datetime DEFAULT NULL,
  `datedelivery` datetime DEFAULT NULL,
  `statuspayment` smallint DEFAULT NULL,
  `statusdelivery` smallint DEFAULT NULL,
  `cdate` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cmonth` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cweek` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cwday` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chour` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msord_sid_type` (`siteid`,`type`),
  KEY `idx_msord_sid_ctime_pstat` (`siteid`,`ctime`,`statuspayment`),
  KEY `idx_msord_sid_mtime_pstat` (`siteid`,`mtime`,`statuspayment`),
  KEY `idx_msord_sid_mtime_dstat` (`siteid`,`mtime`,`statusdelivery`),
  KEY `idx_msord_sid_dstatus` (`siteid`,`statusdelivery`),
  KEY `idx_msord_sid_ddate` (`siteid`,`datedelivery`),
  KEY `idx_msord_sid_pdate` (`siteid`,`datepayment`),
  KEY `idx_msord_sid_editor` (`siteid`,`editor`),
  KEY `idx_msord_sid_cdate` (`siteid`,`cdate`),
  KEY `idx_msord_sid_cmonth` (`siteid`,`cmonth`),
  KEY `idx_msord_sid_cweek` (`siteid`,`cweek`),
  KEY `idx_msord_sid_cwday` (`siteid`,`cwday`),
  KEY `idx_msord_sid_chour` (`siteid`,`chour`),
  KEY `fk_msord_baseid` (`baseid`),
  CONSTRAINT `fk_msord_baseid` FOREIGN KEY (`baseid`) REFERENCES `mshop_order_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_order: ~0 rows (aproximadamente)
DELETE FROM `mshop_order`;
/*!40000 ALTER TABLE `mshop_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_order` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_order_base
CREATE TABLE IF NOT EXISTS `mshop_order_base` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customerid` varbinary(36) NOT NULL,
  `sitecode` varbinary(255) DEFAULT NULL,
  `langid` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currencyid` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `costs` decimal(12,2) NOT NULL,
  `rebate` decimal(12,2) NOT NULL,
  `tax` decimal(14,4) NOT NULL,
  `taxflag` smallint NOT NULL,
  `customerref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msordba_custid_scode` (`customerid`,`sitecode`),
  KEY `idx_msordba_custid_sid` (`customerid`,`siteid`),
  KEY `idx_msordba_sid_ctime` (`siteid`,`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_order_base: ~0 rows (aproximadamente)
DELETE FROM `mshop_order_base`;
/*!40000 ALTER TABLE `mshop_order_base` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_order_base` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_order_base_address
CREATE TABLE IF NOT EXISTS `mshop_order_base_address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `baseid` bigint NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addrid` varbinary(36) NOT NULL,
  `type` varbinary(64) NOT NULL,
  `salutation` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vatid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address3` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `countryid` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefax` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `pos` int NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msordbaad_bid_type` (`baseid`,`type`),
  KEY `idx_msordbaad_sid_bid_typ` (`siteid`,`baseid`,`type`),
  KEY `idx_msordbaad_bid_sid_lname` (`baseid`,`siteid`,`lastname`),
  KEY `idx_msordbaad_bid_sid_addr1` (`baseid`,`siteid`,`address1`),
  KEY `idx_msordbaad_bid_sid_postal` (`baseid`,`siteid`,`postal`),
  KEY `idx_msordbaad_bid_sid_city` (`baseid`,`siteid`,`city`),
  KEY `idx_msordbaad_bid_sid_email` (`baseid`,`siteid`,`email`),
  KEY `fk_msordbaad_baseid` (`baseid`),
  CONSTRAINT `fk_msordbaad_baseid` FOREIGN KEY (`baseid`) REFERENCES `mshop_order_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_order_base_address: ~0 rows (aproximadamente)
DELETE FROM `mshop_order_base_address`;
/*!40000 ALTER TABLE `mshop_order_base_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_order_base_address` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_order_base_coupon
CREATE TABLE IF NOT EXISTS `mshop_order_base_coupon` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `baseid` bigint NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordprodid` bigint DEFAULT NULL,
  `code` varbinary(64) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msordbaco_bid_sid_code` (`baseid`,`siteid`,`code`),
  KEY `fk_msordbaco_baseid` (`baseid`),
  CONSTRAINT `fk_msordbaco_baseid` FOREIGN KEY (`baseid`) REFERENCES `mshop_order_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_order_base_coupon: ~0 rows (aproximadamente)
DELETE FROM `mshop_order_base_coupon`;
/*!40000 ALTER TABLE `mshop_order_base_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_order_base_coupon` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_order_base_product
CREATE TABLE IF NOT EXISTS `mshop_order_base_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `baseid` bigint NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordprodid` bigint DEFAULT NULL,
  `ordaddrid` bigint DEFAULT NULL,
  `type` varbinary(64) NOT NULL,
  `prodid` varbinary(36) NOT NULL,
  `prodcode` varbinary(64) NOT NULL,
  `stocktype` varbinary(64) NOT NULL,
  `supplierid` varbinary(36) NOT NULL DEFAULT '',
  `suppliername` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mediaurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timeframe` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `quantity` double NOT NULL,
  `qtyopen` double NOT NULL DEFAULT '0',
  `currencyid` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `costs` decimal(12,2) NOT NULL,
  `rebate` decimal(12,2) NOT NULL,
  `tax` decimal(14,4) NOT NULL,
  `taxrate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxflag` smallint NOT NULL,
  `flags` int NOT NULL,
  `pos` int NOT NULL,
  `statuspayment` smallint DEFAULT NULL,
  `status` smallint DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msordbapr_bid_pos` (`baseid`,`pos`),
  KEY `idx_msordbapr_bid_sid_pid` (`baseid`,`siteid`,`prodid`),
  KEY `idx_msordbapr_bid_sid_pcd` (`baseid`,`siteid`,`prodcode`),
  KEY `idx_msordbapr_bid_sid_qtyo` (`baseid`,`siteid`,`qtyopen`),
  KEY `idx_msordbapr_ct_sid_pid_bid` (`ctime`,`siteid`,`prodid`,`baseid`),
  KEY `fk_msordbapr_baseid` (`baseid`),
  CONSTRAINT `fk_msordbapr_baseid` FOREIGN KEY (`baseid`) REFERENCES `mshop_order_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_order_base_product: ~0 rows (aproximadamente)
DELETE FROM `mshop_order_base_product`;
/*!40000 ALTER TABLE `mshop_order_base_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_order_base_product` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_order_base_product_attr
CREATE TABLE IF NOT EXISTS `mshop_order_base_product_attr` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ordprodid` bigint NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attrid` varbinary(36) NOT NULL,
  `type` varbinary(64) NOT NULL,
  `code` varbinary(255) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` double NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msordbaprat_oid_aid_ty_cd` (`ordprodid`,`attrid`,`type`,`code`),
  KEY `fk_msordbaprat_ordprodid` (`ordprodid`),
  KEY `idx_msordbaprat_si_cd_va` (`siteid`,`code`,`value`(16)),
  CONSTRAINT `fk_msordbaprat_ordprodid` FOREIGN KEY (`ordprodid`) REFERENCES `mshop_order_base_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_order_base_product_attr: ~0 rows (aproximadamente)
DELETE FROM `mshop_order_base_product_attr`;
/*!40000 ALTER TABLE `mshop_order_base_product_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_order_base_product_attr` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_order_base_service
CREATE TABLE IF NOT EXISTS `mshop_order_base_service` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `baseid` bigint NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `servid` varbinary(36) NOT NULL,
  `type` varbinary(64) NOT NULL,
  `code` varbinary(64) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mediaurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currencyid` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `costs` decimal(12,2) NOT NULL,
  `rebate` decimal(12,2) NOT NULL,
  `tax` decimal(14,4) NOT NULL,
  `taxrate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxflag` smallint NOT NULL DEFAULT '1',
  `pos` int NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msordbase_bid_sid_cd_typ` (`baseid`,`siteid`,`code`,`type`),
  KEY `idx_msordbase_sid_code_type` (`siteid`,`code`,`type`),
  KEY `fk_msordbase_baseid` (`baseid`),
  CONSTRAINT `fk_msordbase_baseid` FOREIGN KEY (`baseid`) REFERENCES `mshop_order_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_order_base_service: ~0 rows (aproximadamente)
DELETE FROM `mshop_order_base_service`;
/*!40000 ALTER TABLE `mshop_order_base_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_order_base_service` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_order_base_service_attr
CREATE TABLE IF NOT EXISTS `mshop_order_base_service_attr` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ordservid` bigint NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attrid` varbinary(36) NOT NULL,
  `type` varbinary(64) NOT NULL,
  `code` varbinary(255) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` double NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msordbaseat_oid_aid_ty_cd` (`ordservid`,`attrid`,`type`,`code`),
  KEY `fk_msordbaseat_ordservid` (`ordservid`),
  KEY `idx_msordbaseat_si_cd_va` (`siteid`,`code`,`value`(16)),
  CONSTRAINT `fk_msordbaseat_ordservid` FOREIGN KEY (`ordservid`) REFERENCES `mshop_order_base_service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_order_base_service_attr: ~0 rows (aproximadamente)
DELETE FROM `mshop_order_base_service_attr`;
/*!40000 ALTER TABLE `mshop_order_base_service_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_order_base_service_attr` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_order_status
CREATE TABLE IF NOT EXISTS `mshop_order_status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parentid` bigint NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varbinary(64) NOT NULL,
  `value` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msordstatus_val_sid` (`siteid`,`parentid`,`type`,`value`),
  KEY `fk_msordst_pid` (`parentid`),
  CONSTRAINT `fk_msordst_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_order_status: ~0 rows (aproximadamente)
DELETE FROM `mshop_order_status`;
/*!40000 ALTER TABLE `mshop_order_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_order_status` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_plugin
CREATE TABLE IF NOT EXISTS `mshop_plugin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msplu_sid_ty_prov` (`siteid`,`type`,`provider`),
  KEY `idx_msplu_sid_prov` (`siteid`,`provider`),
  KEY `idx_msplu_sid_status` (`siteid`,`status`),
  KEY `idx_msplu_sid_label` (`siteid`,`label`),
  KEY `idx_msplu_sid_pos` (`siteid`,`pos`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_plugin: ~12 rows (aproximadamente)
DELETE FROM `mshop_plugin`;
/*!40000 ALTER TABLE `mshop_plugin` DISABLE KEYS */;
INSERT INTO `mshop_plugin` (`id`, `siteid`, `type`, `label`, `provider`, `config`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', _binary 0x6f72646572, 'Limits maximum amount of products', 'ProductLimit', '{"single-number-max":10,"total-number-max":100,"single-value-max":{"EUR":"1000.00"},"total-value-max":{"EUR":"10000.00"}}', 10, 0, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(2, '1.', _binary 0x6f72646572, 'Checks for deleted products', 'ProductGone', '[]', 20, 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(3, '1.', _binary 0x6f72646572, 'Checks for products out of stock', 'ProductStock', '[]', 30, 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(4, '1.', _binary 0x6f72646572, 'Checks for changed product prices', 'ProductPrice', '[]', 40, 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(5, '1.', _binary 0x6f72646572, 'Adds addresses/delivery/payment to basket', 'Autofill', '{"address":1,"useorder":1,"orderaddress":1,"orderservice":1,"delivery":1,"payment":0}', 50, 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(6, '1.', _binary 0x6f72646572, 'Updates delivery/payment options on basket change', 'ServicesUpdate', '[]', 60, 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(7, '1.', _binary 0x6f72646572, 'Free shipping above threshold', 'Shipping', '{"threshold":{"EUR":"1.00"}}', 70, 0, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(8, '1.', _binary 0x6f72646572, 'Checks for necessary basket limits', 'BasketLimits', '{"min-products":1,"max-products":100,"min-value":{"EUR":"1.00"},"max-value":{"EUR":"10000.00"}}', 80, 0, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(9, '1.', _binary 0x6f72646572, 'Country and state tax rates', 'Taxrates', '{"country-taxrates":{"US":"5.00","AT":"20.00"},"state-taxrates":{"CA":"6.25"}}', 90, 0, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(10, '1.', _binary 0x6f72646572, 'Coupon update', 'Coupon', '[]', 100, 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(11, '1.', _binary 0x6f72646572, 'Checks for required addresses (billing/delivery)', 'AddressesAvailable', '{"payment":1,"delivery":""}', 110, 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(12, '1.', _binary 0x6f72646572, 'Checks for required services (delivery/payment)', 'ServicesAvailable', '{"payment":1,"delivery":1}', 120, 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup');
/*!40000 ALTER TABLE `mshop_plugin` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_plugin_type
CREATE TABLE IF NOT EXISTS `mshop_plugin_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mspluty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mspluty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_mspluty_sid_label` (`siteid`,`label`),
  KEY `idx_mspluty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_plugin_type: ~1 rows (aproximadamente)
DELETE FROM `mshop_plugin_type`;
/*!40000 ALTER TABLE `mshop_plugin_type` DISABLE KEYS */;
INSERT INTO `mshop_plugin_type` (`id`, `siteid`, `domain`, `code`, `label`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', 'plugin', _binary 0x6f72646572, 'Order', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup');
/*!40000 ALTER TABLE `mshop_plugin_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_price
CREATE TABLE IF NOT EXISTS `mshop_price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varbinary(64) NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currencyid` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` double NOT NULL,
  `value` decimal(12,2) DEFAULT NULL,
  `costs` decimal(12,2) NOT NULL,
  `rebate` decimal(12,2) NOT NULL,
  `taxrate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mspri_sid_dom_currid` (`siteid`,`domain`,`currencyid`),
  KEY `idx_mspri_sid_dom_quantity` (`siteid`,`domain`,`quantity`),
  KEY `idx_mspri_sid_dom_value` (`siteid`,`domain`,`value`),
  KEY `idx_mspri_sid_dom_costs` (`siteid`,`domain`,`costs`),
  KEY `idx_mspri_sid_dom_rebate` (`siteid`,`domain`,`rebate`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_price: ~100 rows (aproximadamente)
DELETE FROM `mshop_price`;
/*!40000 ALTER TABLE `mshop_price` DISABLE KEYS */;
INSERT INTO `mshop_price` (`id`, `siteid`, `type`, `domain`, `label`, `currencyid`, `quantity`, `value`, `costs`, `rebate`, `taxrate`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small print', 'EUR', 1, 5.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(2, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small print', 'USD', 1, 7.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(3, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large print', 'EUR', 1, 15.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(4, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large print', 'USD', 1, 20.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(15, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small sticker', 'EUR', 1, 2.50, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(16, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small sticker', 'USD', 1, 3.50, 0.00, 0.00, '{"":"5.00"}', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(17, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large sticker', 'EUR', 1, 5.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(18, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large sticker', 'USD', 1, 7.00, 0.00, 0.00, '{"":"5.00"}', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(61, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small print', 'EUR', 1, 5.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(62, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small print', 'USD', 1, 7.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(63, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large print', 'EUR', 1, 15.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(64, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large print', 'USD', 1, 20.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(75, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small sticker', 'EUR', 1, 2.50, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(76, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small sticker', 'USD', 1, 3.50, 0.00, 0.00, '{"":"5.00"}', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(77, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large sticker', 'EUR', 1, 5.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(78, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large sticker', 'USD', 1, 7.00, 0.00, 0.00, '{"":"5.00"}', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(121, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small print', 'EUR', 1, 5.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(122, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small print', 'USD', 1, 7.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(123, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large print', 'EUR', 1, 15.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(124, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large print', 'USD', 1, 20.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(135, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small sticker', 'EUR', 1, 2.50, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(136, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small sticker', 'USD', 1, 3.50, 0.00, 0.00, '{"":"5.00"}', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(137, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large sticker', 'EUR', 1, 5.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(138, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large sticker', 'USD', 1, 7.00, 0.00, 0.00, '{"":"5.00"}', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(181, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small print', 'EUR', 1, 5.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(182, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small print', 'USD', 1, 7.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(183, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large print', 'EUR', 1, 15.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(184, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large print', 'USD', 1, 20.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(195, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small sticker', 'EUR', 1, 2.50, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(196, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small sticker', 'USD', 1, 3.50, 0.00, 0.00, '{"":"5.00"}', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(197, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large sticker', 'EUR', 1, 5.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(198, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large sticker', 'USD', 1, 7.00, 0.00, 0.00, '{"":"5.00"}', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(241, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small print', 'EUR', 1, 5.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(242, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small print', 'USD', 1, 7.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(243, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large print', 'EUR', 1, 15.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(244, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large print', 'USD', 1, 20.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(255, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small sticker', 'EUR', 1, 2.50, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(256, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small sticker', 'USD', 1, 3.50, 0.00, 0.00, '{"":"5.00"}', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(257, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large sticker', 'EUR', 1, 5.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(258, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large sticker', 'USD', 1, 7.00, 0.00, 0.00, '{"":"5.00"}', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(301, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small print', 'EUR', 1, 5.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(302, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small print', 'USD', 1, 7.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(303, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large print', 'EUR', 1, 15.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(304, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large print', 'USD', 1, 20.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(305, '1.', _binary 0x64656661756c74, 'product', 'Demo: Article from 1', 'EUR', 1, 100.00, 5.00, 20.00, '{"":"20.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(306, '1.', _binary 0x64656661756c74, 'product', 'Demo: Article from 1', 'USD', 1, 130.00, 7.50, 30.00, '{"":"10.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(307, '1.', _binary 0x64656661756c74, 'product', 'Demo: Selection article 1 from 1', 'EUR', 1, 140.00, 10.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(308, '1.', _binary 0x64656661756c74, 'product', 'Demo: Selection article 1 from 1', 'USD', 1, 190.00, 15.00, 0.00, '{"":"5.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(309, '1.', _binary 0x64656661756c74, 'product', 'Demo: Selection article from 1', 'EUR', 1, 150.00, 10.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(310, '1.', _binary 0x64656661756c74, 'product', 'Demo: Selection article from 5', 'EUR', 5, 135.00, 10.00, 15.00, '{"":"10.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(311, '1.', _binary 0x64656661756c74, 'product', 'Demo: Selection article from 10', 'EUR', 10, 120.00, 10.00, 30.00, '{"":"10.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(312, '1.', _binary 0x64656661756c74, 'product', 'Demo: Selection article from 1', 'USD', 1, 200.00, 15.00, 0.00, '{"":"5.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(313, '1.', _binary 0x64656661756c74, 'product', 'Demo: Selection article from 5', 'USD', 5, 175.00, 15.00, 25.00, '{"":"5.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(314, '1.', _binary 0x64656661756c74, 'product', 'Demo: Selection article from 10', 'USD', 10, 150.00, 15.00, 50.00, '{"":"5.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(315, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small sticker', 'EUR', 1, 2.50, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(316, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Small sticker', 'USD', 1, 3.50, 0.00, 0.00, '{"":"5.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(317, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large sticker', 'EUR', 1, 5.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(318, '1.', _binary 0x64656661756c74, 'attribute', 'Demo: Large sticker', 'USD', 1, 7.00, 0.00, 0.00, '{"":"5.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(319, '1.', _binary 0x64656661756c74, 'product', 'Demo: Bundle article from 1', 'EUR', 1, 250.00, 10.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(320, '1.', _binary 0x64656661756c74, 'product', 'Demo: Bundle article from 5', 'EUR', 5, 235.00, 10.00, 15.00, '{"":"10.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(321, '1.', _binary 0x64656661756c74, 'product', 'Demo: Bundle article from 10', 'EUR', 10, 220.00, 10.00, 30.00, '{"":"10.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(322, '1.', _binary 0x64656661756c74, 'product', 'Demo: Bundle article from 1', 'USD', 1, 250.00, 15.00, 0.00, '{"":"5.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(323, '1.', _binary 0x64656661756c74, 'product', 'Demo: Bundle article from 5', 'USD', 5, 225.00, 15.00, 25.00, '{"":"5.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(324, '1.', _binary 0x64656661756c74, 'product', 'Demo: Bundle article from 10', 'USD', 10, 200.00, 15.00, 50.00, '{"":"5.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(325, '1.', _binary 0x64656661756c74, 'product', 'Demo: Voucher', 'EUR', 1, 25.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(326, '1.', _binary 0x64656661756c74, 'product', 'Demo: Voucher', 'USD', 1, 25.00, 0.00, 0.00, '{"":"5.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(327, '1.', _binary 0x64656661756c74, 'product', 'Demo: Article from 1', 'EUR', 1, 49.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(328, '1.', _binary 0x64656661756c74, 'product', 'Demo: Article from 1', 'USD', 1, 59.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(329, '1.', _binary 0x64656661756c74, 'product', 'Demo: Article from 1', 'EUR', 1, 69.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(330, '1.', _binary 0x64656661756c74, 'product', 'Demo: Article from 1', 'USD', 1, 79.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(331, '1.', _binary 0x64656661756c74, 'product', 'Demo: Article from 1', 'EUR', 1, 29.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(332, '1.', _binary 0x64656661756c74, 'product', 'Demo: Article from 1', 'USD', 1, 36.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(333, '1.', _binary 0x64656661756c74, 'product', 'Demo: Article from 1', 'EUR', 1, 79.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(334, '1.', _binary 0x64656661756c74, 'product', 'Demo: Article from 1', 'USD', 1, 99.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(335, '1.', _binary 0x64656661756c74, 'product', 'Demo: Article from 1', 'EUR', 1, 19.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(336, '1.', _binary 0x64656661756c74, 'product', 'Demo: Article from 1', 'USD', 1, 22.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(337, '1.', _binary 0x64656661756c74, 'product', 'Demo: Article from 1', 'EUR', 1, 49.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(338, '1.', _binary 0x64656661756c74, 'product', 'Demo: Article from 1', 'USD', 1, 59.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(339, '1.', _binary 0x64656661756c74, 'product', 'Demo: Article from 1', 'EUR', 1, 39.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(340, '1.', _binary 0x64656661756c74, 'product', 'Demo: Article from 1', 'USD', 1, 49.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(341, '1.', _binary 0x64656661756c74, 'service', 'Demo: Click&Collect', 'EUR', 1, 0.00, 0.00, 0.00, '{"":"0.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(342, '1.', _binary 0x64656661756c74, 'service', 'Demo: Click&Collect', 'USD', 1, 0.00, 0.00, 0.00, '{"":"0.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(343, '1.', _binary 0x64656661756c74, 'service', 'Demo: DHL', 'EUR', 1, 0.00, 5.90, 0.00, '{"":"20.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(344, '1.', _binary 0x64656661756c74, 'service', 'Demo: DHL', 'USD', 1, 0.00, 7.90, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(345, '1.', _binary 0x64656661756c74, 'service', 'Demo: DHL', 'EUR', 1, 0.00, 11.90, 0.00, '{"":"20.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(346, '1.', _binary 0x64656661756c74, 'service', 'Demo: DHL', 'USD', 1, 0.00, 15.90, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(347, '1.', _binary 0x64656661756c74, 'service', 'Demo: Fedex', 'EUR', 1, 0.00, 6.90, 0.00, '{"":"20.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(348, '1.', _binary 0x64656661756c74, 'service', 'Demo: Fedex', 'USD', 1, 0.00, 8.50, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(349, '1.', _binary 0x64656661756c74, 'service', 'Demo: TNT', 'EUR', 1, 0.00, 8.90, 0.00, '{"":"20.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(350, '1.', _binary 0x64656661756c74, 'service', 'Demo: TNT', 'USD', 1, 0.00, 12.90, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(351, '1.', _binary 0x64656661756c74, 'service', 'Demo: Invoice', 'EUR', 1, 0.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(352, '1.', _binary 0x64656661756c74, 'service', 'Demo: Invoice', 'USD', 1, 0.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(353, '1.', _binary 0x64656661756c74, 'service', 'Demo: Direct debit', 'EUR', 1, 0.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(354, '1.', _binary 0x64656661756c74, 'service', 'Demo: Direct debit', 'USD', 1, 0.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(355, '1.', _binary 0x64656661756c74, 'service', 'Demo: PayPal', 'EUR', 1, 0.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(356, '1.', _binary 0x64656661756c74, 'service', 'Demo: PayPal', 'USD', 1, 0.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(357, '1.', _binary 0x64656661756c74, 'service', 'Demo: Cache on delivery', 'EUR', 1, 0.00, 8.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(358, '1.', _binary 0x64656661756c74, 'service', 'Demo: Cache on delivery', 'USD', 1, 0.00, 12.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(359, '1.', _binary 0x64656661756c74, 'service', 'Demo: Prepayment', 'EUR', 1, 0.00, 0.00, 0.00, '{"":"20.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(360, '1.', _binary 0x64656661756c74, 'service', 'Demo: Prepayment', 'USD', 1, 0.00, 0.00, 0.00, '{"":"10.00"}', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup');
/*!40000 ALTER TABLE `mshop_price` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_price_list
CREATE TABLE IF NOT EXISTS `mshop_price_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` int NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varbinary(134) NOT NULL DEFAULT '',
  `type` varbinary(64) NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refid` varbinary(36) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msprili_pid_dm_sid_ty_rid` (`parentid`,`domain`,`siteid`,`type`,`refid`),
  KEY `idx_msprili_key_sid` (`key`,`siteid`),
  KEY `fk_msprili_pid` (`parentid`),
  CONSTRAINT `fk_msprili_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_price` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_price_list: ~0 rows (aproximadamente)
DELETE FROM `mshop_price_list`;
/*!40000 ALTER TABLE `mshop_price_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_price_list` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_price_list_type
CREATE TABLE IF NOT EXISTS `mshop_price_list_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msprility_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msprility_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msprility_sid_label` (`siteid`,`label`),
  KEY `idx_msprility_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_price_list_type: ~0 rows (aproximadamente)
DELETE FROM `mshop_price_list_type`;
/*!40000 ALTER TABLE `mshop_price_list_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_price_list_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_price_property
CREATE TABLE IF NOT EXISTS `mshop_price_property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` int NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varbinary(103) NOT NULL DEFAULT '',
  `type` varbinary(64) NOT NULL,
  `langid` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mspripr_sid_ty_lid_value` (`parentid`,`siteid`,`type`,`langid`,`value`),
  KEY `fk_mspripr_key_sid` (`key`,`siteid`),
  KEY `fk_mspripr_pid` (`parentid`),
  CONSTRAINT `fk_mspripr_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_price` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_price_property: ~0 rows (aproximadamente)
DELETE FROM `mshop_price_property`;
/*!40000 ALTER TABLE `mshop_price_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_price_property` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_price_property_type
CREATE TABLE IF NOT EXISTS `mshop_price_property_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mspriprty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mspriprty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_mspriprty_sid_label` (`siteid`,`label`),
  KEY `idx_mspriprty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_price_property_type: ~0 rows (aproximadamente)
DELETE FROM `mshop_price_property_type`;
/*!40000 ALTER TABLE `mshop_price_property_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_price_property_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_price_type
CREATE TABLE IF NOT EXISTS `mshop_price_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msprity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msprity_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msprity_sid_label` (`siteid`,`label`),
  KEY `idx_msprity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_price_type: ~3 rows (aproximadamente)
DELETE FROM `mshop_price_type`;
/*!40000 ALTER TABLE `mshop_price_type` DISABLE KEYS */;
INSERT INTO `mshop_price_type` (`id`, `siteid`, `domain`, `code`, `label`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', 'attribute', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(2, '1.', 'service', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(3, '1.', 'product', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup');
/*!40000 ALTER TABLE `mshop_price_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_product
CREATE TABLE IF NOT EXISTS `mshop_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dataset` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varbinary(64) NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `scale` double NOT NULL DEFAULT '1',
  `rating` decimal(4,2) NOT NULL DEFAULT '0.00',
  `ratings` int NOT NULL DEFAULT '0',
  `instock` smallint NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mspro_siteid_code` (`siteid`,`code`),
  KEY `idx_mspro_id_sid_stat_st_end_rt` (`id`,`siteid`,`status`,`start`,`end`,`rating`),
  KEY `idx_mspro_sid_stat_st_end_rt` (`siteid`,`status`,`start`,`end`,`rating`),
  KEY `idx_mspro_sid_rating` (`siteid`,`rating`),
  KEY `idx_mspro_sid_label` (`siteid`,`label`),
  KEY `idx_mspro_sid_start` (`siteid`,`start`),
  KEY `idx_mspro_sid_end` (`siteid`,`end`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_product: ~14 rows (aproximadamente)
DELETE FROM `mshop_product`;
/*!40000 ALTER TABLE `mshop_product` DISABLE KEYS */;
INSERT INTO `mshop_product` (`id`, `siteid`, `dataset`, `type`, `code`, `label`, `url`, `config`, `start`, `end`, `scale`, `rating`, `ratings`, `instock`, `status`, `mtime`, `ctime`, `editor`, `target`) VALUES
	(71, '1.', '', _binary 0x64656661756c74, _binary 0x64656d6f2d61727469636c65, 'Demo article', 'Demo-article', '[]', NULL, NULL, 1, 0.00, 0, 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup', ''),
	(72, '1.', '', _binary 0x64656661756c74, _binary 0x64656d6f2d73656c656374696f6e2d61727469636c652d31, 'Demo variant article 1', 'Demo-variant-article-1', '[]', NULL, NULL, 1, 0.00, 0, 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup', ''),
	(73, '1.', '', _binary 0x64656661756c74, _binary 0x64656d6f2d73656c656374696f6e2d61727469636c652d32, 'Demo variant article 2', 'Demo-variant-article-2', '[]', NULL, NULL, 1, 0.00, 0, 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup', ''),
	(74, '1.', '', _binary 0x73656c656374, _binary 0x64656d6f2d73656c656374696f6e2d61727469636c65, 'Demo selection article', 'Demo-selection-article', '[]', NULL, NULL, 1, 0.00, 0, 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup', ''),
	(75, '1.', '', _binary 0x62756e646c65, _binary 0x64656d6f2d62756e646c652d61727469636c65, 'Demo bundle article', 'Demo-bundle-article', '[]', NULL, NULL, 1, 0.00, 0, 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup', ''),
	(76, '1.', '', _binary 0x766f7563686572, _binary 0x64656d6f2d766f7563686572, 'Demo voucher', 'Demo-voucher', '[]', NULL, NULL, 1, 0.00, 0, 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup', ''),
	(77, '1.', '', _binary 0x64656661756c74, _binary 0x64656d6f2d726562617465, 'Demo rebate', 'Demo-rebate', '[]', NULL, NULL, 1, 0.00, 0, 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup', ''),
	(78, '1.', '', _binary 0x64656661756c74, _binary 0x64656d6f2d61727469636c652d32, 'Demo article 2', 'Demo-article-2', '[]', NULL, NULL, 1, 0.00, 0, 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup', ''),
	(79, '1.', '', _binary 0x64656661756c74, _binary 0x64656d6f2d61727469636c652d33, 'Demo article 3', 'Demo-article-3', '[]', NULL, NULL, 1, 0.00, 0, 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup', ''),
	(80, '1.', '', _binary 0x64656661756c74, _binary 0x64656d6f2d61727469636c652d34, 'Demo article 4', 'Demo-article-4', '[]', NULL, NULL, 1, 0.00, 0, 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup', ''),
	(81, '1.', '', _binary 0x64656661756c74, _binary 0x64656d6f2d61727469636c652d35, 'Demo article 5', 'Demo-article-5', '[]', NULL, NULL, 1, 0.00, 0, 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup', ''),
	(82, '1.', '', _binary 0x64656661756c74, _binary 0x64656d6f2d61727469636c652d36, 'Demo article 6', 'Demo-article-6', '[]', NULL, NULL, 1, 0.00, 0, 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup', ''),
	(83, '1.', '', _binary 0x64656661756c74, _binary 0x64656d6f2d61727469636c652d37, 'Demo article 7', 'Demo-article-7', '[]', NULL, NULL, 1, 0.00, 0, 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup', ''),
	(84, '1.', '', _binary 0x64656661756c74, _binary 0x64656d6f2d61727469636c652d38, 'Demo article 8', 'Demo-article-8', '[]', NULL, NULL, 1, 0.00, 0, 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup', '');
/*!40000 ALTER TABLE `mshop_product` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_product_list
CREATE TABLE IF NOT EXISTS `mshop_product_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` int NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varbinary(134) NOT NULL DEFAULT '',
  `type` varbinary(64) NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refid` varbinary(36) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msproli_pid_dm_sid_ty_rid` (`parentid`,`domain`,`siteid`,`type`,`refid`),
  KEY `idx_msproli_key_sid` (`key`,`siteid`),
  KEY `fk_msproli_pid` (`parentid`),
  CONSTRAINT `fk_msproli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=931 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_product_list: ~155 rows (aproximadamente)
DELETE FROM `mshop_product_list`;
/*!40000 ALTER TABLE `mshop_product_list` DISABLE KEYS */;
INSERT INTO `mshop_product_list` (`id`, `parentid`, `siteid`, `key`, `type`, `domain`, `refid`, `start`, `end`, `config`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(776, 71, '1.', _binary 0x6174747269627574657c64656661756c747c313031, _binary 0x64656661756c74, 'attribute', _binary 0x313031, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(777, 71, '1.', _binary 0x6174747269627574657c636f6e6669677c313032, _binary 0x636f6e666967, 'attribute', _binary 0x313032, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(778, 71, '1.', _binary 0x6174747269627574657c637573746f6d7c313033, _binary 0x637573746f6d, 'attribute', _binary 0x313033, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(779, 71, '1.', _binary 0x6174747269627574657c636f6e6669677c313034, _binary 0x636f6e666967, 'attribute', _binary 0x313034, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(780, 71, '1.', _binary 0x6174747269627574657c636f6e6669677c313035, _binary 0x636f6e666967, 'attribute', _binary 0x313035, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(781, 71, '1.', _binary 0x6174747269627574657c636f6e6669677c313036, _binary 0x636f6e666967, 'attribute', _binary 0x313036, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(782, 71, '1.', _binary 0x6d656469617c64656661756c747c323032, _binary 0x64656661756c74, 'media', _binary 0x323032, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(783, 71, '1.', _binary 0x6d656469617c64656661756c747c323033, _binary 0x64656661756c74, 'media', _binary 0x323033, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(784, 71, '1.', _binary 0x70726963657c64656661756c747c333035, _binary 0x64656661756c74, 'price', _binary 0x333035, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(785, 71, '1.', _binary 0x70726963657c64656661756c747c333036, _binary 0x64656661756c74, 'price', _binary 0x333036, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(786, 71, '1.', _binary 0x746578747c64656661756c747c31303334, _binary 0x64656661756c74, 'text', _binary 0x31303334, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(787, 71, '1.', _binary 0x746578747c64656661756c747c31303335, _binary 0x64656661756c74, 'text', _binary 0x31303335, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(788, 71, '1.', _binary 0x746578747c64656661756c747c31303336, _binary 0x64656661756c74, 'text', _binary 0x31303336, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(789, 71, '1.', _binary 0x746578747c64656661756c747c31303337, _binary 0x64656661756c74, 'text', _binary 0x31303337, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(790, 71, '1.', _binary 0x746578747c64656661756c747c31303338, _binary 0x64656661756c74, 'text', _binary 0x31303338, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(791, 71, '1.', _binary 0x746578747c64656661756c747c31303339, _binary 0x64656661756c74, 'text', _binary 0x31303339, NULL, NULL, '[]', 5, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(792, 71, '1.', _binary 0x746578747c64656661756c747c31303430, _binary 0x64656661756c74, 'text', _binary 0x31303430, NULL, NULL, '[]', 6, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(793, 72, '1.', _binary 0x6174747269627574657c76617269616e747c313037, _binary 0x76617269616e74, 'attribute', _binary 0x313037, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(794, 72, '1.', _binary 0x6174747269627574657c76617269616e747c313038, _binary 0x76617269616e74, 'attribute', _binary 0x313038, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(795, 72, '1.', _binary 0x6174747269627574657c76617269616e747c313039, _binary 0x76617269616e74, 'attribute', _binary 0x313039, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(796, 72, '1.', _binary 0x70726963657c64656661756c747c333037, _binary 0x64656661756c74, 'price', _binary 0x333037, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(797, 72, '1.', _binary 0x70726963657c64656661756c747c333038, _binary 0x64656661756c74, 'price', _binary 0x333038, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(798, 73, '1.', _binary 0x6174747269627574657c76617269616e747c313130, _binary 0x76617269616e74, 'attribute', _binary 0x313130, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(799, 73, '1.', _binary 0x6174747269627574657c76617269616e747c313131, _binary 0x76617269616e74, 'attribute', _binary 0x313131, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(800, 73, '1.', _binary 0x6174747269627574657c76617269616e747c313132, _binary 0x76617269616e74, 'attribute', _binary 0x313132, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(801, 74, '1.', _binary 0x6d656469617c64656661756c747c323036, _binary 0x64656661756c74, 'media', _binary 0x323036, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(802, 74, '1.', _binary 0x6d656469617c64656661756c747c323037, _binary 0x64656661756c74, 'media', _binary 0x323037, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(803, 74, '1.', _binary 0x70726963657c64656661756c747c333039, _binary 0x64656661756c74, 'price', _binary 0x333039, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(804, 74, '1.', _binary 0x70726963657c64656661756c747c333130, _binary 0x64656661756c74, 'price', _binary 0x333130, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(805, 74, '1.', _binary 0x70726963657c64656661756c747c333131, _binary 0x64656661756c74, 'price', _binary 0x333131, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(806, 74, '1.', _binary 0x70726963657c64656661756c747c333132, _binary 0x64656661756c74, 'price', _binary 0x333132, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(807, 74, '1.', _binary 0x70726963657c64656661756c747c333133, _binary 0x64656661756c74, 'price', _binary 0x333133, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(808, 74, '1.', _binary 0x70726963657c64656661756c747c333134, _binary 0x64656661756c74, 'price', _binary 0x333134, NULL, NULL, '[]', 5, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(809, 74, '1.', _binary 0x746578747c64656661756c747c31303631, _binary 0x64656661756c74, 'text', _binary 0x31303631, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(810, 74, '1.', _binary 0x746578747c64656661756c747c31303632, _binary 0x64656661756c74, 'text', _binary 0x31303632, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(811, 74, '1.', _binary 0x746578747c64656661756c747c31303633, _binary 0x64656661756c74, 'text', _binary 0x31303633, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(812, 74, '1.', _binary 0x746578747c64656661756c747c31303634, _binary 0x64656661756c74, 'text', _binary 0x31303634, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(813, 74, '1.', _binary 0x746578747c64656661756c747c31303635, _binary 0x64656661756c74, 'text', _binary 0x31303635, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(814, 74, '1.', _binary 0x746578747c64656661756c747c31303636, _binary 0x64656661756c74, 'text', _binary 0x31303636, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(815, 74, '1.', _binary 0x746578747c64656661756c747c31303637, _binary 0x64656661756c74, 'text', _binary 0x31303637, NULL, NULL, '[]', 5, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(816, 74, '1.', _binary 0x746578747c64656661756c747c31303638, _binary 0x64656661756c74, 'text', _binary 0x31303638, NULL, NULL, '[]', 6, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(817, 74, '1.', _binary 0x70726f647563747c64656661756c747c3732, _binary 0x64656661756c74, 'product', _binary 0x3732, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(818, 74, '1.', _binary 0x70726f647563747c73756767657374696f6e7c3731, _binary 0x73756767657374696f6e, 'product', _binary 0x3731, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(819, 74, '1.', _binary 0x70726f647563747c626f756768742d746f6765746865727c3731, _binary 0x626f756768742d746f676574686572, 'product', _binary 0x3731, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(820, 74, '1.', _binary 0x70726f647563747c64656661756c747c3733, _binary 0x64656661756c74, 'product', _binary 0x3733, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(821, 75, '1.', _binary 0x6174747269627574657c636f6e6669677c313133, _binary 0x636f6e666967, 'attribute', _binary 0x313133, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(822, 75, '1.', _binary 0x6174747269627574657c636f6e6669677c313134, _binary 0x636f6e666967, 'attribute', _binary 0x313134, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(823, 75, '1.', _binary 0x6d656469617c64656661756c747c323038, _binary 0x64656661756c74, 'media', _binary 0x323038, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(824, 75, '1.', _binary 0x6d656469617c64656661756c747c323039, _binary 0x64656661756c74, 'media', _binary 0x323039, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(825, 75, '1.', _binary 0x70726963657c64656661756c747c333139, _binary 0x64656661756c74, 'price', _binary 0x333139, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(826, 75, '1.', _binary 0x70726963657c64656661756c747c333230, _binary 0x64656661756c74, 'price', _binary 0x333230, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(827, 75, '1.', _binary 0x70726963657c64656661756c747c333231, _binary 0x64656661756c74, 'price', _binary 0x333231, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(828, 75, '1.', _binary 0x70726963657c64656661756c747c333232, _binary 0x64656661756c74, 'price', _binary 0x333232, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(829, 75, '1.', _binary 0x70726963657c64656661756c747c333233, _binary 0x64656661756c74, 'price', _binary 0x333233, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(830, 75, '1.', _binary 0x70726963657c64656661756c747c333234, _binary 0x64656661756c74, 'price', _binary 0x333234, NULL, NULL, '[]', 5, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(831, 75, '1.', _binary 0x746578747c64656661756c747c31303737, _binary 0x64656661756c74, 'text', _binary 0x31303737, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(832, 75, '1.', _binary 0x746578747c64656661756c747c31303738, _binary 0x64656661756c74, 'text', _binary 0x31303738, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(833, 75, '1.', _binary 0x746578747c64656661756c747c31303739, _binary 0x64656661756c74, 'text', _binary 0x31303739, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(834, 75, '1.', _binary 0x746578747c64656661756c747c31303830, _binary 0x64656661756c74, 'text', _binary 0x31303830, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(835, 75, '1.', _binary 0x746578747c64656661756c747c31303831, _binary 0x64656661756c74, 'text', _binary 0x31303831, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(836, 75, '1.', _binary 0x746578747c64656661756c747c31303832, _binary 0x64656661756c74, 'text', _binary 0x31303832, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(837, 75, '1.', _binary 0x746578747c64656661756c747c31303833, _binary 0x64656661756c74, 'text', _binary 0x31303833, NULL, NULL, '[]', 5, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(838, 75, '1.', _binary 0x746578747c64656661756c747c31303834, _binary 0x64656661756c74, 'text', _binary 0x31303834, NULL, NULL, '[]', 6, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(839, 75, '1.', _binary 0x70726f647563747c64656661756c747c3734, _binary 0x64656661756c74, 'product', _binary 0x3734, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(840, 75, '1.', _binary 0x70726f647563747c64656661756c747c3731, _binary 0x64656661756c74, 'product', _binary 0x3731, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(841, 76, '1.', _binary 0x6174747269627574657c637573746f6d7c3135, _binary 0x637573746f6d, 'attribute', _binary 0x3135, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(842, 76, '1.', _binary 0x6174747269627574657c637573746f6d7c313135, _binary 0x637573746f6d, 'attribute', _binary 0x313135, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(843, 76, '1.', _binary 0x6d656469617c64656661756c747c323130, _binary 0x64656661756c74, 'media', _binary 0x323130, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(844, 76, '1.', _binary 0x70726963657c64656661756c747c333235, _binary 0x64656661756c74, 'price', _binary 0x333235, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(845, 76, '1.', _binary 0x70726963657c64656661756c747c333236, _binary 0x64656661756c74, 'price', _binary 0x333236, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(846, 76, '1.', _binary 0x746578747c64656661756c747c31303839, _binary 0x64656661756c74, 'text', _binary 0x31303839, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(847, 76, '1.', _binary 0x746578747c64656661756c747c31303930, _binary 0x64656661756c74, 'text', _binary 0x31303930, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(848, 76, '1.', _binary 0x746578747c64656661756c747c31303931, _binary 0x64656661756c74, 'text', _binary 0x31303931, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(849, 76, '1.', _binary 0x746578747c64656661756c747c31303932, _binary 0x64656661756c74, 'text', _binary 0x31303932, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(850, 76, '1.', _binary 0x746578747c64656661756c747c31303933, _binary 0x64656661756c74, 'text', _binary 0x31303933, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(851, 76, '1.', _binary 0x746578747c64656661756c747c31303934, _binary 0x64656661756c74, 'text', _binary 0x31303934, NULL, NULL, '[]', 5, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(852, 76, '1.', _binary 0x746578747c64656661756c747c31303935, _binary 0x64656661756c74, 'text', _binary 0x31303935, NULL, NULL, '[]', 6, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(853, 77, '1.', _binary 0x746578747c64656661756c747c31303936, _binary 0x64656661756c74, 'text', _binary 0x31303936, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(854, 78, '1.', _binary 0x6d656469617c64656661756c747c323131, _binary 0x64656661756c74, 'media', _binary 0x323131, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(855, 78, '1.', _binary 0x6d656469617c64656661756c747c323132, _binary 0x64656661756c74, 'media', _binary 0x323132, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(856, 78, '1.', _binary 0x70726963657c64656661756c747c333237, _binary 0x64656661756c74, 'price', _binary 0x333237, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(857, 78, '1.', _binary 0x70726963657c64656661756c747c333238, _binary 0x64656661756c74, 'price', _binary 0x333238, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(858, 78, '1.', _binary 0x746578747c64656661756c747c31303937, _binary 0x64656661756c74, 'text', _binary 0x31303937, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(859, 78, '1.', _binary 0x746578747c64656661756c747c31303938, _binary 0x64656661756c74, 'text', _binary 0x31303938, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(860, 78, '1.', _binary 0x746578747c64656661756c747c31303939, _binary 0x64656661756c74, 'text', _binary 0x31303939, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(861, 78, '1.', _binary 0x746578747c64656661756c747c31313030, _binary 0x64656661756c74, 'text', _binary 0x31313030, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(862, 78, '1.', _binary 0x746578747c64656661756c747c31313031, _binary 0x64656661756c74, 'text', _binary 0x31313031, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(863, 78, '1.', _binary 0x746578747c64656661756c747c31313032, _binary 0x64656661756c74, 'text', _binary 0x31313032, NULL, NULL, '[]', 5, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(864, 78, '1.', _binary 0x746578747c64656661756c747c31313033, _binary 0x64656661756c74, 'text', _binary 0x31313033, NULL, NULL, '[]', 6, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(865, 79, '1.', _binary 0x6d656469617c64656661756c747c323133, _binary 0x64656661756c74, 'media', _binary 0x323133, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(866, 79, '1.', _binary 0x6d656469617c64656661756c747c323134, _binary 0x64656661756c74, 'media', _binary 0x323134, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(867, 79, '1.', _binary 0x70726963657c64656661756c747c333239, _binary 0x64656661756c74, 'price', _binary 0x333239, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(868, 79, '1.', _binary 0x70726963657c64656661756c747c333330, _binary 0x64656661756c74, 'price', _binary 0x333330, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(869, 79, '1.', _binary 0x746578747c64656661756c747c31313034, _binary 0x64656661756c74, 'text', _binary 0x31313034, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(870, 79, '1.', _binary 0x746578747c64656661756c747c31313035, _binary 0x64656661756c74, 'text', _binary 0x31313035, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(871, 79, '1.', _binary 0x746578747c64656661756c747c31313036, _binary 0x64656661756c74, 'text', _binary 0x31313036, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(872, 79, '1.', _binary 0x746578747c64656661756c747c31313037, _binary 0x64656661756c74, 'text', _binary 0x31313037, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(873, 79, '1.', _binary 0x746578747c64656661756c747c31313038, _binary 0x64656661756c74, 'text', _binary 0x31313038, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(874, 79, '1.', _binary 0x746578747c64656661756c747c31313039, _binary 0x64656661756c74, 'text', _binary 0x31313039, NULL, NULL, '[]', 5, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(875, 79, '1.', _binary 0x746578747c64656661756c747c31313130, _binary 0x64656661756c74, 'text', _binary 0x31313130, NULL, NULL, '[]', 6, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(876, 80, '1.', _binary 0x6d656469617c64656661756c747c323135, _binary 0x64656661756c74, 'media', _binary 0x323135, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(877, 80, '1.', _binary 0x6d656469617c64656661756c747c323136, _binary 0x64656661756c74, 'media', _binary 0x323136, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(878, 80, '1.', _binary 0x70726963657c64656661756c747c333331, _binary 0x64656661756c74, 'price', _binary 0x333331, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(879, 80, '1.', _binary 0x70726963657c64656661756c747c333332, _binary 0x64656661756c74, 'price', _binary 0x333332, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(880, 80, '1.', _binary 0x746578747c64656661756c747c31313131, _binary 0x64656661756c74, 'text', _binary 0x31313131, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(881, 80, '1.', _binary 0x746578747c64656661756c747c31313132, _binary 0x64656661756c74, 'text', _binary 0x31313132, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(882, 80, '1.', _binary 0x746578747c64656661756c747c31313133, _binary 0x64656661756c74, 'text', _binary 0x31313133, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(883, 80, '1.', _binary 0x746578747c64656661756c747c31313134, _binary 0x64656661756c74, 'text', _binary 0x31313134, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(884, 80, '1.', _binary 0x746578747c64656661756c747c31313135, _binary 0x64656661756c74, 'text', _binary 0x31313135, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(885, 80, '1.', _binary 0x746578747c64656661756c747c31313136, _binary 0x64656661756c74, 'text', _binary 0x31313136, NULL, NULL, '[]', 5, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(886, 80, '1.', _binary 0x746578747c64656661756c747c31313137, _binary 0x64656661756c74, 'text', _binary 0x31313137, NULL, NULL, '[]', 6, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(887, 81, '1.', _binary 0x6d656469617c64656661756c747c323137, _binary 0x64656661756c74, 'media', _binary 0x323137, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(888, 81, '1.', _binary 0x6d656469617c64656661756c747c323138, _binary 0x64656661756c74, 'media', _binary 0x323138, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(889, 81, '1.', _binary 0x70726963657c64656661756c747c333333, _binary 0x64656661756c74, 'price', _binary 0x333333, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(890, 81, '1.', _binary 0x70726963657c64656661756c747c333334, _binary 0x64656661756c74, 'price', _binary 0x333334, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(891, 81, '1.', _binary 0x746578747c64656661756c747c31313138, _binary 0x64656661756c74, 'text', _binary 0x31313138, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(892, 81, '1.', _binary 0x746578747c64656661756c747c31313139, _binary 0x64656661756c74, 'text', _binary 0x31313139, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(893, 81, '1.', _binary 0x746578747c64656661756c747c31313230, _binary 0x64656661756c74, 'text', _binary 0x31313230, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(894, 81, '1.', _binary 0x746578747c64656661756c747c31313231, _binary 0x64656661756c74, 'text', _binary 0x31313231, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(895, 81, '1.', _binary 0x746578747c64656661756c747c31313232, _binary 0x64656661756c74, 'text', _binary 0x31313232, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(896, 81, '1.', _binary 0x746578747c64656661756c747c31313233, _binary 0x64656661756c74, 'text', _binary 0x31313233, NULL, NULL, '[]', 5, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(897, 81, '1.', _binary 0x746578747c64656661756c747c31313234, _binary 0x64656661756c74, 'text', _binary 0x31313234, NULL, NULL, '[]', 6, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(898, 82, '1.', _binary 0x6d656469617c64656661756c747c323139, _binary 0x64656661756c74, 'media', _binary 0x323139, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(899, 82, '1.', _binary 0x6d656469617c64656661756c747c323230, _binary 0x64656661756c74, 'media', _binary 0x323230, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(900, 82, '1.', _binary 0x70726963657c64656661756c747c333335, _binary 0x64656661756c74, 'price', _binary 0x333335, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(901, 82, '1.', _binary 0x70726963657c64656661756c747c333336, _binary 0x64656661756c74, 'price', _binary 0x333336, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(902, 82, '1.', _binary 0x746578747c64656661756c747c31313235, _binary 0x64656661756c74, 'text', _binary 0x31313235, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(903, 82, '1.', _binary 0x746578747c64656661756c747c31313236, _binary 0x64656661756c74, 'text', _binary 0x31313236, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(904, 82, '1.', _binary 0x746578747c64656661756c747c31313237, _binary 0x64656661756c74, 'text', _binary 0x31313237, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(905, 82, '1.', _binary 0x746578747c64656661756c747c31313238, _binary 0x64656661756c74, 'text', _binary 0x31313238, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(906, 82, '1.', _binary 0x746578747c64656661756c747c31313239, _binary 0x64656661756c74, 'text', _binary 0x31313239, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(907, 82, '1.', _binary 0x746578747c64656661756c747c31313330, _binary 0x64656661756c74, 'text', _binary 0x31313330, NULL, NULL, '[]', 5, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(908, 82, '1.', _binary 0x746578747c64656661756c747c31313331, _binary 0x64656661756c74, 'text', _binary 0x31313331, NULL, NULL, '[]', 6, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(909, 83, '1.', _binary 0x6d656469617c64656661756c747c323231, _binary 0x64656661756c74, 'media', _binary 0x323231, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(910, 83, '1.', _binary 0x6d656469617c64656661756c747c323232, _binary 0x64656661756c74, 'media', _binary 0x323232, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(911, 83, '1.', _binary 0x70726963657c64656661756c747c333337, _binary 0x64656661756c74, 'price', _binary 0x333337, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(912, 83, '1.', _binary 0x70726963657c64656661756c747c333338, _binary 0x64656661756c74, 'price', _binary 0x333338, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(913, 83, '1.', _binary 0x746578747c64656661756c747c31313332, _binary 0x64656661756c74, 'text', _binary 0x31313332, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(914, 83, '1.', _binary 0x746578747c64656661756c747c31313333, _binary 0x64656661756c74, 'text', _binary 0x31313333, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(915, 83, '1.', _binary 0x746578747c64656661756c747c31313334, _binary 0x64656661756c74, 'text', _binary 0x31313334, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(916, 83, '1.', _binary 0x746578747c64656661756c747c31313335, _binary 0x64656661756c74, 'text', _binary 0x31313335, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(917, 83, '1.', _binary 0x746578747c64656661756c747c31313336, _binary 0x64656661756c74, 'text', _binary 0x31313336, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(918, 83, '1.', _binary 0x746578747c64656661756c747c31313337, _binary 0x64656661756c74, 'text', _binary 0x31313337, NULL, NULL, '[]', 5, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(919, 83, '1.', _binary 0x746578747c64656661756c747c31313338, _binary 0x64656661756c74, 'text', _binary 0x31313338, NULL, NULL, '[]', 6, 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(920, 84, '1.', _binary 0x6d656469617c64656661756c747c323233, _binary 0x64656661756c74, 'media', _binary 0x323233, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(921, 84, '1.', _binary 0x6d656469617c64656661756c747c323234, _binary 0x64656661756c74, 'media', _binary 0x323234, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(922, 84, '1.', _binary 0x70726963657c64656661756c747c333339, _binary 0x64656661756c74, 'price', _binary 0x333339, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(923, 84, '1.', _binary 0x70726963657c64656661756c747c333430, _binary 0x64656661756c74, 'price', _binary 0x333430, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(924, 84, '1.', _binary 0x746578747c64656661756c747c31313339, _binary 0x64656661756c74, 'text', _binary 0x31313339, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(925, 84, '1.', _binary 0x746578747c64656661756c747c31313430, _binary 0x64656661756c74, 'text', _binary 0x31313430, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(926, 84, '1.', _binary 0x746578747c64656661756c747c31313431, _binary 0x64656661756c74, 'text', _binary 0x31313431, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(927, 84, '1.', _binary 0x746578747c64656661756c747c31313432, _binary 0x64656661756c74, 'text', _binary 0x31313432, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(928, 84, '1.', _binary 0x746578747c64656661756c747c31313433, _binary 0x64656661756c74, 'text', _binary 0x31313433, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(929, 84, '1.', _binary 0x746578747c64656661756c747c31313434, _binary 0x64656661756c74, 'text', _binary 0x31313434, NULL, NULL, '[]', 5, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(930, 84, '1.', _binary 0x746578747c64656661756c747c31313435, _binary 0x64656661756c74, 'text', _binary 0x31313435, NULL, NULL, '[]', 6, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup');
/*!40000 ALTER TABLE `mshop_product_list` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_product_list_type
CREATE TABLE IF NOT EXISTS `mshop_product_list_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msprolity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msprolity_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msprolity_sid_label` (`siteid`,`label`),
  KEY `idx_msprolity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_product_list_type: ~12 rows (aproximadamente)
DELETE FROM `mshop_product_list_type`;
/*!40000 ALTER TABLE `mshop_product_list_type` DISABLE KEYS */;
INSERT INTO `mshop_product_list_type` (`id`, `siteid`, `domain`, `code`, `label`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', 'attribute', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(2, '1.', 'attribute', _binary 0x636f6e666967, 'Configurable', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(3, '1.', 'attribute', _binary 0x76617269616e74, 'Variant', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(4, '1.', 'attribute', _binary 0x68696464656e, 'Hidden', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(5, '1.', 'attribute', _binary 0x637573746f6d, 'Custom value', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(6, '1.', 'media', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(7, '1.', 'price', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(8, '1.', 'product', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(9, '1.', 'product', _binary 0x73756767657374696f6e, 'Suggestion', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(10, '1.', 'product', _binary 0x626f756768742d746f676574686572, 'Bought together', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(11, '1.', 'tag', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(12, '1.', 'text', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup');
/*!40000 ALTER TABLE `mshop_product_list_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_product_property
CREATE TABLE IF NOT EXISTS `mshop_product_property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` int NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varbinary(103) NOT NULL DEFAULT '',
  `type` varbinary(64) NOT NULL,
  `langid` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mspropr_sid_ty_lid_value` (`parentid`,`siteid`,`type`,`langid`,`value`),
  KEY `fk_mspropr_key_sid` (`key`,`siteid`),
  KEY `fk_mspropr_pid` (`parentid`),
  CONSTRAINT `fk_mspropr_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_product_property: ~4 rows (aproximadamente)
DELETE FROM `mshop_product_property`;
/*!40000 ALTER TABLE `mshop_product_property` DISABLE KEYS */;
INSERT INTO `mshop_product_property` (`id`, `parentid`, `siteid`, `key`, `type`, `langid`, `value`, `mtime`, `ctime`, `editor`) VALUES
	(21, 71, '1.', _binary 0x7061636b6167652d6c656e6774687c6e756c6c7c6238623938616161363137316135623862363766353965316564663936636566, _binary 0x7061636b6167652d6c656e677468, NULL, '20.00', '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(22, 71, '1.', _binary 0x7061636b6167652d77696474687c6e756c6c7c3834393664663736666331363063303366386539356236313731393930336230, _binary 0x7061636b6167652d7769647468, NULL, '10.00', '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(23, 71, '1.', _binary 0x7061636b6167652d6865696768747c6e756c6c7c3531643732366237633534633763633938653164303932626538333836366631, _binary 0x7061636b6167652d686569676874, NULL, '5.00', '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(24, 71, '1.', _binary 0x7061636b6167652d7765696768747c6e756c6c7c3832323134333562636365393133623563326463323265616636636236353930, _binary 0x7061636b6167652d776569676874, NULL, '2.5', '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup');
/*!40000 ALTER TABLE `mshop_product_property` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_product_property_type
CREATE TABLE IF NOT EXISTS `mshop_product_property_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msproprty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msproprty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msproprty_sid_label` (`siteid`,`label`),
  KEY `idx_msproprty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_product_property_type: ~4 rows (aproximadamente)
DELETE FROM `mshop_product_property_type`;
/*!40000 ALTER TABLE `mshop_product_property_type` DISABLE KEYS */;
INSERT INTO `mshop_product_property_type` (`id`, `siteid`, `domain`, `code`, `label`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', 'product', _binary 0x7061636b6167652d686569676874, 'Package height', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(2, '1.', 'product', _binary 0x7061636b6167652d6c656e677468, 'Package length', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(3, '1.', 'product', _binary 0x7061636b6167652d7769647468, 'Package width', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(4, '1.', 'product', _binary 0x7061636b6167652d776569676874, 'Package weight', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup');
/*!40000 ALTER TABLE `mshop_product_property_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_product_type
CREATE TABLE IF NOT EXISTS `mshop_product_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msproty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msproty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msproty_sid_label` (`siteid`,`label`),
  KEY `idx_msproty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_product_type: ~6 rows (aproximadamente)
DELETE FROM `mshop_product_type`;
/*!40000 ALTER TABLE `mshop_product_type` DISABLE KEYS */;
INSERT INTO `mshop_product_type` (`id`, `siteid`, `domain`, `code`, `label`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', 'product', _binary 0x64656661756c74, 'Article', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(2, '1.', 'product', _binary 0x62756e646c65, 'Bundle', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(3, '1.', 'product', _binary 0x6576656e74, 'Event', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(4, '1.', 'product', _binary 0x67726f7570, 'Group', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(5, '1.', 'product', _binary 0x73656c656374, 'Selection', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(6, '1.', 'product', _binary 0x766f7563686572, 'Voucher', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup');
/*!40000 ALTER TABLE `mshop_product_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_review
CREATE TABLE IF NOT EXISTS `mshop_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customerid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordprodid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL,
  `rating` smallint NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msrev_sid_cid_dom_rid` (`siteid`,`customerid`,`domain`,`refid`),
  KEY `idx_msrev_sid_dom_rid_sta_ct` (`siteid`,`domain`,`refid`,`status`,`ctime`),
  KEY `idx_msrev_sid_dom_rid_sta_rate` (`siteid`,`domain`,`refid`,`status`,`rating`),
  KEY `idx_msrev_sid_dom_cid_mt` (`siteid`,`domain`,`customerid`,`mtime`),
  KEY `idx_msrev_sid_rate_dom` (`siteid`,`rating`,`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_review: ~0 rows (aproximadamente)
DELETE FROM `mshop_review`;
/*!40000 ALTER TABLE `mshop_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_review` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_rule
CREATE TABLE IF NOT EXISTS `mshop_rule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `pos` int NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msrul_sid_prov` (`siteid`,`provider`),
  KEY `idx_msrul_sid_status` (`siteid`,`status`),
  KEY `idx_msrul_sid_label` (`siteid`,`label`),
  KEY `idx_msrul_sid_pos` (`siteid`,`pos`),
  KEY `idx_msrul_sid_start` (`siteid`,`start`),
  KEY `idx_msrul_sid_end` (`siteid`,`end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_rule: ~0 rows (aproximadamente)
DELETE FROM `mshop_rule`;
/*!40000 ALTER TABLE `mshop_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_rule` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_rule_type
CREATE TABLE IF NOT EXISTS `mshop_rule_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msrulty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msrulty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msrulty_sid_label` (`siteid`,`label`),
  KEY `idx_msrulty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_rule_type: ~1 rows (aproximadamente)
DELETE FROM `mshop_rule_type`;
/*!40000 ALTER TABLE `mshop_rule_type` DISABLE KEYS */;
INSERT INTO `mshop_rule_type` (`id`, `siteid`, `domain`, `code`, `label`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', 'rule', _binary 0x636174616c6f67, 'Catalog', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup');
/*!40000 ALTER TABLE `mshop_rule_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_service
CREATE TABLE IF NOT EXISTS `mshop_service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varbinary(64) NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msser_siteid_code` (`siteid`,`code`),
  KEY `idx_msser_sid_stat_start_end` (`siteid`,`status`,`start`,`end`),
  KEY `idx_msser_sid_prov` (`siteid`,`provider`),
  KEY `idx_msser_sid_code` (`siteid`,`code`),
  KEY `idx_msser_sid_label` (`siteid`,`label`),
  KEY `idx_msser_sid_pos` (`siteid`,`pos`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_service: ~10 rows (aproximadamente)
DELETE FROM `mshop_service`;
/*!40000 ALTER TABLE `mshop_service` DISABLE KEYS */;
INSERT INTO `mshop_service` (`id`, `siteid`, `type`, `code`, `label`, `provider`, `start`, `end`, `config`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(51, '1.', _binary 0x64656c6976657279, _binary 0x64656d6f2d7069636b7570, 'Click & Collect', 'Standard,Time,Supplier', NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(52, '1.', _binary 0x64656c6976657279, _binary 0x64656d6f2d64686c, 'DHL', 'Standard', NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(53, '1.', _binary 0x64656c6976657279, _binary 0x64656d6f2d64686c65787072657373, 'DHL Express', 'Standard', NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(54, '1.', _binary 0x64656c6976657279, _binary 0x64656d6f2d6665646578, 'Fedex', 'Standard', NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(55, '1.', _binary 0x64656c6976657279, _binary 0x64656d6f2d746e74, 'TNT', 'Standard', NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(56, '1.', _binary 0x7061796d656e74, _binary 0x64656d6f2d696e766f696365, 'Invoice', 'PostPay', NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(57, '1.', _binary 0x7061796d656e74, _binary 0x64656d6f2d73657061, 'Direct debit', 'DirectDebit', NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(58, '1.', _binary 0x7061796d656e74, _binary 0x64656d6f2d70617970616c, 'PayPal', 'PayPalExpress', NULL, NULL, '{"paypalexpress.AccountEmail":"selling2@metaways.de","paypalexpress.ApiUsername":"unit_1340199666_biz_api1.yahoo.de","paypalexpress.ApiPassword":"1340199685","paypalexpress.ApiSignature":"A34BfbVoMVoHt7Sf8BlufLXS8tKcAVxmJoDiDUgBjWi455pJoZXGoJ87","paypalexpress.PaypalUrl":"https:\\/\\/www.sandbox.paypal.com\\/webscr&cmd=_express-checkout&useraction=commit&token=%1$s","paypalexpress.ApiEndpoint":"https:\\/\\/api-3t.sandbox.paypal.com\\/nvp"}', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(59, '1.', _binary 0x7061796d656e74, _binary 0x64656d6f2d636173686f6e64656c6976657279, 'Cash on delivery', 'PostPay', NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(60, '1.', _binary 0x7061796d656e74, _binary 0x64656d6f2d707265706179, 'Prepayment', 'PrePay,Reduction', NULL, NULL, '{"reduction.basket-value-min":{"EUR":"200.00"},"reduction.percent":3}', 4, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup');
/*!40000 ALTER TABLE `mshop_service` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_service_list
CREATE TABLE IF NOT EXISTS `mshop_service_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` int NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varbinary(134) NOT NULL DEFAULT '',
  `type` varbinary(64) NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refid` varbinary(36) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msserli_pid_dm_sid_ty_rid` (`parentid`,`domain`,`siteid`,`type`,`refid`),
  KEY `idx_msserli_key_sid` (`key`,`siteid`),
  KEY `fk_msserli_pid` (`parentid`),
  CONSTRAINT `fk_msserli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=445 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_service_list: ~74 rows (aproximadamente)
DELETE FROM `mshop_service_list`;
/*!40000 ALTER TABLE `mshop_service_list` DISABLE KEYS */;
INSERT INTO `mshop_service_list` (`id`, `parentid`, `siteid`, `key`, `type`, `domain`, `refid`, `start`, `end`, `config`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(371, 51, '1.', _binary 0x6d656469617c64656661756c747c323238, _binary 0x64656661756c74, 'media', _binary 0x323238, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(372, 51, '1.', _binary 0x70726963657c64656661756c747c333431, _binary 0x64656661756c74, 'price', _binary 0x333431, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(373, 51, '1.', _binary 0x70726963657c64656661756c747c333432, _binary 0x64656661756c74, 'price', _binary 0x333432, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(374, 51, '1.', _binary 0x746578747c64656661756c747c31313632, _binary 0x64656661756c74, 'text', _binary 0x31313632, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(375, 51, '1.', _binary 0x746578747c64656661756c747c31313633, _binary 0x64656661756c74, 'text', _binary 0x31313633, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(376, 51, '1.', _binary 0x746578747c64656661756c747c31313634, _binary 0x64656661756c74, 'text', _binary 0x31313634, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(377, 51, '1.', _binary 0x746578747c64656661756c747c31313635, _binary 0x64656661756c74, 'text', _binary 0x31313635, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(378, 52, '1.', _binary 0x6d656469617c64656661756c747c323239, _binary 0x64656661756c74, 'media', _binary 0x323239, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(379, 52, '1.', _binary 0x70726963657c64656661756c747c333433, _binary 0x64656661756c74, 'price', _binary 0x333433, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(380, 52, '1.', _binary 0x70726963657c64656661756c747c333434, _binary 0x64656661756c74, 'price', _binary 0x333434, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(381, 52, '1.', _binary 0x746578747c64656661756c747c31313636, _binary 0x64656661756c74, 'text', _binary 0x31313636, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(382, 52, '1.', _binary 0x746578747c64656661756c747c31313637, _binary 0x64656661756c74, 'text', _binary 0x31313637, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(383, 52, '1.', _binary 0x746578747c64656661756c747c31313638, _binary 0x64656661756c74, 'text', _binary 0x31313638, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(384, 52, '1.', _binary 0x746578747c64656661756c747c31313639, _binary 0x64656661756c74, 'text', _binary 0x31313639, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(385, 53, '1.', _binary 0x6d656469617c64656661756c747c323330, _binary 0x64656661756c74, 'media', _binary 0x323330, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(386, 53, '1.', _binary 0x70726963657c64656661756c747c333435, _binary 0x64656661756c74, 'price', _binary 0x333435, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(387, 53, '1.', _binary 0x70726963657c64656661756c747c333436, _binary 0x64656661756c74, 'price', _binary 0x333436, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(388, 53, '1.', _binary 0x746578747c64656661756c747c31313730, _binary 0x64656661756c74, 'text', _binary 0x31313730, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(389, 53, '1.', _binary 0x746578747c64656661756c747c31313731, _binary 0x64656661756c74, 'text', _binary 0x31313731, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(390, 53, '1.', _binary 0x746578747c64656661756c747c31313732, _binary 0x64656661756c74, 'text', _binary 0x31313732, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(391, 53, '1.', _binary 0x746578747c64656661756c747c31313733, _binary 0x64656661756c74, 'text', _binary 0x31313733, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(392, 54, '1.', _binary 0x6d656469617c64656661756c747c323331, _binary 0x64656661756c74, 'media', _binary 0x323331, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(393, 54, '1.', _binary 0x70726963657c64656661756c747c333437, _binary 0x64656661756c74, 'price', _binary 0x333437, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(394, 54, '1.', _binary 0x70726963657c64656661756c747c333438, _binary 0x64656661756c74, 'price', _binary 0x333438, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(395, 54, '1.', _binary 0x746578747c64656661756c747c31313734, _binary 0x64656661756c74, 'text', _binary 0x31313734, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(396, 54, '1.', _binary 0x746578747c64656661756c747c31313735, _binary 0x64656661756c74, 'text', _binary 0x31313735, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(397, 54, '1.', _binary 0x746578747c64656661756c747c31313736, _binary 0x64656661756c74, 'text', _binary 0x31313736, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(398, 54, '1.', _binary 0x746578747c64656661756c747c31313737, _binary 0x64656661756c74, 'text', _binary 0x31313737, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(399, 55, '1.', _binary 0x6d656469617c64656661756c747c323332, _binary 0x64656661756c74, 'media', _binary 0x323332, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(400, 55, '1.', _binary 0x70726963657c64656661756c747c333439, _binary 0x64656661756c74, 'price', _binary 0x333439, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(401, 55, '1.', _binary 0x70726963657c64656661756c747c333530, _binary 0x64656661756c74, 'price', _binary 0x333530, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(402, 55, '1.', _binary 0x746578747c64656661756c747c31313738, _binary 0x64656661756c74, 'text', _binary 0x31313738, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(403, 55, '1.', _binary 0x746578747c64656661756c747c31313739, _binary 0x64656661756c74, 'text', _binary 0x31313739, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(404, 55, '1.', _binary 0x746578747c64656661756c747c31313830, _binary 0x64656661756c74, 'text', _binary 0x31313830, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(405, 55, '1.', _binary 0x746578747c64656661756c747c31313831, _binary 0x64656661756c74, 'text', _binary 0x31313831, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(406, 56, '1.', _binary 0x6d656469617c64656661756c747c323333, _binary 0x64656661756c74, 'media', _binary 0x323333, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(407, 56, '1.', _binary 0x70726963657c64656661756c747c333531, _binary 0x64656661756c74, 'price', _binary 0x333531, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(408, 56, '1.', _binary 0x70726963657c64656661756c747c333532, _binary 0x64656661756c74, 'price', _binary 0x333532, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(409, 56, '1.', _binary 0x746578747c64656661756c747c31313832, _binary 0x64656661756c74, 'text', _binary 0x31313832, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(410, 56, '1.', _binary 0x746578747c64656661756c747c31313833, _binary 0x64656661756c74, 'text', _binary 0x31313833, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(411, 56, '1.', _binary 0x746578747c64656661756c747c31313834, _binary 0x64656661756c74, 'text', _binary 0x31313834, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(412, 56, '1.', _binary 0x746578747c64656661756c747c31313835, _binary 0x64656661756c74, 'text', _binary 0x31313835, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(413, 56, '1.', _binary 0x746578747c64656661756c747c31313836, _binary 0x64656661756c74, 'text', _binary 0x31313836, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(414, 57, '1.', _binary 0x6d656469617c64656661756c747c323334, _binary 0x64656661756c74, 'media', _binary 0x323334, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(415, 57, '1.', _binary 0x6d656469617c64656661756c747c323335, _binary 0x64656661756c74, 'media', _binary 0x323335, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(416, 57, '1.', _binary 0x70726963657c64656661756c747c333533, _binary 0x64656661756c74, 'price', _binary 0x333533, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(417, 57, '1.', _binary 0x70726963657c64656661756c747c333534, _binary 0x64656661756c74, 'price', _binary 0x333534, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(418, 57, '1.', _binary 0x746578747c64656661756c747c31313837, _binary 0x64656661756c74, 'text', _binary 0x31313837, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(419, 57, '1.', _binary 0x746578747c64656661756c747c31313838, _binary 0x64656661756c74, 'text', _binary 0x31313838, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(420, 57, '1.', _binary 0x746578747c64656661756c747c31313839, _binary 0x64656661756c74, 'text', _binary 0x31313839, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(421, 57, '1.', _binary 0x746578747c64656661756c747c31313930, _binary 0x64656661756c74, 'text', _binary 0x31313930, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(422, 57, '1.', _binary 0x746578747c64656661756c747c31313931, _binary 0x64656661756c74, 'text', _binary 0x31313931, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(423, 58, '1.', _binary 0x6d656469617c64656661756c747c323336, _binary 0x64656661756c74, 'media', _binary 0x323336, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(424, 58, '1.', _binary 0x70726963657c64656661756c747c333535, _binary 0x64656661756c74, 'price', _binary 0x333535, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(425, 58, '1.', _binary 0x70726963657c64656661756c747c333536, _binary 0x64656661756c74, 'price', _binary 0x333536, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(426, 58, '1.', _binary 0x746578747c64656661756c747c31313932, _binary 0x64656661756c74, 'text', _binary 0x31313932, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(427, 58, '1.', _binary 0x746578747c64656661756c747c31313933, _binary 0x64656661756c74, 'text', _binary 0x31313933, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(428, 58, '1.', _binary 0x746578747c64656661756c747c31313934, _binary 0x64656661756c74, 'text', _binary 0x31313934, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(429, 58, '1.', _binary 0x746578747c64656661756c747c31313935, _binary 0x64656661756c74, 'text', _binary 0x31313935, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(430, 59, '1.', _binary 0x6d656469617c64656661756c747c323337, _binary 0x64656661756c74, 'media', _binary 0x323337, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(431, 59, '1.', _binary 0x70726963657c64656661756c747c333537, _binary 0x64656661756c74, 'price', _binary 0x333537, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(432, 59, '1.', _binary 0x70726963657c64656661756c747c333538, _binary 0x64656661756c74, 'price', _binary 0x333538, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(433, 59, '1.', _binary 0x746578747c64656661756c747c31313936, _binary 0x64656661756c74, 'text', _binary 0x31313936, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(434, 59, '1.', _binary 0x746578747c64656661756c747c31313937, _binary 0x64656661756c74, 'text', _binary 0x31313937, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(435, 59, '1.', _binary 0x746578747c64656661756c747c31313938, _binary 0x64656661756c74, 'text', _binary 0x31313938, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(436, 59, '1.', _binary 0x746578747c64656661756c747c31313939, _binary 0x64656661756c74, 'text', _binary 0x31313939, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(437, 60, '1.', _binary 0x6d656469617c64656661756c747c323338, _binary 0x64656661756c74, 'media', _binary 0x323338, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(438, 60, '1.', _binary 0x70726963657c64656661756c747c333539, _binary 0x64656661756c74, 'price', _binary 0x333539, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(439, 60, '1.', _binary 0x70726963657c64656661756c747c333630, _binary 0x64656661756c74, 'price', _binary 0x333630, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(440, 60, '1.', _binary 0x746578747c64656661756c747c31323030, _binary 0x64656661756c74, 'text', _binary 0x31323030, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(441, 60, '1.', _binary 0x746578747c64656661756c747c31323031, _binary 0x64656661756c74, 'text', _binary 0x31323031, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(442, 60, '1.', _binary 0x746578747c64656661756c747c31323032, _binary 0x64656661756c74, 'text', _binary 0x31323032, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(443, 60, '1.', _binary 0x746578747c64656661756c747c31323033, _binary 0x64656661756c74, 'text', _binary 0x31323033, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(444, 60, '1.', _binary 0x746578747c64656661756c747c31323034, _binary 0x64656661756c74, 'text', _binary 0x31323034, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup');
/*!40000 ALTER TABLE `mshop_service_list` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_service_list_type
CREATE TABLE IF NOT EXISTS `mshop_service_list_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msserlity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msserlity_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msserlity_sid_label` (`siteid`,`label`),
  KEY `idx_msserlity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_service_list_type: ~3 rows (aproximadamente)
DELETE FROM `mshop_service_list_type`;
/*!40000 ALTER TABLE `mshop_service_list_type` DISABLE KEYS */;
INSERT INTO `mshop_service_list_type` (`id`, `siteid`, `domain`, `code`, `label`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', 'media', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(2, '1.', 'price', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(3, '1.', 'text', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup');
/*!40000 ALTER TABLE `mshop_service_list_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_service_type
CREATE TABLE IF NOT EXISTS `mshop_service_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msserty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msserty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msserty_sid_label` (`siteid`,`label`),
  KEY `idx_msserty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_service_type: ~2 rows (aproximadamente)
DELETE FROM `mshop_service_type`;
/*!40000 ALTER TABLE `mshop_service_type` DISABLE KEYS */;
INSERT INTO `mshop_service_type` (`id`, `siteid`, `domain`, `code`, `label`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', 'service', _binary 0x7061796d656e74, 'Payment', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(2, '1.', 'service', _binary 0x64656c6976657279, 'Delivery', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup');
/*!40000 ALTER TABLE `mshop_service_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_stock
CREATE TABLE IF NOT EXISTS `mshop_stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prodid` varbinary(36) NOT NULL,
  `type` varbinary(64) NOT NULL,
  `stocklevel` int DEFAULT NULL,
  `backdate` datetime DEFAULT NULL,
  `timeframe` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mssto_sid_pid_ty` (`siteid`,`prodid`,`type`),
  KEY `idx_mssto_sid_stocklevel` (`siteid`,`stocklevel`),
  KEY `idx_mssto_sid_backdate` (`siteid`,`backdate`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_stock: ~14 rows (aproximadamente)
DELETE FROM `mshop_stock`;
/*!40000 ALTER TABLE `mshop_stock` DISABLE KEYS */;
INSERT INTO `mshop_stock` (`id`, `siteid`, `prodid`, `type`, `stocklevel`, `backdate`, `timeframe`, `mtime`, `ctime`, `editor`) VALUES
	(71, '1.', _binary 0x3731, _binary 0x64656661756c74, NULL, NULL, '', '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(72, '1.', _binary 0x3732, _binary 0x64656661756c74, 5, NULL, '', '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(73, '1.', _binary 0x3733, _binary 0x64656661756c74, 0, '2015-01-01 12:00:00', '', '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(74, '1.', _binary 0x3734, _binary 0x64656661756c74, 5, NULL, '', '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(75, '1.', _binary 0x3735, _binary 0x64656661756c74, 10, NULL, '', '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(76, '1.', _binary 0x3736, _binary 0x64656661756c74, NULL, NULL, '', '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(77, '1.', _binary 0x3737, _binary 0x64656661756c74, NULL, NULL, '', '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(78, '1.', _binary 0x3738, _binary 0x64656661756c74, NULL, NULL, '', '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(79, '1.', _binary 0x3739, _binary 0x64656661756c74, NULL, NULL, '', '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(80, '1.', _binary 0x3830, _binary 0x64656661756c74, NULL, NULL, '', '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(81, '1.', _binary 0x3831, _binary 0x64656661756c74, NULL, NULL, '', '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(82, '1.', _binary 0x3832, _binary 0x64656661756c74, NULL, NULL, '', '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(83, '1.', _binary 0x3833, _binary 0x64656661756c74, NULL, NULL, '', '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(84, '1.', _binary 0x3834, _binary 0x64656661756c74, NULL, NULL, '', '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup');
/*!40000 ALTER TABLE `mshop_stock` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_stock_type
CREATE TABLE IF NOT EXISTS `mshop_stock_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msstoty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msstoty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msstoty_sid_label` (`siteid`,`label`),
  KEY `idx_msstoty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_stock_type: ~1 rows (aproximadamente)
DELETE FROM `mshop_stock_type`;
/*!40000 ALTER TABLE `mshop_stock_type` DISABLE KEYS */;
INSERT INTO `mshop_stock_type` (`id`, `siteid`, `domain`, `code`, `label`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', 'product', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup');
/*!40000 ALTER TABLE `mshop_stock_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_subscription
CREATE TABLE IF NOT EXISTS `mshop_subscription` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `baseid` bigint NOT NULL,
  `ordprodid` bigint NOT NULL,
  `next` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `productid` varbinary(36) NOT NULL DEFAULT '',
  `interval` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` smallint DEFAULT NULL,
  `period` smallint NOT NULL DEFAULT '0',
  `status` smallint NOT NULL DEFAULT '0',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mssub_sid_next_stat` (`siteid`,`next`,`status`),
  KEY `idx_mssub_sid_baseid` (`siteid`,`baseid`),
  KEY `idx_mssub_sid_opid` (`siteid`,`ordprodid`),
  KEY `idx_mssub_sid_pid_period` (`siteid`,`productid`,`period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_subscription: ~0 rows (aproximadamente)
DELETE FROM `mshop_subscription`;
/*!40000 ALTER TABLE `mshop_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_subscription` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_supplier
CREATE TABLE IF NOT EXISTS `mshop_supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(255) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mssup_sid_code` (`siteid`,`code`),
  KEY `idx_mssup_sid_status` (`siteid`,`status`),
  KEY `idx_mssup_sid_label` (`siteid`,`label`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_supplier: ~2 rows (aproximadamente)
DELETE FROM `mshop_supplier`;
/*!40000 ALTER TABLE `mshop_supplier` DISABLE KEYS */;
INSERT INTO `mshop_supplier` (`id`, `siteid`, `code`, `label`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(11, '1.', _binary 0x64656d6f2d7465737431, 'Test supplier 1', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(12, '1.', _binary 0x64656d6f2d7465737432, 'Test supplier 2', 1, '2022-03-10 02:07:32', '2022-03-10 02:07:32', 'core:setup');
/*!40000 ALTER TABLE `mshop_supplier` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_supplier_address
CREATE TABLE IF NOT EXISTS `mshop_supplier_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` int NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vatid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salutation` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address3` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `countryid` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefax` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `pos` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mssupad_sid_rid` (`siteid`,`parentid`),
  KEY `fk_mssupad_pid` (`parentid`),
  CONSTRAINT `fk_mssupad_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_supplier_address: ~2 rows (aproximadamente)
DELETE FROM `mshop_supplier_address`;
/*!40000 ALTER TABLE `mshop_supplier_address` DISABLE KEYS */;
INSERT INTO `mshop_supplier_address` (`id`, `parentid`, `siteid`, `company`, `vatid`, `salutation`, `title`, `firstname`, `lastname`, `address1`, `address2`, `address3`, `postal`, `city`, `state`, `langid`, `countryid`, `telephone`, `telefax`, `email`, `website`, `longitude`, `latitude`, `birthday`, `pos`, `mtime`, `ctime`, `editor`) VALUES
	(11, 11, '1.', 'Test company', 'DE999999999', 'company', '', '', '', 'Test street', '1', '', '10000', 'Test city', 'NY', NULL, 'US', '', '', 'demo1@example.com', '', NULL, NULL, NULL, 0, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(12, 12, '1.', 'Test company', 'DE999999999', 'company', '', '', '', 'Test road', '10', '', '20000', 'Test town', 'NY', NULL, 'US', '', '', 'demo2@example.com', '', NULL, NULL, NULL, 0, '2022-03-10 02:07:32', '2022-03-10 02:07:32', 'core:setup');
/*!40000 ALTER TABLE `mshop_supplier_address` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_supplier_list
CREATE TABLE IF NOT EXISTS `mshop_supplier_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` int NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varbinary(134) NOT NULL DEFAULT '',
  `type` varbinary(64) NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refid` varbinary(36) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mssupli_pid_dm_sid_ty_rid` (`parentid`,`domain`,`siteid`,`type`,`refid`),
  KEY `idx_mssupli_pid_dm_sid_pos_rid` (`parentid`,`domain`,`siteid`,`pos`,`refid`),
  KEY `idx_mssupli_rid_dom_sid_ty` (`refid`,`domain`,`siteid`,`type`),
  KEY `idx_mssupli_key_sid` (`key`,`siteid`),
  KEY `fk_mssupli_pid` (`parentid`),
  CONSTRAINT `fk_mssupli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_supplier_list: ~20 rows (aproximadamente)
DELETE FROM `mshop_supplier_list`;
/*!40000 ALTER TABLE `mshop_supplier_list` DISABLE KEYS */;
INSERT INTO `mshop_supplier_list` (`id`, `parentid`, `siteid`, `key`, `type`, `domain`, `refid`, `start`, `end`, `config`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(101, 11, '1.', _binary 0x6d656469617c64656661756c747c323339, _binary 0x64656661756c74, 'media', _binary 0x323339, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(102, 11, '1.', _binary 0x746578747c64656661756c747c31323035, _binary 0x64656661756c74, 'text', _binary 0x31323035, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(103, 11, '1.', _binary 0x746578747c64656661756c747c31323036, _binary 0x64656661756c74, 'text', _binary 0x31323036, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(104, 11, '1.', _binary 0x746578747c64656661756c747c31323037, _binary 0x64656661756c74, 'text', _binary 0x31323037, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(105, 11, '1.', _binary 0x746578747c64656661756c747c31323038, _binary 0x64656661756c74, 'text', _binary 0x31323038, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(106, 11, '1.', _binary 0x746578747c64656661756c747c31323039, _binary 0x64656661756c74, 'text', _binary 0x31323039, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(107, 11, '1.', _binary 0x746578747c64656661756c747c31323130, _binary 0x64656661756c74, 'text', _binary 0x31323130, NULL, NULL, '[]', 5, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(108, 11, '1.', _binary 0x746578747c64656661756c747c31323131, _binary 0x64656661756c74, 'text', _binary 0x31323131, NULL, NULL, '[]', 6, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(109, 11, '1.', _binary 0x70726f647563747c64656661756c747c3731, _binary 0x64656661756c74, 'product', _binary 0x3731, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(110, 11, '1.', _binary 0x70726f647563747c64656661756c747c3734, _binary 0x64656661756c74, 'product', _binary 0x3734, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(111, 12, '1.', _binary 0x6d656469617c64656661756c747c323430, _binary 0x64656661756c74, 'media', _binary 0x323430, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:32', '2022-03-10 02:07:32', 'core:setup'),
	(112, 12, '1.', _binary 0x746578747c64656661756c747c31323132, _binary 0x64656661756c74, 'text', _binary 0x31323132, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:32', '2022-03-10 02:07:32', 'core:setup'),
	(113, 12, '1.', _binary 0x746578747c64656661756c747c31323133, _binary 0x64656661756c74, 'text', _binary 0x31323133, NULL, NULL, '[]', 1, 1, '2022-03-10 02:07:32', '2022-03-10 02:07:32', 'core:setup'),
	(114, 12, '1.', _binary 0x746578747c64656661756c747c31323134, _binary 0x64656661756c74, 'text', _binary 0x31323134, NULL, NULL, '[]', 2, 1, '2022-03-10 02:07:32', '2022-03-10 02:07:32', 'core:setup'),
	(115, 12, '1.', _binary 0x746578747c64656661756c747c31323135, _binary 0x64656661756c74, 'text', _binary 0x31323135, NULL, NULL, '[]', 3, 1, '2022-03-10 02:07:32', '2022-03-10 02:07:32', 'core:setup'),
	(116, 12, '1.', _binary 0x746578747c64656661756c747c31323136, _binary 0x64656661756c74, 'text', _binary 0x31323136, NULL, NULL, '[]', 4, 1, '2022-03-10 02:07:32', '2022-03-10 02:07:32', 'core:setup'),
	(117, 12, '1.', _binary 0x746578747c64656661756c747c31323137, _binary 0x64656661756c74, 'text', _binary 0x31323137, NULL, NULL, '[]', 5, 1, '2022-03-10 02:07:32', '2022-03-10 02:07:32', 'core:setup'),
	(118, 12, '1.', _binary 0x746578747c64656661756c747c31323138, _binary 0x64656661756c74, 'text', _binary 0x31323138, NULL, NULL, '[]', 6, 1, '2022-03-10 02:07:32', '2022-03-10 02:07:32', 'core:setup'),
	(119, 12, '1.', _binary 0x70726f647563747c64656661756c747c3734, _binary 0x64656661756c74, 'product', _binary 0x3734, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:32', '2022-03-10 02:07:32', 'core:setup'),
	(120, 12, '1.', _binary 0x70726f647563747c64656661756c747c3735, _binary 0x64656661756c74, 'product', _binary 0x3735, NULL, NULL, '[]', 0, 1, '2022-03-10 02:07:32', '2022-03-10 02:07:32', 'core:setup');
/*!40000 ALTER TABLE `mshop_supplier_list` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_supplier_list_type
CREATE TABLE IF NOT EXISTS `mshop_supplier_list_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mssuplity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mssuplity_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_mssuplity_sid_label` (`siteid`,`label`),
  KEY `idx_mssuplity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_supplier_list_type: ~5 rows (aproximadamente)
DELETE FROM `mshop_supplier_list_type`;
/*!40000 ALTER TABLE `mshop_supplier_list_type` DISABLE KEYS */;
INSERT INTO `mshop_supplier_list_type` (`id`, `siteid`, `domain`, `code`, `label`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', 'attribute', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(2, '1.', 'product', _binary 0x70726f6d6f74696f6e, 'Promotion', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(3, '1.', 'product', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(4, '1.', 'media', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(5, '1.', 'text', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup');
/*!40000 ALTER TABLE `mshop_supplier_list_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_tag
CREATE TABLE IF NOT EXISTS `mshop_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varbinary(64) NOT NULL,
  `langid` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mstag_sid_dom_ty_lid_lab` (`siteid`,`domain`,`type`,`langid`,`label`),
  KEY `idx_mstag_sid_dom_langid` (`siteid`,`domain`,`langid`),
  KEY `idx_mstag_sid_dom_label` (`siteid`,`domain`,`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_tag: ~0 rows (aproximadamente)
DELETE FROM `mshop_tag`;
/*!40000 ALTER TABLE `mshop_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_tag` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_tag_type
CREATE TABLE IF NOT EXISTS `mshop_tag_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mstagty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mstagty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_mstagty_sid_label` (`siteid`,`label`),
  KEY `idx_mstagty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_tag_type: ~2 rows (aproximadamente)
DELETE FROM `mshop_tag_type`;
/*!40000 ALTER TABLE `mshop_tag_type` DISABLE KEYS */;
INSERT INTO `mshop_tag_type` (`id`, `siteid`, `domain`, `code`, `label`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', 'catalog', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(2, '1.', 'product', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup');
/*!40000 ALTER TABLE `mshop_tag_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_text
CREATE TABLE IF NOT EXISTS `mshop_text` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varbinary(64) NOT NULL,
  `langid` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mstex_sid_domain_status` (`siteid`,`domain`,`status`),
  KEY `idx_mstex_sid_domain_langid` (`siteid`,`domain`,`langid`),
  KEY `idx_mstex_sid_dom_label` (`siteid`,`domain`,`label`),
  KEY `idx_mstex_sid_dom_cont` (`siteid`,`domain`,`content`(255))
) ENGINE=InnoDB AUTO_INCREMENT=1219 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_text: ~553 rows (aproximadamente)
DELETE FROM `mshop_text`;
/*!40000 ALTER TABLE `mshop_text` DISABLE KEYS */;
INSERT INTO `mshop_text` (`id`, `siteid`, `type`, `langid`, `domain`, `label`, `content`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Schwarz', 'Schwarz', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(2, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Black', 'Black', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(3, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Schwarz', 'Schwarz', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(4, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Black', 'Black', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(5, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kleiner Aufdruck', 'Kleiner Aufdruck', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(6, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Small print', 'Small print', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(7, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Kleiner Aufdruck', 'Kleiner-Aufdruck', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(8, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Small print', 'small-print', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(9, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kleiner Aufdruck', 'Text Aufdruck', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(10, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Small print', 'print text', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(11, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Ein Monat', '1 Monat', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(12, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: One Month', '1 month', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(13, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Ein Jahr', '1 Jahr', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(14, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: One year', '1 year', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(15, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Grosser Aufdruck', 'Grosser Aufdruck', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(16, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Large print', 'Large print', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(17, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Grosser Aufdruck', 'Grosser-Aufdruck', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(18, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Large print', 'large-print', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(26, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Blau', 'Blau', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(27, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Blau', 'Blau', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(28, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Blue', 'Blue', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(29, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Blue', 'blue', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(30, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Width 32', '32', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(31, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url: Width 32', 'Weite-32', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(32, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url: Width 32', 'width-32', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(33, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Length 34', '34', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(34, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url: Length 34', 'Länge-34', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(35, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url: Length 34', 'length-34', 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(36, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Beige', 'Beige', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(37, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Beige', 'Beige', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(38, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Beige', 'Beige', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(39, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Beige', 'beige', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(40, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Width 33', '33', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(41, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url: Width 33', 'Weite-33', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(42, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url: Width 33', 'width-33', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(43, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Length 36', '36', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(44, '1.', _binary 0x75726c, NULL, 'attribute', 'Demo url: Length 36', 'Länge-36', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(45, '1.', _binary 0x75726c, NULL, 'attribute', 'Demo url: Length 36', 'length-36', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(54, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kleines Etikett', 'Kleines Etikett', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(55, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Small sticker', 'Small sticker', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(56, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Kleines Etikett', 'Kleines-Etikett', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(57, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Small sticker', 'small-sticker', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(58, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Grosses Etikett', 'Großes Etikett', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(59, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Large sticker', 'Large sticker', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(60, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Grosses Etikett', 'Grosses-Etikett', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(61, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Large sticker', 'large-sticker', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(70, '1.', _binary 0x6e616d65, 'de', 'attribute', 'name/de: Gutscheinwert', 'Gutscheinwert', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(71, '1.', _binary 0x6e616d65, 'en', 'attribute', 'name/en: Voucher value', 'Voucher value', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(72, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kundendatum', 'Kundendatum', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(73, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Customer date', 'Customer date', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(138, '1.', _binary 0x73686f7274, 'de', 'catalog', 'Best seller kurz', '<p>Große Auswahl an TOP Sellern<br /><strong>BESTE Preise garantiert</strong></p>', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(139, '1.', _binary 0x73686f7274, 'en', 'catalog', 'Best seller short', '<p>LARGE selection of TOP sellers<br /><strong>BEST prices guaranteed</strong></p>', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(141, '1.', _binary 0x73686f7274, 'de', 'catalog', 'New arrivals kurz', '<p><strong>Sommer 2021</strong></p><p>Neue Collection eingetroffen</p>', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(142, '1.', _binary 0x73686f7274, 'en', 'catalog', 'New arrivals short', '<p><strong>Summer 2021</strong></p><p>New collection available</p>', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(144, '1.', _binary 0x73686f7274, 'de', 'catalog', 'Hot deals kurz', '<p>Bis zu <strong>30%</strong> Rabatt<br />auf ausgewählte Stücke</p>', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(145, '1.', _binary 0x73686f7274, 'en', 'catalog', 'Hot deals short', '<p>Up to <strong>30%</strong> discount<br />on selected items</p>', 1, '2022-03-10 01:12:50', '2022-03-10 01:12:50', 'core:setup'),
	(190, '1.', _binary 0x6e616d65, 'de', 'supplier', 'Demo name/de: Demo Händler', 'Demo-Händler', 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(191, '1.', _binary 0x73686f7274, 'de', 'supplier', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demo-Händlers', 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(192, '1.', _binary 0x6c6f6e67, 'de', 'supplier', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Lieferanten, die gerne etwas länger sein darf.', 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(193, '1.', _binary 0x6e616d65, 'en', 'supplier', 'Demo name/en: Demo supplier', 'Demo supplier', 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(194, '1.', _binary 0x73686f7274, 'en', 'supplier', 'Demo short/en: This is the short description', 'This is the short description of the demo supplier.', 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(195, '1.', _binary 0x6c6f6e67, 'en', 'supplier', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo supplier that may be a little bit longer.', 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(196, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'supplier', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(197, '1.', _binary 0x6e616d65, 'de', 'supplier', 'Demo name/de: Demo Händler 2', 'Demo-Händler 2', 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(198, '1.', _binary 0x73686f7274, 'de', 'supplier', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demo-Händlers 2', 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(199, '1.', _binary 0x6c6f6e67, 'de', 'supplier', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Lieferanten, die gerne etwas länger sein darf.', 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(200, '1.', _binary 0x6e616d65, 'en', 'supplier', 'Demo name/en: Demo supplier 2', 'Demo supplier 2', 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(201, '1.', _binary 0x73686f7274, 'en', 'supplier', 'Demo short/en: This is the short description', 'This is the short description of the demo article.', 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(202, '1.', _binary 0x6c6f6e67, 'en', 'supplier', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo article that may be a little bit longer.', 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(203, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'supplier', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 01:12:51', '2022-03-10 01:12:51', 'core:setup'),
	(204, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Schwarz', 'Schwarz', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(205, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Black', 'Black', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(206, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Schwarz', 'Schwarz', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(207, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Black', 'Black', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(208, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kleiner Aufdruck', 'Kleiner Aufdruck', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(209, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Small print', 'Small print', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(210, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Kleiner Aufdruck', 'Kleiner-Aufdruck', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(211, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Small print', 'small-print', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(212, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kleiner Aufdruck', 'Text Aufdruck', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(213, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Small print', 'print text', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(214, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Ein Monat', '1 Monat', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(215, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: One Month', '1 month', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(216, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Ein Jahr', '1 Jahr', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(217, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: One year', '1 year', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(218, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Grosser Aufdruck', 'Grosser Aufdruck', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(219, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Large print', 'Large print', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(220, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Grosser Aufdruck', 'Grosser-Aufdruck', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(221, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Large print', 'large-print', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(229, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Blau', 'Blau', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(230, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Blau', 'Blau', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(231, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Blue', 'Blue', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(232, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Blue', 'blue', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(233, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Width 32', '32', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(234, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url: Width 32', 'Weite-32', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(235, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url: Width 32', 'width-32', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(236, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Length 34', '34', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(237, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url: Length 34', 'Länge-34', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(238, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url: Length 34', 'length-34', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(239, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Beige', 'Beige', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(240, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Beige', 'Beige', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(241, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Beige', 'Beige', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(242, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Beige', 'beige', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(243, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Width 33', '33', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(244, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url: Width 33', 'Weite-33', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(245, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url: Width 33', 'width-33', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(246, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Length 36', '36', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(247, '1.', _binary 0x75726c, NULL, 'attribute', 'Demo url: Length 36', 'Länge-36', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(248, '1.', _binary 0x75726c, NULL, 'attribute', 'Demo url: Length 36', 'length-36', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(257, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kleines Etikett', 'Kleines Etikett', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(258, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Small sticker', 'Small sticker', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(259, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Kleines Etikett', 'Kleines-Etikett', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(260, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Small sticker', 'small-sticker', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(261, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Grosses Etikett', 'Großes Etikett', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(262, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Large sticker', 'Large sticker', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(263, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Grosses Etikett', 'Grosses-Etikett', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(264, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Large sticker', 'large-sticker', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(273, '1.', _binary 0x6e616d65, 'de', 'attribute', 'name/de: Gutscheinwert', 'Gutscheinwert', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(274, '1.', _binary 0x6e616d65, 'en', 'attribute', 'name/en: Voucher value', 'Voucher value', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(275, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kundendatum', 'Kundendatum', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(276, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Customer date', 'Customer date', 1, '2022-03-10 01:19:56', '2022-03-10 01:19:56', 'core:setup'),
	(341, '1.', _binary 0x73686f7274, 'de', 'catalog', 'Best seller kurz', '<p>Große Auswahl an TOP Sellern<br /><strong>BESTE Preise garantiert</strong></p>', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(342, '1.', _binary 0x73686f7274, 'en', 'catalog', 'Best seller short', '<p>LARGE selection of TOP sellers<br /><strong>BEST prices guaranteed</strong></p>', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(344, '1.', _binary 0x73686f7274, 'de', 'catalog', 'New arrivals kurz', '<p><strong>Sommer 2021</strong></p><p>Neue Collection eingetroffen</p>', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(345, '1.', _binary 0x73686f7274, 'en', 'catalog', 'New arrivals short', '<p><strong>Summer 2021</strong></p><p>New collection available</p>', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(347, '1.', _binary 0x73686f7274, 'de', 'catalog', 'Hot deals kurz', '<p>Bis zu <strong>30%</strong> Rabatt<br />auf ausgewählte Stücke</p>', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(348, '1.', _binary 0x73686f7274, 'en', 'catalog', 'Hot deals short', '<p>Up to <strong>30%</strong> discount<br />on selected items</p>', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(393, '1.', _binary 0x6e616d65, 'de', 'supplier', 'Demo name/de: Demo Händler', 'Demo-Händler', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(394, '1.', _binary 0x73686f7274, 'de', 'supplier', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demo-Händlers', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(395, '1.', _binary 0x6c6f6e67, 'de', 'supplier', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Lieferanten, die gerne etwas länger sein darf.', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(396, '1.', _binary 0x6e616d65, 'en', 'supplier', 'Demo name/en: Demo supplier', 'Demo supplier', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(397, '1.', _binary 0x73686f7274, 'en', 'supplier', 'Demo short/en: This is the short description', 'This is the short description of the demo supplier.', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(398, '1.', _binary 0x6c6f6e67, 'en', 'supplier', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo supplier that may be a little bit longer.', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(399, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'supplier', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(400, '1.', _binary 0x6e616d65, 'de', 'supplier', 'Demo name/de: Demo Händler 2', 'Demo-Händler 2', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(401, '1.', _binary 0x73686f7274, 'de', 'supplier', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demo-Händlers 2', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(402, '1.', _binary 0x6c6f6e67, 'de', 'supplier', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Lieferanten, die gerne etwas länger sein darf.', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(403, '1.', _binary 0x6e616d65, 'en', 'supplier', 'Demo name/en: Demo supplier 2', 'Demo supplier 2', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(404, '1.', _binary 0x73686f7274, 'en', 'supplier', 'Demo short/en: This is the short description', 'This is the short description of the demo article.', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(405, '1.', _binary 0x6c6f6e67, 'en', 'supplier', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo article that may be a little bit longer.', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(406, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'supplier', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 01:19:57', '2022-03-10 01:19:57', 'core:setup'),
	(407, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Schwarz', 'Schwarz', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(408, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Black', 'Black', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(409, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Schwarz', 'Schwarz', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(410, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Black', 'Black', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(411, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kleiner Aufdruck', 'Kleiner Aufdruck', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(412, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Small print', 'Small print', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(413, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Kleiner Aufdruck', 'Kleiner-Aufdruck', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(414, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Small print', 'small-print', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(415, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kleiner Aufdruck', 'Text Aufdruck', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(416, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Small print', 'print text', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(417, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Ein Monat', '1 Monat', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(418, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: One Month', '1 month', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(419, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Ein Jahr', '1 Jahr', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(420, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: One year', '1 year', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(421, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Grosser Aufdruck', 'Grosser Aufdruck', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(422, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Large print', 'Large print', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(423, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Grosser Aufdruck', 'Grosser-Aufdruck', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(424, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Large print', 'large-print', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(432, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Blau', 'Blau', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(433, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Blau', 'Blau', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(434, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Blue', 'Blue', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(435, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Blue', 'blue', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(436, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Width 32', '32', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(437, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url: Width 32', 'Weite-32', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(438, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url: Width 32', 'width-32', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(439, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Length 34', '34', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(440, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url: Length 34', 'Länge-34', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(441, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url: Length 34', 'length-34', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(442, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Beige', 'Beige', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(443, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Beige', 'Beige', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(444, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Beige', 'Beige', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(445, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Beige', 'beige', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(446, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Width 33', '33', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(447, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url: Width 33', 'Weite-33', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(448, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url: Width 33', 'width-33', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(449, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Length 36', '36', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(450, '1.', _binary 0x75726c, NULL, 'attribute', 'Demo url: Length 36', 'Länge-36', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(451, '1.', _binary 0x75726c, NULL, 'attribute', 'Demo url: Length 36', 'length-36', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(460, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kleines Etikett', 'Kleines Etikett', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(461, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Small sticker', 'Small sticker', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(462, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Kleines Etikett', 'Kleines-Etikett', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(463, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Small sticker', 'small-sticker', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(464, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Grosses Etikett', 'Großes Etikett', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(465, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Large sticker', 'Large sticker', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(466, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Grosses Etikett', 'Grosses-Etikett', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(467, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Large sticker', 'large-sticker', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(476, '1.', _binary 0x6e616d65, 'de', 'attribute', 'name/de: Gutscheinwert', 'Gutscheinwert', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(477, '1.', _binary 0x6e616d65, 'en', 'attribute', 'name/en: Voucher value', 'Voucher value', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(478, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kundendatum', 'Kundendatum', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(479, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Customer date', 'Customer date', 1, '2022-03-10 01:25:08', '2022-03-10 01:25:08', 'core:setup'),
	(544, '1.', _binary 0x73686f7274, 'de', 'catalog', 'Best seller kurz', '<p>Große Auswahl an TOP Sellern<br /><strong>BESTE Preise garantiert</strong></p>', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(545, '1.', _binary 0x73686f7274, 'en', 'catalog', 'Best seller short', '<p>LARGE selection of TOP sellers<br /><strong>BEST prices guaranteed</strong></p>', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(547, '1.', _binary 0x73686f7274, 'de', 'catalog', 'New arrivals kurz', '<p><strong>Sommer 2021</strong></p><p>Neue Collection eingetroffen</p>', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(548, '1.', _binary 0x73686f7274, 'en', 'catalog', 'New arrivals short', '<p><strong>Summer 2021</strong></p><p>New collection available</p>', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(550, '1.', _binary 0x73686f7274, 'de', 'catalog', 'Hot deals kurz', '<p>Bis zu <strong>30%</strong> Rabatt<br />auf ausgewählte Stücke</p>', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(551, '1.', _binary 0x73686f7274, 'en', 'catalog', 'Hot deals short', '<p>Up to <strong>30%</strong> discount<br />on selected items</p>', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(596, '1.', _binary 0x6e616d65, 'de', 'supplier', 'Demo name/de: Demo Händler', 'Demo-Händler', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(597, '1.', _binary 0x73686f7274, 'de', 'supplier', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demo-Händlers', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(598, '1.', _binary 0x6c6f6e67, 'de', 'supplier', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Lieferanten, die gerne etwas länger sein darf.', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(599, '1.', _binary 0x6e616d65, 'en', 'supplier', 'Demo name/en: Demo supplier', 'Demo supplier', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(600, '1.', _binary 0x73686f7274, 'en', 'supplier', 'Demo short/en: This is the short description', 'This is the short description of the demo supplier.', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(601, '1.', _binary 0x6c6f6e67, 'en', 'supplier', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo supplier that may be a little bit longer.', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(602, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'supplier', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(603, '1.', _binary 0x6e616d65, 'de', 'supplier', 'Demo name/de: Demo Händler 2', 'Demo-Händler 2', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(604, '1.', _binary 0x73686f7274, 'de', 'supplier', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demo-Händlers 2', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(605, '1.', _binary 0x6c6f6e67, 'de', 'supplier', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Lieferanten, die gerne etwas länger sein darf.', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(606, '1.', _binary 0x6e616d65, 'en', 'supplier', 'Demo name/en: Demo supplier 2', 'Demo supplier 2', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(607, '1.', _binary 0x73686f7274, 'en', 'supplier', 'Demo short/en: This is the short description', 'This is the short description of the demo article.', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(608, '1.', _binary 0x6c6f6e67, 'en', 'supplier', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo article that may be a little bit longer.', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(609, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'supplier', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 01:25:09', '2022-03-10 01:25:09', 'core:setup'),
	(610, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Schwarz', 'Schwarz', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(611, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Black', 'Black', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(612, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Schwarz', 'Schwarz', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(613, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Black', 'Black', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(614, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kleiner Aufdruck', 'Kleiner Aufdruck', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(615, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Small print', 'Small print', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(616, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Kleiner Aufdruck', 'Kleiner-Aufdruck', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(617, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Small print', 'small-print', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(618, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kleiner Aufdruck', 'Text Aufdruck', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(619, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Small print', 'print text', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(620, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Ein Monat', '1 Monat', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(621, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: One Month', '1 month', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(622, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Ein Jahr', '1 Jahr', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(623, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: One year', '1 year', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(624, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Grosser Aufdruck', 'Grosser Aufdruck', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(625, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Large print', 'Large print', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(626, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Grosser Aufdruck', 'Grosser-Aufdruck', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(627, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Large print', 'large-print', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(635, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Blau', 'Blau', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(636, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Blau', 'Blau', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(637, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Blue', 'Blue', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(638, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Blue', 'blue', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(639, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Width 32', '32', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(640, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url: Width 32', 'Weite-32', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(641, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url: Width 32', 'width-32', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(642, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Length 34', '34', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(643, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url: Length 34', 'Länge-34', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(644, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url: Length 34', 'length-34', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(645, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Beige', 'Beige', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(646, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Beige', 'Beige', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(647, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Beige', 'Beige', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(648, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Beige', 'beige', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(649, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Width 33', '33', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(650, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url: Width 33', 'Weite-33', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(651, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url: Width 33', 'width-33', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(652, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Length 36', '36', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(653, '1.', _binary 0x75726c, NULL, 'attribute', 'Demo url: Length 36', 'Länge-36', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(654, '1.', _binary 0x75726c, NULL, 'attribute', 'Demo url: Length 36', 'length-36', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(663, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kleines Etikett', 'Kleines Etikett', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(664, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Small sticker', 'Small sticker', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(665, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Kleines Etikett', 'Kleines-Etikett', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(666, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Small sticker', 'small-sticker', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(667, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Grosses Etikett', 'Großes Etikett', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(668, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Large sticker', 'Large sticker', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(669, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Grosses Etikett', 'Grosses-Etikett', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(670, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Large sticker', 'large-sticker', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(679, '1.', _binary 0x6e616d65, 'de', 'attribute', 'name/de: Gutscheinwert', 'Gutscheinwert', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(680, '1.', _binary 0x6e616d65, 'en', 'attribute', 'name/en: Voucher value', 'Voucher value', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(681, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kundendatum', 'Kundendatum', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(682, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Customer date', 'Customer date', 1, '2022-03-10 01:39:21', '2022-03-10 01:39:21', 'core:setup'),
	(747, '1.', _binary 0x73686f7274, 'de', 'catalog', 'Best seller kurz', '<p>Große Auswahl an TOP Sellern<br /><strong>BESTE Preise garantiert</strong></p>', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(748, '1.', _binary 0x73686f7274, 'en', 'catalog', 'Best seller short', '<p>LARGE selection of TOP sellers<br /><strong>BEST prices guaranteed</strong></p>', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(750, '1.', _binary 0x73686f7274, 'de', 'catalog', 'New arrivals kurz', '<p><strong>Sommer 2021</strong></p><p>Neue Collection eingetroffen</p>', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(751, '1.', _binary 0x73686f7274, 'en', 'catalog', 'New arrivals short', '<p><strong>Summer 2021</strong></p><p>New collection available</p>', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(753, '1.', _binary 0x73686f7274, 'de', 'catalog', 'Hot deals kurz', '<p>Bis zu <strong>30%</strong> Rabatt<br />auf ausgewählte Stücke</p>', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(754, '1.', _binary 0x73686f7274, 'en', 'catalog', 'Hot deals short', '<p>Up to <strong>30%</strong> discount<br />on selected items</p>', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(799, '1.', _binary 0x6e616d65, 'de', 'supplier', 'Demo name/de: Demo Händler', 'Demo-Händler', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(800, '1.', _binary 0x73686f7274, 'de', 'supplier', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demo-Händlers', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(801, '1.', _binary 0x6c6f6e67, 'de', 'supplier', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Lieferanten, die gerne etwas länger sein darf.', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(802, '1.', _binary 0x6e616d65, 'en', 'supplier', 'Demo name/en: Demo supplier', 'Demo supplier', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(803, '1.', _binary 0x73686f7274, 'en', 'supplier', 'Demo short/en: This is the short description', 'This is the short description of the demo supplier.', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(804, '1.', _binary 0x6c6f6e67, 'en', 'supplier', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo supplier that may be a little bit longer.', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(805, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'supplier', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(806, '1.', _binary 0x6e616d65, 'de', 'supplier', 'Demo name/de: Demo Händler 2', 'Demo-Händler 2', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(807, '1.', _binary 0x73686f7274, 'de', 'supplier', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demo-Händlers 2', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(808, '1.', _binary 0x6c6f6e67, 'de', 'supplier', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Lieferanten, die gerne etwas länger sein darf.', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(809, '1.', _binary 0x6e616d65, 'en', 'supplier', 'Demo name/en: Demo supplier 2', 'Demo supplier 2', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(810, '1.', _binary 0x73686f7274, 'en', 'supplier', 'Demo short/en: This is the short description', 'This is the short description of the demo article.', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(811, '1.', _binary 0x6c6f6e67, 'en', 'supplier', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo article that may be a little bit longer.', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(812, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'supplier', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 01:39:22', '2022-03-10 01:39:22', 'core:setup'),
	(813, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Schwarz', 'Schwarz', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(814, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Black', 'Black', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(815, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Schwarz', 'Schwarz', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(816, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Black', 'Black', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(817, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kleiner Aufdruck', 'Kleiner Aufdruck', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(818, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Small print', 'Small print', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(819, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Kleiner Aufdruck', 'Kleiner-Aufdruck', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(820, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Small print', 'small-print', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(821, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kleiner Aufdruck', 'Text Aufdruck', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(822, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Small print', 'print text', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(823, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Ein Monat', '1 Monat', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(824, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: One Month', '1 month', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(825, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Ein Jahr', '1 Jahr', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(826, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: One year', '1 year', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(827, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Grosser Aufdruck', 'Grosser Aufdruck', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(828, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Large print', 'Large print', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(829, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Grosser Aufdruck', 'Grosser-Aufdruck', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(830, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Large print', 'large-print', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(838, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Blau', 'Blau', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(839, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Blau', 'Blau', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(840, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Blue', 'Blue', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(841, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Blue', 'blue', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(842, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Width 32', '32', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(843, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url: Width 32', 'Weite-32', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(844, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url: Width 32', 'width-32', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(845, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Length 34', '34', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(846, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url: Length 34', 'Länge-34', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(847, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url: Length 34', 'length-34', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(848, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Beige', 'Beige', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(849, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Beige', 'Beige', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(850, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Beige', 'Beige', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(851, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Beige', 'beige', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(852, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Width 33', '33', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(853, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url: Width 33', 'Weite-33', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(854, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url: Width 33', 'width-33', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(855, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Length 36', '36', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(856, '1.', _binary 0x75726c, NULL, 'attribute', 'Demo url: Length 36', 'Länge-36', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(857, '1.', _binary 0x75726c, NULL, 'attribute', 'Demo url: Length 36', 'length-36', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(866, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kleines Etikett', 'Kleines Etikett', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(867, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Small sticker', 'Small sticker', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(868, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Kleines Etikett', 'Kleines-Etikett', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(869, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Small sticker', 'small-sticker', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(870, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Grosses Etikett', 'Großes Etikett', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(871, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Large sticker', 'Large sticker', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(872, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Grosses Etikett', 'Grosses-Etikett', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(873, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Large sticker', 'large-sticker', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(882, '1.', _binary 0x6e616d65, 'de', 'attribute', 'name/de: Gutscheinwert', 'Gutscheinwert', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(883, '1.', _binary 0x6e616d65, 'en', 'attribute', 'name/en: Voucher value', 'Voucher value', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(884, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kundendatum', 'Kundendatum', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(885, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Customer date', 'Customer date', 1, '2022-03-10 01:54:57', '2022-03-10 01:54:57', 'core:setup'),
	(950, '1.', _binary 0x73686f7274, 'de', 'catalog', 'Best seller kurz', '<p>Große Auswahl an TOP Sellern<br /><strong>BESTE Preise garantiert</strong></p>', 1, '2022-03-10 01:54:58', '2022-03-10 01:54:58', 'core:setup'),
	(951, '1.', _binary 0x73686f7274, 'en', 'catalog', 'Best seller short', '<p>LARGE selection of TOP sellers<br /><strong>BEST prices guaranteed</strong></p>', 1, '2022-03-10 01:54:58', '2022-03-10 01:54:58', 'core:setup'),
	(953, '1.', _binary 0x73686f7274, 'de', 'catalog', 'New arrivals kurz', '<p><strong>Sommer 2021</strong></p><p>Neue Collection eingetroffen</p>', 1, '2022-03-10 01:54:58', '2022-03-10 01:54:58', 'core:setup'),
	(954, '1.', _binary 0x73686f7274, 'en', 'catalog', 'New arrivals short', '<p><strong>Summer 2021</strong></p><p>New collection available</p>', 1, '2022-03-10 01:54:58', '2022-03-10 01:54:58', 'core:setup'),
	(956, '1.', _binary 0x73686f7274, 'de', 'catalog', 'Hot deals kurz', '<p>Bis zu <strong>30%</strong> Rabatt<br />auf ausgewählte Stücke</p>', 1, '2022-03-10 01:54:58', '2022-03-10 01:54:58', 'core:setup'),
	(957, '1.', _binary 0x73686f7274, 'en', 'catalog', 'Hot deals short', '<p>Up to <strong>30%</strong> discount<br />on selected items</p>', 1, '2022-03-10 01:54:58', '2022-03-10 01:54:58', 'core:setup'),
	(1002, '1.', _binary 0x6e616d65, 'de', 'supplier', 'Demo name/de: Demo Händler', 'Demo-Händler', 1, '2022-03-10 01:54:59', '2022-03-10 01:54:59', 'core:setup'),
	(1003, '1.', _binary 0x73686f7274, 'de', 'supplier', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demo-Händlers', 1, '2022-03-10 01:54:59', '2022-03-10 01:54:59', 'core:setup'),
	(1004, '1.', _binary 0x6c6f6e67, 'de', 'supplier', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Lieferanten, die gerne etwas länger sein darf.', 1, '2022-03-10 01:54:59', '2022-03-10 01:54:59', 'core:setup'),
	(1005, '1.', _binary 0x6e616d65, 'en', 'supplier', 'Demo name/en: Demo supplier', 'Demo supplier', 1, '2022-03-10 01:54:59', '2022-03-10 01:54:59', 'core:setup'),
	(1006, '1.', _binary 0x73686f7274, 'en', 'supplier', 'Demo short/en: This is the short description', 'This is the short description of the demo supplier.', 1, '2022-03-10 01:54:59', '2022-03-10 01:54:59', 'core:setup'),
	(1007, '1.', _binary 0x6c6f6e67, 'en', 'supplier', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo supplier that may be a little bit longer.', 1, '2022-03-10 01:54:59', '2022-03-10 01:54:59', 'core:setup'),
	(1008, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'supplier', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 01:54:59', '2022-03-10 01:54:59', 'core:setup'),
	(1009, '1.', _binary 0x6e616d65, 'de', 'supplier', 'Demo name/de: Demo Händler 2', 'Demo-Händler 2', 1, '2022-03-10 01:54:59', '2022-03-10 01:54:59', 'core:setup'),
	(1010, '1.', _binary 0x73686f7274, 'de', 'supplier', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demo-Händlers 2', 1, '2022-03-10 01:54:59', '2022-03-10 01:54:59', 'core:setup'),
	(1011, '1.', _binary 0x6c6f6e67, 'de', 'supplier', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Lieferanten, die gerne etwas länger sein darf.', 1, '2022-03-10 01:54:59', '2022-03-10 01:54:59', 'core:setup'),
	(1012, '1.', _binary 0x6e616d65, 'en', 'supplier', 'Demo name/en: Demo supplier 2', 'Demo supplier 2', 1, '2022-03-10 01:54:59', '2022-03-10 01:54:59', 'core:setup'),
	(1013, '1.', _binary 0x73686f7274, 'en', 'supplier', 'Demo short/en: This is the short description', 'This is the short description of the demo article.', 1, '2022-03-10 01:54:59', '2022-03-10 01:54:59', 'core:setup'),
	(1014, '1.', _binary 0x6c6f6e67, 'en', 'supplier', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo article that may be a little bit longer.', 1, '2022-03-10 01:54:59', '2022-03-10 01:54:59', 'core:setup'),
	(1015, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'supplier', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 01:54:59', '2022-03-10 01:54:59', 'core:setup'),
	(1016, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Schwarz', 'Schwarz', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1017, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Black', 'Black', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1018, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Schwarz', 'Schwarz', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1019, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Black', 'Black', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1020, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kleiner Aufdruck', 'Kleiner Aufdruck', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1021, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Small print', 'Small print', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1022, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Kleiner Aufdruck', 'Kleiner-Aufdruck', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1023, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Small print', 'small-print', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1024, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kleiner Aufdruck', 'Text Aufdruck', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1025, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Small print', 'print text', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1026, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Ein Monat', '1 Monat', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1027, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: One Month', '1 month', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1028, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Ein Jahr', '1 Jahr', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1029, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: One year', '1 year', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1030, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Grosser Aufdruck', 'Grosser Aufdruck', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1031, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Large print', 'Large print', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1032, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Grosser Aufdruck', 'Grosser-Aufdruck', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1033, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Large print', 'large-print', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1034, '1.', _binary 0x6e616d65, 'de', 'product', 'Demo name/de: Demoartikel', 'Demoartikel', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1035, '1.', _binary 0x73686f7274, 'de', 'product', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demoartikels', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1036, '1.', _binary 0x6c6f6e67, 'de', 'product', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Artikels, die gerne etwas länger sein darf.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1037, '1.', _binary 0x6e616d65, 'en', 'product', 'Demo name/en: Demo article', 'Demo article', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1038, '1.', _binary 0x73686f7274, 'en', 'product', 'Demo short/en: This is the short description', 'This is the short description of the demo article.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1039, '1.', _binary 0x6c6f6e67, 'en', 'product', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo article that may be a little bit longer.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1040, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'product', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1041, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Blau', 'Blau', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1042, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Blau', 'Blau', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1043, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Blue', 'Blue', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1044, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Blue', 'blue', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1045, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Width 32', '32', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1046, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url: Width 32', 'Weite-32', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1047, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url: Width 32', 'width-32', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1048, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Length 34', '34', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1049, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url: Length 34', 'Länge-34', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1050, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url: Length 34', 'length-34', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1051, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Beige', 'Beige', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1052, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Beige', 'Beige', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1053, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Beige', 'Beige', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1054, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Beige', 'beige', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1055, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Width 33', '33', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1056, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url: Width 33', 'Weite-33', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1057, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url: Width 33', 'width-33', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1058, '1.', _binary 0x6e616d65, NULL, 'attribute', 'Demo name: Length 36', '36', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1059, '1.', _binary 0x75726c, NULL, 'attribute', 'Demo url: Length 36', 'Länge-36', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1060, '1.', _binary 0x75726c, NULL, 'attribute', 'Demo url: Length 36', 'length-36', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1061, '1.', _binary 0x6e616d65, 'de', 'product', 'Demo name/de: Demoartikel mit Auswahl', 'Demoartikel mit Auswahl', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1062, '1.', _binary 0x75726c, 'de', 'product', 'Demo url/de: Demoartikel mit Auswahl', 'Demoartikel-mit-Auswahl', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1063, '1.', _binary 0x73686f7274, 'de', 'product', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demoartikels mit Auswahl', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1064, '1.', _binary 0x6c6f6e67, 'de', 'product', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Artikels mit Auswahl, die gerne etwas länger sein darf.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1065, '1.', _binary 0x6e616d65, 'en', 'product', 'Demo name/en: Demo selection article', 'Demo selection article', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1066, '1.', _binary 0x73686f7274, 'en', 'product', 'Demo short/en: This is the short description', 'This is the short description of the selection demo article.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1067, '1.', _binary 0x6c6f6e67, 'en', 'product', 'Demo long/en: Add a detailed description', 'Add a detailed description of the selection demo article that may be a little bit longer.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1068, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'product', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1069, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kleines Etikett', 'Kleines Etikett', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1070, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Small sticker', 'Small sticker', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1071, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Kleines Etikett', 'Kleines-Etikett', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1072, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Small sticker', 'small-sticker', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1073, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Grosses Etikett', 'Großes Etikett', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1074, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Large sticker', 'Large sticker', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1075, '1.', _binary 0x75726c, 'de', 'attribute', 'Demo url/de: Grosses Etikett', 'Grosses-Etikett', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1076, '1.', _binary 0x75726c, 'en', 'attribute', 'Demo url/en: Large sticker', 'large-sticker', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1077, '1.', _binary 0x6e616d65, 'de', 'product', 'Demo name/de: Demoartikel mit Bundle', 'Demoartikel mit Bundle', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1078, '1.', _binary 0x75726c, 'de', 'product', 'Demo url/de: Demoartikel mit Bundle', 'Demoartikel-mit-Bundle', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1079, '1.', _binary 0x73686f7274, 'de', 'product', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demoartikels mit Bundle', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1080, '1.', _binary 0x6c6f6e67, 'de', 'product', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Artikels mit Bundle, die gerne etwas länger sein darf.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1081, '1.', _binary 0x6e616d65, 'en', 'product', 'Demo name/en: Demo bundle article', 'Demo bundle article', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1082, '1.', _binary 0x73686f7274, 'en', 'product', 'Demo short/en: This is the short description', 'This is the short description of the bundle demo article.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1083, '1.', _binary 0x6c6f6e67, 'en', 'product', 'Demo long/en: Add a detailed description', 'Add a detailed description of the bundle demo article that may be a little bit longer.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1084, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'product', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1085, '1.', _binary 0x6e616d65, 'de', 'attribute', 'name/de: Gutscheinwert', 'Gutscheinwert', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1086, '1.', _binary 0x6e616d65, 'en', 'attribute', 'name/en: Voucher value', 'Voucher value', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1087, '1.', _binary 0x6e616d65, 'de', 'attribute', 'Demo name/de: Kundendatum', 'Kundendatum', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1088, '1.', _binary 0x6e616d65, 'en', 'attribute', 'Demo name/en: Customer date', 'Customer date', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1089, '1.', _binary 0x6e616d65, 'de', 'product', 'Demo name/de: Gutschein', 'Demo-Gutschein', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1090, '1.', _binary 0x73686f7274, 'de', 'product', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demo-Gutscheins', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1091, '1.', _binary 0x6c6f6e67, 'de', 'product', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Gutscheins, die gerne etwas länger sein darf.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1092, '1.', _binary 0x6e616d65, 'en', 'product', 'Demo name/en: Demo article', 'Demo voucher', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1093, '1.', _binary 0x73686f7274, 'en', 'product', 'Demo short/en: This is the short description', 'This is the short description of the demo voucher.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1094, '1.', _binary 0x6c6f6e67, 'en', 'product', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo voucher that may be a little bit longer.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1095, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'product', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1096, '1.', _binary 0x6e616d65, 'de', 'product', 'Demo name/de: Rabatt', 'Demorabatt', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1097, '1.', _binary 0x6e616d65, 'de', 'product', 'Demo name/de: Demoartikel', 'Demoartikel 2', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1098, '1.', _binary 0x73686f7274, 'de', 'product', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demoartikels', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1099, '1.', _binary 0x6c6f6e67, 'de', 'product', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Artikels, die gerne etwas länger sein darf.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1100, '1.', _binary 0x6e616d65, 'en', 'product', 'Demo name/en: Demo article', 'Demo article 2', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1101, '1.', _binary 0x73686f7274, 'en', 'product', 'Demo short/en: This is the short description', 'This is the short description of the demo article.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1102, '1.', _binary 0x6c6f6e67, 'en', 'product', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo article that may be a little bit longer.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1103, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'product', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1104, '1.', _binary 0x6e616d65, 'de', 'product', 'Demo name/de: Demoartikel', 'Demoartikel 3', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1105, '1.', _binary 0x73686f7274, 'de', 'product', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demoartikels', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1106, '1.', _binary 0x6c6f6e67, 'de', 'product', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Artikels, die gerne etwas länger sein darf.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1107, '1.', _binary 0x6e616d65, 'en', 'product', 'Demo name/en: Demo article', 'Demo article 3', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1108, '1.', _binary 0x73686f7274, 'en', 'product', 'Demo short/en: This is the short description', 'This is the short description of the demo article.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1109, '1.', _binary 0x6c6f6e67, 'en', 'product', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo article that may be a little bit longer.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1110, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'product', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1111, '1.', _binary 0x6e616d65, 'de', 'product', 'Demo name/de: Demoartikel', 'Demoartikel 4', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1112, '1.', _binary 0x73686f7274, 'de', 'product', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demoartikels', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1113, '1.', _binary 0x6c6f6e67, 'de', 'product', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Artikels, die gerne etwas länger sein darf.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1114, '1.', _binary 0x6e616d65, 'en', 'product', 'Demo name/en: Demo article', 'Demo article 4', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1115, '1.', _binary 0x73686f7274, 'en', 'product', 'Demo short/en: This is the short description', 'This is the short description of the demo article.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1116, '1.', _binary 0x6c6f6e67, 'en', 'product', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo article that may be a little bit longer.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1117, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'product', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1118, '1.', _binary 0x6e616d65, 'de', 'product', 'Demo name/de: Demoartikel', 'Demoartikel 5', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1119, '1.', _binary 0x73686f7274, 'de', 'product', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demoartikels', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1120, '1.', _binary 0x6c6f6e67, 'de', 'product', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Artikels, die gerne etwas länger sein darf.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1121, '1.', _binary 0x6e616d65, 'en', 'product', 'Demo name/en: Demo article', 'Demo article 5', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1122, '1.', _binary 0x73686f7274, 'en', 'product', 'Demo short/en: This is the short description', 'This is the short description of the demo article.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1123, '1.', _binary 0x6c6f6e67, 'en', 'product', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo article that may be a little bit longer.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1124, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'product', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1125, '1.', _binary 0x6e616d65, 'de', 'product', 'Demo name/de: Demoartikel', 'Demoartikel 6', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1126, '1.', _binary 0x73686f7274, 'de', 'product', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demoartikels', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1127, '1.', _binary 0x6c6f6e67, 'de', 'product', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Artikels, die gerne etwas länger sein darf.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1128, '1.', _binary 0x6e616d65, 'en', 'product', 'Demo name/en: Demo article', 'Demo article 6', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1129, '1.', _binary 0x73686f7274, 'en', 'product', 'Demo short/en: This is the short description', 'This is the short description of the demo article.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1130, '1.', _binary 0x6c6f6e67, 'en', 'product', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo article that may be a little bit longer.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1131, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'product', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1132, '1.', _binary 0x6e616d65, 'de', 'product', 'Demo name/de: Demoartikel', 'Demoartikel 7', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1133, '1.', _binary 0x73686f7274, 'de', 'product', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demoartikels', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1134, '1.', _binary 0x6c6f6e67, 'de', 'product', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Artikels, die gerne etwas länger sein darf.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1135, '1.', _binary 0x6e616d65, 'en', 'product', 'Demo name/en: Demo article', 'Demo article 7', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1136, '1.', _binary 0x73686f7274, 'en', 'product', 'Demo short/en: This is the short description', 'This is the short description of the demo article.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1137, '1.', _binary 0x6c6f6e67, 'en', 'product', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo article that may be a little bit longer.', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1138, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'product', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 02:07:30', '2022-03-10 02:07:30', 'core:setup'),
	(1139, '1.', _binary 0x6e616d65, 'de', 'product', 'Demo name/de: Demoartikel', 'Demoartikel 8', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1140, '1.', _binary 0x73686f7274, 'de', 'product', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demoartikels', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1141, '1.', _binary 0x6c6f6e67, 'de', 'product', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Artikels, die gerne etwas länger sein darf.', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1142, '1.', _binary 0x6e616d65, 'en', 'product', 'Demo name/en: Demo article', 'Demo article 8', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1143, '1.', _binary 0x73686f7274, 'en', 'product', 'Demo short/en: This is the short description', 'This is the short description of the demo article.', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1144, '1.', _binary 0x6c6f6e67, 'en', 'product', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo article that may be a little bit longer.', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1145, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'product', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1146, '1.', _binary 0x6e616d65, 'de', 'catalog', 'Demo name/de: Start', 'Start', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1147, '1.', _binary 0x75726c, 'de', 'catalog', 'Demo url/de: Start', 'Start', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1148, '1.', _binary 0x73686f7274, 'de', 'catalog', 'Demo short/de: Dies ist der Kurztext', 'Dies ist der Kurztext für die Hauptkategorie ihres neuen Webshops.', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1149, '1.', _binary 0x73686f7274, 'en', 'catalog', 'Demo short/en: This is the short text', 'This is the short text for the main category of your new web shop.', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1150, '1.', _binary 0x6c6f6e67, 'de', 'catalog', 'Demo long/de: Hier kann eine ausführliche Einleitung', 'Hier kann eine ausführliche Einleitung für ihre Hauptkategorie stehen.', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1151, '1.', _binary 0x6c6f6e67, 'en', 'catalog', 'Demo long/en: Here you can add a long introduction', 'Here you can add a long introduction for you main category.', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1152, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'catalog', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1153, '1.', _binary 0x73686f7274, 'de', 'catalog', 'Best seller kurz', '<p>Große Auswahl an TOP Sellern<br /><strong>BESTE Preise garantiert</strong></p>', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1154, '1.', _binary 0x73686f7274, 'en', 'catalog', 'Best seller short', '<p>LARGE selection of TOP sellers<br /><strong>BEST prices guaranteed</strong></p>', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1155, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'catalog', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1156, '1.', _binary 0x73686f7274, 'de', 'catalog', 'New arrivals kurz', '<p><strong>Sommer 2021</strong></p><p>Neue Collection eingetroffen</p>', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1157, '1.', _binary 0x73686f7274, 'en', 'catalog', 'New arrivals short', '<p><strong>Summer 2021</strong></p><p>New collection available</p>', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1158, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'catalog', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1159, '1.', _binary 0x73686f7274, 'de', 'catalog', 'Hot deals kurz', '<p>Bis zu <strong>30%</strong> Rabatt<br />auf ausgewählte Stücke</p>', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1160, '1.', _binary 0x73686f7274, 'en', 'catalog', 'Hot deals short', '<p>Up to <strong>30%</strong> discount<br />on selected items</p>', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1161, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'catalog', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1162, '1.', _binary 0x73686f7274, 'de', 'service', 'Demo short/de: Abholung vor Ort', 'Abholung vor Ort', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1163, '1.', _binary 0x6c6f6e67, 'de', 'service', 'Demo long/de: Abholung vor Ort', 'Abholung vor Ort bei einem unserer Läden', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1164, '1.', _binary 0x73686f7274, 'en', 'service', 'Demo short/en: Local pick-up', 'Local pick-up', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1165, '1.', _binary 0x6c6f6e67, 'en', 'service', 'Demo long/en: Local pick-up', 'Pick-up at one of our local stores', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1166, '1.', _binary 0x73686f7274, 'de', 'service', 'Demo short/de: Lieferung innerhalb von drei Tagen', 'Lieferung innerhalb von drei Tagen.', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1167, '1.', _binary 0x6c6f6e67, 'de', 'service', 'Demo long/de: Die Lieferung erfolgt in der Regel', 'Die Lieferung erfolgt in der Regel innerhalb von drei Werktagen', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1168, '1.', _binary 0x73686f7274, 'en', 'service', 'Demo short/en: Delivery within three days', 'Delivery within three days', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1169, '1.', _binary 0x6c6f6e67, 'en', 'service', 'Demo long/en: The parcel is usually delivered', 'The parcel is usually delivered within three working days', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1170, '1.', _binary 0x73686f7274, 'de', 'service', 'Demo short/de: Lieferung am nächsten Tag', 'Lieferung am nächsten Tag.', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1171, '1.', _binary 0x6c6f6e67, 'de', 'service', 'Demo long/de: Bei Bestellungen bis 16:00 Uhr', 'Bei Bestellungen bis 16:00 Uhr erfolgt die Lieferung am nächsten Werktag', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1172, '1.', _binary 0x73686f7274, 'en', 'service', 'Demo short/en: Delivery on the next day', 'Delivery on the next day', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1173, '1.', _binary 0x6c6f6e67, 'en', 'service', 'Demo long/en: If you order till 16 o\'clock', 'If you order till 16 o\'clock the delivery will be on the next working day', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1174, '1.', _binary 0x73686f7274, 'de', 'service', 'Demo short/de: Lieferung innerhalb von drei Tagen', 'Lieferung innerhalb von drei Tagen.', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1175, '1.', _binary 0x6c6f6e67, 'de', 'service', 'Demo long/de: Die Lieferung erfolgt in der Regel', 'Die Lieferung erfolgt in der Regel innerhalb von drei Werktagen', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1176, '1.', _binary 0x73686f7274, 'en', 'service', 'Demo short/en: Delivery within three days', 'Delivery within three days', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1177, '1.', _binary 0x6c6f6e67, 'en', 'service', 'Demo long/en: The parcel is usually delivered', 'The parcel is usually delivered within three working days', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1178, '1.', _binary 0x73686f7274, 'de', 'service', 'Demo short/de: Lieferung innerhalb von drei Tagen', 'Lieferung innerhalb von drei Tagen.', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1179, '1.', _binary 0x6c6f6e67, 'de', 'service', 'Demo long/de: Die Lieferung erfolgt in der Regel', 'Die Lieferung erfolgt in der Regel innerhalb von drei Werktagen', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1180, '1.', _binary 0x73686f7274, 'en', 'service', 'Demo short/en: Delivery within three days', 'Delivery within three days', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1181, '1.', _binary 0x6c6f6e67, 'en', 'service', 'Demo long/en: The parcel is usually delivered', 'The parcel is usually delivered within three working days', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1182, '1.', _binary 0x6e616d65, 'de', 'service', 'Demo name/de: Rechnung', 'Rechnung', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1183, '1.', _binary 0x73686f7274, 'de', 'service', 'Demo short/de: Zahlung per Rechnung', 'Zahlung per Rechnung innerhalb von 14 Tagen.', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1184, '1.', _binary 0x6c6f6e67, 'de', 'service', 'Demo long/de: Bitte überweisen Sie den Betrag', 'Bitte überweisen Sie den Betrag innerhalb von 14 Tagen an BIC: XXX, IBAN: YYY', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1185, '1.', _binary 0x73686f7274, 'en', 'service', 'Demo short/en: Pay by invoice', 'Pay by invoice within 14 days', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1186, '1.', _binary 0x6c6f6e67, 'en', 'service', 'Demo long/en: Please transfer the money', 'Please transfer the money within 14 days to BIC: XXX, IBAN: YYY', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1187, '1.', _binary 0x6e616d65, 'de', 'service', 'Demo name/de: Lastschrift', 'Lastschrift', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1188, '1.', _binary 0x73686f7274, 'de', 'service', 'Demo short/de: Abbuchung vom angegebenen Konto', 'Abbuchung vom angegebenen Konto.', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1189, '1.', _binary 0x6c6f6e67, 'de', 'service', 'Demo long/de: Der Betrag wird in den nächsten 1-3 Tagen', 'Der Betrag wird in den nächsten 1-3 Tagen von Ihrem Konto abgebucht', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1190, '1.', _binary 0x73686f7274, 'en', 'service', 'Demo short/en: Payment via your bank account', 'Payment via your bank account', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1191, '1.', _binary 0x6c6f6e67, 'en', 'service', 'Demo long/en: The money will be collected', 'The money will be collected from your bank account within 1-3 days', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1192, '1.', _binary 0x73686f7274, 'de', 'service', 'Demo short/de: Zahlung mit ihrem PayPal Konto', 'Zahlung mit PayPal', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1193, '1.', _binary 0x6c6f6e67, 'de', 'service', 'Demo long/de: Einfache Bezahlung mit Ihrem PayPal Konto', 'Einfache Bezahlung mit Ihrem PayPal Konto.', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1194, '1.', _binary 0x73686f7274, 'en', 'service', 'Demo short/en: Payment via your PayPal account', 'Payment via PayPal', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1195, '1.', _binary 0x6c6f6e67, 'en', 'service', 'Demo long/en: Easy and secure payment with your PayPal account', 'Easy and secure payment with your PayPal account', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1196, '1.', _binary 0x6e616d65, 'de', 'service', 'Demo name/de: Nachnahme', 'Nachnahme', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1197, '1.', _binary 0x73686f7274, 'de', 'service', 'Demo short/de: Zahlung bei Lieferung', 'Zahlung bei Lieferung.', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1198, '1.', _binary 0x6c6f6e67, 'de', 'service', 'Demo long/de: Die Bezahlung erfolgt bei Übergabe der Ware', 'Die Bezahlung erfolgt bei Übergabe der Ware', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1199, '1.', _binary 0x73686f7274, 'en', 'service', 'Demo short/en: Pay cash on delivery of the parcel', 'Pay cash on delivery of the parcel', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1200, '1.', _binary 0x6e616d65, 'de', 'service', 'Demo name/de: Vorauskasse', 'Vorauskasse', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1201, '1.', _binary 0x73686f7274, 'de', 'service', 'Demo short/de: Versand der Ware nach Zahlungseingang', '3% Rabatt, Versand der Ware nach Zahlungseingang.', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1202, '1.', _binary 0x6c6f6e67, 'de', 'service', 'Demo long/de: Bitte überweisen Sie den Betrag', 'Bitte überweisen Sie den Betrag an BIC: XXX, IBAN: YYY', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1203, '1.', _binary 0x73686f7274, 'en', 'service', 'Demo short/en: The parcel will be shipped after the payment has been received', '3% discount, the parcel will be shipped after the payment has been received', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1204, '1.', _binary 0x6c6f6e67, 'en', 'service', 'Demo long/en: Please transfer the money', 'Please transfer the money to BIC: XXX, IBAN: YYY', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1205, '1.', _binary 0x6e616d65, 'de', 'supplier', 'Demo name/de: Demo Händler', 'Demo-Händler', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1206, '1.', _binary 0x73686f7274, 'de', 'supplier', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demo-Händlers', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1207, '1.', _binary 0x6c6f6e67, 'de', 'supplier', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Lieferanten, die gerne etwas länger sein darf.', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1208, '1.', _binary 0x6e616d65, 'en', 'supplier', 'Demo name/en: Demo supplier', 'Demo supplier', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1209, '1.', _binary 0x73686f7274, 'en', 'supplier', 'Demo short/en: This is the short description', 'This is the short description of the demo supplier.', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1210, '1.', _binary 0x6c6f6e67, 'en', 'supplier', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo supplier that may be a little bit longer.', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1211, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'supplier', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup'),
	(1212, '1.', _binary 0x6e616d65, 'de', 'supplier', 'Demo name/de: Demo Händler 2', 'Demo-Händler 2', 1, '2022-03-10 02:07:32', '2022-03-10 02:07:32', 'core:setup'),
	(1213, '1.', _binary 0x73686f7274, 'de', 'supplier', 'Demo short/de: Dies ist die Kurzbeschreibung', 'Dies ist die Kurzbeschreibung des Demo-Händlers 2', 1, '2022-03-10 02:07:32', '2022-03-10 02:07:32', 'core:setup'),
	(1214, '1.', _binary 0x6c6f6e67, 'de', 'supplier', 'Demo long/de: Hier folgt eine ausführliche Beschreibung', 'Hier folgt eine ausführliche Beschreibung des Lieferanten, die gerne etwas länger sein darf.', 1, '2022-03-10 02:07:32', '2022-03-10 02:07:32', 'core:setup'),
	(1215, '1.', _binary 0x6e616d65, 'en', 'supplier', 'Demo name/en: Demo supplier 2', 'Demo supplier 2', 1, '2022-03-10 02:07:32', '2022-03-10 02:07:32', 'core:setup'),
	(1216, '1.', _binary 0x73686f7274, 'en', 'supplier', 'Demo short/en: This is the short description', 'This is the short description of the demo article.', 1, '2022-03-10 02:07:32', '2022-03-10 02:07:32', 'core:setup'),
	(1217, '1.', _binary 0x6c6f6e67, 'en', 'supplier', 'Demo long/en: Add a detailed description', 'Add a detailed description of the demo article that may be a little bit longer.', 1, '2022-03-10 02:07:32', '2022-03-10 02:07:32', 'core:setup'),
	(1218, '1.', _binary 0x6d6574612d6465736372697074696f6e, NULL, 'supplier', 'Demo meta-description', 'Meta descriptions are important because they are shown in the search engine result page', 1, '2022-03-10 02:07:32', '2022-03-10 02:07:32', 'core:setup');
/*!40000 ALTER TABLE `mshop_text` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_text_list
CREATE TABLE IF NOT EXISTS `mshop_text_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` int NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varbinary(134) NOT NULL DEFAULT '',
  `type` varbinary(64) NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refid` varbinary(36) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mstexli_pid_dm_sid_ty_rid` (`parentid`,`domain`,`siteid`,`type`,`refid`),
  KEY `idx_mstexli_key_sid` (`key`,`siteid`),
  KEY `fk_mstexli_pid` (`parentid`),
  CONSTRAINT `fk_mstexli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_text` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_text_list: ~0 rows (aproximadamente)
DELETE FROM `mshop_text_list`;
/*!40000 ALTER TABLE `mshop_text_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_text_list` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_text_list_type
CREATE TABLE IF NOT EXISTS `mshop_text_list_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mstexlity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mstexlity_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_mstexlity_sid_label` (`siteid`,`label`),
  KEY `idx_mstexlity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_text_list_type: ~0 rows (aproximadamente)
DELETE FROM `mshop_text_list_type`;
/*!40000 ALTER TABLE `mshop_text_list_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_text_list_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.mshop_text_type
CREATE TABLE IF NOT EXISTS `mshop_text_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mstexty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mstexty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_mstexty_sid_label` (`siteid`,`label`),
  KEY `idx_mstexty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.mshop_text_type: ~22 rows (aproximadamente)
DELETE FROM `mshop_text_type`;
/*!40000 ALTER TABLE `mshop_text_type` DISABLE KEYS */;
INSERT INTO `mshop_text_type` (`id`, `siteid`, `domain`, `code`, `label`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', 'attribute', _binary 0x6e616d65, 'Name', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(2, '1.', 'attribute', _binary 0x73686f7274, 'Short description', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(3, '1.', 'attribute', _binary 0x6c6f6e67, 'Long description', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(4, '1.', 'catalog', _binary 0x6e616d65, 'Name', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(5, '1.', 'catalog', _binary 0x73686f7274, 'Short description', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(6, '1.', 'catalog', _binary 0x6c6f6e67, 'Long description', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(7, '1.', 'catalog', _binary 0x75726c, 'URL segment', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(8, '1.', 'catalog', _binary 0x6d6574612d6b6579776f7264, 'Meta keywords', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(9, '1.', 'catalog', _binary 0x6d6574612d6465736372697074696f6e, 'Meta description', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(10, '1.', 'product', _binary 0x6e616d65, 'Name', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(11, '1.', 'product', _binary 0x73686f7274, 'Short description', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(12, '1.', 'product', _binary 0x6c6f6e67, 'Long description', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(13, '1.', 'product', _binary 0x75726c, 'URL segment', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(14, '1.', 'product', _binary 0x6d6574612d6b6579776f7264, 'Meta keywords', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(15, '1.', 'product', _binary 0x6d6574612d6465736372697074696f6e, 'Meta description', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(16, '1.', 'product', _binary 0x6261736b6574, 'Basket description', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(17, '1.', 'service', _binary 0x6e616d65, 'Name', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(18, '1.', 'service', _binary 0x73686f7274, 'Short description', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(19, '1.', 'service', _binary 0x6c6f6e67, 'Long description', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(20, '1.', 'supplier', _binary 0x6e616d65, 'Name', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(21, '1.', 'supplier', _binary 0x73686f7274, 'Short description', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(22, '1.', 'supplier', _binary 0x6c6f6e67, 'Long description', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup');
/*!40000 ALTER TABLE `mshop_text_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.pages: ~0 rows (aproximadamente)
DELETE FROM `pages`;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.password_resets: ~0 rows (aproximadamente)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.permissions: ~70 rows (aproximadamente)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
	(1, 'browse_admin', NULL, '2022-02-01 07:35:06', '2022-02-01 07:35:06'),
	(2, 'browse_bread', NULL, '2022-02-01 07:35:06', '2022-02-01 07:35:06'),
	(3, 'browse_database', NULL, '2022-02-01 07:35:06', '2022-02-01 07:35:06'),
	(4, 'browse_media', NULL, '2022-02-01 07:35:06', '2022-02-01 07:35:06'),
	(5, 'browse_compass', NULL, '2022-02-01 07:35:06', '2022-02-01 07:35:06'),
	(6, 'browse_menus', 'menus', '2022-02-01 07:35:06', '2022-02-01 07:35:06'),
	(7, 'read_menus', 'menus', '2022-02-01 07:35:06', '2022-02-01 07:35:06'),
	(8, 'edit_menus', 'menus', '2022-02-01 07:35:06', '2022-02-01 07:35:06'),
	(9, 'add_menus', 'menus', '2022-02-01 07:35:07', '2022-02-01 07:35:07'),
	(10, 'delete_menus', 'menus', '2022-02-01 07:35:07', '2022-02-01 07:35:07'),
	(11, 'browse_roles', 'roles', '2022-02-01 07:35:07', '2022-02-01 07:35:07'),
	(12, 'read_roles', 'roles', '2022-02-01 07:35:07', '2022-02-01 07:35:07'),
	(13, 'edit_roles', 'roles', '2022-02-01 07:35:07', '2022-02-01 07:35:07'),
	(14, 'add_roles', 'roles', '2022-02-01 07:35:07', '2022-02-01 07:35:07'),
	(15, 'delete_roles', 'roles', '2022-02-01 07:35:07', '2022-02-01 07:35:07'),
	(16, 'browse_users', 'users', '2022-02-01 07:35:07', '2022-02-01 07:35:07'),
	(17, 'read_users', 'users', '2022-02-01 07:35:07', '2022-02-01 07:35:07'),
	(18, 'edit_users', 'users', '2022-02-01 07:35:07', '2022-02-01 07:35:07'),
	(19, 'add_users', 'users', '2022-02-01 07:35:08', '2022-02-01 07:35:08'),
	(20, 'delete_users', 'users', '2022-02-01 07:35:08', '2022-02-01 07:35:08'),
	(21, 'browse_settings', 'settings', '2022-02-01 07:35:08', '2022-02-01 07:35:08'),
	(22, 'read_settings', 'settings', '2022-02-01 07:35:08', '2022-02-01 07:35:08'),
	(23, 'edit_settings', 'settings', '2022-02-01 07:35:08', '2022-02-01 07:35:08'),
	(24, 'add_settings', 'settings', '2022-02-01 07:35:08', '2022-02-01 07:35:08'),
	(25, 'delete_settings', 'settings', '2022-02-01 07:35:08', '2022-02-01 07:35:08'),
	(36, 'browse_workshops', 'workshops', '2022-02-01 08:34:38', '2022-02-01 08:34:38'),
	(37, 'read_workshops', 'workshops', '2022-02-01 08:34:38', '2022-02-01 08:34:38'),
	(38, 'edit_workshops', 'workshops', '2022-02-01 08:34:38', '2022-02-01 08:34:38'),
	(39, 'add_workshops', 'workshops', '2022-02-01 08:34:38', '2022-02-01 08:34:38'),
	(40, 'delete_workshops', 'workshops', '2022-02-01 08:34:38', '2022-02-01 08:34:38'),
	(41, 'browse_sponsors', 'sponsors', '2022-02-01 08:44:26', '2022-02-01 08:44:26'),
	(42, 'read_sponsors', 'sponsors', '2022-02-01 08:44:26', '2022-02-01 08:44:26'),
	(43, 'edit_sponsors', 'sponsors', '2022-02-01 08:44:26', '2022-02-01 08:44:26'),
	(44, 'add_sponsors', 'sponsors', '2022-02-01 08:44:26', '2022-02-01 08:44:26'),
	(45, 'delete_sponsors', 'sponsors', '2022-02-01 08:44:26', '2022-02-01 08:44:26'),
	(46, 'browse_chats', 'chats', '2022-02-01 08:44:47', '2022-02-01 08:44:47'),
	(47, 'read_chats', 'chats', '2022-02-01 08:44:47', '2022-02-01 08:44:47'),
	(48, 'edit_chats', 'chats', '2022-02-01 08:44:47', '2022-02-01 08:44:47'),
	(49, 'add_chats', 'chats', '2022-02-01 08:44:47', '2022-02-01 08:44:47'),
	(50, 'delete_chats', 'chats', '2022-02-01 08:44:47', '2022-02-01 08:44:47'),
	(51, 'browse_matches', 'matches', '2022-02-01 08:45:33', '2022-02-01 08:45:33'),
	(52, 'read_matches', 'matches', '2022-02-01 08:45:33', '2022-02-01 08:45:33'),
	(53, 'edit_matches', 'matches', '2022-02-01 08:45:33', '2022-02-01 08:45:33'),
	(54, 'add_matches', 'matches', '2022-02-01 08:45:33', '2022-02-01 08:45:33'),
	(55, 'delete_matches', 'matches', '2022-02-01 08:45:33', '2022-02-01 08:45:33'),
	(56, 'browse_estado', 'estado', '2022-02-02 07:24:44', '2022-02-02 07:24:44'),
	(57, 'read_estado', 'estado', '2022-02-02 07:24:44', '2022-02-02 07:24:44'),
	(58, 'edit_estado', 'estado', '2022-02-02 07:24:44', '2022-02-02 07:24:44'),
	(59, 'add_estado', 'estado', '2022-02-02 07:24:44', '2022-02-02 07:24:44'),
	(60, 'delete_estado', 'estado', '2022-02-02 07:24:44', '2022-02-02 07:24:44'),
	(61, 'browse_state', 'state', '2022-02-02 07:26:28', '2022-02-02 07:26:28'),
	(62, 'read_state', 'state', '2022-02-02 07:26:28', '2022-02-02 07:26:28'),
	(63, 'edit_state', 'state', '2022-02-02 07:26:28', '2022-02-02 07:26:28'),
	(64, 'add_state', 'state', '2022-02-02 07:26:28', '2022-02-02 07:26:28'),
	(65, 'delete_state', 'state', '2022-02-02 07:26:28', '2022-02-02 07:26:28'),
	(66, 'browse_states', 'states', '2022-02-02 07:30:12', '2022-02-02 07:30:12'),
	(67, 'read_states', 'states', '2022-02-02 07:30:12', '2022-02-02 07:30:12'),
	(68, 'edit_states', 'states', '2022-02-02 07:30:12', '2022-02-02 07:30:12'),
	(69, 'add_states', 'states', '2022-02-02 07:30:12', '2022-02-02 07:30:12'),
	(70, 'delete_states', 'states', '2022-02-02 07:30:12', '2022-02-02 07:30:12'),
	(71, 'browse_likes', 'likes', '2022-02-02 08:43:03', '2022-02-02 08:43:03'),
	(72, 'read_likes', 'likes', '2022-02-02 08:43:03', '2022-02-02 08:43:03'),
	(73, 'edit_likes', 'likes', '2022-02-02 08:43:03', '2022-02-02 08:43:03'),
	(74, 'add_likes', 'likes', '2022-02-02 08:43:03', '2022-02-02 08:43:03'),
	(75, 'delete_likes', 'likes', '2022-02-02 08:43:03', '2022-02-02 08:43:03'),
	(81, 'browse_workshop_users', 'workshop_users', '2022-02-07 08:09:07', '2022-02-07 08:09:07'),
	(82, 'read_workshop_users', 'workshop_users', '2022-02-07 08:09:07', '2022-02-07 08:09:07'),
	(83, 'edit_workshop_users', 'workshop_users', '2022-02-07 08:09:07', '2022-02-07 08:09:07'),
	(84, 'add_workshop_users', 'workshop_users', '2022-02-07 08:09:07', '2022-02-07 08:09:07'),
	(85, 'delete_workshop_users', 'workshop_users', '2022-02-07 08:09:07', '2022-02-07 08:09:07');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.permission_role: ~107 rows (aproximadamente)
DELETE FROM `permission_role`;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(1, 2),
	(2, 1),
	(3, 1),
	(4, 1),
	(4, 2),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(16, 2),
	(17, 1),
	(17, 2),
	(18, 1),
	(18, 2),
	(19, 1),
	(19, 2),
	(20, 1),
	(20, 2),
	(21, 1),
	(21, 2),
	(22, 1),
	(22, 2),
	(23, 1),
	(23, 2),
	(24, 1),
	(24, 2),
	(25, 1),
	(25, 2),
	(36, 1),
	(36, 2),
	(37, 1),
	(37, 2),
	(38, 1),
	(38, 2),
	(39, 1),
	(39, 2),
	(40, 1),
	(40, 2),
	(41, 1),
	(41, 2),
	(42, 1),
	(42, 2),
	(43, 1),
	(43, 2),
	(44, 1),
	(44, 2),
	(45, 1),
	(45, 2),
	(46, 1),
	(46, 2),
	(47, 1),
	(47, 2),
	(48, 1),
	(48, 2),
	(49, 1),
	(49, 2),
	(50, 1),
	(50, 2),
	(51, 1),
	(51, 2),
	(52, 1),
	(52, 2),
	(53, 1),
	(53, 2),
	(54, 1),
	(54, 2),
	(55, 1),
	(55, 2),
	(56, 1),
	(57, 1),
	(58, 1),
	(59, 1),
	(60, 1),
	(61, 1),
	(62, 1),
	(63, 1),
	(64, 1),
	(65, 1),
	(66, 1),
	(67, 1),
	(68, 1),
	(69, 1),
	(70, 1),
	(71, 1),
	(71, 2),
	(72, 1),
	(72, 2),
	(73, 1),
	(73, 2),
	(74, 1),
	(74, 2),
	(75, 1),
	(75, 2),
	(81, 1),
	(82, 1),
	(83, 1),
	(84, 1),
	(85, 1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.personal_access_tokens: ~0 rows (aproximadamente)
DELETE FROM `personal_access_tokens`;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.posts: ~0 rows (aproximadamente)
DELETE FROM `posts`;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imgUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.products: ~0 rows (aproximadamente)
DELETE FROM `products`;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.purchases
CREATE TABLE IF NOT EXISTS `purchases` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `cart_id` bigint unsigned NOT NULL,
  `purchase_date` date NOT NULL,
  `accepted_payment_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchases_accepted_payment_token_unique` (`accepted_payment_token`),
  KEY `purchases_user_id_foreign` (`user_id`),
  KEY `purchases_cart_id_foreign` (`cart_id`),
  CONSTRAINT `purchases_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  CONSTRAINT `purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.purchases: ~0 rows (aproximadamente)
DELETE FROM `purchases`;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.roles: ~4 rows (aproximadamente)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrador', '2022-02-01 07:35:06', '2022-02-01 07:35:06'),
	(2, 'owner', 'GureTabadul Owner', '2022-02-01 07:35:06', '2022-02-01 07:35:06'),
	(3, 'user', 'Usuario Normal', '2022-02-01 07:35:06', '2022-02-01 07:35:06'),
	(4, 'visitante', 'Visitante', '2022-02-01 07:35:06', '2022-02-01 07:35:06');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.settings: ~10 rows (aproximadamente)
DELETE FROM `settings`;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
	(1, 'site.title', 'Título del sitio', 'GureTabadul', '', 'text', 1, 'Site'),
	(2, 'site.description', 'Descripción del sitio', NULL, '', 'text', 2, 'Site'),
	(3, 'site.logo', 'Logo del sitio', 'settings\\February2022\\BXfqlkl00jrmvoNKpVWh.png', '', 'image', 3, 'Site'),
	(4, 'site.google_analytics_tracking_id', 'ID de rastreo de Google Analytics', NULL, '', 'text', 4, 'Site'),
	(5, 'admin.bg_image', 'Imagen de fondo del administrador', 'settings\\February2022\\kFFbRcLqIg7hjZmciSX4.png', '', 'image', 5, 'Admin'),
	(6, 'admin.title', 'Título del administrador', 'GureTabadul', '', 'text', 1, 'Admin'),
	(7, 'admin.description', 'Descripción del administrador', 'Inicia Sesión para entrar al panel de Administración', '', 'text', 2, 'Admin'),
	(8, 'admin.loader', 'Imagen de carga del administrador', 'settings\\February2022\\Wlauc0oDO0ojm0JA9veM.png', '', 'image', 3, 'Admin'),
	(9, 'admin.icon_image', 'Ícono del administrador', 'settings\\February2022\\CUrgNDfq9PZwXXKdFxsV.png', '', 'image', 4, 'Admin'),
	(10, 'admin.google_analytics_client_id', 'ID de Cliente para Google Analytics (usado para el tablero de administrador)', NULL, '', 'text', 1, 'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.sponsors
CREATE TABLE IF NOT EXISTS `sponsors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imgUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.sponsors: ~5 rows (aproximadamente)
DELETE FROM `sponsors`;
/*!40000 ALTER TABLE `sponsors` DISABLE KEYS */;
INSERT INTO `sponsors` (`id`, `name`, `url`, `description`, `imgUrl`, `created_at`, `updated_at`) VALUES
	(9, 'Spotify', 'open.spotify.com', 'Esto es para escchar musica', 'sponsors\\February2022\\xFTmueAYZ009KGiwLCXP.png', '2022-02-03 09:05:25', '2022-02-03 12:10:07'),
	(10, 'Amazon', 'www.amazon.com', 'Compra y gasta dinero puto', 'sponsors\\February2022\\KaYAYfJJqMWTMDkESyyn.png', '2022-02-03 09:06:06', '2022-02-03 12:10:38'),
	(11, 'Raimon', 'https://inazuma.fandom.com/es/wiki/Instituto_Raimon', 'putosamos', 'sponsors\\February2022\\wS162nH78iOqP1DZ52Wt.png', '2022-02-03 09:07:25', '2022-02-03 12:09:12'),
	(12, 'Bertiz', 'www.bertiz.es', 'VIVA EL CAFOE', 'sponsors\\February2022\\fo2w3vJLlTgNkUiyJYF3.png', '2022-02-03 09:07:51', '2022-02-03 12:20:58'),
	(13, 'Vuela raso', 'www.vuelaraso.es', 'Gasta el dinero para que se lo den al mikel, que ta pobre :(', 'sponsors\\February2022\\ljAl8zaEXuLxlhMC6UUT.png', '2022-02-03 09:08:31', '2022-02-03 12:20:51');
/*!40000 ALTER TABLE `sponsors` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.states
CREATE TABLE IF NOT EXISTS `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.states: ~4 rows (aproximadamente)
DELETE FROM `states`;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'No procesado', '2022-02-02', '2022-02-02'),
	(2, 'En proceso', '2022-02-02', '2022-02-02'),
	(3, 'Aceptado', '2022-02-02', '2022-02-02'),
	(4, 'Denegado', '2022-02-02', '2022-02-02');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.texts
CREATE TABLE IF NOT EXISTS `texts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` mediumtext,
  `id_language` int NOT NULL,
  `key` varchar(150) DEFAULT NULL,
  `zone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_texts_languages` (`id_language`),
  CONSTRAINT `FK_texts_languages` FOREIGN KEY (`id_language`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla guretabadul.texts: ~3 rows (aproximadamente)
DELETE FROM `texts`;
/*!40000 ALTER TABLE `texts` DISABLE KEYS */;
INSERT INTO `texts` (`id`, `text`, `id_language`, `key`, `zone`) VALUES
	(1, 'Servicios', 1, 'services-navb', 'navbar'),
	(2, 'Services', 2, 'services-navb', 'navbar'),
	(3, 'Zerbitzuak', 3, 'services-navb', 'navbar');
/*!40000 ALTER TABLE `texts` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.translations
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.translations: ~0 rows (aproximadamente)
DELETE FROM `translations`;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT '3',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` date DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `phone` int DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `village` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `acepted` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `superuser` smallint NOT NULL DEFAULT '0',
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `salutation` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `company` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vatid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address1` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address2` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address3` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `postal` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `langid` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `countryid` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `telefax` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '1',
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_lvusr_email` (`email`),
  KEY `idx_lvusr_langid` (`langid`),
  KEY `idx_lvusr_last_first` (`lastname`,`firstname`),
  KEY `idx_lvusr_post_addr1` (`postal`,`address1`),
  KEY `idx_lvusr_post_city` (`postal`,`city`),
  KEY `idx_lvusr_lastname` (`lastname`),
  KEY `idx_lvusr_address1` (`address1`),
  KEY `idx_lvusr_city` (`city`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.users: ~9 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `phone`, `country`, `village`, `address`, `banned`, `acepted`, `deleted_at`, `superuser`, `siteid`, `salutation`, `company`, `vatid`, `title`, `firstname`, `lastname`, `address1`, `address2`, `address3`, `postal`, `city`, `state`, `langid`, `countryid`, `telephone`, `telefax`, `website`, `longitude`, `latitude`, `birthday`, `status`, `editor`) VALUES
	(1, 1, 'Admin', 'Raimon4@guretabadul.com', 'users\\February2022\\k64UQfMamLky6RYz35CT.jpg', NULL, '$2y$10$E3sebi6m5D0KrgREj525xu2x8axKEjnKjd2t4HUQVR01CYv/DwDUi', 'h87hjSeuT31DKWa1MpCCfnYAUeFWXjDmMCzyJGpRGY1MopEBPoVVhbKdi1N4', NULL, '2022-02-01 07:35:11', '2022-02-03 07:55:53', 623526137, 'España', 'Bilbao', 'Indautxu', 0, 0, NULL, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', NULL, NULL, NULL, 1, ''),
	(2, 2, 'Ibone', 'admin@guretabadul.com', 'users\\February2022\\Bll4uUjr4J3HKkW2MR6O.png', NULL, '$2y$10$E3sebi6m5D0KrgREj525xu2x8axKEjnKjd2t4HUQVR01CYv/DwDUi', 'VkL7Erfl2Pxht4pI0gg6y7VgvT4TlfOa0vHfCjiOGeLFM2NfKj6UFkhpKwhp', NULL, '2022-02-01 07:35:11', '2022-02-03 10:10:19', 762362123, 'España', 'Bilbao', 'Indautxu', 0, 0, NULL, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', NULL, NULL, NULL, 1, ''),
	(3, 3, 'Manola', 'manola@yahoo.es', 'users\\February2022\\ZisBVtQkvZtUKwjqmQBn.png', NULL, '$2y$10$KEO1nBJHz.O0G7VVqfKjJOYqOpajWpbtNWrsiLvtXKbjNvztCNvOy', NULL, NULL, '2022-02-01 08:01:42', '2022-03-07 08:02:34', 1231232, 'España', 'Bilbao', 'Av tupa n234', 0, 0, NULL, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', NULL, NULL, NULL, 1, ''),
	(4, 4, 'Manola2', 'Manola4@yahoo.es', 'users\\February2022\\HwjNMeBQBrAuKUE0QLL9.png', NULL, '$2y$10$OJYqNByPYY6pirogUlEzdOd4li7hVqt7BIlTQ5Q0a6JTO1IaulqkO', NULL, NULL, '2022-02-01 11:14:24', '2022-02-08 10:50:24', 1231232, 'España', 'Bilbao', 'Av tupa n234', 0, 0, NULL, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', NULL, NULL, NULL, 1, ''),
	(18, 3, 'Maria', 'maria202@gmail.com', 'users\\February2022\\HwjNMeBQBrAuKUE0QLL9.png', NULL, '$2y$10$7J5zzGj5yAPnIOaFGl2WjOx4QfCSbLAizIXnXKqgduWpZxtXSJtfe', NULL, NULL, '2022-02-09 09:43:28', '2022-02-09 09:43:28', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', NULL, NULL, NULL, 1, ''),
	(19, 3, 'Laura', 'laura2022@gmail.com', 'users\\February2022\\Bll4uUjr4J3HKkW2MR6O.png', NULL, '', NULL, NULL, '2022-02-09 10:49:25', '2022-02-09 10:49:26', 654321789, 'España', 'Bilbao', 'Deusto', 0, 0, NULL, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', NULL, NULL, NULL, 1, ''),
	(20, 4, 'kasjsja', 'Raimon4@guretabadul.com2022-02-09 15:47:04', 'users/default.png', NULL, 'visitante', NULL, NULL, '2022-02-09 15:47:04', '2022-02-09 15:47:04', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', NULL, NULL, NULL, 1, ''),
	(21, 2, 'puto', '3', 'users/default.png', NULL, 'z', NULL, NULL, '2022-03-07 08:33:00', '2022-03-07 08:33:00', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', NULL, NULL, NULL, 1, ''),
	(25, 2, 'puto2', 'puto@puto2', 'users/default.png', NULL, 'z', NULL, NULL, '2022-03-07 08:38:33', '2022-03-07 08:38:33', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', NULL, NULL, NULL, 1, '');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.users_address
CREATE TABLE IF NOT EXISTS `users_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` bigint unsigned NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vatid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salutation` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address3` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `countryid` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefax` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `pos` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lvuad_pid` (`parentid`),
  KEY `idx_lvuad_last_first` (`lastname`,`firstname`),
  KEY `idx_lvuad_post_addr1` (`postal`,`address1`),
  KEY `idx_lvuad_post_city` (`postal`,`city`),
  KEY `idx_lvuad_address1` (`address1`),
  KEY `idx_lvuad_city` (`city`),
  KEY `idx_lvuad_email` (`email`),
  CONSTRAINT `fk_lvuad_pid` FOREIGN KEY (`parentid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.users_address: ~1 rows (aproximadamente)
DELETE FROM `users_address`;
/*!40000 ALTER TABLE `users_address` DISABLE KEYS */;
INSERT INTO `users_address` (`id`, `parentid`, `siteid`, `company`, `vatid`, `salutation`, `title`, `firstname`, `lastname`, `address1`, `address2`, `address3`, `postal`, `city`, `state`, `langid`, `countryid`, `telephone`, `email`, `telefax`, `website`, `longitude`, `latitude`, `birthday`, `pos`, `mtime`, `ctime`, `editor`) VALUES
	(6, 31, '1.', 'Demo company', 'DE999999999', 'ms', '', 'Test', 'User', 'Demo street', '100', '', '12345', 'Demo city', 'NY', 'en', 'US', '', 'demo@example.com', '', '', NULL, NULL, NULL, 0, '2022-03-10 02:07:31', '2022-03-10 02:07:31', 'core:setup');
/*!40000 ALTER TABLE `users_address` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.users_list
CREATE TABLE IF NOT EXISTS `users_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` bigint unsigned NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varbinary(134) NOT NULL DEFAULT '',
  `type` varbinary(64) NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refid` varbinary(36) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL,
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_lvuli_pid_dm_sid_ty_rid` (`parentid`,`domain`,`siteid`,`type`,`refid`),
  KEY `idx_lvuli_key_sid` (`key`,`siteid`),
  KEY `fk_lvuli_pid` (`parentid`),
  CONSTRAINT `fk_lvuli_pid` FOREIGN KEY (`parentid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.users_list: ~0 rows (aproximadamente)
DELETE FROM `users_list`;
/*!40000 ALTER TABLE `users_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_list` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.users_list_type
CREATE TABLE IF NOT EXISTS `users_list_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_lvulity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_lvulity_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_lvulity_sid_label` (`siteid`,`label`),
  KEY `idx_lvulity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.users_list_type: ~5 rows (aproximadamente)
DELETE FROM `users_list_type`;
/*!40000 ALTER TABLE `users_list_type` DISABLE KEYS */;
INSERT INTO `users_list_type` (`id`, `siteid`, `domain`, `code`, `label`, `pos`, `status`, `mtime`, `ctime`, `editor`) VALUES
	(1, '1.', 'customer/group', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(2, '1.', 'product', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(3, '1.', 'product', _binary 0x6661766f72697465, 'Favorite', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(4, '1.', 'product', _binary 0x7761746368, 'Watch list', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup'),
	(5, '1.', 'service', _binary 0x64656661756c74, 'Standard', 0, 1, '2022-03-10 01:12:49', '2022-03-10 01:12:49', 'core:setup');
/*!40000 ALTER TABLE `users_list_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.users_property
CREATE TABLE IF NOT EXISTS `users_property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` bigint unsigned NOT NULL,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varbinary(103) NOT NULL DEFAULT '',
  `type` varbinary(64) NOT NULL,
  `langid` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_lvupr_sid_ty_lid_value` (`parentid`,`siteid`,`type`,`langid`,`value`),
  KEY `fk_lvupr_key_sid` (`key`,`siteid`),
  KEY `fk_lvupr_pid` (`parentid`),
  CONSTRAINT `fk_lvupr_pid` FOREIGN KEY (`parentid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.users_property: ~0 rows (aproximadamente)
DELETE FROM `users_property`;
/*!40000 ALTER TABLE `users_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_property` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.users_property_type
CREATE TABLE IF NOT EXISTS `users_property_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varbinary(64) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_lvuprty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_lvuprty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_lvuprty_sid_label` (`siteid`,`label`),
  KEY `idx_lvuprty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.users_property_type: ~0 rows (aproximadamente)
DELETE FROM `users_property_type`;
/*!40000 ALTER TABLE `users_property_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_property_type` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.user_roles: ~2 rows (aproximadamente)
DELETE FROM `user_roles`;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
	(18, 4),
	(19, 3);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.workshops
CREATE TABLE IF NOT EXISTS `workshops` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imgUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `precio` int NOT NULL DEFAULT '0',
  `plazas` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.workshops: ~4 rows (aproximadamente)
DELETE FROM `workshops`;
/*!40000 ALTER TABLE `workshops` DISABLE KEYS */;
INSERT INTO `workshops` (`id`, `name`, `date`, `description`, `imgUrl`, `created_at`, `updated_at`, `precio`, `plazas`) VALUES
	(7, 'Pollo Nyembwe', '2022-12-09', 'El pollo Nyembwe se considera el plato nacional de Gabón. Este plato es muy popular en muchos países africanos, África occidental y central. Consiste en pollo ahumado, mantequilla de nuez de palma y cebolla.', 'https://lejournaldelafrique.com/wp-content/uploads/2021/04/001ec94a27151170bbec23.jpg', '2022-02-03 07:48:32', '2022-02-09 09:32:06', 5, 5),
	(8, 'Pastel vasco', '5445-05-02', 'El pastel vasco ​ es un postre cuyo origen está en la región vasco-francesa de Lapurdi.', 'https://www.hola.com/imagenes/cocina/recetas/20200916175374/pastel-vasco-crema-pastelera/0-865-897/pastel-vasco-receta-facil-m.jpg', '2022-02-03 11:25:09', '2022-02-09 09:32:14', 10, 15),
	(9, 'sagar dantza', '2030-12-09', 'Danza que se realizan en el valle del Baztán en época de carnaval. No hay una única danza, ya que cada pueblo tiene la suya; por lo tanto, el nombre idóneo sería Sagar Dantzak.', 'https://static1.diariovasco.com/www/pre2017/multimedia/prensa/noticias/201009/25/fotos/7830549.jpg', '2022-02-09 09:35:46', '2022-02-09 09:35:46', 12, 20),
	(10, 'Halva dulce', '2023-09-10', 'Dulces basados en pasta de sésamo', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Halwa_at_Mitayi_street_clt.jpg/1280px-Halwa_at_Mitayi_street_clt.jpg', '2022-02-09 09:40:17', '2022-02-09 09:40:17', 5, 20);
/*!40000 ALTER TABLE `workshops` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.workshop_users
CREATE TABLE IF NOT EXISTS `workshop_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `workshop_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workshop_users_user_id_foreign` (`user_id`),
  KEY `workshop_users_workshop_id_foreign` (`workshop_id`),
  CONSTRAINT `workshop_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `workshop_users_workshop_id_foreign` FOREIGN KEY (`workshop_id`) REFERENCES `workshops` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.workshop_users: ~6 rows (aproximadamente)
DELETE FROM `workshop_users`;
/*!40000 ALTER TABLE `workshop_users` DISABLE KEYS */;
INSERT INTO `workshop_users` (`id`, `user_id`, `workshop_id`, `created_at`, `updated_at`) VALUES
	(23, 19, 7, NULL, NULL),
	(24, 18, 9, NULL, NULL),
	(25, 3, 10, NULL, NULL),
	(26, 4, 8, NULL, NULL),
	(27, 20, 10, '2022-02-09 15:47:04', '2022-02-09 15:47:04'),
	(28, 1, 10, '2022-02-09 16:17:20', '2022-02-09 16:17:20');
/*!40000 ALTER TABLE `workshop_users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
