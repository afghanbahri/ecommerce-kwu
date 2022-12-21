-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 8.0.30 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk laravel-ecom02
CREATE DATABASE IF NOT EXISTS `laravel-ecom02` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `laravel-ecom02`;

-- membuang struktur untuk table laravel-ecom02.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` text COLLATE utf8mb4_unicode_ci,
  `category_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_category_id_foreign` (`category_id`),
  CONSTRAINT `categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel laravel-ecom02.categories: ~4 rows (lebih kurang)
INSERT INTO `categories` (`id`, `name`, `slug`, `cover`, `category_id`, `created_at`, `updated_at`) VALUES
	(1, 'Ventela', 'ventela', NULL, NULL, '2022-12-20 09:34:31', '2022-12-20 09:34:31'),
	(2, 'Compass', 'compass', NULL, NULL, '2022-12-20 21:15:01', '2022-12-20 21:15:01'),
	(3, 'Warrior', 'warrior', NULL, NULL, '2022-12-20 21:15:14', '2022-12-20 21:15:14'),
	(4, 'Patrobas', 'patrobas', NULL, NULL, '2022-12-20 21:15:25', '2022-12-20 21:15:25');

-- membuang struktur untuk table laravel-ecom02.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel laravel-ecom02.failed_jobs: ~0 rows (lebih kurang)

