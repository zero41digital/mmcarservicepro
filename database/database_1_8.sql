-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 20, 2021 at 10:28 PM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_1_7`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
CREATE TABLE IF NOT EXISTS `activity_logs` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `model` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT '0',
  `action` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `raw_data` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `is_private` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `is_hidden` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
CREATE TABLE IF NOT EXISTS `announcements` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL DEFAULT '0000-00-00',
  `end_date` date NOT NULL DEFAULT '0000-00-00',
  `share_with` enum('members','clients','all') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `created_by_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `start_date` (`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
CREATE TABLE IF NOT EXISTS `companies` (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) UNSIGNED DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vat_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_file` varchar(44) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `is_trashed` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `trashed_by_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `created_at` (`created_at`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `configurations`
--

DROP TABLE IF EXISTS `configurations`;
CREATE TABLE IF NOT EXISTS `configurations` (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `configurations`
--

INSERT INTO `configurations` (`id`, `category_name`, `name`, `value`) VALUES
(1, 'mailing', 'smtp_server', 'smtp.mailtrap.io'),
(2, 'mailing', 'smtp_port', '2525'),
(3, 'mailing', 'smtp_authenticate', '1'),
(4, 'mailing', 'smtp_username', ''),
(5, 'mailing', 'smtp_password', ''),
(6, 'mailing', 'smtp_secure_connection', 'no'),
(7, 'mailing', 'smtp_reply_from_email', 'noreply@example.com'),
(8, 'mailing', 'smtp_from_name', 'PROMS'),
(9, 'mailing', 'smtp_from_email', 'support@demo.com'),
(10, 'system', 'site_name', 'PROMS'),
(11, 'system', 'contact_email', 'contact@demo.com'),
(14, 'system', 'default_currency', '$'),
(15, 'system', 'items_per_page', '10'),
(16, 'system', 'calendar_google_api_key', NULL),
(17, 'system', 'calendar_google_event_address', NULL),
(18, 'system', 'paypal_email', 'paypal_sandbox@demo.com'),
(19, 'system', 'paypal_sandbox', 'yes'),
(20, 'system', 'paypal_currency_code', 'USD'),
(21, 'system', 'stripe_secret_key', 'sk_live_lV5nITIlIlzvSZmkfunl5bH3'),
(22, 'system', 'stripe_publishable_key', 'pk_live_ogI79OxdoS6YUGWLkkAVwbC3'),
(23, 'system', 'stripe_currency_code', 'USD'),
(24, 'system', 'offline_bank_name', 'United Bank Limited'),
(25, 'system', 'offline_bank_account', 'NL38ABNA0477066537'),
(26, 'system', 'invoice_color', '#999'),
(27, 'system', 'send_due_date_invoice_reminder_before_days', '10'),
(28, 'system', 'send_due_date_invoice_reminder_after_days', '1'),
(36, 'pusher', 'pusher_app_id', ''),
(37, 'pusher', 'pusher_key', ''),
(38, 'pusher', 'pusher_secret', ''),
(39, 'pusher', 'pusher_cluster', 'ap2'),
(40, 'pusher', 'pusher_enable', 'no'),
(41, 'system', 'default_language', 'english');

-- --------------------------------------------------------

--
-- Table structure for table `estimates`
--

DROP TABLE IF EXISTS `estimates`;
CREATE TABLE IF NOT EXISTS `estimates` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `estimate_no` varchar(100) NOT NULL,
  `client_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `project_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `company_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `due_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tax` varchar(255) NOT NULL,
  `tax_rate` decimal(10,2) NOT NULL,
  `tax2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tax_rate2` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `discount_amount_type` enum('percentage','fixed') CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `private_note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `total_amount` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(11) UNSIGNED NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_key` varchar(40) NOT NULL,
  `is_online_payment_disabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `is_trashed` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `trashed_by_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_items`
--

DROP TABLE IF EXISTS `estimate_items`;
CREATE TABLE IF NOT EXISTS `estimate_items` (
  `u_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `o_key` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `estimate_id` int(11) UNSIGNED NOT NULL,
  `quantity` decimal(10,2) UNSIGNED NOT NULL,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`u_key`),
  KEY `o_key` (`o_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '',
  `description` text,
  `start` datetime DEFAULT '0000-00-00 00:00:00',
  `end` datetime DEFAULT '0000-00-00 00:00:00',
  `classname` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_users`
--

DROP TABLE IF EXISTS `event_users`;
CREATE TABLE IF NOT EXISTS `event_users` (
  `event_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`event_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `global_labels`
--

DROP TABLE IF EXISTS `global_labels`;
CREATE TABLE IF NOT EXISTS `global_labels` (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `bg_color_hex` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `is_active` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `global_labels`
--

INSERT INTO `global_labels` (`id`, `type`, `name`, `bg_color_hex`, `is_default`, `is_active`) VALUES
(1, 'PROJECT', 'NEW', 'FFEB3B', 1, 1),
(2, 'PROJECT', 'CANCELED', 'FF5722', 0, 1),
(3, 'PROJECT', 'INPROGRESS', '8BC34A', 0, 1),
(4, 'PROJECT', 'PAUSED', 'FF5722', 0, 1),
(5, 'TASK', 'NEW', 'F5BA42', 1, 1),
(6, 'TASK', 'CONFIRMED', 'B276D8', 0, 1),
(7, 'TASK', 'DUPLICATE', '31353C', 0, 1),
(8, 'TASK', 'WONT FIX', '7277D5', 0, 1),
(9, 'TASK', 'ASSIGNED', 'D9434E', 0, 1),
(10, 'TASK', 'BLOCKED', 'E3643E', 0, 1),
(11, 'TASK', 'IN PROGRESS', 'A5ADB8', 0, 1),
(12, 'TASK', 'FIXED', 'F59B43', 0, 1),
(13, 'TASK', 'REOPENED', '4B8CDC', 0, 1),
(14, 'TASK', 'VERIFIED', 'B1C252', 0, 1),
(15, 'TICKET', 'NEW', 'FFEB3B', 1, 1),
(16, 'TICKET', 'INPROGRESS', '8BC34A', 0, 1),
(17, 'TICKET', 'PAUSED', 'FF5722', 0, 1),
(19, 'TICKET', 'DONE', 'B276D8', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(100) NOT NULL,
  `reference` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `project_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `company_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `due_after_days` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `issue_date` date NOT NULL DEFAULT '0000-00-00',
  `due_date` date NOT NULL DEFAULT '0000-00-00',
  `tax` varchar(255) NOT NULL,
  `tax_rate` decimal(10,2) NOT NULL,
  `tax2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tax_rate2` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `discount_amount_type` enum('percentage','fixed') CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `private_note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `is_recurring` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `recurring_start_date` date NOT NULL DEFAULT '0000-00-00',
  `recurring_invoice_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `recurring_value` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `recurring_type` enum('days','weeks','months','years') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_of_cycles` int(10) UNSIGNED DEFAULT NULL,
  `no_of_cycles_completed` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `due_reminder_date` date NOT NULL DEFAULT '0000-00-00',
  `recurring_reminder_date` date NOT NULL DEFAULT '0000-00-00',
  `next_recurring_date` date NOT NULL DEFAULT '0000-00-00',
  `total_amount` decimal(10,2) NOT NULL,
  `paid_amount` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(11) UNSIGNED NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_key` varchar(40) NOT NULL,
  `is_online_payment_disabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `is_cancelled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `is_trashed` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `trashed_by_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_key` (`access_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

DROP TABLE IF EXISTS `invoice_items`;
CREATE TABLE IF NOT EXISTS `invoice_items` (
  `u_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `o_key` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `invoice_id` int(11) UNSIGNED NOT NULL,
  `quantity` decimal(10,2) UNSIGNED NOT NULL,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `project_timelog_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`u_key`),
  KEY `o_key` (`o_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_item_project_timelogs`
--

DROP TABLE IF EXISTS `invoice_item_project_timelogs`;
CREATE TABLE IF NOT EXISTS `invoice_item_project_timelogs` (
  `invoice_u_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `project_timelog_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`invoice_u_key`,`project_timelog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ipn_logs`
--

DROP TABLE IF EXISTS `ipn_logs`;
CREATE TABLE IF NOT EXISTS `ipn_logs` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_payment_processed` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
CREATE TABLE IF NOT EXISTS `leads` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `postcode` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `client_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `assigned_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `source_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `is_import_lead` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ip_address` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_open` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leads_sources`
--

DROP TABLE IF EXISTS `leads_sources`;
CREATE TABLE IF NOT EXISTS `leads_sources` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leads_sources`
--

INSERT INTO `leads_sources` (`id`, `name`) VALUES
(1, 'Facebook'),
(2, 'Google');

-- --------------------------------------------------------

--
-- Table structure for table `leads_statuses`
--

DROP TABLE IF EXISTS `leads_statuses`;
CREATE TABLE IF NOT EXISTS `leads_statuses` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leads_statuses`
--

INSERT INTO `leads_statuses` (`id`, `name`) VALUES
(1, 'New'),
(2, 'Updated');

-- --------------------------------------------------------

--
-- Table structure for table `lead_forms`
--

DROP TABLE IF EXISTS `lead_forms`;
CREATE TABLE IF NOT EXISTS `lead_forms` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `assigned_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `default_status_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `default_source_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `is_collect_userinfo` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `access_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_by_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_key` (`access_key`),
  UNIQUE KEY `access_key_2` (`access_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_form_elements`
--

DROP TABLE IF EXISTS `lead_form_elements`;
CREATE TABLE IF NOT EXISTS `lead_form_elements` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `field_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `field_category` int(10) UNSIGNED NOT NULL,
  `field_data` text COLLATE utf8_unicode_ci NOT NULL,
  `is_required` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `help_text` text COLLATE utf8_unicode_ci NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_form_element_values`
--

DROP TABLE IF EXISTS `lead_form_element_values`;
CREATE TABLE IF NOT EXISTS `lead_form_element_values` (
  `element_id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL,
  `element_value` text COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `element_id` (`element_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_groups`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `message_group_comments`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `message_group_comment_files`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `message_group_participants`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `label_id` int(10) UNSIGNED DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `is_featured` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `is_enable_timelog` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `is_timelog_visible` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `start_date` date NOT NULL DEFAULT '0000-00-00',
  `due_date` date NOT NULL DEFAULT '0000-00-00',
  `completed_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `completed_by_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_trashed` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `completed_at` (`completed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_comments`
--

DROP TABLE IF EXISTS `project_comments`;
CREATE TABLE IF NOT EXISTS `project_comments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `parent_type` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `is_private` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `is_trashed` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `trashed_by_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `parent_type` (`parent_type`,`parent_id`) USING BTREE,
  KEY `created_at` (`created_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_companies`
--

DROP TABLE IF EXISTS `project_companies`;
CREATE TABLE IF NOT EXISTS `project_companies` (
  `project_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `company_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_id`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_discussions`
--

DROP TABLE IF EXISTS `project_discussions`;
CREATE TABLE IF NOT EXISTS `project_discussions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `is_private` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `is_sticky` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_trashed` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `trashed_by_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `created_at` (`created_at`),
  KEY `is_sticky` (`is_sticky`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_files`
--

DROP TABLE IF EXISTS `project_files`;
CREATE TABLE IF NOT EXISTS `project_files` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `access_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `parent_type` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `is_private` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
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
  KEY `parent_type` (`parent_type`,`parent_id`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_notes`
--

DROP TABLE IF EXISTS `project_notes`;
CREATE TABLE IF NOT EXISTS `project_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_tasks`
--

DROP TABLE IF EXISTS `project_tasks`;
CREATE TABLE IF NOT EXISTS `project_tasks` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_unicode_ci,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `task_list_id` int(10) UNSIGNED DEFAULT NULL,
  `assignee_id` int(10) UNSIGNED DEFAULT NULL,
  `label_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `start_date` date NOT NULL DEFAULT '0000-00-00',
  `due_date` date NOT NULL DEFAULT '0000-00-00',
  `is_high_priority` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `completed_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `completed_by_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_trashed` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `trashed_by_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `task_list_id` (`task_list_id`),
  KEY `completed_at` (`completed_at`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_task_lists`
--

DROP TABLE IF EXISTS `project_task_lists`;
CREATE TABLE IF NOT EXISTS `project_task_lists` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_private` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `is_high_priority` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `start_date` date DEFAULT '0000-00-00',
  `due_date` date DEFAULT '0000-00-00',
  `created_at` datetime DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `is_trashed` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `trashed_by_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `created_at` (`created_at`),
  KEY `is_high_priority` (`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_timelogs`
--

DROP TABLE IF EXISTS `project_timelogs`;
CREATE TABLE IF NOT EXISTS `project_timelogs` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `memo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `member_id` int(10) UNSIGNED NOT NULL,
  `start_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `total_hours` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `hourly_rate` decimal(10,2) UNSIGNED NOT NULL DEFAULT '10.00',
  `is_approved` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `is_timer` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `is_timer_started` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `is_billable` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_trashed` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `trashed_by_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_users`
--

DROP TABLE IF EXISTS `project_users`;
CREATE TABLE IF NOT EXISTS `project_users` (
  `project_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`project_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `searchable_objects`
--

DROP TABLE IF EXISTS `searchable_objects`;
CREATE TABLE IF NOT EXISTS `searchable_objects` (
  `model` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `object_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `field_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field_content` text COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `is_private` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`model`,`object_id`,`field_name`) USING BTREE,
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `parent_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(44) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`parent_type`,`parent_id`,`user_id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_no` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `label_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `assignee_id` int(10) UNSIGNED DEFAULT NULL,
  `priority` enum('low','medium','high','urget') COLLATE utf8_unicode_ci DEFAULT 'low',
  `is_open` tinyint(1) NOT NULL DEFAULT '1',
  `created_by_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_trashed` tinyint(1) NOT NULL DEFAULT '0',
  `trashed_by_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_key` (`access_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_types`
--

DROP TABLE IF EXISTS `ticket_types`;
CREATE TABLE IF NOT EXISTS `ticket_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_logs`
--

DROP TABLE IF EXISTS `transaction_logs`;
CREATE TABLE IF NOT EXISTS `transaction_logs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  `transaction_type` enum('expense','payment') COLLATE utf8_unicode_ci NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `credit_account_id` int(10) UNSIGNED NOT NULL,
  `debit_account_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `debit_account_id` (`debit_account_id`),
  KEY `credit_account_id` (`credit_account_id`),
  KEY `transaction_type` (`transaction_type`),
  KEY `transaction_reference` (`transaction_type`,`reference_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hourly_rate` decimal(10,2) UNSIGNED NOT NULL DEFAULT '15.00',
  `can_access_invoices_estimates` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8_unicode_ci,
  `avatar_file` varchar(44) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_visit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_activity` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `is_admin` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `is_trashed` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `trashed_by_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `is_group_trashed` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `is_chat_enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `last_visit` (`last_visit`),
  KEY `company_id` (`company_id`),
  KEY `last_login` (`last_login`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_files`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

DROP TABLE IF EXISTS `user_notifications`;
CREATE TABLE IF NOT EXISTS `user_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `is_read` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `is_read` (`is_read`),
  KEY `created_by_id` (`created_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `searchable_objects`
--
ALTER TABLE `searchable_objects` ADD FULLTEXT KEY `field_content` (`field_content`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
