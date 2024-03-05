DROP TABLE IF EXISTS `message_groups`;
CREATE TABLE IF NOT EXISTS `message_groups` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_trashed` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `trashed_by_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `message_group_participants`;
CREATE TABLE IF NOT EXISTS `message_group_participants` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message_group_id` int(10) UNSIGNED NOT NULL,
  `unread_messages` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`message_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `message_group_comments`;
CREATE TABLE IF NOT EXISTS `message_group_comments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci,
  `message_group_id` int(10) UNSIGNED DEFAULT NULL,
  `is_trashed` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `trashed_by_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `created_at` (`created_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `message_group_comment_files`;
CREATE TABLE IF NOT EXISTS `message_group_comment_files` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `access_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `message_group_comment_id` int(10) UNSIGNED DEFAULT NULL,
  `can_download` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `file_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `file_repository_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `file_extension` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `file_type_string` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `file_size` int(10) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `is_trashed` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `trashed_by_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_key` (`access_key`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `users` ADD `is_chat_enabled` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' AFTER `is_group_trashed`;

INSERT INTO `configurations` (`id`, `category_name`, `name`, `value`) VALUES (NULL, 'pusher', 'pusher_app_id', '');
INSERT INTO `configurations` (`id`, `category_name`, `name`, `value`) VALUES (NULL, 'pusher', 'pusher_key', '');
INSERT INTO `configurations` (`id`, `category_name`, `name`, `value`) VALUES (NULL, 'pusher', 'pusher_secret', '');
INSERT INTO `configurations` (`id`, `category_name`, `name`, `value`) VALUES (NULL, 'pusher', 'pusher_cluster', 'ap2');
INSERT INTO `configurations` (`id`, `category_name`, `name`, `value`) VALUES (NULL, 'pusher', 'pusher_enable', 'no');
