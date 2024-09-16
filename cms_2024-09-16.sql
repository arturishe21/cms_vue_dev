# ************************************************************
# Sequel Ace SQL dump
# Version 20067
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 9.0.1)
# Database: cms
# Generation Time: 2024-09-16 17:50:57 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table activations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activations`;

CREATE TABLE `activations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `completed` tinyint NOT NULL,
  `completed_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`)
VALUES
	(1,1,'KAeedobpdF5ngq62xSPIzx1zdZkjjk2P',1,'2020-09-02 08:52:31','2020-09-02 08:52:31','2020-10-13 15:55:39'),
	(3,3,'',1,'0000-00-00 00:00:00','2020-10-13 15:58:39','2020-10-15 07:44:03'),
	(4,4,'',1,'0000-00-00 00:00:00','2020-10-28 11:47:19','2020-10-28 12:10:24');

/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table authors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `authors`;

CREATE TABLE `authors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `full_name_ru` varchar(255) NOT NULL,
  `full_name_en` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `priority` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;

INSERT INTO `authors` (`id`, `full_name`, `full_name_ru`, `full_name_en`, `picture`, `created_at`, `updated_at`, `priority`)
VALUES
	(1,'{\"ua\":\"\\u0444\\u0444\\u0444\\u0433\\u0433\",\"ru\":\"\\u0444\\u0444\\u044411\",\"en\":\"fff\"}','sdssd','sdssd','/storage/editor/fotos/afb6856c0b2c786e99909ba24680ff09_1599725057.png','2020-09-03 00:00:00','2024-09-16 20:17:58',NULL);

/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table kidzza
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kidzza`;

CREATE TABLE `kidzza` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



# Dump of table languages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;

INSERT INTO `languages` (`id`, `language`, `is_active`, `priority`)
VALUES
	(1,'ua',1,1),
	(2,'en',1,3),
	(3,'ru',1,2);

/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menu_header
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu_header`;

CREATE TABLE `menu_header` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `lft` int NOT NULL,
  `rgt` int NOT NULL,
  `depth` int NOT NULL DEFAULT '0',
  `title` json DEFAULT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `is_target_blank` tinyint NOT NULL DEFAULT '0',
  `is_active` tinyint NOT NULL DEFAULT '0',
  `tb_tree_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_header_parent_id_index` (`parent_id`),
  KEY `menu_header_lft_index` (`lft`),
  KEY `menu_header_rgt_index` (`rgt`),
  KEY `tb_tree_id` (`tb_tree_id`),
  CONSTRAINT `menu_header_ibfk_1` FOREIGN KEY (`tb_tree_id`) REFERENCES `tb_tree` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `menu_header` WRITE;
/*!40000 ALTER TABLE `menu_header` DISABLE KEYS */;

INSERT INTO `menu_header` (`id`, `parent_id`, `lft`, `rgt`, `depth`, `title`, `url`, `is_target_blank`, `is_active`, `tb_tree_id`)
VALUES
	(1,NULL,1,298,0,'{\"en\": null, \"ru\": null, \"ua\": \"Меню\"}',X'7B22656E223A206E756C6C2C20227275223A206E756C6C2C20227561223A206E756C6C7D',0,1,NULL),
	(3,1,2,7,0,'{\"da\": \"Tequila og Mezcal\", \"de\": \"Tequila und Mezcal\", \"en\": \"Tequila and Mezcal\", \"es\": \"Tequila y Mezcal\", \"fr\": \"Téquila et Mezcal\", \"nl\": \"Tequila en Mezcal\", \"tr\": \"Tekila ve Mezcal\", \"ua\": \"testqq\"}',X'2F',1,1,15);

/*!40000 ALTER TABLE `menu_header` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2018_02_22_093849_create_users_table',1),
	(2,'2018_02_22_094422_create_roles_table',1),
	(3,'2018_02_22_095823_create_role_users_table',1),
	(4,'2018_02_22_100056_create_activations_table',1),
	(5,'2018_02_22_103113_create_persistences_table',1),
	(6,'2018_02_22_103444_create_reminders_table',1),
	(7,'2018_02_22_103844_create_settings_table',1),
	(8,'2018_02_22_104132_create_setting_select_table',1),
	(9,'2018_02_22_104452_create_tb_tree_table',1),
	(10,'2018_02_22_105621_create_throttle_table',1),
	(11,'2018_02_22_105933_create_translations_phrases_cms_table',1),
	(12,'2018_02_22_110107_create_translations_cms_table',1),
	(13,'2018_02_22_141402_create_revisions',1),
	(14,'2014_10_12_100000_create_password_resets_table',2),
	(15,'2019_08_19_000000_create_failed_jobs_table',2),
	(17,'2020_09_02_134108_create_words',3),
	(18,'2016_04_18_132921_create_translations_table',4),
	(20,'2020_09_03_113439_create_autors',5),
	(21,'2020_09_03_121740_add_autor_id',6),
	(22,'2020_09_04_154313_add_links',7),
	(27,'2020_10_13_195654_create_index_users_roles',8),
	(28,'2016_11_14_124121_image_storage_migration',9);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table news
# ------------------------------------------------------------

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `user_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;

INSERT INTO `news` (`id`, `title`, `user_id`, `created_at`, `updated_at`, `is_active`, `picture`, `text`)
VALUES
	(1,'{\"ua\":\"asda\",\"ru\":\"\\u043e\\u0441\\u0434\\u0430\",\"en\":\"asda\"}',NULL,NULL,'2024-09-16 19:57:30',0,NULL,NULL),
	(2,'{\"ua\":\"asda\",\"ru\":\"\\u043e\\u0441\\u0434\\u0430\",\"en\":\"asda\"}',NULL,'2024-08-28 20:45:58','2024-09-16 20:43:57',1,NULL,'<p>adasd</p>');

/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table persistences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `persistences`;

CREATE TABLE `persistences` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `persistences_user_id_index` (`user_id`),
  KEY `persistences_code_index` (`code`),
  CONSTRAINT `persistences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `persistences` WRITE;
/*!40000 ALTER TABLE `persistences` DISABLE KEYS */;

INSERT INTO `persistences` (`id`, `user_id`, `code`, `created_at`, `updated_at`)
VALUES
	(3,1,'WExoKjnV59TudzsgcGpu0vTtHPW8DwHL','2020-09-02 14:27:43','2020-09-02 14:27:43'),
	(4,1,'fJlWgOADKIrCgr6HXgQgPKrVqKVVqzLg','2020-09-03 09:50:08','2020-09-03 09:50:08'),
	(5,1,'00Szxe75CBkaV2o5phtV3KuahkeOpSj2','2020-09-04 13:30:26','2020-09-04 13:30:26'),
	(6,1,'ezhIMf6hyKEtem6Ja5QBJtB91GrZY6ZF','2020-09-07 10:23:32','2020-09-07 10:23:32'),
	(7,1,'4JNUjnyeQN3GqRayq9MG4JbTBBh5cNcB','2020-09-07 17:33:34','2020-09-07 17:33:34'),
	(8,1,'EMza7OW0NWBlggwSh2tiT2UbldC3q7Nr','2020-09-10 11:01:43','2020-09-10 11:01:43'),
	(9,1,'blT4HQ7DwFc7ta76apupacrQVIx4SVDk','2020-09-14 16:35:44','2020-09-14 16:35:44'),
	(10,1,'GC71nhBAwctN4vNLActCgWQggz7RFYue','2020-09-14 14:54:44','2020-09-14 14:54:44'),
	(11,1,'JWkkH4DwE9bpDd2eSaapeXfuNzYGaQpj','2020-09-17 08:58:31','2020-09-17 08:58:31'),
	(12,1,'1Bq0KNVknWqa0ks2IJnND6d3H4cY8LkN','2020-09-25 08:52:13','2020-09-25 08:52:13'),
	(13,1,'PhkS2yT2Oj7mMjFK7tVlJ34jgS75YFQy','2020-10-07 09:57:19','2020-10-07 09:57:19'),
	(14,1,'dmkIRBD0VPkB2HmPJKAiCToMii40ud5m','2020-10-09 13:08:14','2020-10-09 13:08:14'),
	(15,1,'ucX7U8BvoKHQjDwjeYny6Xw2I3C8MKSw','2020-10-13 08:02:05','2020-10-13 08:02:05'),
	(16,1,'LLHVyDJSD3nuTJCm5BVl5WR9HdPo3TkM','2020-10-13 14:51:02','2020-10-13 14:51:02'),
	(17,1,'OgOQG7gXVxz0idogs3UDSxZjdFcRELKn','2020-10-13 19:45:04','2020-10-13 19:45:04'),
	(18,1,'tpVIWTU9C0bnE5Nt8iSccEx5hH8u2Oty','2020-10-15 07:11:29','2020-10-15 07:11:29'),
	(19,1,'oUPwIdkxVh94OWcZ8Fk2RswDV8D077IC','2020-10-15 14:39:09','2020-10-15 14:39:09'),
	(20,1,'e0qWt66W6a54PUshKts1qiN1mSttD11i','2020-10-19 12:02:52','2020-10-19 12:02:52'),
	(21,1,'D9k7qPW3Wjs8pWPugqkRH5Olkj0NAiwQ','2020-10-20 13:35:02','2020-10-20 13:35:02'),
	(22,1,'f3XQ1HlCLJXwnJq3nrF1A6U5U7ZHLnGn','2020-10-21 06:36:09','2020-10-21 06:36:09'),
	(23,1,'dszOOwaTJlgqRS4eGg1UdmeOqOj1ucef','2020-10-28 11:45:31','2020-10-28 11:45:31'),
	(24,1,'mhDMRpKypzsJIpqir52sqDsQhqSkdL7v','2020-11-11 07:36:53','2020-11-11 07:36:53'),
	(25,1,'o6gZlrlGjENZjzVVuYn7DTC79QDVrtLK','2020-11-11 07:36:53','2020-11-11 07:36:53'),
	(26,1,'59r32W41d5p1GqGdginRaFavsQE3XFhf','2020-11-11 21:41:46','2020-11-11 21:41:46'),
	(27,1,'N9eGppmPF7W3oBKzUTfYahgyE9Kaqncu','2020-11-17 10:14:49','2020-11-17 10:14:49'),
	(28,1,'e8UKEywv8oWPwkXFDIi0Guap0wPYUcXe','2020-11-18 08:00:44','2020-11-18 08:00:44'),
	(29,1,'At2T5hYVjKspkzuNtMAEvRhXZHF5g3dD','2020-11-18 10:11:41','2020-11-18 10:11:41'),
	(30,1,'3F9Jo7ksdgua9THh2Z5Zm55wIS31CHQd','2020-11-19 15:50:07','2020-11-19 15:50:07'),
	(32,1,'22cQPKuRH7B0PN6vesuWAa8JLTPFaQwg','2024-09-16 19:33:50','2024-09-16 19:33:50');