-- membuang struktur untuk table laravel-ecom02.media
CREATE TABLE IF NOT EXISTS `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint unsigned NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `media_order_column_index` (`order_column`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel laravel-ecom02.media: ~20 rows (lebih kurang)
INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
	(3, 'App\\Models\\Category', 1, '05725558-07ea-42f9-b3a4-19764fa814f4', 'photo', '63a284fc7649b_Slide1', '63a284fc7649b_Slide1.PNG', 'image/png', 'public', 'public', 9225, '[]', '[]', '[]', '[]', 1, '2022-12-20 21:01:02', '2022-12-20 21:01:02'),
	(5, 'App\\Models\\Product', 1, '76754b56-2c12-41ef-8df6-8793278fed5a', 'gallery', '63a28816e53b9_Picture1', '63a28816e53b9_Picture1.jpg', 'image/jpeg', 'public', 'public', 43526, '[]', '[]', '[]', '[]', 1, '2022-12-20 21:14:16', '2022-12-20 21:14:16'),
	(6, 'App\\Models\\Category', 2, 'b0145f26-9096-4ad1-b039-3ad9414e5aa9', 'photo', '63a288417aeca_Slide2', '63a288417aeca_Slide2.PNG', 'image/png', 'public', 'public', 9979, '[]', '[]', '[]', '[]', 1, '2022-12-20 21:15:01', '2022-12-20 21:15:01'),
	(7, 'App\\Models\\Category', 3, '90d90029-82ba-4cce-b0d5-0f104c4fab10', 'photo', '63a2885120755_Slide3', '63a2885120755_Slide3.PNG', 'image/png', 'public', 'public', 9537, '[]', '[]', '[]', '[]', 1, '2022-12-20 21:15:14', '2022-12-20 21:15:14'),
	(8, 'App\\Models\\Category', 4, '839fae24-6cff-4259-aad3-1b1c0cea1083', 'photo', '63a2885c0c1bc_Slide4', '63a2885c0c1bc_Slide4.PNG', 'image/png', 'public', 'public', 10601, '[]', '[]', '[]', '[]', 1, '2022-12-20 21:15:25', '2022-12-20 21:15:25'),
	(9, 'App\\Models\\Product', 2, '837ae49c-0880-4591-b540-44c756c7d9a9', 'gallery', '63a289426012a_Picture2', '63a289426012a_Picture2.jpg', 'image/jpeg', 'public', 'public', 45207, '[]', '[]', '[]', '[]', 1, '2022-12-20 21:19:43', '2022-12-20 21:19:43'),
	(10, 'App\\Models\\Product', 3, 'de8f590c-4a89-404c-bf30-ca7bac57bf12', 'gallery', '63a2897e072fb_Picture3', '63a2897e072fb_Picture3.jpg', 'image/jpeg', 'public', 'public', 47896, '[]', '[]', '[]', '[]', 1, '2022-12-20 21:20:37', '2022-12-20 21:20:37'),
	(11, 'App\\Models\\Product', 4, '12c3991a-dbc5-4d13-9567-4a41db48211a', 'gallery', '63a289cb2dc73_Picture4', '63a289cb2dc73_Picture4.jpg', 'image/jpeg', 'public', 'public', 49464, '[]', '[]', '[]', '[]', 1, '2022-12-20 21:21:32', '2022-12-20 21:21:32'),
	(12, 'App\\Models\\Product', 5, '750ad5f5-9e3b-4332-bb15-90289b72d423', 'gallery', '63a28b7093462_compas1', '63a28b7093462_compas1.jpg', 'image/jpeg', 'public', 'public', 54328, '[]', '[]', '[]', '[]', 1, '2022-12-20 21:28:36', '2022-12-20 21:28:36'),
	(13, 'App\\Models\\Product', 6, '3c143db3-446e-4281-b688-096e21874eea', 'gallery', '63a28c9f4febe_compas2', '63a28c9f4febe_compas2.jpg', 'image/jpeg', 'public', 'public', 63811, '[]', '[]', '[]', '[]', 1, '2022-12-20 21:33:37', '2022-12-20 21:33:37'),
	(14, 'App\\Models\\Product', 7, '9966d9b8-7a0c-48b2-8680-be9d4e999ac1', 'gallery', '63a28ce409ae4_compas3', '63a28ce409ae4_compas3.jpg', 'image/jpeg', 'public', 'public', 79629, '[]', '[]', '[]', '[]', 1, '2022-12-20 21:34:45', '2022-12-20 21:34:45'),
	(15, 'App\\Models\\Product', 8, '5bb15c56-b268-41ae-b4fe-3aafd2d20e31', 'gallery', '63a28d2953b03_Compass Retrograde Slip On Black', '63a28d2953b03_Compass-Retrograde-Slip-On-Black.jpg', 'image/jpeg', 'public', 'public', 63420, '[]', '[]', '[]', '[]', 1, '2022-12-20 21:35:55', '2022-12-20 21:35:55'),
	(16, 'App\\Models\\Product', 9, '2249c601-8a29-4e3b-a610-e13cb21fa22c', 'gallery', '63a28d3f7086d_Warrior Classic High Black White - 149900', '63a28d3f7086d_Warrior-Classic-High-Black-White---149900.jpeg', 'image/jpeg', 'public', 'public', 221391, '[]', '[]', '[]', '[]', 1, '2022-12-20 21:38:54', '2022-12-20 21:38:54'),
	(17, 'App\\Models\\Product', 10, 'f8450141-6143-4b4f-a21a-9515d59533b2', 'gallery', '63a28e3a2dcbf_WARRIOR SLIP ON AVATAR 2.0 - 179900', '63a28e3a2dcbf_WARRIOR-SLIP-ON-AVATAR-2.0---179900.jpg', 'image/jpeg', 'public', 'public', 239821, '[]', '[]', '[]', '[]', 1, '2022-12-20 21:40:47', '2022-12-20 21:40:47'),
	(18, 'App\\Models\\Product', 11, '3867f747-73d4-48f9-aa06-673fa2bd93d8', 'gallery', '63a28ec076547_Warrior Tristan HC- 239900', '63a28ec076547_Warrior-Tristan-HC--239900.jpg', 'image/jpeg', 'public', 'public', 114695, '[]', '[]', '[]', '[]', 1, '2022-12-20 21:42:43', '2022-12-20 21:42:43'),
	(19, 'App\\Models\\Product', 12, '5c0e9c8e-d4bd-4e2f-b7b8-3d69f037c5d8', 'gallery', '63a28ed5a5299_Zeus - 269900', '63a28ed5a5299_Zeus---269900.jpg', 'image/jpeg', 'public', 'public', 63421, '[]', '[]', '[]', '[]', 1, '2022-12-20 21:45:54', '2022-12-20 21:45:54'),
	(20, 'App\\Models\\Product', 13, '0ac560c6-663a-495a-b7e3-53e9e82daa27', 'gallery', '63a28fdc1f132_Patrobas Ivan Black White - 279900', '63a28fdc1f132_Patrobas-Ivan-Black-White---279900.jpeg', 'image/jpeg', 'public', 'public', 87573, '[]', '[]', '[]', '[]', 1, '2022-12-20 21:47:39', '2022-12-20 21:47:39'),
	(21, 'App\\Models\\Product', 14, 'e45762d6-a5c9-4ab0-8977-57b905eba5a7', 'gallery', '63a2904d25fb8_Patrobas Cloud Slip On Black White - 289900', '63a2904d25fb8_Patrobas-Cloud-Slip-On-Black-White---289900.jpeg', 'image/jpeg', 'public', 'public', 96314, '[]', '[]', '[]', '[]', 1, '2022-12-20 21:49:45', '2022-12-20 21:49:45'),
	(22, 'App\\Models\\Product', 15, '9c685230-24bc-4e57-bacd-fdf2d02caf91', 'gallery', '63a290c85b250_Patrobas x Cleo Black Low - 529900', '63a290c85b250_Patrobas-x-Cleo-Black-Low---529900.jpeg', 'image/jpeg', 'public', 'public', 100151, '[]', '[]', '[]', '[]', 1, '2022-12-20 21:51:47', '2022-12-20 21:51:47'),
	(23, 'App\\Models\\Product', 16, '67b30ba9-79bb-4679-a6d9-036c09eb0822', 'gallery', '63a2911ccde5c_Patrobas x Cleo Black High - 549900', '63a2911ccde5c_Patrobas-x-Cleo-Black-High---549900.jpeg', 'image/jpeg', 'public', 'public', 103574, '[]', '[]', '[]', '[]', 1, '2022-12-20 21:53:02', '2022-12-20 21:53:02');

-- membuang struktur untuk table laravel-ecom02.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel laravel-ecom02.migrations: ~13 rows (lebih kurang)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2022_03_30_011648_create_categories_table', 1),
	(6, '2022_04_19_071658_create_media_table', 1),
	(7, '2022_04_27_063355_create_tags_table', 1),
	(8, '2022_04_28_210054_create_products_table', 1),
	(9, '2022_05_05_055458_create_product_tag_table', 1),
	(10, '2022_08_15_055828_create_orders_table', 1),
	(11, '2022_08_16_053218_create_order_items_table', 1),
	(12, '2022_08_16_053450_create_shipments_table', 1),
	(13, '2022_08_16_053945_create_payments_table', 1);

-- membuang struktur untuk table laravel-ecom02.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` datetime NOT NULL,
  `payment_due` datetime NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_total_price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `tax_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `tax_percent` decimal(16,2) NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `discount_percent` decimal(16,2) NOT NULL DEFAULT '0.00',
  `shipping_cost` decimal(16,2) NOT NULL DEFAULT '0.00',
  `grand_total` decimal(16,2) NOT NULL DEFAULT '0.00',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `customer_first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_city_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_province_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_postcode` int DEFAULT NULL,
  `shipping_courier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_service_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_by` bigint unsigned DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `cancelled_by` bigint unsigned DEFAULT NULL,
  `cancelled_at` datetime DEFAULT NULL,
  `cancellation_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_code_unique` (`code`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_approved_by_foreign` (`approved_by`),
  KEY `orders_cancelled_by_foreign` (`cancelled_by`),
  KEY `orders_payment_token_index` (`payment_token`),
  KEY `orders_code_index` (`code`),
  KEY `orders_code_order_date_index` (`code`,`order_date`),
  CONSTRAINT `orders_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel laravel-ecom02.orders: ~0 rows (lebih kurang)

-- membuang struktur untuk table laravel-ecom02.order_items
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL,
  `base_price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `base_total` decimal(16,2) NOT NULL DEFAULT '0.00',
  `tax_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `tax_percent` decimal(16,2) NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `discount_percent` decimal(16,2) NOT NULL DEFAULT '0.00',
  `sub_total` decimal(16,2) NOT NULL DEFAULT '0.00',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  KEY `order_items_name_index` (`name`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel laravel-ecom02.order_items: ~0 rows (lebih kurang)

-- membuang struktur untuk table laravel-ecom02.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel laravel-ecom02.password_resets: ~0 rows (lebih kurang)

-- membuang struktur untuk table laravel-ecom02.payments
CREATE TABLE IF NOT EXISTS `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payloads` json DEFAULT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `va_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biller_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payments_number_unique` (`number`),
  KEY `payments_order_id_foreign` (`order_id`),
  KEY `payments_number_index` (`number`),
  KEY `payments_method_index` (`method`),
  KEY `payments_token_index` (`token`),
  KEY `payments_payment_type_index` (`payment_type`),
  CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel laravel-ecom02.payments: ~0 rows (lebih kurang)

-- membuang struktur untuk table laravel-ecom02.personal_access_tokens
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

-- Membuang data untuk tabel laravel-ecom02.personal_access_tokens: ~0 rows (lebih kurang)

-- membuang struktur untuk table laravel-ecom02.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` decimal(8,2) NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel laravel-ecom02.products: ~16 rows (lebih kurang)
INSERT INTO `products` (`id`, `name`, `slug`, `price`, `quantity`, `description`, `details`, `weight`, `category_id`, `created_at`, `updated_at`) VALUES
	(1, 'Public Low', 'public-low', 290000, 10, 'Sepatu Local Pride !', 'ORIGINAL 100% !\r\n-\r\nSneakers lokal yang super hits\r\nKualitas bintang 5 ⭐️⭐️⭐️⭐️⭐️\r\nHarga sangat terjangkau\r\nMade in Indonesia🇲🇨 #localpride\r\n-\r\n\r\nSize Chart :\r\n36 ; 23,1cm\r\n37 ; 23,8 cm\r\n38 ; 24.7 cm\r\n39 ; 25.2 cm\r\n40 ; 26.1 cm\r\n41 ; 26.5 cm\r\n42 ; 27.4 cm\r\n43 ; 28.3 cm\r\n44 ; 28.8 cm\r\n-\r\nOutsole Vulcanized\r\nInsole terbuat dari Ultralite Foam menjadikan Ventela sangat empuk dan nyaman dipakai', 1000.00, 1, '2022-12-20 21:10:29', '2022-12-20 21:10:29'),
	(2, 'Public High', 'public-high', 300000, 10, 'Sepatu Local Pride !', 'ORIGINAL 100% !\r\n-\r\nSneakers lokal yang super hits\r\nKualitas bintang 5 ⭐️⭐️⭐️⭐️⭐️\r\nHarga sangat terjangkau\r\nMade in Indonesia🇲🇨 #localpride\r\n-\r\n\r\nSize Chart :\r\n36 ; 23,1cm\r\n37 ; 23,8 cm\r\n38 ; 24.7 cm\r\n39 ; 25.2 cm\r\n40 ; 26.1 cm\r\n41 ; 26.5 cm\r\n42 ; 27.4 cm\r\n43 ; 28.3 cm\r\n44 ; 28.8 cm\r\n-\r\nOutsole Vulcanized\r\nInsole terbuat dari Ultralite Foam menjadikan Ventela sangat empuk dan nyaman dipakai', 1000.00, 1, '2022-12-20 21:19:43', '2022-12-20 21:19:43'),
	(3, 'Noir Low', 'noir-low', 450000, 10, 'Sepatu Local Pride !', 'ORIGINAL 100% !\r\n-\r\nSneakers lokal yang super hits\r\nKualitas bintang 5 ⭐️⭐️⭐️⭐️⭐️\r\nHarga sangat terjangkau\r\nMade in Indonesia🇲🇨 #localpride\r\n-\r\n\r\nSize Chart :\r\n36 ; 23,1cm\r\n37 ; 23,8 cm\r\n38 ; 24.7 cm\r\n39 ; 25.2 cm\r\n40 ; 26.1 cm\r\n41 ; 26.5 cm\r\n42 ; 27.4 cm\r\n43 ; 28.3 cm\r\n44 ; 28.8 cm\r\n-\r\nOutsole Vulcanized\r\nInsole terbuat dari Ultralite Foam menjadikan Ventela sangat empuk dan nyaman dipakai', 1000.00, 1, '2022-12-20 21:20:37', '2022-12-20 21:20:37'),
	(4, 'Noir High', 'noir-high', 470000, 10, 'Sepatu Local Pride !', 'ORIGINAL 100% !\r\n-\r\nSneakers lokal yang super hits\r\nKualitas bintang 5 ⭐️⭐️⭐️⭐️⭐️\r\nHarga sangat terjangkau\r\nMade in Indonesia🇲🇨 #localpride\r\n-\r\n\r\nSize Chart :\r\n36 ; 23,1cm\r\n37 ; 23,8 cm\r\n38 ; 24.7 cm\r\n39 ; 25.2 cm\r\n40 ; 26.1 cm\r\n41 ; 26.5 cm\r\n42 ; 27.4 cm\r\n43 ; 28.3 cm\r\n44 ; 28.8 cm\r\n-\r\nOutsole Vulcanized\r\nInsole terbuat dari Ultralite Foam menjadikan Ventela sangat empuk dan nyaman dipakai', 1000.00, 1, '2022-12-20 21:21:32', '2022-12-20 21:21:32'),
	(5, 'Gazelle Low Black White', 'gazelle-low-black-white', 408000, 10, 'Sepatu Local Pride !', 'Siluet pertama sepatu Compass® terlahir kembali pada 2018. Gazelle® Low dirancang dengan sentuhan vintage klasik yang dipadukan dengan detail modern yang relevan. Potongan rendah menekankan gaya santai dan kasual. Logo samping itu diwariskan dari tahun 1988, terinspirasi dari binatang Gazelle yang sedang berlari.\r\nㅤ\r\nㅤ\r\nSpesifikasi :\r\n• Potongan rendah\r\n• Upper menggunakan bahan kanvas\r\n• Lining upper menggunakan bahan kanvas\r\n• Logo samping menggunakan bahan PVC\r\n• Lubang tali berwarna perak\r\n• Tali sepatu menggunakan polyester\r\n• Pesanan khusus label woven\r\n• Foxing menggunakan bahan karet\r\n• Outsole menggunakan bahan karet\r\n• Proses vulkanisasi\r\n• Buatan Indonesia\r\nㅤ\r\nPanduan Ukuran :\r\n• US 4 / UK 3 / EUR 34 / CM 22.5\r\n• US 4.5 / UK 3.5 / EUR 35 / CM 23.5\r\n• US 5 / UK 4 / EUR 36 / CM 24\r\n• US 5.5 / UK 4.5 / EUR 37 / CM 24.5\r\n• US 6.5 / UK 5.5 / EUR 38 / CM 25\r\n• US 7 / UK 6 / EUR 39 / CM 26\r\n• US 8 / UK 7 / EUR 40 / CM 26.5\r\n• US 8.5 / UK 7.5 / EUR 41 / CM 27\r\n• US 9.5 / UK 8.5 / EUR 42 / CM 27.5\r\n• US 10 / UK 9 / EUR 43 / CM 28.5\r\n• US 10.5 / UK 9.5 / EUR 44 / CM 29\r\n• US 11 / UK 10.5 / EUR 45 / CM 29.5', 1000.00, 2, '2022-12-20 21:28:35', '2022-12-20 21:28:35'),
	(6, 'Gazelle Hi Black White', 'gazelle-hi-black-white', 438000, 10, 'Sepatu Local Pride !', 'Siluet pertama sepatu Compass® terlahir kembali pada 2018. Gazelle® Hi dirancang dengan sentuhan vintage klasik yang dipadukan dengan detail modern yang relevan. Potongan tinggi memberikan kesan dan keunggulan pada gaya klasik, yang menjadikannya tak lekang oleh waktu dan segar. Logo samping itu diwariskan dari tahun 1988, terinspirasi dari binatang Gazelle yang sedang berlari.\r\nㅤ\r\nㅤ\r\nSpesifikasi :\r\n• Potongan tinggi\r\n• Upper menggunakan bahan kanvas\r\n• Lining upper menggunakan bahan kanvas\r\n• Logo samping menggunakan bahan PVC\r\n• Lubang tali berwarna perak\r\n• Tali sepatu menggunakan polyester\r\n• Pesanan khusus label woven\r\n• Foxing menggunakan bahan karet\r\n• Outsole menggunakan bahan karet\r\n• Proses vulkanisasi\r\n• Buatan Indonesia\r\nㅤ\r\nPanduan Ukuran :\r\n• US 4 / UK 3 / EUR 34 / CM 22.5\r\n• US 4.5 / UK 3.5 / EUR 35 / CM 23.5\r\n• US 5 / UK 4 / EUR 36 / CM 24\r\n• US 5.5 / UK 4.5 / EUR 37 / CM 24.5\r\n• US 6.5 / UK 5.5 / EUR 38 / CM 25\r\n• US 7 / UK 6 / EUR 39 / CM 26\r\n• US 8 / UK 7 / EUR 40 / CM 26.5\r\n• US 8.5 / UK 7.5 / EUR 41 / CM 27\r\n• US 9.5 / UK 8.5 / EUR 42 / CM 27.5\r\n• US 10 / UK 9 / EUR 43 / CM 28.5\r\n• US 10.5 / UK 9.5 / EUR 44 / CM 29\r\n• US 11 / UK 10.5 / EUR 45 / CM 29.5', 1000.00, 2, '2022-12-20 21:33:36', '2022-12-20 21:33:36'),
	(7, 'Boy Pablo Low Black', 'boy-pablo-low-black', 778000, 10, 'Sepatu Local Pride !', 'COMPASS / BOY PABLO\r\nWHICH PABLO ARE YOU TODAY?\r\nRETROGRADE LOW\r\n\r\nGagasan “WHICH PABLO ARE YOU TODAY?” disederhanakan menjadi sebuah "Diary" dalam medium sepatu, dimana setiap harinya siapa pun yang memakai sepatu ini perasaannya akan terwakili oleh 5 ekspresi berbeda dari Boy Pablo yang dapat ditempel di tongue sepatu.\r\n\r\nGagasan ini sekaligus mengajak setiap orang untuk memahami diri mereka sebaik-baiknya; memahami pikiran, perasaan, dan suasana hati.\r\n\r\n\r\nSpesifikasi :\r\n• Potongan rendah\r\n• 5 buah emblem ekspresi Boy Pablo\r\n• Upper menggunakan bahan kanvas\r\n• Lidah menggunakan bahan nylon\r\n• Lining upper menggunakan bahan kanvas\r\n• Lining collar menggunakan bahan mesh dengan busa\r\n• Insole menggunakan bahan kanvas\r\n• Logo samping menggunakan bahan PVC\r\n• Lubang tali berwarna perak\r\n• Tali sepatu menggunakan katun\r\n• Tambahan tali\r\n• Label woven pesanan khusus\r\n• Sablon overlap di bagian upper dengan foxing\r\n• Foxing menggunakan bahan karet\r\n• Outsole menggunakan bahan karet\r\n• Bumper foxing diemboss khusus\r\n• Proses vulkanisasi\r\n• Buatan Indonesia\r\n\r\nPanduan Ukuran :\r\n• US 4 / UK 3 / EUR 34 / CM 22.5\r\n• US 4.5 / UK 3.5 / EUR 35 / CM 23.5\r\n• US 5 / UK 4 / EUR 36 / CM 24\r\n• US 5.5 / UK 4.5 / EUR 37 / CM 24.5\r\n• US 6.5 / UK 5.5 / EUR 38 / CM 25\r\n• US 7 / UK 6 / EUR 39 / CM 26\r\n• US 8 / UK 7 / EUR 40 / CM 26.5\r\n• US 8.5 / UK 7.5 / EUR 41 / CM 27\r\n• US 9.5 / UK 8.5 / EUR 42 / CM 27.5\r\n• US 10 / UK 9 / EUR 43 / CM 28.5\r\n• US 10.5 / UK 9.5 / EUR 44 / CM 29\r\n• US 11 / UK 10.5 / EUR 45 / CM 29.5', 1000.00, 2, '2022-12-20 21:34:45', '2022-12-20 21:34:45'),
	(8, 'Retrograde Slip On Black', 'retrograde-slip-on-black', 458000, 10, 'Sepatu Local Pride !', 'Koleksi Compass®️ Retrograde Slip-On dihadirkan untuk anak muda yang cinta akan sebuah konsep hidup yang simpel dan praktis.\r\nㅤㅤ\r\nDesain Retrograde Slip-On terinspirasi dari sebuah siluet sepatu yang digunakan oleh pelaut saat berlayar dengan perahunya.\r\nㅤ\r\nㅤ\r\nSpesifikasi :\r\n• Potongan rendah\r\n• Upper menggunakan bahan kanvas\r\n• Lining upper menggunakan bahan PVC\r\n• Potongan heel berbahan PVC\r\n• Busa pada bagian ankle\r\n• Detail emboss pada bagian heel\r\n• Foxing menggunakan bahan karet\r\n• Outsole menggunakan bahan karet\r\n• Proses vulkanisasi\r\n• Buatan Indonesia\r\nㅤ\r\nPanduan Ukuran :\r\n• US 4 / UK 3 / EUR 34 / CM 22.5\r\n• US 4.5 / UK 3.5 / EUR 35 / CM 23.5\r\n• US 5 / UK 4 / EUR 36 / CM 24\r\n• US 5.5 / UK 4.5 / EUR 37 / CM 24.5\r\n• US 6.5 / UK 5.5 / EUR 38 / CM 25\r\n• US 7 / UK 6 / EUR 39 / CM 26\r\n• US 8 / UK 7 / EUR 40 / CM 26.5\r\n• US 8.5 / UK 7.5 / EUR 41 / CM 27\r\n• US 9.5 / UK 8.5 / EUR 42 / CM 27.5\r\n• US 10 / UK 9 / EUR 43 / CM 28.5\r\n• US 10.5 / UK 9.5 / EUR 44 / CM 29\r\n• US 11 / UK 10.5 / EUR 45 / CM 29.5', 1000.00, 2, '2022-12-20 21:35:55', '2022-12-20 21:35:55'),
	(9, 'Warrior Classic High Black White', 'warrior-classic-high-black-white', 149000, 10, 'Sepatu Local Pride !', 'Model Produk : Sepatu Warrior Classic HC Black White\r\nWarna : Black White | BNIB (Brand New In Box), 100% Original\r\nBahan : kanvas tebal | sol dari karet\r\n\r\nKeterangan Ukuran size dalam cm Insole\r\nSize 37 = 24.5 cm\r\nSize 38 = 25 cm\r\nSize 39 = 25.5 cm\r\nSize 40 = 26cm\r\nSize 41 = 27cm\r\nSize 42 = 27.5 cm\r\nSize 43 = 28 cm', 1000.00, 3, '2022-12-20 21:38:54', '2022-12-20 21:38:54'),
	(10, 'Slip On Avatar 2.0', 'slip-on-avatar-2-0', 179900, 10, 'Sepatu Local Pride !', 'Model Produk :Warrior Slip On Avatar 2.0\r\nWarna : Putih | BNIB (Brand New In Box), 100% Original\r\nVariasi Size : 37-43\r\nBahan : kanvas tebal | sol dari karet\r\nKeterangan Ukuran size dalam cm Insole\r\n\r\n37: 24,1cm\r\n38: 24,7cm\r\n39: 25,3cm\r\n40: 25,9cm\r\n41: 26,5cm\r\n42: 27,1cm\r\n43: 27,7cm\r\n44: 28.3cm', 1000.00, 3, '2022-12-20 21:40:47', '2022-12-20 21:40:47'),
	(11, 'Tristan High Cut', 'tristan-high-cut', 239900, 10, 'Sepatu Local Pride !', 'Model Produk : Sepatu Warrior Tristan High Cut\r\n\r\n• upper bahan corduroy serat besar\r\n• foxing lebar membuat kokoh pada sepatu\r\n• insole model removable bahan Eva Phylon\r\n• logo emboss baru Warrior bahan TPR hitam\r\n\r\nKeterangan Ukuran size dalam cm Insole\r\n\r\n37: 24,1cm\r\n38: 24,7cm\r\n39: 25,3cm\r\n40: 25,9cm\r\n41: 26,5cm\r\n42: 27,1cm\r\n43: 27,7cm\r\n44: 28.3cm', 1000.00, 3, '2022-12-20 21:42:43', '2022-12-20 21:42:43'),
	(12, 'Zeus', 'zeus', 269900, 10, 'Sepatu Local Pride !', 'Keluaran terbaru kami yang cocok jadi sepatu baru untuk OOTD Lebaran tahun ini. Dengan model overwashed black dan gradasi warna yang ikonik, ditambah bagian foxing yang glossy. Pastinya mampu meningkatkan overall penampilan kamu jadi kece maksimal!\r\n\r\nSPESIFIKASI\r\nBahan Upper : Canvas 12 oz\r\n✅ Overwashed Black Canvas\r\n✅ Washing Gradasi\r\n✅ Removable insole untuk menunjang kenyamanan saat digunakan sepanjang hari\r\n✅ Foxing glossy yang mampu menambah kesan mewah dan elegan pada sepatu\r\n\r\nTersedia dalam size : 37-43', 1000.00, 3, '2022-12-20 21:45:54', '2022-12-20 21:45:54'),
	(13, 'Classic High Black White', 'classic-high-black-white', 279900, 10, 'Sepatu Local Pride !', 'IVAN series adalah sepatu yang sudah melalui proses penyegaran dengan menambahkan upper logo “wavy” sebagai brand identity Patrobas. Sepatu ini dirancang dengan konstruksi Vulcanized dan sudah melalui proses suhu uap yang tinggi, jadi tidak perlu diragukan lagi kualitasnya. Ivan di desain stylish dan menggunakan material berkualitas agar nyaman dan cocok jika digunakan untuk keseharian atau “beater” kalian.\r\n\r\nCOLOR Black White\r\nMATERIAL Canvas\r\nPVC Leather\r\nRubber Foxing\r\nRubber Gum Sole\r\n\r\nSize Chart\r\nSIZE 36 = 24,5 cm\r\nSIZE 37 = 25,2 cm\r\nSIZE 38 = 25,9 cm\r\nSIZE 39 = 26,3 cm\r\nSIZE 40 = 27,0 cm\r\nSIZE 41 = 27,7 cm\r\nSIZE 42 = 28,1 cm\r\nSIZE 43 = 28,5 cm\r\nSIZE 44 = 29 cm', 1000.00, 4, '2022-12-20 21:47:39', '2022-12-20 21:47:39'),
	(14, 'Cloud Slip On Black White', 'cloud-slip-on-black-white', 289900, 10, 'Sepatu Local Pride !', 'Terinspirasi dari awan yang konon empuk dan lembut, Patrobas Cloud Slip On dirancang dengan kenyamanan 3 in 1 :\r\n\r\n1. Collar berbahan Mesh (anti-lecet)\r\n2. Insole Patrofoam tech\r\n3. Lining breathable mesh\r\n\r\nDidesain untuk #gengpatrobas yang suka kepraktisan dan memiliki keseharian dengan mobilitas tinggi agar tetap merasakan kenyamanan yang maksimal\r\n\r\nMaterial :\r\n– 12 oz Canvas\r\n– Patrobas Logo Stitching Pattern Toe Cap\r\n– Breathable mesh collar\r\n– Breathable mesh lining\r\n– Patrofoam tech insole\r\n– Foxing Patch Logo Patrobas\r\n\r\nSize Chart\r\nSIZE 36 = 24,5 cm\r\nSIZE 37 = 25,2 cm\r\nSIZE 38 = 25,9 cm\r\nSIZE 39 = 26,3 cm\r\nSIZE 40 = 27,0 cm\r\nSIZE 41 = 27,7 cm\r\nSIZE 42 = 28,1 cm\r\nSIZE 43 = 28,5 cm\r\nSIZE 44 = 29 cm', 1000.00, 4, '2022-12-20 21:49:45', '2022-12-20 21:49:45'),
	(15, 'Cleo Black Low', 'cleo-black-low', 529900, 10, 'Sepatu Local Pride !', 'Sepatu PATROBAS X CLEO Series (Limited Edition)\r\n\r\nTerima kasih telah berpartisipasi dalam #LangkahMurni Cleo x Patrobas. Dengan membeli sepatu hasil kolaborasi ini, kamu telah menjadi bagian dari kami, generasi muda yang memulai satu aksi #LangkahMurni untuk Negeri.\r\n#LangkahMurni adalah komitmen Cleo untuk melestarikan Alam. Salah satunya dengan koleksi sepatu berbahan kanvas rPET (terbuat dari daur ulang botol plastik).', 1000.00, 4, '2022-12-20 21:51:47', '2022-12-20 21:51:47'),
	(16, 'Cleo Black High', 'cleo-black-high', 549900, 10, 'Sepatu Local Pride !', 'Sepatu PATROBAS X CLEO Series (Limited Edition)\r\n\r\nTerima kasih telah berpartisipasi dalam #LangkahMurni Cleo x Patrobas. Dengan membeli sepatu hasil kolaborasi ini, kamu telah menjadi bagian dari kami, generasi muda yang memulai satu aksi #LangkahMurni untuk Negeri.\r\n#LangkahMurni adalah komitmen Cleo untuk melestarikan Alam. Salah satunya dengan koleksi sepatu berbahan kanvas rPET (terbuat dari daur ulang botol plastik).', 1000.00, 4, '2022-12-20 21:53:02', '2022-12-20 21:53:02');

