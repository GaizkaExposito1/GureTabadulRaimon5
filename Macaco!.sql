-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.18 - MySQL Community Server - GPL
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `imgChat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'users/default.png',
  `nuevoMensaje` tinyint(4) NOT NULL DEFAULT '0',
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
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
  `order` int(11) NOT NULL DEFAULT '1',
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user1_id` bigint(20) unsigned NOT NULL,
  `user2_id` bigint(20) unsigned NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(150) DEFAULT NULL,
  `lang` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla guretabadul.languages: ~0 rows (aproximadamente)
DELETE FROM `languages`;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` (`id`, `language`, `lang`) VALUES
	(1, 'Español', 'es'),
	(2, 'English', 'en'),
	(3, 'Euskara', 'eus');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.likes
CREATE TABLE IF NOT EXISTS `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `like_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `isAprender` tinyint(4) NOT NULL DEFAULT '0',
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

-- Volcando estructura para tabla guretabadul.matches
CREATE TABLE IF NOT EXISTS `matches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user1_id` bigint(20) unsigned NOT NULL,
  `user2_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `estado` tinyint(4) NOT NULL,
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.menus: ~0 rows (aproximadamente)
DELETE FROM `menus`;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2022-02-01 07:35:05', '2022-02-01 07:35:05');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.menu_items
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `isAdmin` tinyint(1) NOT NULL,
  `chat_id` bigint(20) unsigned NOT NULL,
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- Volcando estructura para tabla guretabadul.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
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

-- Volcando estructura para tabla guretabadul.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `cart_id` bigint(20) unsigned NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` mediumtext,
  `id_language` int(11) NOT NULL,
  `key` varchar(150) DEFAULT NULL,
  `zone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_texts_languages` (`id_language`),
  CONSTRAINT `FK_texts_languages` FOREIGN KEY (`id_language`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla guretabadul.texts: ~0 rows (aproximadamente)
DELETE FROM `texts`;
/*!40000 ALTER TABLE `texts` DISABLE KEYS */;
INSERT INTO `texts` (`id`, `text`, `id_language`, `key`, `zone`) VALUES
	(1, 'Servicios', 1, 'services-navb', 'navbar'),
	(2, 'Services', 2, 'services-navb', 'navbar'),
	(3, 'Zerbitzuak', 3, 'services-navb', 'navbar');
/*!40000 ALTER TABLE `texts` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.translations
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT '3',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `village` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `acepted` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla guretabadul.users: ~7 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `phone`, `country`, `village`, `address`, `banned`, `acepted`, `deleted_at`) VALUES
	(1, 1, 'Admin', 'Raimon4@guretabadul.com', 'users\\February2022\\k64UQfMamLky6RYz35CT.jpg', NULL, '$2y$10$E3sebi6m5D0KrgREj525xu2x8axKEjnKjd2t4HUQVR01CYv/DwDUi', 'RZ7CDu4OKPzq6c8Y8Eaquk5VVLGL3zBeZfACWqjc6dk7vFWEsieMjqCDYAuB', NULL, '2022-02-01 07:35:11', '2022-02-03 07:55:53', 623526137, 'España', 'Bilbao', 'Indautxu', 0, 0, NULL),
	(2, 2, 'Ibone', 'admin@guretabadul.com', 'users\\February2022\\Bll4uUjr4J3HKkW2MR6O.png', NULL, '$2y$10$E3sebi6m5D0KrgREj525xu2x8axKEjnKjd2t4HUQVR01CYv/DwDUi', 'VkL7Erfl2Pxht4pI0gg6y7VgvT4TlfOa0vHfCjiOGeLFM2NfKj6UFkhpKwhp', NULL, '2022-02-01 07:35:11', '2022-02-03 10:10:19', 762362123, 'España', 'Bilbao', 'Indautxu', 0, 0, NULL),
	(3, 3, 'Manola', 'manola@yahoo.es', 'users\\February2022\\ZisBVtQkvZtUKwjqmQBn.png', NULL, '$2y$10$KEO1nBJHz.O0G7VVqfKjJOYqOpajWpbtNWrsiLvtXKbjNvztCNvOy', NULL, NULL, '2022-02-01 08:01:42', '2022-03-07 08:02:34', 1231232, 'España', 'Bilbao', 'Av tupa n234', 0, 0, NULL),
	(4, 4, 'Manola2', 'Manola4@yahoo.es', 'users\\February2022\\HwjNMeBQBrAuKUE0QLL9.png', NULL, '$2y$10$OJYqNByPYY6pirogUlEzdOd4li7hVqt7BIlTQ5Q0a6JTO1IaulqkO', NULL, NULL, '2022-02-01 11:14:24', '2022-02-08 10:50:24', 1231232, 'España', 'Bilbao', 'Av tupa n234', 0, 0, NULL),
	(18, 3, 'Maria', 'maria202@gmail.com', 'users\\February2022\\HwjNMeBQBrAuKUE0QLL9.png', NULL, '$2y$10$7J5zzGj5yAPnIOaFGl2WjOx4QfCSbLAizIXnXKqgduWpZxtXSJtfe', NULL, NULL, '2022-02-09 09:43:28', '2022-02-09 09:43:28', NULL, NULL, NULL, NULL, 0, 1, NULL),
	(19, 3, 'Laura', 'laura2022@gmail.com', 'users\\February2022\\Bll4uUjr4J3HKkW2MR6O.png', NULL, '', NULL, NULL, '2022-02-09 10:49:25', '2022-02-09 10:49:26', 654321789, 'España', 'Bilbao', 'Deusto', 0, 0, NULL),
	(20, 4, 'kasjsja', 'Raimon4@guretabadul.com2022-02-09 15:47:04', 'users/default.png', NULL, 'visitante', NULL, NULL, '2022-02-09 15:47:04', '2022-02-09 15:47:04', NULL, NULL, NULL, NULL, 0, 0, NULL),
	(21, 2, 'puto', '3', 'users/default.png', NULL, 'z', NULL, NULL, '2022-03-07 08:33:00', '2022-03-07 08:33:00', NULL, NULL, NULL, NULL, 0, 0, NULL),
	(25, 2, 'puto2', 'puto@puto2', 'users/default.png', NULL, 'z', NULL, NULL, '2022-03-07 08:38:33', '2022-03-07 08:38:33', NULL, NULL, NULL, NULL, 0, 0, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla guretabadul.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imgUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `precio` int(11) NOT NULL DEFAULT '0',
  `plazas` int(11) DEFAULT '0',
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `workshop_id` bigint(20) unsigned NOT NULL,
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