/*!40000 ALTER TABLE `persistences` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table reminders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reminders`;

CREATE TABLE `reminders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `completed` tinyint NOT NULL,
  `completed_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reminders_user_id_index` (`user_id`),
  CONSTRAINT `reminders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



# Dump of table revisions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `revisions`;

CREATE TABLE `revisions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(100) NOT NULL,
  `revisionable_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `old_value` text,
  `new_value` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;

INSERT INTO `revisions` (`id`, `revisionable_type`, `revisionable_id`, `user_id`, `key`, `old_value`, `new_value`, `created_at`, `updated_at`)
VALUES
	(1,'App\\Models\\Word',1,1,'created_at',NULL,'2020-09-02 14:12:52','2020-09-02 14:12:52','2020-09-02 14:12:52'),
	(2,'App\\Models\\Word',1,1,'title_ru','','ssss','2020-09-02 14:15:02','2020-09-02 14:15:02'),
	(3,'App\\Models\\Word',1,1,'title_en','','ssss','2020-09-02 14:15:02','2020-09-02 14:15:02'),
	(4,'App\\Models\\Autor',1,1,'created_at',NULL,'2020-09-03 11:44:55','2020-09-03 11:44:55','2020-09-03 11:44:55'),
	(5,'App\\Models\\Autor',1,1,'full_name_ru','','sss','2020-09-03 11:45:56','2020-09-03 11:45:56'),
	(6,'App\\Models\\Autor',1,1,'full_name_en','','sss','2020-09-03 11:45:56','2020-09-03 11:45:56'),
	(7,'App\\Models\\Autor',2,1,'created_at',NULL,'2020-09-03 11:48:18','2020-09-03 11:48:18','2020-09-03 11:48:18'),
	(8,'App\\Models\\Author',1,1,'created_at',NULL,'2020-09-03 12:27:24','2020-09-03 12:27:24','2020-09-03 12:27:24'),
	(9,'App\\Models\\Word',1,1,'author_id',NULL,'1','2020-09-03 12:30:06','2020-09-03 12:30:06'),
	(10,'App\\Models\\Word',2,1,'created_at',NULL,'2020-09-04 13:34:46','2020-09-04 13:34:46','2020-09-04 13:34:46'),
	(11,'App\\Models\\Word',2,1,'description','','<p>Начали эти окопы копать. Стреляли бесконечно. Мы сидели без света по три, по четыре месяца. Зима, метель на улице, света нет. Аккумулятор стоит с машины или с мотоцикла, светодиодная лампочка, потому что дети маленькие. Как с одной свечкой сидеть? Связи нету, телефоны не работают. Они отключены, потому что их зарядить вообще негде.</p><p>Обстреляли нас с 13-го на 14-е января 2015 года. Это первый раз залетели к нам в село &laquo;Грады&raquo;. Меня не было дома, я в больнице была. Сын старший был дома. И вот этот вот шок и испуг за него: он дома, и туда летит, в село, и я вижу, как оно летит. Потому что летело и шумело так это! Это очень было страшно.</p><p>И когда мы приехали домой, он выходит, у него шок такой, у него страх, но он его не показывал. Окон нету, все повылетало. Этими осколками аж в дом позалетали. Он выходит и говорит: &laquo;Мама, а у нас окна повыпадали&raquo;.</p><p>У меня от испуга, я не знала что спросить. Но главное, что он живой, он целый. Я говорю: &laquo;Женечка, где ты, сыночек, был?&raquo; &ndash; &laquo;Я, &ndash; говорит, &ndash; стал между стенкой и шкафом и стоял там, пока нас обстреливали&raquo;. Боже! Это не передать. Ну, страх за своего сына. Это очень страшно!</p>','2020-09-04 13:49:51','2020-09-04 13:49:51'),
	(12,'App\\Models\\Word',2,1,'description_ru','','<p>Начали эти окопы копать. Стреляли бесконечно. Мы сидели без света по три, по четыре месяца. Зима, метель на улице, света нет. Аккумулятор стоит с машины или с мотоцикла, светодиодная лампочка, потому что дети маленькие. Как с одной свечкой сидеть? Связи нету, телефоны не работают. Они отключены, потому что их зарядить вообще негде.</p><p>Обстреляли нас с 13-го на 14-е января 2015 года. Это первый раз залетели к нам в село &laquo;Грады&raquo;. Меня не было дома, я в больнице была. Сын старший был дома. И вот этот вот шок и испуг за него: он дома, и туда летит, в село, и я вижу, как оно летит. Потому что летело и шумело так это! Это очень было страшно.</p><p>И когда мы приехали домой, он выходит, у него шок такой, у него страх, но он его не показывал. Окон нету, все повылетало. Этими осколками аж в дом позалетали. Он выходит и говорит: &laquo;Мама, а у нас окна повыпадали&raquo;.</p><p>У меня от испуга, я не знала что спросить. Но главное, что он живой, он целый. Я говорю: &laquo;Женечка, где ты, сыночек, был?&raquo; &ndash; &laquo;Я, &ndash; говорит, &ndash; стал между стенкой и шкафом и стоял там, пока нас обстреливали&raquo;. Боже! Это не передать. Ну, страх за своего сына. Это очень страшно!</p>','2020-09-04 13:49:51','2020-09-04 13:49:51'),
	(13,'App\\Models\\Word',2,1,'description_en','','<p>Начали эти окопы копать. Стреляли бесконечно. Мы сидели без света по три, по четыре месяца. Зима, метель на улице, света нет. Аккумулятор стоит с машины или с мотоцикла, светодиодная лампочка, потому что дети маленькие. Как с одной свечкой сидеть? Связи нету, телефоны не работают. Они отключены, потому что их зарядить вообще негде.</p><p>Обстреляли нас с 13-го на 14-е января 2015 года. Это первый раз залетели к нам в село &laquo;Грады&raquo;. Меня не было дома, я в больнице была. Сын старший был дома. И вот этот вот шок и испуг за него: он дома, и туда летит, в село, и я вижу, как оно летит. Потому что летело и шумело так это! Это очень было страшно.</p><p>И когда мы приехали домой, он выходит, у него шок такой, у него страх, но он его не показывал. Окон нету, все повылетало. Этими осколками аж в дом позалетали. Он выходит и говорит: &laquo;Мама, а у нас окна повыпадали&raquo;.</p><p>У меня от испуга, я не знала что спросить. Но главное, что он живой, он целый. Я говорю: &laquo;Женечка, где ты, сыночек, был?&raquo; &ndash; &laquo;Я, &ndash; говорит, &ndash; стал между стенкой и шкафом и стоял там, пока нас обстреливали&raquo;. Боже! Это не передать. Ну, страх за своего сына. Это очень страшно!</p>','2020-09-04 13:49:51','2020-09-04 13:49:51'),
	(14,'App\\Models\\Word',2,1,'description','<p>Начали эти окопы копать. Стреляли бесконечно. Мы сидели без света по три, по четыре месяца. Зима, метель на улице, света нет. Аккумулятор стоит с машины или с мотоцикла, светодиодная лампочка, потому что дети маленькие. Как с одной свечкой сидеть? Связи нету, телефоны не работают. Они отключены, потому что их зарядить вообще негде.</p><p>Обстреляли нас с 13-го на 14-е января 2015 года. Это первый раз залетели к нам в село &laquo;Грады&raquo;. Меня не было дома, я в больнице была. Сын старший был дома. И вот этот вот шок и испуг за него: он дома, и туда летит, в село, и я вижу, как оно летит. Потому что летело и шумело так это! Это очень было страшно.</p><p>И когда мы приехали домой, он выходит, у него шок такой, у него страх, но он его не показывал. Окон нету, все повылетало. Этими осколками аж в дом позалетали. Он выходит и говорит: &laquo;Мама, а у нас окна повыпадали&raquo;.</p><p>У меня от испуга, я не знала что спросить. Но главное, что он живой, он целый. Я говорю: &laquo;Женечка, где ты, сыночек, был?&raquo; &ndash; &laquo;Я, &ndash; говорит, &ndash; стал между стенкой и шкафом и стоял там, пока нас обстреливали&raquo;. Боже! Это не передать. Ну, страх за своего сына. Это очень страшно!</p>','<p>Начали эти окопы копать. Стреляли бесконечно. Мы сидели без света по три, по четыре месяца. Зима, метель на улице, света нет. Аккумулятор стоит с машины или с мотоцикла, светодиодная лампочка, потому что дети маленькие. Как с одной свечкой сидеть? Связи нету, телефоны не работают. Они отключены, потому что их зарядить вообще негде.</p><p><br></p>','2020-09-04 13:50:11','2020-09-04 13:50:11'),
	(15,'App\\Models\\Word',2,1,'description_ru','<p>Начали эти окопы копать. Стреляли бесконечно. Мы сидели без света по три, по четыре месяца. Зима, метель на улице, света нет. Аккумулятор стоит с машины или с мотоцикла, светодиодная лампочка, потому что дети маленькие. Как с одной свечкой сидеть? Связи нету, телефоны не работают. Они отключены, потому что их зарядить вообще негде.</p><p>Обстреляли нас с 13-го на 14-е января 2015 года. Это первый раз залетели к нам в село &laquo;Грады&raquo;. Меня не было дома, я в больнице была. Сын старший был дома. И вот этот вот шок и испуг за него: он дома, и туда летит, в село, и я вижу, как оно летит. Потому что летело и шумело так это! Это очень было страшно.</p><p>И когда мы приехали домой, он выходит, у него шок такой, у него страх, но он его не показывал. Окон нету, все повылетало. Этими осколками аж в дом позалетали. Он выходит и говорит: &laquo;Мама, а у нас окна повыпадали&raquo;.</p><p>У меня от испуга, я не знала что спросить. Но главное, что он живой, он целый. Я говорю: &laquo;Женечка, где ты, сыночек, был?&raquo; &ndash; &laquo;Я, &ndash; говорит, &ndash; стал между стенкой и шкафом и стоял там, пока нас обстреливали&raquo;. Боже! Это не передать. Ну, страх за своего сына. Это очень страшно!</p>','<P> Начали эти окопы копать. Стреляли бесконечно. Мы сидели без света по три, по четыре месяца. Зима, метель на улице, света имеется. Аккумулятор стоит с машины или с мотоцикла, светодиодная лампочка, потому что дети маленькие. Как с одной свечкой сидеть? Связи нету, телефоны не работают. Они отключены, потому что их зарядит вообще негде. </ P> <p> <br> </ p>','2020-09-04 13:50:11','2020-09-04 13:50:11'),
	(16,'App\\Models\\Word',2,1,'description_en','<p>Начали эти окопы копать. Стреляли бесконечно. Мы сидели без света по три, по четыре месяца. Зима, метель на улице, света нет. Аккумулятор стоит с машины или с мотоцикла, светодиодная лампочка, потому что дети маленькие. Как с одной свечкой сидеть? Связи нету, телефоны не работают. Они отключены, потому что их зарядить вообще негде.</p><p>Обстреляли нас с 13-го на 14-е января 2015 года. Это первый раз залетели к нам в село &laquo;Грады&raquo;. Меня не было дома, я в больнице была. Сын старший был дома. И вот этот вот шок и испуг за него: он дома, и туда летит, в село, и я вижу, как оно летит. Потому что летело и шумело так это! Это очень было страшно.</p><p>И когда мы приехали домой, он выходит, у него шок такой, у него страх, но он его не показывал. Окон нету, все повылетало. Этими осколками аж в дом позалетали. Он выходит и говорит: &laquo;Мама, а у нас окна повыпадали&raquo;.</p><p>У меня от испуга, я не знала что спросить. Но главное, что он живой, он целый. Я говорю: &laquo;Женечка, где ты, сыночек, был?&raquo; &ndash; &laquo;Я, &ndash; говорит, &ndash; стал между стенкой и шкафом и стоял там, пока нас обстреливали&raquo;. Боже! Это не передать. Ну, страх за своего сына. Это очень страшно!</p>','<p> They started digging these trenches. They fired endlessly. We sat without light for three or four months. Winter, blizzard on the street, no light. The battery is from the car or from the motorcycle, the LED light bulb, because the children are small. How to sit with one candle? There is no connection, the phones do not work. They are disabled because there is no place to charge them at all. </p> <p> <br> </p>','2020-09-04 13:50:11','2020-09-04 13:50:11'),
	(17,'App\\Models\\Word',1,1,'link','','ыы','2020-09-04 15:48:25','2020-09-04 15:48:25'),
	(18,'App\\Models\\Word',1,1,'link_ru','','ыы','2020-09-04 15:48:25','2020-09-04 15:48:25'),
	(19,'App\\Models\\Word',1,1,'link_en','','yy','2020-09-04 15:48:25','2020-09-04 15:48:25'),
	(20,'App\\Models\\Word',1,1,'is_active','0','1','2020-09-04 15:55:01','2020-09-04 15:55:01'),
	(21,'App\\Models\\Word',2,1,'description_ru','<P> Начали эти окопы копать. Стреляли бесконечно. Мы сидели без света по три, по четыре месяца. Зима, метель на улице, света имеется. Аккумулятор стоит с машины или с мотоцикла, светодиодная лампочка, потому что дети маленькие. Как с одной свечкой сидеть? Связи нету, телефоны не работают. Они отключены, потому что их зарядит вообще негде. </ P> <p> <br> </ p>','<p>Начали эти окопы копать. Стреляли бесконечно. Мы сидели без света по три, по четыре месяца. Зима, метель на улице, света имеется. Аккумулятор стоит с машины или с мотоцикла, светодиодная лампочка, потому что дети маленькие. Как с одной свечкой сидеть? Связи нету, телефоны не работают. Они отключены, потому что их зарядит вообще негде. <!-- P--></p><p><br><!-- p--></p>','2020-09-04 15:55:05','2020-09-04 15:55:05'),
	(22,'App\\Models\\Word',2,1,'description_en','<p> They started digging these trenches. They fired endlessly. We sat without light for three or four months. Winter, blizzard on the street, no light. The battery is from the car or from the motorcycle, the LED light bulb, because the children are small. How to sit with one candle? There is no connection, the phones do not work. They are disabled because there is no place to charge them at all. </p> <p> <br> </p>','<p>They started digging these trenches. They fired endlessly. We sat without light for three or four months. Winter, blizzard on the street, no light. The battery is from the car or from the motorcycle, the LED light bulb, because the children are small. How to sit with one candle? There is no connection, the phones do not work. They are disabled because there is no place to charge them at all.</p><p><br></p>','2020-09-04 15:55:05','2020-09-04 15:55:05'),
	(23,'App\\Models\\Word',2,1,'is_active','0','1','2020-09-04 15:55:10','2020-09-04 15:55:10'),
	(24,'App\\Models\\Author',1,1,'full_name','sdssd','Вася','2020-09-10 11:04:19','2020-09-10 11:04:19'),
	(25,'App\\Models\\Author',1,1,'picture','','/storage/editor/fotos/afb6856c0b2c786e99909ba24680ff09_1599725057.png','2020-09-10 11:04:19','2020-09-10 11:04:19'),
	(26,'App\\Models\\Word',1,1,'sound','','/storage/files/new-test.xlsx','2020-09-10 11:06:20','2020-09-10 11:06:20'),
	(27,'App\\Models\\Word',1,1,'sound','/storage/files/new-test.xlsx','/storage/files/sondheim-send-in-the-clowns.mp3','2020-09-10 11:10:10','2020-09-10 11:10:10'),
	(28,'App\\Models\\Word',1,1,'sound_ru','','/storage/files/new-test.xlsx','2020-09-10 11:11:07','2020-09-10 11:11:07'),
	(29,'App\\Models\\Word',2,1,'sound','','/storage/files/sondheim-send-in-the-clowns.mp3','2020-09-10 11:18:50','2020-09-10 11:18:50'),
	(30,'App\\Models\\WordsDefinition',1,1,'created_at',NULL,NULL,'2020-09-14 14:57:47','2020-09-14 14:57:47'),
	(31,'App\\Models\\WordsDefinition',1,1,'title','asasas','asasas111','2020-09-14 14:58:02','2020-09-14 14:58:02'),
	(32,'App\\Models\\WordsDefinition',2,1,'created_at',NULL,NULL,'2020-09-14 14:58:07','2020-09-14 14:58:07'),
	(33,'App\\Models\\WordsDefinition',3,1,'created_at',NULL,NULL,'2020-09-14 15:11:58','2020-09-14 15:11:58'),
	(34,'App\\Models\\Word',1,1,'is_active','1','0','2020-09-17 09:13:17','2020-09-17 09:13:17'),
	(35,'App\\Models\\Word',3,1,'created_at',NULL,'2020-10-09 13:08:51','2020-10-09 13:08:51','2020-10-09 13:08:51'),
	(36,'App\\Models\\Word',4,1,'created_at',NULL,'2020-10-13 08:49:05','2020-10-13 08:49:05','2020-10-13 08:49:05'),
	(37,'App\\Models\\Word',5,1,'created_at',NULL,'2020-10-13 09:02:58','2020-10-13 09:02:58','2020-10-13 09:02:58'),
	(38,'App\\Models\\Word',6,1,'created_at',NULL,'2020-10-15 08:28:55','2020-10-15 08:28:55','2020-10-15 08:28:55'),
	(39,'App\\Models\\Tree',2,1,'lft',NULL,'62','2020-10-15 08:39:24','2020-10-15 08:39:24'),
	(40,'App\\Models\\Tree',2,1,'rgt',NULL,'63','2020-10-15 08:39:24','2020-10-15 08:39:24'),
	(41,'App\\Models\\Tree',2,1,'is_active','0','1','2020-10-15 08:39:27','2020-10-15 08:39:27'),
	(42,'App\\Models\\Tree',3,1,'lft',NULL,'3','2020-10-15 08:39:33','2020-10-15 08:39:33'),
	(43,'App\\Models\\Tree',3,1,'rgt',NULL,'4','2020-10-15 08:39:33','2020-10-15 08:39:33'),
	(44,'App\\Models\\Tree',4,1,'lft',NULL,'66','2020-10-15 08:51:18','2020-10-15 08:51:18'),
	(45,'App\\Models\\Tree',4,1,'rgt',NULL,'67','2020-10-15 08:51:18','2020-10-15 08:51:18'),
	(46,'App\\Models\\Tree',5,1,'lft',NULL,'67','2020-10-15 08:51:18','2020-10-15 08:51:18'),
	(47,'App\\Models\\Tree',5,1,'rgt',NULL,'68','2020-10-15 08:51:18','2020-10-15 08:51:18'),
	(48,'App\\Models\\Word',3,1,'title','asdasdasdaaaaa','asdasdasdaaaaa111','2020-10-15 10:30:40','2020-10-15 10:30:40'),
	(49,'App\\Models\\Author',1,1,'full_name','Вася','Вася11','2020-10-15 10:33:06','2020-10-15 10:33:06'),
	(50,'App\\Models\\Author',1,1,'full_name','Вася11','Вася1122','2020-10-15 10:35:10','2020-10-15 10:35:10'),
	(51,'App\\Models\\Word',3,1,'title','asdasdasdaaaaa111','11asdasdasdaaaaa111','2020-10-15 10:42:35','2020-10-15 10:42:35'),
	(52,'App\\Models\\Author',1,1,'full_name','Вася1122','Вася1122__','2020-10-15 10:48:36','2020-10-15 10:48:36'),
	(53,'App\\Models\\Word',3,1,'title','11asdasdasdaaaaa111','11asdasdasdaaaaa1111111','2020-10-15 10:48:43','2020-10-15 10:48:43'),
	(54,'App\\Models\\Word',3,1,'description','','<p>Дзвінки по Україні &ndash; 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>&ndash; 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">&laquo;Безліміт за кордон&raquo;</a></p><p>SMS по Україні (на всі мобільні мережі) &ndash; якщо ви використали 50 за день, вартість &ndash; 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон &ndash; 2 грн/шт.</p>','2020-10-20 13:35:34','2020-10-20 13:35:34'),
	(55,'App\\Models\\Word',3,1,'description_ru','','<P> Звонки по Украине - 0,60 грн / мин </ p> <p> Звонки за границу в <a href=\"/rates/prepay/supernet-start#countries_30\"> 30 стран </a> <span> </ span> - 10 грн за каждые 10 мин (10 пакетов в сутки) </ p> <p> Для безлимитных звонков на 3 номера абонентов Польши (T-Mobile / Heyah), России (МТС, Beeline) закажите услугу <a href = \"/ za-kordon / calls-abroad / poslugi / bezlimit-za-kordon / peredplata\" rel = \"noopener noreferrer\" target = \"_ blank\"> «Безлимит за границу» </a> </ p> <p> SMS по Украине (на все мобильные сети) - если вы использовали 50 за день, стоимость - 0,60 грн / шт. Вам будут доступны новые 50 SMS за 1,50 грн / день уже на следующий день. </ P> <p> SMS за границу - 2 грн / шт. </ P>','2020-10-20 13:35:34','2020-10-20 13:35:34'),
	(56,'App\\Models\\Word',3,1,'description_en','','<p> Calls within Ukraine - 0.60 UAH / min </p> <p> Calls abroad to <a href=\"/rates/prepay/supernet-start#countries_30\"> 30 countries </a> <span> </span> - UAH 10 for every 10 minutes (10 packages per day) </p> <p> For unlimited calls to 3 numbers of subscribers of Poland (T-Mobile / Heyah), Russia (MTS, Beeline) order the service <a href = \"/ for-cordon / calls-abroad / services / unlimited-for-cordon / prepayment\" rel = \"noopener noreferrer\" target = \"_ blank\"> \"Unlimited abroad\" </a> </p> <p> SMS in Ukraine (for all mobile networks) - if you used 50 per day, the cost is 0.60 UAH / piece. You will have access to 50 new SMS for UAH 1.50 / day the next day. </p> <p> SMS abroad - UAH 2 / piece </p>','2020-10-20 13:35:34','2020-10-20 13:35:34'),
	(57,'App\\Models\\Word',3,1,'description','<p>Дзвінки по Україні &ndash; 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>&ndash; 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">&laquo;Безліміт за кордон&raquo;</a></p><p>SMS по Україні (на всі мобільні мережі) &ndash; якщо ви використали 50 за день, вартість &ndash; 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон &ndash; 2 грн/шт.</p>','<p>Дзвінки по Україні – 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>– 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">«Безліміт за кордон»</a></p><p>SMS по Україні (на всі мобільні мережі) – якщо ви використали 50 за день, вартість – 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон – 2 грн/шт.</p>','2020-10-20 13:37:44','2020-10-20 13:37:44'),
	(58,'App\\Models\\Word',3,1,'description_ru','<P> Звонки по Украине - 0,60 грн / мин </ p> <p> Звонки за границу в <a href=\"/rates/prepay/supernet-start#countries_30\"> 30 стран </a> <span> </ span> - 10 грн за каждые 10 мин (10 пакетов в сутки) </ p> <p> Для безлимитных звонков на 3 номера абонентов Польши (T-Mobile / Heyah), России (МТС, Beeline) закажите услугу <a href = \"/ za-kordon / calls-abroad / poslugi / bezlimit-za-kordon / peredplata\" rel = \"noopener noreferrer\" target = \"_ blank\"> «Безлимит за границу» </a> </ p> <p> SMS по Украине (на все мобильные сети) - если вы использовали 50 за день, стоимость - 0,60 грн / шт. Вам будут доступны новые 50 SMS за 1,50 грн / день уже на следующий день. </ P> <p> SMS за границу - 2 грн / шт. </ P>','<p>&nbsp;<!-- P--></p>','2020-10-20 13:37:44','2020-10-20 13:37:44'),
	(59,'App\\Models\\Word',3,1,'description_en','<p> Calls within Ukraine - 0.60 UAH / min </p> <p> Calls abroad to <a href=\"/rates/prepay/supernet-start#countries_30\"> 30 countries </a> <span> </span> - UAH 10 for every 10 minutes (10 packages per day) </p> <p> For unlimited calls to 3 numbers of subscribers of Poland (T-Mobile / Heyah), Russia (MTS, Beeline) order the service <a href = \"/ for-cordon / calls-abroad / services / unlimited-for-cordon / prepayment\" rel = \"noopener noreferrer\" target = \"_ blank\"> \"Unlimited abroad\" </a> </p> <p> SMS in Ukraine (for all mobile networks) - if you used 50 per day, the cost is 0.60 UAH / piece. You will have access to 50 new SMS for UAH 1.50 / day the next day. </p> <p> SMS abroad - UAH 2 / piece </p>','<p>Calls within Ukraine - 0.60 UAH / min</p><p>Calls abroad to <a href=\"/rates/prepay/supernet-start#countries_30\">&nbsp;30 countries&nbsp;</a>\r\n<span>&nbsp;</span> - UAH 10 for every 10 minutes (10 packages per day)</p><p>For unlimited calls to 3 numbers of subscribers of Poland (T-Mobile / Heyah), Russia (MTS, Beeline) order the service <a href=\"/%20for-cordon%20/%20calls-abroad%20/%20services%20/%20unlimited-for-cordon%20/%20prepayment\" rel=\"noopener noreferrer\" target=\"_ blank\">&nbsp;\"Unlimited abroad\"&nbsp;</a></p><p>SMS in Ukraine (for all mobile networks) - if you used 50 per day, the cost is 0.60 UAH / piece. You will have access to 50 new SMS for UAH 1.50 / day the next day.</p><p>SMS abroad - UAH 2 / piece</p>','2020-10-20 13:37:44','2020-10-20 13:37:44'),
	(60,'App\\Models\\Word',3,1,'description_ru','<p>&nbsp;<!-- P--></p>','<P> Звонки по Украине - 0,60 грн / мин </ p> <p> Звонки за границу в <a href=\"/rates/prepay/supernet-start#countries_30\"> 30 стран </a> <span> </ span> - 10 грн за каждые 10 мин (10 пакетов в сутки) </ p> <p> Для безлимитных звонков на 3 номера абонентов Польши (T-Mobile / Heyah), России (МТС, Beeline) закажите услугу <a href = \"/ za-kordon / calls-abroad / poslugi / bezlimit-za-kordon / peredplata\" rel = \"noopener noreferrer\" target = \"_ blank\"> «Безлимит за границу» </a> </ p> <p> SMS по Украине (на все мобильные сети) - если вы использовали 50 за день, стоимость - 0,60 грн / шт. Вам будут доступны новые 50 SMS за 1,50 грн / день уже на следующий день. </ P> <p> SMS за границу - 2 грн / шт. </ P>','2020-10-21 06:42:37','2020-10-21 06:42:37'),
	(61,'App\\Models\\Word',3,1,'description_en','<p>Calls within Ukraine - 0.60 UAH / min</p><p>Calls abroad to <a href=\"/rates/prepay/supernet-start#countries_30\">&nbsp;30 countries&nbsp;</a>\r\n<span>&nbsp;</span> - UAH 10 for every 10 minutes (10 packages per day)</p><p>For unlimited calls to 3 numbers of subscribers of Poland (T-Mobile / Heyah), Russia (MTS, Beeline) order the service <a href=\"/%20for-cordon%20/%20calls-abroad%20/%20services%20/%20unlimited-for-cordon%20/%20prepayment\" rel=\"noopener noreferrer\" target=\"_ blank\">&nbsp;\"Unlimited abroad\"&nbsp;</a></p><p>SMS in Ukraine (for all mobile networks) - if you used 50 per day, the cost is 0.60 UAH / piece. You will have access to 50 new SMS for UAH 1.50 / day the next day.</p><p>SMS abroad - UAH 2 / piece</p>','<p> Calls within Ukraine - 0.60 UAH / min </p> <p> Calls abroad to <a href=\"/rates/prepay/supernet-start#countries_30\"> 30 countries </a> <span> </span> - UAH 10 for every 10 minutes (10 packages per day) </p> <p> For unlimited calls to 3 numbers of subscribers of Poland (T-Mobile / Heyah), Russia (MTS, Beeline) order the service <a href = \"/ for-cordon / calls-abroad / services / unlimited-for-cordon / prepayment\" rel = \"noopener noreferrer\" target = \"_ blank\"> \"Unlimited abroad\" </a> </p> <p> SMS in Ukraine (for all mobile networks) - if you used 50 per day, the cost is 0.60 UAH / piece. You will have access to 50 new SMS for UAH 1.50 / day the next day. </p> <p> SMS abroad - UAH 2 / piece </p>','2020-10-21 06:42:37','2020-10-21 06:42:37'),
	(62,'App\\Models\\Word',3,1,'description_ru','<P> Звонки по Украине - 0,60 грн / мин </ p> <p> Звонки за границу в <a href=\"/rates/prepay/supernet-start#countries_30\"> 30 стран </a> <span> </ span> - 10 грн за каждые 10 мин (10 пакетов в сутки) </ p> <p> Для безлимитных звонков на 3 номера абонентов Польши (T-Mobile / Heyah), России (МТС, Beeline) закажите услугу <a href = \"/ za-kordon / calls-abroad / poslugi / bezlimit-za-kordon / peredplata\" rel = \"noopener noreferrer\" target = \"_ blank\"> «Безлимит за границу» </a> </ p> <p> SMS по Украине (на все мобильные сети) - если вы использовали 50 за день, стоимость - 0,60 грн / шт. Вам будут доступны новые 50 SMS за 1,50 грн / день уже на следующий день. </ P> <p> SMS за границу - 2 грн / шт. </ P>','<P> Звонки по Украине - 0,60 грн/мин </p> <p> Звонки за границу в <a href=\"/rates/prepay/supernet-start#countries_30\"> 30 стран </a> <span> </span> - 10 грн за каждые 10 мин (10 пакетов в сутки) </p> <p> Для безлимитных звонков на 3 номера абонентов Польши (T-Mobile/Heyah), России (МТС, Beeline) закажите услугу <a href = \"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel = \"noopener noreferrer\" target = \"_ blank\"> «Безлимит за границу» </a> </p> <p> SMS по Украине (на все мобильные сети) - если вы использовали 50 за день, стоимость - 0,60 грн/шт. Вам будут доступны новые 50 SMS за 1,50 грн/день уже на следующий день. </P> <p> SMS за границу - 2 грн/шт. </P>','2020-10-21 06:57:12','2020-10-21 06:57:12'),
	(63,'App\\Models\\Word',3,1,'description_en','<p> Calls within Ukraine - 0.60 UAH / min </p> <p> Calls abroad to <a href=\"/rates/prepay/supernet-start#countries_30\"> 30 countries </a> <span> </span> - UAH 10 for every 10 minutes (10 packages per day) </p> <p> For unlimited calls to 3 numbers of subscribers of Poland (T-Mobile / Heyah), Russia (MTS, Beeline) order the service <a href = \"/ for-cordon / calls-abroad / services / unlimited-for-cordon / prepayment\" rel = \"noopener noreferrer\" target = \"_ blank\"> \"Unlimited abroad\" </a> </p> <p> SMS in Ukraine (for all mobile networks) - if you used 50 per day, the cost is 0.60 UAH / piece. You will have access to 50 new SMS for UAH 1.50 / day the next day. </p> <p> SMS abroad - UAH 2 / piece </p>','<p> Calls within Ukraine - 0.60 UAH/min </p> <p> Calls abroad to <a href=\"/rates/prepay/supernet-start#countries_30\"> 30 countries </a> <span> </span> - UAH 10 for every 10 minutes (10 packages per day) </p> <p> For unlimited calls to 3 numbers of subscribers of Poland (T-Mobile/Heyah), Russia (MTS, Beeline) order the service <a href = \"/for-cordon/calls-abroad/services/unlimited-for-cordon/prepayment\" rel = \"noopener noreferrer\" target = \"_ blank\"> \"Unlimited abroad\" </a> </p> <p> SMS in Ukraine (for all mobile networks) - if you used 50 per day, the cost is 0.60 UAH/piece. You will have access to 50 new SMS for UAH 1.50/day the next day. </p> <p> SMS abroad - UAH 2/piece </p>','2020-10-21 06:57:12','2020-10-21 06:57:12'),
	(64,'App\\Models\\Word',3,1,'description_ru','<P> Звонки по Украине - 0,60 грн/мин </p> <p> Звонки за границу в <a href=\"/rates/prepay/supernet-start#countries_30\"> 30 стран </a> <span> </span> - 10 грн за каждые 10 мин (10 пакетов в сутки) </p> <p> Для безлимитных звонков на 3 номера абонентов Польши (T-Mobile/Heyah), России (МТС, Beeline) закажите услугу <a href = \"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel = \"noopener noreferrer\" target = \"_ blank\"> «Безлимит за границу» </a> </p> <p> SMS по Украине (на все мобильные сети) - если вы использовали 50 за день, стоимость - 0,60 грн/шт. Вам будут доступны новые 50 SMS за 1,50 грн/день уже на следующий день. </P> <p> SMS за границу - 2 грн/шт. </P>','<p>Звонки по Украине - 0,60 грн/мин</p><p>Звонки за границу в <a href=\"/rates/prepay/supernet-start#countries_30\">&nbsp;30 стран&nbsp;</a>\r\n<span>&nbsp;</span> - 10 грн за каждые 10 мин (10 пакетов в сутки)</p><p>Для безлимитных звонков на 3 номера абонентов Польши (T-Mobile/Heyah), России (МТС, Beeline) закажите услугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_ blank\">&nbsp;«Безлимит за границу»&nbsp;</a></p><p>SMS по Украине (на все мобильные сети) - если вы использовали 50 за день, стоимость - 0,60 грн/шт. Вам будут доступны новые 50 SMS за 1,50 грн/день уже на следующий день.</p><p>SMS за границу - 2 грн/шт.</p>','2020-11-11 07:37:14','2020-11-11 07:37:14'),
	(65,'App\\Models\\Word',3,1,'description_en','<p> Calls within Ukraine - 0.60 UAH/min </p> <p> Calls abroad to <a href=\"/rates/prepay/supernet-start#countries_30\"> 30 countries </a> <span> </span> - UAH 10 for every 10 minutes (10 packages per day) </p> <p> For unlimited calls to 3 numbers of subscribers of Poland (T-Mobile/Heyah), Russia (MTS, Beeline) order the service <a href = \"/for-cordon/calls-abroad/services/unlimited-for-cordon/prepayment\" rel = \"noopener noreferrer\" target = \"_ blank\"> \"Unlimited abroad\" </a> </p> <p> SMS in Ukraine (for all mobile networks) - if you used 50 per day, the cost is 0.60 UAH/piece. You will have access to 50 new SMS for UAH 1.50/day the next day. </p> <p> SMS abroad - UAH 2/piece </p>','<p>Calls within Ukraine - 0.60 UAH/min</p><p>Calls abroad to <a href=\"/rates/prepay/supernet-start#countries_30\">&nbsp;30 countries&nbsp;</a>\r\n<span>&nbsp;</span> - UAH 10 for every 10 minutes (10 packages per day)</p><p>For unlimited calls to 3 numbers of subscribers of Poland (T-Mobile/Heyah), Russia (MTS, Beeline) order the service <a href=\"/for-cordon/calls-abroad/services/unlimited-for-cordon/prepayment\" rel=\"noopener noreferrer\" target=\"_ blank\">&nbsp;\"Unlimited abroad\"&nbsp;</a></p><p>SMS in Ukraine (for all mobile networks) - if you used 50 per day, the cost is 0.60 UAH/piece. You will have access to 50 new SMS for UAH 1.50/day the next day.</p><p>SMS abroad - UAH 2/piece</p>','2020-11-11 07:37:14','2020-11-11 07:37:14'),
	(66,'App\\Models\\Word',3,1,'description','<p>Дзвінки по Україні – 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>– 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">«Безліміт за кордон»</a></p><p>SMS по Україні (на всі мобільні мережі) – якщо ви використали 50 за день, вартість – 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон – 2 грн/шт.</p>','<p>111Дзвінки по Україні &ndash; 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>&ndash; 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">&laquo;Безліміт за кордон&raquo;</a></p><p>SMS по Україні (на всі мобільні мережі) &ndash; якщо ви використали 50 за день, вартість &ndash; 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон &ndash; 2 грн/шт.</p>','2020-11-11 08:03:13','2020-11-11 08:03:13'),
	(67,'App\\Models\\Word',3,1,'description','<p>111Дзвінки по Україні &ndash; 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>&ndash; 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">&laquo;Безліміт за кордон&raquo;</a></p><p>SMS по Україні (на всі мобільні мережі) &ndash; якщо ви використали 50 за день, вартість &ndash; 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон &ndash; 2 грн/шт.</p>','<p>111Дзвінки по Україні – 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>– 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">«Безліміт за кордон»</a></p><p>SMS по Україні (на всі мобільні мережі) – якщо ви використали 50 за день, вартість – 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон – 2 грн/шт.</p>','2020-11-11 08:03:32','2020-11-11 08:03:32'),
	(68,'App\\Models\\Word',3,1,'description','<p>111Дзвінки по Україні – 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>– 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">«Безліміт за кордон»</a></p><p>SMS по Україні (на всі мобільні мережі) – якщо ви використали 50 за день, вартість – 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон – 2 грн/шт.</p>','<p>1111111Дзdddddвінки по Україні &ndash; 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>&ndash; 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">&laquo;Безліміт за кордон&raquo;</a></p><p>SMS по Україні (на всі мобільні мережі) &ndash; якщо ви використали 50 за день, вартість &ndash; 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон &ndash; 2 грн/шт.</p>','2020-11-11 08:21:05','2020-11-11 08:21:05'),
	(69,'App\\Models\\Word',3,1,'description','<p>1111111Дзdddddвінки по Україні &ndash; 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>&ndash; 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">&laquo;Безліміт за кордон&raquo;</a></p><p>SMS по Україні (на всі мобільні мережі) &ndash; якщо ви використали 50 за день, вартість &ndash; 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон &ndash; 2 грн/шт.</p>','<p>1111111Дзdddddвінки по Україні – 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>– 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">«Безліміт за кордон»</a></p><p>SMS по Україні (на всі мобільні мережі) – якщо ви використали 50 за день, вартість – 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон – 2 грн/шт.</p>','2020-11-11 08:26:27','2020-11-11 08:26:27'),
	(70,'App\\Models\\Word',3,1,'description','<p>1111111Дзdddddвінки по Україні – 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>– 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">«Безліміт за кордон»</a></p><p>SMS по Україні (на всі мобільні мережі) – якщо ви використали 50 за день, вартість – 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон – 2 грн/шт.</p>','<p>1111111Дз22222dddddвінки по Україні &ndash; 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>&ndash; 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">&laquo;Безліміт за кордон&raquo;</a></p><p>SMS по Україні (на всі мобільні мережі) &ndash; якщо ви використали 50 за день, вартість &ndash; 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон &ndash; 2 грн/шт.</p>','2020-11-11 08:26:34','2020-11-11 08:26:34'),
	(71,'App\\Models\\Word',3,1,'description','<p>1111111Дз22222dddddвінки по Україні &ndash; 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>&ndash; 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">&laquo;Безліміт за кордон&raquo;</a></p><p>SMS по Україні (на всі мобільні мережі) &ndash; якщо ви використали 50 за день, вартість &ndash; 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон &ndash; 2 грн/шт.</p>','<p>22221111111Дз22222dddddвінки по Україні &ndash; 0,60 грн/хв</p>\n\n<p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>&ndash; 10 грн за кожні 10 хв (10 пакетів на добу)</p>\n\n<p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">&laquo;Безліміт за кордон&raquo;</a></p>\n\n<p>SMS по Україні (на всі мобільні мережі) &ndash; якщо ви використали 50 за день, вартість &ndash; 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p>\n\n<p>SMS за кордон &ndash; 2 грн/шт.</p>','2020-11-11 08:26:42','2020-11-11 08:26:42'),
	(72,'App\\Models\\Word',3,1,'description','<p>22221111111Дз22222dddddвінки по Україні &ndash; 0,60 грн/хв</p>\n\n<p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>&ndash; 10 грн за кожні 10 хв (10 пакетів на добу)</p>\n\n<p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">&laquo;Безліміт за кордон&raquo;</a></p>\n\n<p>SMS по Україні (на всі мобільні мережі) &ndash; якщо ви використали 50 за день, вартість &ndash; 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p>\n\n<p>SMS за кордон &ndash; 2 грн/шт.</p>','<p>3333322221111111Дз22222dddddвінки по Україні &ndash; 0,60 грн/хв</p>\n\n<p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>&ndash; 10 грн за кожні 10 хв (10 пакетів на добу)</p>\n\n<p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">&laquo;Безліміт за кордон&raquo;</a></p>\n\n<p>SMS по Україні (на всі мобільні мережі) &ndash; якщо ви використали 50 за день, вартість &ndash; 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p>\n\n<p>SMS за кордон &ndash; 2 грн/шт.</p>','2020-11-11 08:26:53','2020-11-11 08:26:53'),
	(73,'App\\Models\\Word',3,1,'description','<p>3333322221111111Дз22222dddddвінки по Україні &ndash; 0,60 грн/хв</p>\n\n<p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>&ndash; 10 грн за кожні 10 хв (10 пакетів на добу)</p>\n\n<p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">&laquo;Безліміт за кордон&raquo;</a></p>\n\n<p>SMS по Україні (на всі мобільні мережі) &ndash; якщо ви використали 50 за день, вартість &ndash; 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p>\n\n<p>SMS за кордон &ndash; 2 грн/шт.</p>','<p>3333322221111111Дз22222dddddвінки по Україні – 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>– 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">«Безліміт за кордон»</a></p><p>SMS по Україні (на всі мобільні мережі) – якщо ви використали 50 за день, вартість – 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон – 2 грн/шт.</p>','2020-11-11 08:29:30','2020-11-11 08:29:30'),
	(74,'App\\Models\\Word',3,1,'description','<p>3333322221111111Дз22222dddddвінки по Україні – 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>– 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">«Безліміт за кордон»</a></p><p>SMS по Україні (на всі мобільні мережі) – якщо ви використали 50 за день, вартість – 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон – 2 грн/шт.</p>','<p>1111311333322221111111Дз22222dddddвінки по Україні &ndash; 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>&ndash; 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">&laquo;Безліміт за кордон&raquo;</a></p><p>SMS по Україні (на всі мобільні мережі) &ndash; якщо ви використали 50 за день, вартість &ndash; 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон &ndash; 2 грн/шт.</p>','2020-11-11 08:30:57','2020-11-11 08:30:57'),
	(75,'App\\Models\\Word',3,1,'description_ru','<p>Звонки по Украине - 0,60 грн/мин</p><p>Звонки за границу в <a href=\"/rates/prepay/supernet-start#countries_30\">&nbsp;30 стран&nbsp;</a>\r\n<span>&nbsp;</span> - 10 грн за каждые 10 мин (10 пакетов в сутки)</p><p>Для безлимитных звонков на 3 номера абонентов Польши (T-Mobile/Heyah), России (МТС, Beeline) закажите услугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_ blank\">&nbsp;«Безлимит за границу»&nbsp;</a></p><p>SMS по Украине (на все мобильные сети) - если вы использовали 50 за день, стоимость - 0,60 грн/шт. Вам будут доступны новые 50 SMS за 1,50 грн/день уже на следующий день.</p><p>SMS за границу - 2 грн/шт.</p>','<p>Звонки по Украине - 0,60 грн/мин</p><p>Звонки за границу в <a href=\"/rates/prepay/supernet-start#countries_30\">&nbsp;30 стран&nbsp;</a>\n<span>&nbsp;</span> - 10 грн за каждые 10 мин (10 пакетов в сутки)</p><p>Для безлимитных звонков на 3 номера абонентов Польши (T-Mobile/Heyah), России (МТС, Beeline) закажите услугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_ blank\">&nbsp;«Безлимит за границу»&nbsp;</a></p><p>SMS по Украине (на все мобильные сети) - если вы использовали 50 за день, стоимость - 0,60 грн/шт. Вам будут доступны новые 50 SMS за 1,50 грн/день уже на следующий день.</p><p>SMS за границу - 2 грн/шт.</p>','2020-11-11 08:30:57','2020-11-11 08:30:57'),
	(76,'App\\Models\\Word',3,1,'description_en','<p>Calls within Ukraine - 0.60 UAH/min</p><p>Calls abroad to <a href=\"/rates/prepay/supernet-start#countries_30\">&nbsp;30 countries&nbsp;</a>\r\n<span>&nbsp;</span> - UAH 10 for every 10 minutes (10 packages per day)</p><p>For unlimited calls to 3 numbers of subscribers of Poland (T-Mobile/Heyah), Russia (MTS, Beeline) order the service <a href=\"/for-cordon/calls-abroad/services/unlimited-for-cordon/prepayment\" rel=\"noopener noreferrer\" target=\"_ blank\">&nbsp;\"Unlimited abroad\"&nbsp;</a></p><p>SMS in Ukraine (for all mobile networks) - if you used 50 per day, the cost is 0.60 UAH/piece. You will have access to 50 new SMS for UAH 1.50/day the next day.</p><p>SMS abroad - UAH 2/piece</p>','<p>Calls within Ukraine - 0.60 UAH/min</p><p>Calls abroad to <a href=\"/rates/prepay/supernet-start#countries_30\">&nbsp;30 countries&nbsp;</a>\n<span>&nbsp;</span> - UAH 10 for every 10 minutes (10 packages per day)</p><p>For unlimited calls to 3 numbers of subscribers of Poland (T-Mobile/Heyah), Russia (MTS, Beeline) order the service <a href=\"/for-cordon/calls-abroad/services/unlimited-for-cordon/prepayment\" rel=\"noopener noreferrer\" target=\"_ blank\">&nbsp;\"Unlimited abroad\"&nbsp;</a></p><p>SMS in Ukraine (for all mobile networks) - if you used 50 per day, the cost is 0.60 UAH/piece. You will have access to 50 new SMS for UAH 1.50/day the next day.</p><p>SMS abroad - UAH 2/piece</p>','2020-11-11 08:30:57','2020-11-11 08:30:57'),
	(77,'App\\Models\\Word',3,1,'description','<p>1111311333322221111111Дз22222dddddвінки по Україні &ndash; 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>&ndash; 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">&laquo;Безліміт за кордон&raquo;</a></p><p>SMS по Україні (на всі мобільні мережі) &ndash; якщо ви використали 50 за день, вартість &ndash; 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон &ndash; 2 грн/шт.</p>','<p>22221111311333322221111111Дз22222dddddвінки по Україні &ndash; 0,60 грн/хв</p>\n\n<p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>&ndash; 10 грн за кожні 10 хв (10 пакетів на добу)</p>\n\n<p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">&laquo;Безліміт за кордон&raquo;</a></p>\n\n<p>SMS по Україні (на всі мобільні мережі) &ndash; якщо ви використали 50 за день, вартість &ndash; 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p>\n\n<p>SMS за кордон &ndash; 2 грн/шт.</p>','2020-11-11 08:31:08','2020-11-11 08:31:08'),
	(78,'App\\Models\\Word',7,1,'created_at',NULL,'2020-11-11 08:33:53','2020-11-11 08:33:53','2020-11-11 08:33:53'),
	(79,'App\\Models\\Word',3,1,'description','<p>22221111311333322221111111Дз22222dddddвінки по Україні &ndash; 0,60 грн/хв</p>\n\n<p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>&ndash; 10 грн за кожні 10 хв (10 пакетів на добу)</p>\n\n<p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">&laquo;Безліміт за кордон&raquo;</a></p>\n\n<p>SMS по Україні (на всі мобільні мережі) &ndash; якщо ви використали 50 за день, вартість &ndash; 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p>\n\n<p>SMS за кордон &ndash; 2 грн/шт.</p>','<p>11122221111311333322221111111Дз22222dddddвінки по Україні &ndash; 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>&ndash; 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">&laquo;Безліміт за кордон&raquo;</a></p><p>SMS по Україні (на всі мобільні мережі) &ndash; якщо ви використали 50 за день, вартість &ndash; 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон &ndash; 2 грн/шт.</p>','2020-11-11 08:40:34','2020-11-11 08:40:34'),
	(80,'App\\Models\\Word',3,1,'description','<p>11122221111311333322221111111Дз22222dddddвінки по Україні &ndash; 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>&ndash; 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">&laquo;Безліміт за кордон&raquo;</a></p><p>SMS по Україні (на всі мобільні мережі) &ndash; якщо ви використали 50 за день, вартість &ndash; 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон &ndash; 2 грн/шт.</p>','<p>333311122221111311333322221111111Дз22222dddddвінки по Україні &ndash; 0,60 грн/хв</p>\n\n<p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>&ndash; 10 грн за кожні 10 хв (10 пакетів на добу)</p>\n\n<p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">&laquo;Безліміт за кордон&raquo;</a></p>\n\n<p>SMS по Україні (на всі мобільні мережі) &ndash; якщо ви використали 50 за день, вартість &ndash; 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p>\n\n<p>SMS за кордон &ndash; 2 грн/шт.</p>','2020-11-11 08:40:43','2020-11-11 08:40:43'),
	(81,'App\\Models\\Word',8,1,'created_at',NULL,'2020-11-11 08:41:22','2020-11-11 08:41:22','2020-11-11 08:41:22'),
	(82,'App\\Models\\Word',8,1,'description','<p>ssssss</p>','<p>ssssss11</p>','2020-11-11 08:41:33','2020-11-11 08:41:33'),
	(83,'App\\Models\\Word',8,1,'description_ru','<P> ssssss </p>','<p>ssssss</p>','2020-11-11 08:41:33','2020-11-11 08:41:33'),
	(84,'App\\Models\\Word',8,1,'description_en','<p> ssssss </p>','<p>ssssss</p>','2020-11-11 08:41:33','2020-11-11 08:41:33'),
	(85,'App\\Models\\Word',8,1,'description','<p>ssssss11</p>','<p>22222ssssss11</p>','2020-11-11 08:41:42','2020-11-11 08:41:42'),
	(86,'App\\Models\\Word',9,1,'created_at',NULL,'2020-11-11 08:42:03','2020-11-11 08:42:03','2020-11-11 08:42:03'),
	(87,'App\\Models\\Word',9,1,'description','<p>1111asdasdasdasd</p>','<p>22222222212222111asdasdasdasd</p>','2020-11-11 08:42:22','2020-11-11 08:42:22'),
	(88,'App\\Models\\Word',9,1,'description_ru','<P> 1111asdasdasdasd </p>','<p>1111asdasdasdasd</p>','2020-11-11 08:42:22','2020-11-11 08:42:22'),
	(89,'App\\Models\\Word',9,1,'description_en','<p> 1111asdasdasdasd </p>','<p>1111asdasdasdasd</p>','2020-11-11 08:42:22','2020-11-11 08:42:22'),
	(90,'App\\Models\\Word',10,1,'created_at',NULL,'2020-11-11 08:42:49','2020-11-11 08:42:49','2020-11-11 08:42:49'),
	(91,'App\\Models\\Word',3,1,'description','<p>333311122221111311333322221111111Дз22222dddddвінки по Україні &ndash; 0,60 грн/хв</p>\n\n<p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>&ndash; 10 грн за кожні 10 хв (10 пакетів на добу)</p>\n\n<p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">&laquo;Безліміт за кордон&raquo;</a></p>\n\n<p>SMS по Україні (на всі мобільні мережі) &ndash; якщо ви використали 50 за день, вартість &ndash; 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p>\n\n<p>SMS за кордон &ndash; 2 грн/шт.</p>','<p>333311122221111311333322221111111Дз22222dddddвінки по Україні – 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>– 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">«Безліміт за кордон»</a></p><p>SMS по Україні (на всі мобільні мережі) – якщо ви використали 50 за день, вартість – 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон – 2 грн/шт.</p>','2020-11-19 15:57:36','2020-11-19 15:57:36'),
	(92,'App\\Models\\Word',3,1,'sound','','/storage/editor/fotos/658c70d1ec2cf8dcd7c80a3a65541b50_1605801022.png','2020-11-19 15:57:36','2020-11-19 15:57:36'),
	(93,'App\\Models\\Word',3,1,'sound_ru','','/storage/editor/fotos/658c70d1ec2cf8dcd7c80a3a65541b50_1605801022.png','2020-11-19 15:57:36','2020-11-19 15:57:36'),
	(94,'App\\Models\\Word',3,1,'sound_en','','/storage/editor/fotos/658c70d1ec2cf8dcd7c80a3a65541b50_1605801022.png','2020-11-19 15:57:36','2020-11-19 15:57:36'),
	(95,'App\\Models\\Word',3,1,'sound','/storage/editor/fotos/658c70d1ec2cf8dcd7c80a3a65541b50_1605801022.png','/storage/editor/fotos/cb18550095ec15b93e355569dd25df86_1605801493.png','2020-11-19 15:58:26','2020-11-19 15:58:26'),
	(96,'App\\Models\\Word',3,1,'sound_ru','/storage/editor/fotos/658c70d1ec2cf8dcd7c80a3a65541b50_1605801022.png','/storage/editor/fotos/cb18550095ec15b93e355569dd25df86_1605801493.png','2020-11-19 15:58:26','2020-11-19 15:58:26'),
	(97,'App\\Models\\Tree',2,1,'template','main','contacts','2024-09-16 19:49:22','2024-09-16 19:49:22'),
	(98,'App\\Models\\Tree',2,1,'template','contacts','main','2024-09-16 19:49:24','2024-09-16 19:49:24'),
	(99,'App\\Models\\News',1,1,'created_at',NULL,NULL,'2024-09-16 19:57:30','2024-09-16 19:57:30'),
	(100,'App\\Models\\News',2,1,'created_at',NULL,NULL,'2024-09-16 19:58:53','2024-09-16 19:58:53'),
	(101,'App\\Models\\MorphOne\\Seo',18,1,'created_at',NULL,NULL,'2024-09-16 19:58:53','2024-09-16 19:58:53'),
	(102,'App\\Models\\News',2,1,'text',NULL,'<p>adasd</p>','2024-09-16 19:59:26','2024-09-16 19:59:26'),
	(103,'App\\Models\\MorphOne\\Seo',18,1,'seo_title','{\"en\": \"\", \"ru\": \"\", \"ua\": \"\"}','{\"en\":\"\",\"ru\":\"\",\"ua\":\"\"}','2024-09-16 19:59:27','2024-09-16 19:59:27'),
	(104,'App\\Models\\Tree',2,1,'title','ddd','{\"ua\":\"\\u0444\\u0444\\u0444\",\"ru\":\"\\u0444\\u0444\\u0444\",\"en\":\"fff\"}','2024-09-16 20:16:17','2024-09-16 20:16:17'),
	(105,'App\\Models\\News',2,1,'is_active','0','1','2024-09-16 20:16:39','2024-09-16 20:16:39'),
	(106,'App\\Models\\Author',1,1,'full_name','Вася1122__','{\"ua\":\"\\u0444\\u0444\\u0444\",\"ru\":\"\\u0444\\u0444\\u0444\",\"en\":\"fff\"}','2024-09-16 20:17:41','2024-09-16 20:17:41'),
	(107,'App\\Models\\Author',1,1,'created_at','2020-09-03 12:27:24','2020-09-03 00:00:00','2024-09-16 20:17:41','2024-09-16 20:17:41'),
	(108,'App\\Models\\Author',1,1,'full_name','{\"ua\":\"\\u0444\\u0444\\u0444\",\"ru\":\"\\u0444\\u0444\\u0444\",\"en\":\"fff\"}','{\"ua\":\"\\u0444\\u0444\\u0444\",\"ru\":\"\\u0444\\u0444\\u044411\",\"en\":\"fff\"}','2024-09-16 20:17:49','2024-09-16 20:17:49'),
	(109,'App\\Models\\Author',1,1,'full_name','{\"ua\":\"\\u0444\\u0444\\u0444\",\"ru\":\"\\u0444\\u0444\\u044411\",\"en\":\"fff\"}','{\"ua\":\"\\u0444\\u0444\\u0444\\u0433\\u0433\",\"ru\":\"\\u0444\\u0444\\u044411\",\"en\":\"fff\"}','2024-09-16 20:17:58','2024-09-16 20:17:58'),
	(110,'App\\Models\\Tree',1,1,'title','Главная','{\"ua\":\"\\u0413\\u043e\\u0440\\u043e\\u0432\\u043d\\u0430\",\"ru\":\"\\u0413\\u043e\\u0440\\u043e\\u0432\\u043d\\u0430\",\"en\":\"Gorovna\"}','2024-09-16 20:18:57','2024-09-16 20:18:57'),
	(111,'App\\Models\\Tree',2,1,'title','{\"ua\":\"\\u0444\\u0444\\u0444\",\"ru\":\"\\u0444\\u0444\\u0444\",\"en\":\"fff\"}','{\"ua\":\"\\u0444\\u0444\\u0444\",\"ru\":\"11\\u0444\\u0444\\u0444\",\"en\":\"fff\"}','2024-09-16 20:38:14','2024-09-16 20:38:14'),
	(112,'App\\Models\\MenuHeader',3,1,'title','{\"da\": \"Tequila og Mezcal\", \"de\": \"Tequila und Mezcal\", \"en\": \"Tequila and Mezcal\", \"es\": \"Tequila y Mezcal\", \"fr\": \"Téquila et Mezcal\", \"nl\": \"Tequila en Mezcal\", \"tr\": \"Tekila ve Mezcal\"}','{\"da\":\"Tequila og Mezcal\",\"de\":\"Tequila und Mezcal\",\"en\":\"Tequila and Mezcal\",\"es\":\"Tequila y Mezcal\",\"fr\":\"T\\u00e9quila et Mezcal\",\"nl\":\"Tequila en Mezcal\",\"tr\":\"Tekila ve Mezcal\",\"ua\":\"test\"}','2024-09-16 20:40:48','2024-09-16 20:40:48'),
	(113,'App\\Models\\MenuHeader',3,1,'url','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}',NULL,'2024-09-16 20:40:48','2024-09-16 20:40:48'),
	(114,'App\\Models\\MenuHeader',3,1,'title','{\"da\": \"Tequila og Mezcal\", \"de\": \"Tequila und Mezcal\", \"en\": \"Tequila and Mezcal\", \"es\": \"Tequila y Mezcal\", \"fr\": \"Téquila et Mezcal\", \"nl\": \"Tequila en Mezcal\", \"tr\": \"Tekila ve Mezcal\", \"ua\": \"test\"}','{\"da\":\"Tequila og Mezcal\",\"de\":\"Tequila und Mezcal\",\"en\":\"Tequila and Mezcal\",\"es\":\"Tequila y Mezcal\",\"fr\":\"T\\u00e9quila et Mezcal\",\"nl\":\"Tequila en Mezcal\",\"tr\":\"Tekila ve Mezcal\",\"ua\":\"test\"}','2024-09-16 20:43:40','2024-09-16 20:43:40'),
	(115,'App\\Models\\MenuHeader',3,1,'url',NULL,'/','2024-09-16 20:43:40','2024-09-16 20:43:40'),
	(116,'App\\Models\\MenuHeader',3,1,'title','{\"da\": \"Tequila og Mezcal\", \"de\": \"Tequila und Mezcal\", \"en\": \"Tequila and Mezcal\", \"es\": \"Tequila y Mezcal\", \"fr\": \"Téquila et Mezcal\", \"nl\": \"Tequila en Mezcal\", \"tr\": \"Tekila ve Mezcal\", \"ua\": \"test\"}','{\"da\":\"Tequila og Mezcal\",\"de\":\"Tequila und Mezcal\",\"en\":\"Tequila and Mezcal\",\"es\":\"Tequila y Mezcal\",\"fr\":\"T\\u00e9quila et Mezcal\",\"nl\":\"Tequila en Mezcal\",\"tr\":\"Tekila ve Mezcal\",\"ua\":\"testqq\"}','2024-09-16 20:43:45','2024-09-16 20:43:45'),
	(117,'App\\Models\\News',2,1,'created_at',NULL,'2024-08-28 20:45:58','2024-09-16 20:43:58','2024-09-16 20:43:58'),
	(118,'App\\Models\\MorphOne\\Seo',18,1,'seo_title','{\"en\": null, \"ru\": null, \"ua\": null}','{\"en\":\"\",\"ru\":\"\",\"ua\":\"\"}','2024-09-16 20:43:58','2024-09-16 20:43:58');

/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_users`;

CREATE TABLE `role_users` (
  `user_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_role_id_foreign` (`role_id`),
  CONSTRAINT `role_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;

INSERT INTO `role_users` (`user_id`, `role_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL),
	(2,2,NULL,NULL),
	(3,1,NULL,NULL),
	(4,1,NULL,NULL),
	(4,2,NULL,NULL);

/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role_words
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_words`;

CREATE TABLE `role_words` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `word_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `role_words` WRITE;
/*!40000 ALTER TABLE `role_words` DISABLE KEYS */;