-- membuang struktur untuk table laravel-ecom02.product_tag
CREATE TABLE IF NOT EXISTS `product_tag` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_tag_product_id_foreign` (`product_id`),
  KEY `product_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `product_tag_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel laravel-ecom02.product_tag: ~16 rows (lebih kurang)
INSERT INTO `product_tag` (`id`, `product_id`, `tag_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, NULL, NULL),
	(2, 2, 1, NULL, NULL),
	(3, 3, 1, NULL, NULL),
	(4, 4, 1, NULL, NULL),
	(5, 5, 2, NULL, NULL),
	(6, 6, 2, NULL, NULL),
	(7, 7, 2, NULL, NULL),
	(8, 8, 2, NULL, NULL),
	(9, 9, 3, NULL, NULL),
	(10, 10, 3, NULL, NULL),
	(11, 11, 3, NULL, NULL),
	(12, 12, 3, NULL, NULL),
	(13, 13, 4, NULL, NULL),
	(14, 14, 4, NULL, NULL),
	(15, 15, 4, NULL, NULL),
	(16, 16, 4, NULL, NULL);

-- membuang struktur untuk table laravel-ecom02.shipments
CREATE TABLE IF NOT EXISTS `shipments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `track_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_qty` int NOT NULL,
  `total_weight` int NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` int DEFAULT NULL,
  `shipped_at` datetime DEFAULT NULL,
  `shipped_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipments_user_id_foreign` (`user_id`),
  KEY `shipments_order_id_foreign` (`order_id`),
  KEY `shipments_shipped_by_foreign` (`shipped_by`),
  KEY `shipments_track_number_index` (`track_number`),
  CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `shipments_shipped_by_foreign` FOREIGN KEY (`shipped_by`) REFERENCES `users` (`id`),
  CONSTRAINT `shipments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel laravel-ecom02.shipments: ~0 rows (lebih kurang)

-- membuang struktur untuk table laravel-ecom02.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_name_unique` (`name`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel laravel-ecom02.tags: ~4 rows (lebih kurang)
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'Ventela', 'ventela', '2022-12-20 21:01:14', '2022-12-20 21:01:14'),
	(2, 'Compass', 'compass', '2022-12-20 21:15:34', '2022-12-20 21:15:41'),
	(3, 'Warrior', 'warrior', '2022-12-20 21:15:48', '2022-12-20 21:15:48'),
	(4, 'Patrobas', 'patrobas', '2022-12-20 21:15:56', '2022-12-20 21:15:56');

-- membuang struktur untuk table laravel-ecom02.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `address` text COLLATE utf8mb4_unicode_ci,
  `address2` text COLLATE utf8mb4_unicode_ci,
  `province_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel laravel-ecom02.users: ~2 rows (lebih kurang)
INSERT INTO `users` (`id`, `username`, `email`, `email_verified_at`, `password`, `is_admin`, `address`, `address2`, `province_id`, `city_id`, `postcode`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'admin@example.com', NULL, '$2y$10$UGoD7a0eIIyp97TSCqN3KehKLcaymsU6bAEnwACdGo7a9WWTyqXNe', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'LOBMB67k9PaRZKDKW8eJch3ayjpQi8M5SYCpvS9YedZu4qItRjUmgAVIj0VA', NULL, NULL),
	(2, 'riodwnto', 'riodwianto21@gmail.com', NULL, '$2y$10$uWjXTHVPhDcpHdcoaCVrd.eMNtSo1ca.puwIQJVo.WJMsBUi9Q1kW', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'ccsiB2093AecnBNaO4VnwJTNbQwTz6H2RYjSIC3HVowgUwRdXPHr0hQDnvaU', '2022-12-20 20:41:40', '2022-12-20 20:41:40');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
