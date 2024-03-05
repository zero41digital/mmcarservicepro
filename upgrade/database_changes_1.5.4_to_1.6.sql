DROP TABLE IF EXISTS `user_files`;
CREATE TABLE IF NOT EXISTS `user_files` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `access_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `file_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `file_repository_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `file_extension` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `file_type_string` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `file_size` int(10) NOT NULL,
  `approved_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `is_trashed` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `trashed_by_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_key` (`access_key`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