INSERT INTO `role_words` (`id`, `word_id`, `role_id`)
VALUES
	(21,4,0);

/*!40000 ALTER TABLE `role_words` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `permissions` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `slug`, `name`, `permissions`, `created_at`, `updated_at`)
VALUES
	(1,'admin','Администратор','{\"admin.access\":true,\"tree.view\":true,\"words.view\":true,\"authors.view\":true,\"settingsblock.view\":true,\"settingssettingsall.view\":true,\"translationscmsphrases.view\":true,\"revisions.view\":true,\"translationsphrases.view\":true,\"usersgroup.view\":true,\"users.view\":true,\"groups.view\":true,\"dashboard.view\":true}','2020-09-02 08:52:31','2024-09-16 19:33:21'),
	(2,'editor','Редактор','{\"admin.access\":true,\"tree.view\":true,\"articles.view\":true,\"settings_block.view\":true,\"settingssettings_all.view\":true,\"translations_cmsphrases.view\":true,\"revisions.view\":true,\"translationsphrases.view\":true,\"users_group.view\":true,\"users.view\":true,\"groups.view\":true}','2020-09-02 08:52:31','2020-09-02 08:52:31');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table seo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `seo`;

CREATE TABLE `seo` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `seo_id` int NOT NULL,
  `seo_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` json NOT NULL,
  `seo_description` json NOT NULL,
  `seo_text` json NOT NULL,
  `seo_keywords` json NOT NULL,
  `is_seo_noindex` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seo_seo_id_seo_type_unique` (`seo_id`,`seo_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `seo` WRITE;
/*!40000 ALTER TABLE `seo` DISABLE KEYS */;

INSERT INTO `seo` (`id`, `seo_id`, `seo_type`, `seo_title`, `seo_description`, `seo_text`, `seo_keywords`, `is_seo_noindex`)
VALUES
	(1,1,'App\\Models\\Tree','{\"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"pl\": \"\", \"tr\": \"\"}','{\"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"pl\": \"\", \"tr\": \"\"}','{\"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"pl\": \"\", \"tr\": \"\"}','{\"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"pl\": \"\", \"tr\": \"\"}',0),
	(2,2,'App\\Models\\Tree','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}',0),
	(3,3,'App\\Models\\Tree','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}',0),
	(4,5,'App\\Models\\Tree','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}',0),
	(5,9,'App\\Models\\Tree','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}',0),
	(6,8,'App\\Models\\Tree','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}',0),
	(7,4,'App\\Models\\Tree','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}',0),
	(8,10,'App\\Models\\Tree','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}',0),
	(9,18,'App\\Models\\Tree','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}',0),
	(10,14,'App\\Models\\Tree','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}',0),
	(11,21,'App\\Models\\Tree','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}',0),
	(12,13,'App\\Models\\Tree','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}',0),
	(13,22,'App\\Models\\Tree','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}',0),
	(14,11,'App\\Models\\Tree','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}',0),
	(15,23,'App\\Models\\Tree','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}',0),
	(16,26,'App\\Models\\Tree','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}',0),
	(17,27,'App\\Models\\Tree','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}','{\"da\": \"\", \"de\": \"\", \"en\": \"\", \"es\": \"\", \"fr\": \"\", \"nl\": \"\", \"tr\": \"\"}',0),
	(18,2,'App\\Models\\News','{\"en\": \"\", \"ru\": \"\", \"ua\": \"\"}','null','null','null',0);

/*!40000 ALTER TABLE `seo` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table setting_select
# ------------------------------------------------------------

DROP TABLE IF EXISTS `setting_select`;

CREATE TABLE `setting_select` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_setting` int unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  `value2` varchar(255) NOT NULL,
  `value3` varchar(255) NOT NULL,
  `priority` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `setting_select_id_setting_index` (`id_setting`),
  CONSTRAINT `setting_select_id_setting_foreign` FOREIGN KEY (`id_setting`) REFERENCES `settings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



# Dump of table settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `group_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;

INSERT INTO `settings` (`id`, `type`, `title`, `slug`, `value`, `group_type`)
VALUES
	(1,0,'Email администратора','email-administratora','arturishe@ukr.net','general');

/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_tree
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_tree`;

CREATE TABLE `tb_tree` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `lft` int NOT NULL,
  `rgt` int NOT NULL,
  `depth` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `template` varchar(120) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `additional_pictures` text NOT NULL,
  `is_active` tinyint NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_description` varchar(255) NOT NULL,
  `seo_keywords` varchar(255) NOT NULL,
  `is_show_in_menu` tinyint NOT NULL,
  `is_show_in_footer_menu` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_tree_lft_index` (`lft`),
  KEY `tb_tree_rgt_index` (`rgt`),
  KEY `tb_tree_parent_id_foreign` (`parent_id`),
  CONSTRAINT `tb_tree_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `tb_tree` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `tb_tree` WRITE;
/*!40000 ALTER TABLE `tb_tree` DISABLE KEYS */;

INSERT INTO `tb_tree` (`id`, `parent_id`, `lft`, `rgt`, `depth`, `title`, `description`, `slug`, `template`, `picture`, `additional_pictures`, `is_active`, `seo_title`, `seo_description`, `seo_keywords`, `is_show_in_menu`, `is_show_in_footer_menu`, `created_at`, `updated_at`)
VALUES
	(1,NULL,1,70,0,'{\"ua\":\"\\u0413\\u043e\\u0440\\u043e\\u0432\\u043d\\u0430\",\"ru\":\"\\u0413\\u043e\\u0440\\u043e\\u0432\\u043d\\u0430\",\"en\":\"Gorovna\"}','','/','main','','',1,'','','',0,0,'2020-09-02 08:52:31','2024-09-16 20:18:57'),
	(2,1,2,5,0,'{\"ua\":\"\\u0444\\u0444\\u0444\",\"ru\":\"11\\u0444\\u0444\\u0444\",\"en\":\"fff\"}','','ddd','main','','',1,'','','',0,0,'2020-10-15 08:39:24','2024-09-16 20:38:14'),
	(3,2,3,4,0,'ttt','','ttt','main','','',0,'','','',0,0,'2020-10-15 08:39:33','2020-10-15 08:39:33'),
	(4,1,66,69,0,'ddd','','ddd_1602751878','main','','',1,'','','',0,0,'2020-10-15 08:39:24','2020-10-15 08:51:18'),
	(5,4,67,68,0,'ttt','','ttt','main','','',0,'','','',0,0,'2020-10-15 08:39:33','2020-10-15 08:51:18');

/*!40000 ALTER TABLE `tb_tree` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table throttle
# ------------------------------------------------------------

DROP TABLE IF EXISTS `throttle`;

CREATE TABLE `throttle` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `throttle_user_id_index` (`user_id`),
  KEY `throttle_type_ip_created_at_index` (`type`,`ip`,`created_at`),
  CONSTRAINT `throttle_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `throttle` WRITE;
/*!40000 ALTER TABLE `throttle` DISABLE KEYS */;

INSERT INTO `throttle` (`id`, `user_id`, `type`, `ip`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'global','','2020-09-14 14:54:30','2020-09-14 14:54:30'),
	(2,NULL,'ip','127.0.0.1','2020-09-14 14:54:30','2020-09-14 14:54:30'),
	(3,1,'user','','2020-09-14 14:54:30','2020-09-14 14:54:30'),
	(4,NULL,'global','','2020-10-13 19:43:50','2020-10-13 19:43:50'),
	(5,NULL,'ip','127.0.0.1','2020-10-13 19:43:50','2020-10-13 19:43:50'),
	(6,1,'user','','2020-10-13 19:43:50','2020-10-13 19:43:50'),
	(7,NULL,'global','','2020-10-13 19:43:54','2020-10-13 19:43:54'),
	(8,NULL,'ip','127.0.0.1','2020-10-13 19:43:54','2020-10-13 19:43:54'),
	(9,1,'user','','2020-10-13 19:43:54','2020-10-13 19:43:54'),
	(10,NULL,'global','','2020-10-13 19:44:17','2020-10-13 19:44:17'),
	(11,NULL,'ip','127.0.0.1','2020-10-13 19:44:17','2020-10-13 19:44:17'),
	(12,1,'user','','2020-10-13 19:44:17','2020-10-13 19:44:17');

/*!40000 ALTER TABLE `throttle` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `translations`;

CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_translations_phrase` int unsigned NOT NULL,
  `lang` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `translate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `translations_id_translations_phrase_index` (`id_translations_phrase`),
  CONSTRAINT `translations_id_translations_phrase_foreign` FOREIGN KEY (`id_translations_phrase`) REFERENCES `translations_phrases` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;

INSERT INTO `translations` (`id`, `id_translations_phrase`, `lang`, `translate`)
VALUES
	(1,1,'ua','поделиться историей'),
	(2,1,'ru','поделиться историей'),
	(3,1,'en','поделиться историей'),
	(10,5,'ua','як справи'),
	(11,5,'ru','как дела'),
	(12,5,'en','how are you');

/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table translations_cms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `translations_cms`;

CREATE TABLE `translations_cms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `translations_phrases_cms_id` int unsigned NOT NULL,
  `lang` varchar(2) NOT NULL,
  `translate` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `translations_cms_translations_phrases_cms_id_index` (`translations_phrases_cms_id`),
  CONSTRAINT `translations_cms_translations_phrases_cms_id_foreign` FOREIGN KEY (`translations_phrases_cms_id`) REFERENCES `translations_phrases_cms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `translations_cms` WRITE;
/*!40000 ALTER TABLE `translations_cms` DISABLE KEYS */;

INSERT INTO `translations_cms` (`id`, `translations_phrases_cms_id`, `lang`, `translate`)
VALUES
	(11,8,'ru','Фраза'),
	(12,8,'uk','Фраза'),
	(13,8,'en','The phrase'),
	(14,9,'ru','Код'),
	(15,9,'uk','Код'),
	(16,9,'en','Code'),
	(17,10,'ru','Переводы'),
	(18,10,'uk','Переклади'),
	(19,10,'en','Translations'),
	(20,11,'ru','Добавить'),
	(21,11,'uk','Додати'),
	(22,11,'en','Add'),
	(23,12,'ru','Удалить'),
	(24,12,'uk','Видалити'),
	(25,12,'en','Delete'),
	(26,13,'ru','Каталог пустой'),
	(27,13,'uk','Каталог порожній'),
	(28,13,'en','Directory is empty'),
	(29,14,'ru','Показано'),
	(30,14,'uk','Показано'),
	(31,14,'en','Shown'),
	(32,15,'ru','записей'),
	(33,15,'uk','записів'),
	(34,15,'en','records'),
	(35,16,'ru','из'),
	(36,16,'uk','з'),
	(37,16,'en','from'),
	(38,17,'ru','Главная'),
	(39,17,'uk','Головна'),
	(40,17,'en','Main'),
	(44,19,'ru','О нас'),
	(45,19,'uk','Про нас'),
	(46,19,'en','About us'),
	(47,20,'ru','Переменые'),
	(48,20,'uk','Змінні'),
	(49,20,'en','Changes'),
	(50,21,'ru','Настройки'),
	(51,21,'uk','Налаштування'),
	(52,21,'en','Settings'),
	(53,22,'ru','Пресса'),
	(54,22,'uk','Преса'),
	(55,22,'en','Press'),
	(56,23,'ru','Структура сайта'),
	(57,23,'uk','Структура сайту'),
	(58,23,'en','Structure  website'),
	(59,24,'ru','Кейсы'),
	(60,24,'uk','Кейси'),
	(61,24,'en','Cases'),
	(62,25,'ru','Команда'),
	(63,25,'uk','Команда'),
	(64,25,'en','Team'),
	(65,26,'ru','Упр. пользователями'),
	(66,26,'uk','Упр. користувачами'),
	(67,26,'en','Users'),
	(68,27,'ru','Пользователи'),
	(69,27,'uk','Користувачі'),
	(70,27,'en','Users'),
	(71,28,'ru','Группы'),
	(72,28,'uk','Групи'),
	(73,28,'en','Groups'),
	(74,29,'ru','Показывать по'),
	(75,29,'uk','Показувати по'),
	(76,29,'en','Show'),
	(77,30,'ru','Все'),
	(78,30,'uk','Всі'),
	(79,30,'en','All'),
	(80,31,'ru','Административная часть сайта'),
	(81,31,'uk','Адміністративна частина сайту'),
	(82,31,'en','The administrative part of the site'),
	(83,32,'ru','Служба поддержки'),
	(84,32,'uk','Служба підтримки'),
	(85,32,'en','Support'),
	(86,33,'ru','Войти'),
	(87,33,'uk','Увійти'),
	(88,33,'en','Enter in CMS'),
	(89,34,'ru','Эл.почта'),
	(90,34,'uk','Ел.пошта'),
	(91,34,'en','Email'),
	(92,35,'ru','Пароль'),
	(93,35,'uk','Пароль'),
	(94,35,'en','Password'),
	(95,36,'ru','Запомнить меня'),
	(96,36,'uk','Запамятати мене'),
	(97,36,'en','Remember me'),
	(98,37,'ru','Введите адрес эл.почты'),
	(99,37,'uk','Введіть адреса ел.пошти'),
	(100,37,'en','Enter your email'),
	(101,38,'ru','Введите валидный адрес эл.почты'),
	(102,38,'uk','Введіть дійсний адреса ел.пошти'),
	(103,38,'en','Enter a valid email'),
	(104,39,'ru','Введите пароль'),
	(105,39,'uk','Введіть пароль'),
	(106,39,'en','Enter the password'),
	(107,40,'ru','Пользователь не найден'),
	(108,40,'uk','Користувач не знайдений'),
	(109,40,'en','User not found'),
	(110,41,'ru','Создать'),
	(111,41,'uk','Створити'),
	(112,41,'en','Add'),
	(113,42,'ru','Тип'),
	(114,42,'uk','Тип'),
	(115,42,'en','Type'),
	(116,43,'ru','Группа'),
	(117,43,'uk','Група'),
	(118,43,'en','Group'),
	(119,44,'ru','Значение'),
	(120,44,'uk','Значення'),
	(121,44,'en','Value'),
	(122,45,'ru','Редактировать'),
	(123,45,'uk','Редагувати'),
	(124,45,'en','Edit'),
	(125,46,'ru','Редактирование'),
	(126,46,'uk','Редагування'),
	(127,46,'en','Edit'),
	(128,47,'ru','Название'),
	(129,47,'uk','Назва'),
	(130,47,'en','Title'),
	(131,48,'ru','Клонировать'),
	(132,48,'uk','Клонувати'),
	(133,48,'en','Clone'),
	(134,49,'ru','Дата создания'),
	(135,49,'uk','Дата створення'),
	(136,49,'en','Created date'),
	(137,50,'ru','Статья активна'),
	(138,50,'uk','Стаття активна'),
	(139,50,'en','Article active'),
	(140,51,'ru','Общие'),
	(141,51,'uk','Загальні'),
	(142,51,'en','Common'),
	(143,52,'ru','Телефоны'),
	(144,52,'uk','Телефони'),
	(145,52,'en','Phones'),
	(149,54,'ru','Новости'),
	(150,54,'uk','Новини'),
	(151,54,'en','News'),
	(152,55,'ru','Создание'),
	(153,55,'uk','Створення'),
	(154,55,'en','Creation'),
	(155,56,'ru','Отмена'),
	(156,56,'uk','Скасування'),
	(157,56,'en','Cancel'),
	(158,57,'ru','Сохранить'),
	(159,57,'uk','Зберегти'),
	(160,57,'en','Save'),
	(161,58,'ru','Показать дерево'),
	(162,58,'uk','Показати дерево'),
	(163,58,'en','To show the tree'),
	(164,59,'ru','Спрятать дерево'),
	(165,59,'uk','Сховати дерево'),
	(166,59,'en','To hide a tree'),
	(167,60,'ru','Шаблон'),
	(168,60,'uk','Шаблон'),
	(169,60,'en','Template'),
	(170,61,'ru','Активный'),
	(171,61,'uk','Активний'),
	(172,61,'en','Active'),
	(173,62,'ru','Предпросмотр'),
	(174,62,'uk','Попередній перегляд'),
	(175,62,'en','Preview'),
	(176,63,'ru','ДА'),
	(177,63,'uk','ТАК'),
	(178,63,'en','YES'),
	(179,64,'ru','НЕТ'),
	(180,64,'uk','НI'),
	(181,64,'en','NO'),
	(182,65,'ru','Выберите шаблон'),
	(183,65,'uk','Виберіть шаблон'),
	(184,65,'en','Select the template'),
	(185,66,'ru','Общая'),
	(186,66,'uk','Загальна'),
	(187,66,'en','Common'),
	(188,67,'ru','Текст'),
	(189,67,'uk','Текст'),
	(190,67,'en','The text'),
	(191,68,'ru','Выберите изображение для загрузки'),
	(192,68,'uk','Виберіть зображення для завантаження'),
	(193,68,'en','Select the image to load'),
	(194,69,'ru','Нет изображений'),
	(195,69,'uk','Немає зображень'),
	(196,69,'en','No images'),
	(197,70,'ru','Выбрать'),
	(198,70,'uk','Вибрати'),
	(199,70,'en','Choose'),
	(200,71,'ru','Нет изображения'),
	(201,71,'uk','Немає зображення'),
	(202,71,'en','No picture'),
	(203,72,'ru','Код(для вставки)'),
	(204,72,'uk','Код (для вставки)'),
	(205,72,'en','Code(to paste)'),
	(206,73,'ru','Большой текст'),
	(207,73,'uk','Великий текст'),
	(208,73,'en','Large text'),
	(209,74,'ru','Большой текст с редактором'),
	(210,74,'uk','Великий текст з редактором'),
	(211,74,'en','Great text editor'),
	(212,75,'ru','Список'),
	(213,75,'uk','Список'),
	(214,75,'en','List'),
	(215,76,'ru','Двойной список'),
	(216,76,'uk','Подвійний список'),
	(217,76,'en','Double list'),
	(218,77,'ru','Тройной список'),
	(219,77,'uk','Потрійний список'),
	(220,77,'en','Triple list'),
	(221,78,'ru','Файл'),
	(222,78,'uk','Файл'),
	(223,78,'en','File'),
	(224,79,'ru','Шаблоны писем'),
	(225,79,'uk','Шаблони листів'),
	(226,79,'en','Email templates'),
	(227,80,'ru','Тема письма'),
	(228,80,'uk','Тема листа'),
	(229,80,'en','Subject'),
	(230,81,'ru','Пусто'),
	(231,81,'uk','Порожньо'),
	(232,81,'en','Empty'),
	(233,82,'ru','Тело письма'),
	(234,82,'uk','Тіло листа'),
	(235,82,'en','The body of the email'),
	(236,83,'ru','Загрузка...'),
	(237,83,'uk','Завантаження...'),
	(238,83,'en','Loading...'),
	(239,84,'ru','Выберите время'),
	(240,84,'uk','Виберіть час'),
	(241,84,'en','Select the time'),
	(242,85,'ru','Время'),
	(243,85,'uk','Час'),
	(244,85,'en','Time'),
	(245,86,'ru','Часы'),
	(246,86,'uk','Години'),
	(247,86,'en','Hours'),
	(248,87,'ru','Минуты'),
	(249,87,'uk','Хвилини'),
	(250,87,'en','Minutes'),
	(251,88,'ru','Секунды'),
	(252,88,'uk','Секунди'),
	(253,88,'en','Seconds'),
	(254,89,'ru','Миллисекунды'),
	(255,89,'uk','Мілісекунди'),
	(256,89,'en','Milliseconds'),
	(257,90,'ru','Часовой пояс'),
	(258,90,'uk','Часовий пояс'),
	(259,90,'en','Time zone'),
	(260,91,'ru','Сейчас'),
	(261,91,'uk','Зараз'),
	(262,91,'en','Now'),
	(263,92,'ru','Закрыть'),
	(264,92,'uk','Закрити'),
	(265,92,'en','Close'),
	(266,93,'ru','Баннера'),
	(267,93,'uk','Банера'),
	(268,93,'en','Banners'),
	(269,94,'ru','Баннерные площадки'),
	(270,94,'uk','Банерні майданчики'),
	(271,94,'en','Banners area'),
	(272,95,'ru','Площадка'),
	(273,95,'uk','Майданчик'),
	(274,95,'en','Area'),
	(275,96,'ru','Кол.показов'),
	(276,96,'uk','Кількість.показів'),
	(277,96,'en','Count showing'),
	(278,97,'ru','Кол.кликов'),
	(279,97,'uk','Кіл.кліків'),
	(280,97,'en','Count clicks'),
	(281,98,'ru','Статус'),
	(282,98,'uk','Статус'),
	(283,98,'en','Status'),
	(284,99,'ru','Начало показа'),
	(285,99,'uk','Початок показу'),
	(286,99,'en','Beginning of the show'),
	(287,100,'ru','Конец показа'),
	(288,100,'uk','Кінець показу'),
	(289,100,'en','End of the show'),
	(290,101,'ru','Всегда показывать'),
	(291,101,'uk','Завжди показувати'),
	(292,101,'en','Always show'),
	(293,102,'ru','Баннерная площадка'),
	(294,102,'uk','Банерна майданчик'),
	(295,102,'en','Banner area'),
	(296,103,'ru','Ссылка'),
	(297,103,'uk','Посилання'),
	(298,103,'en','Link'),
	(299,104,'ru','Файл для показа'),
	(300,104,'uk','Файл'),
	(301,104,'en','File'),
	(302,105,'ru','Выбрать файл (jpg, gif, png или swf)'),
	(303,105,'uk','Вибрати файл (jpg, gif, png або swf)'),
	(304,105,'en','To select a file (jpg, gif, png or swf)'),
	(305,106,'ru','Показывать всегда'),
	(306,106,'uk','Завжди показувати'),
	(307,106,'en','Show always'),
	(308,107,'ru','Открывать в новом окне'),
	(309,107,'uk','Відкрити у новому вікні'),
	(310,107,'en','To open in a new window'),
	(311,108,'ru','Короткий текст'),
	(312,108,'uk','Короткий текст'),
	(313,108,'en','Short text'),
	(314,109,'ru','Изображение'),
	(315,109,'uk','Зображення'),
	(316,109,'en','Image'),
	(317,110,'ru','Дополнительные изображение'),
	(318,110,'uk','Додаткові зображення'),
	(319,110,'en','Additional image'),
	(320,111,'ru','Описание'),
	(321,111,'uk','Опис'),
	(322,111,'en','Description'),
	(323,112,'ru','Письма'),
	(324,112,'uk','Листи'),
	(325,112,'en','Mails'),
	(326,113,'ru','Кому'),
	(327,113,'uk','Кому'),
	(328,113,'en','Sent to'),
	(329,114,'ru','Дата отправки'),
	(330,114,'uk','Дата відправки'),
	(331,114,'en','Date sent'),
	(332,115,'ru','Просмотреть'),
	(333,115,'uk','Переглянути'),
	(334,115,'en','Show'),
	(335,116,'ru','Письмо'),
	(336,116,'uk','Лист'),
	(337,116,'en','Mail'),
	(338,117,'ru','Если включен тестовый режим, то письма не будут уходить, а будут складываться в лог файл'),
	(339,117,'uk','Якщо ввімкнути тестовий режим, то листи не будуть іти, а будуть складатися в лог файл'),
	(340,117,'en','If you enable test mode, then mails will not leave, and will be stored in the log file'),
	(341,118,'ru','Настройки почты'),
	(342,118,'uk','Налаштування пошти'),
	(343,118,'en','Mail settings'),
	(344,119,'ru','Драйвер'),
	(345,119,'uk','Драйвер'),
	(346,119,'en','Driver'),
	(347,120,'ru','Обратный адрес в письме'),
	(348,120,'uk','Зворотна адреса у листі'),
	(349,120,'en','The return address in the letter'),
	(350,121,'ru','Имя отправителя'),
	(351,121,'uk','Імя відправника'),
	(352,121,'en','The name of the sender'),
	(353,122,'ru','Тестовый режим'),
	(354,122,'uk','Тестовий режим'),
	(355,122,'en','Test mode'),
	(356,123,'ru','Почта'),
	(357,123,'uk','Пошта'),
	(358,123,'en','Mails'),
	(359,124,'ru','Настройки почты обновлены'),
	(360,124,'uk','Налаштування пошти оновлено'),
	(361,124,'en','Mail settings updated'),
	(362,125,'ru','Выход'),
	(363,125,'uk','Вихід'),
	(364,125,'en','Exit'),
	(365,126,'ru','Группы пользователей'),
	(366,126,'uk','Групи користувачів'),
	(367,126,'en','User group'),
	(368,127,'ru','Имя'),
	(369,127,'uk','Імя'),
	(370,127,'en','Name'),
	(371,128,'ru','Фамилия'),
	(372,128,'uk','Прізвище'),
	(373,128,'en','Surname'),
	(374,129,'ru','Дата последнего входа'),
	(375,129,'uk','Дата останнього входу'),
	(376,129,'en','Date of last login'),
	(377,130,'ru','Дата регистрации'),
	(378,130,'uk','Дата реєстрації'),
	(379,130,'en','Registration date'),
	(380,131,'ru','Активен'),
	(381,131,'uk','Активний'),
	(382,131,'en','Active'),
	(383,132,'ru','Поиск'),
	(384,132,'uk','Пошук'),
	(385,132,'en','Search'),
	(386,133,'ru','Права'),
	(387,133,'uk','Права'),
	(388,133,'en','Right'),
	(389,134,'ru','Профайл'),
	(390,134,'uk','Профайл'),
	(391,134,'en','Profile'),
	(392,135,'ru','Загрузить'),
	(393,135,'uk','Завантажити'),
	(394,135,'en','Download'),
	(395,136,'ru','Подписан на рассылку'),
	(396,136,'uk','Підписаний на розсилку'),
	(397,136,'en','Signed up for the newsletter'),
	(398,137,'ru','Группы пользователя'),
	(399,137,'uk','Групи'),
	(400,137,'en','User group'),
	(401,138,'ru','Разрешить'),
	(402,138,'uk','Дозволити1'),
	(403,138,'en','Allow'),
	(404,139,'ru','Запретить'),
	(405,139,'uk','Заборонити'),
	(406,139,'en','Prohibit'),
	(407,140,'ru','Наследовать'),
	(408,140,'uk','Успадковувати'),
	(409,140,'en','Inherit'),
	(410,141,'ru','Эту операцию нельзя будет отменить.'),
	(411,141,'uk','Цю операцію не можна буде скасувати.'),
	(412,141,'en','This operation cannot be undone.'),
	(413,142,'ru','Поле удалено успешно'),
	(414,142,'uk','Поле видалено успішно'),
	(415,142,'en','Field deleted successfully'),
	(416,143,'ru','Что-то пошло не так, попробуйте позже'),
	(417,143,'uk','Щось пішло не так, спробуйте пізніше'),
	(418,143,'en','Something went wrong, try again later'),
	(419,144,'ru','Сохранено'),
	(420,144,'uk','Збережено1'),
	(421,144,'en','Saved'),
	(422,145,'ru','Новоя запись добавлена'),
	(423,145,'uk','Новоя запис додано'),
	(424,145,'en','New entry added'),
	(425,146,'ru','Ошибка при загрузке изображения'),
	(426,146,'uk','Помилка при завантаженні зображення'),
	(427,146,'en','Error loading image'),
	(428,147,'ru','Ошибка при загрузке файла'),
	(429,147,'uk','Помилка при завантаженні файлу'),
	(430,147,'en','Error loading file'),
	(431,148,'ru','Порядок следования изменен1'),
	(432,148,'uk','Порядок змінено1'),
	(433,148,'en','The order changed'),
	(434,149,'ru','Последние 5 заказов1'),
	(435,149,'uk','qweqwewe'),
	(436,149,'en','qweqwewe'),
	(440,149,'ru','test'),
	(441,149,'uk','te'),
	(442,149,'en','te'),
	(443,149,'ru','Последние 5 заказов'),
	(444,149,'uk','Останні 5 замовлень'),
	(445,149,'en','The last 5 orders'),
	(449,151,'ru','Русский111'),
	(450,151,'uk','Російська22233'),
	(451,151,'en','Russian11111133'),
	(452,152,'ru','Русский1'),
	(453,152,'uk','Русский1'),
	(454,152,'en','Русский1'),
	(461,166,'ru','Переводы CMS'),
	(462,166,'uk','Переклади CMS'),
	(463,166,'en','The translation of CMS'),
	(464,167,'ru','Переклади CMS'),
	(465,167,'uk','Переклади CMS'),
	(466,167,'en','Perekladi CMS'),
	(467,168,'ru','Статьи'),
	(468,168,'uk','Статті'),
	(469,168,'en','Article'),
	(470,169,'ru','Управление'),
	(471,169,'uk','Управління'),
	(472,169,'en','Management'),
	(473,170,'ru','Контроль изменений'),
	(474,170,'uk','Контроль змін'),
	(475,170,'en','Change control'),
	(476,171,'ru','Обрезать изображение'),
	(477,171,'uk','Обрізати зображення'),
	(478,171,'en','Crop the image'),
	(479,172,'ru','The translation of CMS'),
	(480,172,'uk','The translation of CMS'),
	(481,172,'en','The translation of CMS'),
	(482,173,'ru','SEO'),
	(483,173,'uk','SEO'),
	(484,173,'en','SEO'),
	(485,174,'ru','Безопасность'),
	(486,174,'uk','Безпека'),
	(487,174,'en','Security'),
	(488,175,'ru','Цены'),
	(489,175,'uk','Ціни'),
	(490,175,'en','Prices'),
	(491,176,'ru','Код для вставки'),
	(492,176,'uk','Код для вставки'),
	(493,176,'en','Embed code'),
	(494,177,'ru','Текстовое поле'),
	(495,177,'uk','Текстове поле'),
	(496,177,'en','Text box'),
	(497,178,'ru','Вкл/Выкл'),
	(498,178,'uk','Вкл/Викл'),
	(499,178,'en','On/Off'),
	(500,179,'ru','Общее'),
	(501,179,'uk','Общее'),
	(502,179,'en','Общее'),
	(503,180,'ru','Заголовок'),
	(504,180,'uk','Заголовок'),
	(505,180,'en','Заголовок'),
	(506,181,'ru','Url'),
	(507,181,'uk','Url'),
	(508,181,'en','Url'),
	(509,182,'ru','Картинка'),
	(510,182,'uk','Картинка'),
	(511,182,'en','Картинка'),
	(512,183,'ru','Выбрать из загруженных'),
	(513,183,'uk','Выбрать из загруженных'),
	(514,183,'en','Выбрать из загруженных'),
	(515,184,'ru','Выберите изображения'),
	(516,184,'uk','Выберите изображения'),
	(517,184,'en','Выберите изображения'),
	(518,185,'ru','Дополнительные картинки'),
	(519,185,'uk','Дополнительные картинки'),
	(520,185,'en','Дополнительные картинки'),
	(521,186,'ru','Активно'),
	(522,186,'uk','Активно'),
	(523,186,'en','Активно'),
	(524,187,'ru','Seo title'),
	(525,187,'uk','Seo title'),
	(526,187,'en','Seo title'),
	(527,188,'ru','Seo description'),
	(528,188,'uk','Seo description'),
	(529,188,'en','Seo description'),
	(530,189,'ru','#'),
	(531,189,'uk','#'),
	(532,189,'en','#'),
	(533,190,'ru','Редактироварь'),
	(534,190,'uk','Редактироварь'),
	(535,190,'en','Редактироварь'),
	(536,191,'ru','20'),
	(537,191,'uk','20'),
	(538,191,'en','20'),
	(539,192,'ru','100'),
	(540,192,'uk','100'),
	(541,192,'en','100'),
	(542,193,'ru','1000'),
	(543,193,'uk','1000'),
	(544,193,'en','1000'),
	(545,194,'ru','Права доступа'),
	(546,194,'uk','Права доступа'),
	(547,194,'en','Права доступа'),
	(548,195,'ru','Дооступ в cms'),
	(549,195,'uk','Дооступ в cms'),
	(550,195,'en','Дооступ в cms'),
	(551,196,'ru','Да'),
	(552,196,'uk','Да'),
	(553,196,'en','Да'),
	(554,197,'ru','Просмотр'),
	(555,197,'uk','Просмотр'),
	(556,197,'en','Просмотр'),
	(557,198,'ru','Слова'),
	(558,198,'uk','Слова'),
	(559,198,'en','Слова'),
	(560,199,'ru','Картинки111'),
	(561,199,'uk','Картинки111'),
	(562,199,'en','Картинки111'),
	(563,200,'ru','Checkbox'),
	(564,200,'uk','Checkbox'),
	(565,200,'en','Checkbox'),
	(566,201,'ru','Datetime'),
	(567,201,'uk','Datetime'),
	(568,201,'en','Datetime'),
	(569,202,'ru','Дерево'),
	(570,202,'uk','Дерево'),
	(571,202,'en','Дерево'),
	(572,203,'ru','Нет'),
	(573,203,'uk','Нет'),
	(574,203,'en','Нет'),
	(575,204,'ru','Пока пусто'),
	(576,204,'uk','Пока пусто'),
	(577,204,'en','Пока пусто'),
	(578,205,'ru','Файл mp3'),
	(579,205,'uk','Файл mp3'),
	(580,205,'en','Файл mp3'),
	(581,206,'ru','создание'),
	(582,206,'uk','создание'),
	(583,206,'en','создание'),
	(584,207,'ru','ua'),
	(585,207,'uk','ua'),
	(586,207,'en','ua'),
	(587,208,'ru','ru'),
	(588,208,'uk','ru'),
	(589,208,'en','ru'),
	(590,209,'ru','en'),
	(591,209,'uk','en'),
	(592,209,'en','en'),
	(593,210,'ru','Выберите файл для загрузки'),
	(594,210,'uk','Выберите файл для загрузки'),
	(595,210,'en','Выберите файл для загрузки'),
	(596,211,'ru','Выберите файлы'),
	(597,211,'uk','Выберите файлы'),
	(598,211,'en','Выберите файлы'),
	(599,212,'ru','Размер'),
	(600,212,'uk','Размер'),
	(601,212,'en','Размер'),
	(602,213,'ru','Дата'),
	(603,213,'uk','Дата'),
	(604,213,'en','Дата'),
	(605,214,'ru','Клонировтаь'),
	(606,214,'uk','Клонировтаь'),
	(607,214,'en','Клонировтаь'),
	(608,215,'ru','Файл mp3 (рус)'),
	(609,215,'uk','Файл mp3 (рус)'),
	(610,215,'en','Файл mp3 (рус)'),
	(611,216,'ru','Файл mp3 (en)'),
	(612,216,'uk','Файл mp3 (en)'),
	(613,216,'en','Файл mp3 (en)'),
	(614,217,'ru','Язык'),
	(615,217,'uk','Язык'),
	(616,217,'en','Язык'),
	(617,218,'ru','Автора'),
	(618,218,'uk','Автора'),
	(619,218,'en','Автора'),
	(620,219,'ru','Autor'),
	(621,219,'uk','Autor'),
	(622,219,'en','Autor'),
	(623,220,'ru','ФИО'),
	(624,220,'uk','ФИО'),
	(625,220,'en','ФИО'),
	(626,221,'ru','Фото'),
	(627,221,'uk','Фото'),
	(628,221,'en','Фото'),
	(629,222,'ru','Email'),
	(630,222,'uk','Email'),
	(631,222,'en','Email'),
	(632,223,'ru','Авторы'),
	(633,223,'uk','Авторы'),
	(634,223,'en','Авторы'),
	(635,224,'ru','Автор'),
	(636,224,'uk','Автор'),
	(637,224,'en','Автор'),
	(638,225,'ru','Скачать'),
	(639,225,'uk','Скачать'),
	(640,225,'en','Скачать'),
	(641,226,'ru','Загрузка..'),
	(642,226,'uk','Загрузка..'),
	(643,226,'en','Загрузка..'),
	(644,227,'ru','Описания'),
	(645,227,'uk','Описания'),
	(646,227,'en','Описания'),
	(647,228,'ru','User'),
	(648,228,'uk','User'),
	(649,228,'en','User'),
	(650,229,'ru','Экспорт'),
	(651,229,'uk','Экспорт'),
	(652,229,'en','Экспорт'),
	(653,230,'ru','tt'),
	(654,230,'uk','tt'),
	(655,230,'en','tt'),
	(656,231,'ru','Импорт'),
	(657,231,'uk','Импорт'),
	(658,231,'en','Импорт'),
	(659,232,'ru','Выбрать файл'),
	(660,232,'uk','Выбрать файл'),
	(661,232,'en','Выбрать файл'),
	(662,233,'ru','Версии'),
	(663,233,'uk','Версии'),
	(664,233,'en','Версии'),
	(665,234,'ru','ИМя'),
	(666,234,'uk','ИМя'),
	(667,234,'en','ИМя'),
	(668,235,'ru','test'),
	(669,235,'uk','test'),
	(670,236,'ru','test'),
	(671,236,'uk','test'),
	(672,236,'en','test'),
	(673,235,'en','test');

/*!40000 ALTER TABLE `translations_cms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table translations_phrases
# ------------------------------------------------------------

DROP TABLE IF EXISTS `translations_phrases`;

CREATE TABLE `translations_phrases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `phrase` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `translations_phrases` WRITE;
/*!40000 ALTER TABLE `translations_phrases` DISABLE KEYS */;

INSERT INTO `translations_phrases` (`id`, `phrase`)
VALUES
	(1,X'D0BFD0BED0B4D0B5D0BBD0B8D182D18CD181D18F20D0B8D181D182D0BED180D0B8D0B5D0B9'),
	(5,X'D18FD0BA20D181D0BFD180D0B0D0B2D0B8');

/*!40000 ALTER TABLE `translations_phrases` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table translations_phrases_cms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `translations_phrases_cms`;

CREATE TABLE `translations_phrases_cms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `phrase` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `translations_phrases_cms` WRITE;
/*!40000 ALTER TABLE `translations_phrases_cms` DISABLE KEYS */;

INSERT INTO `translations_phrases_cms` (`id`, `phrase`)
VALUES
	(8,'Фраза'),
	(9,'Код'),
	(10,'Переводы'),
	(11,'Добавить'),
	(12,'Удалить'),
	(13,'Каталог пустой'),
	(14,'Показано'),
	(15,'записей'),
	(16,'из'),
	(17,'Главная'),
	(19,'О нас'),
	(20,'Переменые'),
	(21,'Настройки'),
	(22,'Пресса'),
	(23,'Структура сайта'),
	(24,'Кейсы'),
	(25,'Команда'),
	(26,'Упр. пользователями'),
	(27,'Пользователи'),
	(28,'Группы'),
	(29,'Показывать по'),
	(30,'Все'),
	(31,'Административная часть сайта'),
	(32,'Служба поддержки'),
	(33,'Войти'),
	(34,'Эл.почта'),
	(35,'Пароль'),
	(36,'Запомнить меня'),
	(37,'Введите адрес эл.почты'),
	(38,'Введите валидный адрес эл.почты'),
	(39,'Введите пароль'),
	(40,'Пользователь не найден'),
	(41,'Создать'),
	(42,'Тип'),
	(43,'Группа'),
	(44,'Значение'),
	(45,'Редактировать'),
	(46,'Редактирование'),
	(47,'Название'),
	(48,'Клонировать'),
	(49,'Дата создания'),
	(50,'Статья активна'),
	(51,'Общие'),
	(52,'Телефоны'),
	(54,'Новости'),
	(55,'Создание'),
	(56,'Отмена'),
	(57,'Сохранить'),
	(58,'Показать дерево'),
	(59,'Спрятать дерево'),
	(60,'Шаблон'),
	(61,'Активный'),
	(62,'Предпросмотр'),
	(63,'ДА'),
	(64,'НЕТ'),
	(65,'Выберите шаблон'),
	(66,'Общая'),
	(67,'Текст'),
	(68,'Выберите изображение для загрузки'),
	(69,'Нет изображений'),
	(70,'Выбрать'),
	(71,'Нет изображения'),
	(72,'Код(для вставки)'),
	(73,'Большой текст'),
	(74,'Большой текст с редактором'),
	(75,'Список'),
	(76,'Двойной список'),
	(77,'Тройной список'),
	(78,'Файл'),
	(79,'Шаблоны писем'),
	(80,'Тема письма'),
	(81,'Пусто'),
	(82,'Тело письма'),
	(83,'Загрузка...'),
	(84,'Выберите время'),
	(85,'Время'),
	(86,'Часы'),
	(87,'Минуты'),
	(88,'Секунды'),
	(89,'Миллисекунды'),
	(90,'Часовой пояс'),
	(91,'Сейчас'),
	(92,'Закрыть'),
	(93,'Баннера'),
	(94,'Баннерные площадки'),
	(95,'Площадка'),
	(96,'Кол.показов'),
	(97,'Кол.кликов'),
	(98,'Статус'),
	(99,'Начало показа'),
	(100,'Конец показа'),
	(101,'Всегда показывать'),
	(102,'Баннерная площадка'),
	(103,'Ссылка'),
	(104,'Файл для показа'),
	(105,'Выбрать файл (jpg, gif, png или swf)'),
	(106,'Показывать всегда'),
	(107,'Открывать в новом окне'),
	(108,'Короткий текст'),
	(109,'Изображение'),
	(110,'Дополнительные изображение'),
	(111,'Описание'),
	(112,'Письма'),
	(113,'Кому'),
	(114,'Дата отправки'),
	(115,'Просмотреть'),
	(116,'Письмо'),
	(117,'Если включен тестовый режим, то письма не будут уходить, а будут складываться в лог файл'),
	(118,'Настройки почты'),
	(119,'Драйвер'),
	(120,'Обратный адрес в письме'),
	(121,'Имя отправителя'),
	(122,'Тестовый режим'),
	(123,'Почта'),
	(124,'Настройки почты обновлены'),
	(125,'Выход'),
	(126,'Группы пользователей'),
	(127,'Имя'),
	(128,'Фамилия'),
	(129,'Дата последнего входа'),
	(130,'Дата регистрации'),
	(131,'Активен'),
	(132,'Поиск'),
	(133,'Права'),
	(134,'Профайл'),
	(135,'Загрузить'),
	(136,'Подписан на рассылку'),
	(137,'Группы пользователя'),
	(138,'Разрешить'),
	(139,'Запретить'),
	(140,'Наследовать'),
	(141,'Эту операцию нельзя будет отменить.'),
	(142,'Поле удалено успешно'),
	(143,'Что-то пошло не так, попробуйте позже'),
	(144,'Сохранено'),
	(145,'Новоя запись добавлена'),
	(146,'Ошибка при загрузке изображения'),
	(147,'Ошибка при загрузке файла'),
	(148,'Порядок следования изменен'),
	(149,'Последние 5 заказов'),
	(151,'Русский'),
	(152,'Русский1'),
	(166,'Переводы CMS'),
	(167,'Переклади CMS'),
	(168,'Статьи'),
	(169,'Управление'),
	(170,'Контроль изменений'),
	(171,'Обрезать изображение'),
	(172,'The translation of CMS'),
	(173,'SEO'),
	(174,'Безопасность'),
	(175,'Цены'),
	(176,'Код для вставки'),
	(177,'Текстовое поле'),
	(178,'Вкл/Выкл'),
	(179,'Общее'),
	(180,'Заголовок'),
	(181,'Url'),
	(182,'Картинка'),
	(183,'Выбрать из загруженных'),
	(184,'Выберите изображения'),
	(185,'Дополнительные картинки'),
	(186,'Активно'),
	(187,'Seo title'),
	(188,'Seo description'),
	(189,'#'),
	(190,'Редактироварь'),
	(191,'20'),
	(192,'100'),
	(193,'1000'),
	(194,'Права доступа'),
	(195,'Дооступ в cms'),
	(196,'Да'),
	(197,'Просмотр'),
	(198,'Слова'),
	(199,'Картинки111'),
	(200,'Checkbox'),
	(201,'Datetime'),
	(202,'Дерево'),
	(203,'Нет'),
	(204,'Пока пусто'),
	(205,'Файл mp3'),
	(206,'создание'),
	(207,'ua'),
	(208,'ru'),
	(209,'en'),
	(210,'Выберите файл для загрузки'),
	(211,'Выберите файлы'),
	(212,'Размер'),
	(213,'Дата'),
	(214,'Клонировтаь'),
	(215,'Файл mp3 (рус)'),
	(216,'Файл mp3 (en)'),
	(217,'Язык'),
	(218,'Автора'),
	(219,'Autor'),
	(220,'ФИО'),
	(221,'Фото'),
	(222,'Email'),
	(223,'Авторы'),
	(224,'Автор'),
	(225,'Скачать'),
	(226,'Загрузка..'),
	(227,'Описания'),
	(228,'User'),
	(229,'Экспорт'),
	(230,'tt'),
	(231,'Импорт'),
	(232,'Выбрать файл'),
	(233,'Версии'),
	(234,'ИМя'),
	(235,'test'),
	(236,'test');

/*!40000 ALTER TABLE `translations_phrases_cms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `permissions` text NOT NULL,
  `last_login` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `email`, `password`, `first_name`, `last_name`, `image`, `permissions`, `last_login`, `created_at`, `updated_at`)
VALUES
	(1,'admin@vis-design.com','$2y$10$vgjJK293Fkdn4nl6zYCdAevdMlgkg00Bq12nTbgjzkKmkRtM3zrrS','admin','admin','','','2024-09-16 19:33:50','2020-09-02 08:52:31','2024-09-16 19:33:50'),
	(2,'denis@vis-design.coma','$2y$10$fxqOFkhzeFrdKxY.0rOTBOYvXsiuJ39wV5UDqf9cJP6ZpNdWHKn9u','','asd','','','0000-00-00 00:00:00','2020-09-07 10:23:58','2020-10-13 15:55:58'),
	(3,'adm1111in@vis-design.com','$2y$10$P18GIxTrvmklDntXUxR1augIuIAhqyaUrViQuHGFsVAmR3P2Elygu','','asdasdasd','','','0000-00-00 00:00:00','2020-10-13 15:58:26','2020-10-15 07:44:03'),
	(4,'admin123123@vis-design.com','$2y$10$jOT5D9JffkNMoDW.6PSt9uM8avSdZrdrtaab/MHsQCRJa79tt8bD2','123123','123123','','','0000-00-00 00:00:00','2020-10-28 11:45:48','2024-09-16 19:32:02');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vis_documents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vis_documents`;

CREATE TABLE `vis_documents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `file_folder` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_source` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table vis_galleries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vis_galleries`;

CREATE TABLE `vis_galleries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table vis_images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vis_images`;

CREATE TABLE `vis_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `file_folder` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_source` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_cms_preview` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exif_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `date_time_source` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `vis_images` WRITE;
/*!40000 ALTER TABLE `vis_images` DISABLE KEYS */;

INSERT INTO `vis_images` (`id`, `file_folder`, `file_source`, `file_cms_preview`, `title`, `slug`, `exif_data`, `is_active`, `date_time_source`, `created_at`, `updated_at`)
VALUES
	(1,'/storage/editor/fotos/','658c70d1ec2cf8dcd7c80a3a65541b50_1605801022.png','200x200/658c70d1ec2cf8dcd7c80a3a65541b50_1605801022.png','','','',1,'2020-11-19 17:50:22','2020-11-19 15:50:22','2020-11-19 15:50:22'),
	(2,'/storage/editor/fotos/','cb18550095ec15b93e355569dd25df86_1605801493.png','200x200/cb18550095ec15b93e355569dd25df86_1605801493.png','','-1','',1,'2020-11-19 17:58:13','2020-11-19 15:58:13','2020-11-19 15:58:13');

/*!40000 ALTER TABLE `vis_images` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vis_images2galleries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vis_images2galleries`;

CREATE TABLE `vis_images2galleries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_image` int unsigned NOT NULL,
  `id_gallery` int unsigned NOT NULL,
  `is_preview` tinyint NOT NULL,
  `priority` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vis_images2galleries_id_image_foreign` (`id_image`),
  KEY `vis_images2galleries_id_gallery_foreign` (`id_gallery`),
  CONSTRAINT `vis_images2galleries_id_gallery_foreign` FOREIGN KEY (`id_gallery`) REFERENCES `vis_galleries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vis_images2galleries_id_image_foreign` FOREIGN KEY (`id_image`) REFERENCES `vis_images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table vis_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vis_tags`;

CREATE TABLE `vis_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table vis_tags2entities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vis_tags2entities`;

CREATE TABLE `vis_tags2entities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_tag` int unsigned NOT NULL,
  `id_entity` int unsigned NOT NULL,
  `entity_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vis_tags2entities_id_tag_foreign` (`id_tag`),
  CONSTRAINT `vis_tags2entities_id_tag_foreign` FOREIGN KEY (`id_tag`) REFERENCES `vis_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table vis_video_galleries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vis_video_galleries`;

CREATE TABLE `vis_video_galleries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table vis_videos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vis_videos`;

CREATE TABLE `vis_videos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_preview` int unsigned DEFAULT NULL,
  `api_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_provider` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vis_videos_id_preview_foreign` (`id_preview`),
  CONSTRAINT `vis_videos_id_preview_foreign` FOREIGN KEY (`id_preview`) REFERENCES `vis_images` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table vis_videos2video_galleries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vis_videos2video_galleries`;

CREATE TABLE `vis_videos2video_galleries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_video` int unsigned NOT NULL,
  `id_video_gallery` int unsigned NOT NULL,
  `is_preview` tinyint NOT NULL,
  `priority` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vis_videos2video_galleries_id_video_foreign` (`id_video`),
  KEY `vis_videos2video_galleries_id_video_gallery_foreign` (`id_video_gallery`),
  CONSTRAINT `vis_videos2video_galleries_id_video_foreign` FOREIGN KEY (`id_video`) REFERENCES `vis_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vis_videos2video_galleries_id_video_gallery_foreign` FOREIGN KEY (`id_video_gallery`) REFERENCES `vis_video_galleries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table words
# ------------------------------------------------------------

DROP TABLE IF EXISTS `words`;

CREATE TABLE `words` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ru` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_ru` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sound` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sound_ru` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sound_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_id` int unsigned DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_ru` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `words_author_id_index` (`author_id`),
  CONSTRAINT `words_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `words` WRITE;
/*!40000 ALTER TABLE `words` DISABLE KEYS */;

INSERT INTO `words` (`id`, `title`, `title_ru`, `title_en`, `description`, `description_ru`, `description_en`, `sound`, `sound_ru`, `sound_en`, `is_active`, `created_at`, `updated_at`, `author_id`, `link`, `link_ru`, `link_en`)
VALUES
	(3,'11asdasdasdaaaaa1111111','asdasdasdaaaaa','asdasdasdaaaaa','<p>333311122221111311333322221111111Дз22222dddddвінки по Україні – 0,60 грн/хв</p><p>Дзвінки за кордон в <a href=\"/rates/prepay/supernet-start#countries_30\">30 країн</a><span>&nbsp;</span>– 10 грн за кожні 10 хв (10 пакетів на добу)</p><p>Для безлімітних дзвінків на 3 номери абонентів Польщі (T-Mobile/Heyah), Росії (МТС, Beeline) замовте послугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_blank\">«Безліміт за кордон»</a></p><p>SMS по Україні (на всі мобільні мережі) – якщо ви використали 50 за день, вартість – 0,60 грн/шт. Вам будуть доступні нові 50 SMS за 1,50 грн/день вже на наступний день.</p><p>SMS за кордон – 2 грн/шт.</p>','<p>Звонки по Украине - 0,60 грн/мин</p><p>Звонки за границу в <a href=\"/rates/prepay/supernet-start#countries_30\">&nbsp;30 стран&nbsp;</a>\n<span>&nbsp;</span> - 10 грн за каждые 10 мин (10 пакетов в сутки)</p><p>Для безлимитных звонков на 3 номера абонентов Польши (T-Mobile/Heyah), России (МТС, Beeline) закажите услугу <a href=\"/za-kordon/calls-abroad/poslugi/bezlimit-za-kordon/peredplata\" rel=\"noopener noreferrer\" target=\"_ blank\">&nbsp;«Безлимит за границу»&nbsp;</a></p><p>SMS по Украине (на все мобильные сети) - если вы использовали 50 за день, стоимость - 0,60 грн/шт. Вам будут доступны новые 50 SMS за 1,50 грн/день уже на следующий день.</p><p>SMS за границу - 2 грн/шт.</p>','<p>Calls within Ukraine - 0.60 UAH/min</p><p>Calls abroad to <a href=\"/rates/prepay/supernet-start#countries_30\">&nbsp;30 countries&nbsp;</a>\n<span>&nbsp;</span> - UAH 10 for every 10 minutes (10 packages per day)</p><p>For unlimited calls to 3 numbers of subscribers of Poland (T-Mobile/Heyah), Russia (MTS, Beeline) order the service <a href=\"/for-cordon/calls-abroad/services/unlimited-for-cordon/prepayment\" rel=\"noopener noreferrer\" target=\"_ blank\">&nbsp;\"Unlimited abroad\"&nbsp;</a></p><p>SMS in Ukraine (for all mobile networks) - if you used 50 per day, the cost is 0.60 UAH/piece. You will have access to 50 new SMS for UAH 1.50/day the next day.</p><p>SMS abroad - UAH 2/piece</p>','/storage/editor/fotos/cb18550095ec15b93e355569dd25df86_1605801493.png','/storage/editor/fotos/cb18550095ec15b93e355569dd25df86_1605801493.png','/storage/editor/fotos/658c70d1ec2cf8dcd7c80a3a65541b50_1605801022.png',0,'2020-10-09 13:08:51','2020-11-19 15:58:26',1,'asdasdasdaaaaa','',''),
	(4,'sssdd','sssdd','sssdd','','','','','','',0,'2020-10-13 08:49:05','2020-10-13 08:49:05',1,'sssdd','',''),
	(5,'ыыыы','ыыыы','yyyy','','','','','','',0,'2020-10-13 09:02:58','2020-10-13 09:02:58',1,'yyyy','',''),
	(6,'asdasdasdaaaaa','asdasdasdaaaaa','asdasdasdaaaaa','','','','','','',0,'2020-10-15 08:28:55','2020-10-15 08:28:55',1,'asdasdasdaaaaa','',''),
	(7,'sdasd','sdasd','sdasd','<p>asdasda</p>','<P> asdasda </p>','<p> asdasda </p>','','','',0,'2020-11-11 08:33:53','2020-11-11 08:33:53',1,'sdasd','',''),
	(8,'sdsds','sdsds','sdsds','<p>22222ssssss11</p>','<p>ssssss</p>','<p>ssssss</p>','','','',0,'2020-11-11 08:41:22','2020-11-11 08:41:42',1,'sdsd','',''),
	(9,'sdasdasda','sdasdasda','sdasdasda','<p>22222222212222111asdasdasdasd</p>','<p>1111asdasdasdasd</p>','<p>1111asdasdasdasd</p>','','','',0,'2020-11-11 08:42:03','2020-11-11 08:42:22',1,'sdasdasd','',''),
	(10,'1111','1111','1111','<p>222221111</p>','<P> 222221111 </p>','<p> 222221111 </p>','','','',0,'2020-11-11 08:42:49','2020-11-11 08:42:49',1,'1111','','');

/*!40000 ALTER TABLE `words` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table words_definition
# ------------------------------------------------------------

DROP TABLE IF EXISTS `words_definition`;

CREATE TABLE `words_definition` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `word_id` int DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `words_definition` WRITE;
/*!40000 ALTER TABLE `words_definition` DISABLE KEYS */;

INSERT INTO `words_definition` (`id`, `title`, `description`, `word_id`, `model`)
VALUES
	(1,'asasas111',NULL,1,NULL),
	(2,'ddddd11',NULL,1,NULL),
	(3,'sdsds',NULL,1,'App\\Models\\Word');

/*!40000 ALTER TABLE `words_definition` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
