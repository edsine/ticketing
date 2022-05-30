-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 30, 2022 at 02:08 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pglhelpdesk`
--

-- --------------------------------------------------------

--
-- Table structure for table `canned_replies`
--

CREATE TABLE `canned_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shared` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acronym` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `acronym`, `created_at`, `updated_at`) VALUES
(2, 'Pyrich Group Limited', 'PGL', '2022-05-27 16:03:30', '2022-05-27 16:03:30');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `all_agents` tinyint(1) NOT NULL DEFAULT '0',
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `all_agents`, `public`, `created_at`, `updated_at`) VALUES
(1, 'Admin Department', 0, 1, '2022-05-13 10:18:27', '2022-05-13 10:18:27');

-- --------------------------------------------------------

--
-- Table structure for table `email_verifiers`
--

CREATE TABLE `email_verifiers` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `server_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `mime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

CREATE TABLE `labels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `locale`, `name`) VALUES
(1, 'en', 'English');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2020_06_01_000001_create_user_roles_table', 1),
(3, '2020_06_01_000002_create_users_table', 1),
(4, '2020_06_01_000004_create_password_resets_table', 1),
(5, '2020_06_01_000005_create_failed_jobs_table', 1),
(6, '2020_06_01_000006_create_settings_table', 1),
(7, '2020_06_01_000007_create_email_verifiers_table', 1),
(8, '2020_06_01_000008_create_languages_table', 1),
(9, '2020_06_01_000009_create_notifications_table', 1),
(10, '2020_10_16_193905_create_labels_table', 1),
(11, '2020_10_28_180001_create_files_table', 1),
(12, '2020_10_28_180002_create_statuses_table', 1),
(13, '2020_10_28_180003_create_priorities_table', 1),
(14, '2020_10_28_180004_create_departments_table', 1),
(15, '2020_10_28_180005_create_canned_replies_table', 1),
(16, '2020_10_28_185714_create_tickets_table', 1),
(17, '2020_10_28_185745_create_ticket_replies_table', 1),
(18, '2020_10_28_185924_create_ticket_attachments_table', 1),
(19, '2020_10_28_190949_create_ticket_labels_table', 1),
(20, '2020_10_28_191259_create_user_departments_table', 1),
(21, '2020_10_28_194213_add_dashboard_column_to_user_roles_table', 1),
(22, '2022_05_27_153240_create_companies_table', 2),
(23, '2022_05_27_153259_create_projects_table', 2),
(24, '2022_05_30_140918_add_company_id_to_users_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'laradesk_auth_token', '5fe07ab97924c5aaf730b81983b026cd844de14f189c4fa2475abca96075a2f0', '[\"*\"]', '2022-04-25 15:56:41', '2022-04-25 15:55:51', '2022-04-25 15:56:41'),
(2, 'App\\Models\\User', 2, 'laradesk_auth_token', '0f32eb953a7a26e9c0ecc2fa1322126d989e2a7f648e7e83e1175118016d9518', '[\"*\"]', NULL, '2022-04-25 15:56:53', '2022-04-25 15:56:53'),
(3, 'App\\Models\\User', 1, 'laradesk_auth_token', '23338079b94d415d14036ffbf72861c086e54a6ce94f58e2d6104e6b05491e09', '[\"*\"]', '2022-04-25 16:51:13', '2022-04-25 15:57:47', '2022-04-25 16:51:13'),
(4, 'App\\Models\\User', 1, 'laradesk_auth_token', 'fd37a7d34d0838735468f851d77bd03d6c5a237573d7e93ff40020feb47e73d0', '[\"*\"]', '2022-05-13 08:47:36', '2022-05-13 08:47:15', '2022-05-13 08:47:36'),
(5, 'App\\Models\\User', 1, 'laradesk_auth_token', 'b210a60b9fd2c62df8ad658900d8034e73c05d1bf8fb7594626873c2ff8aaa33', '[\"*\"]', '2022-05-13 09:53:09', '2022-05-13 08:48:51', '2022-05-13 09:53:09'),
(15, 'App\\Models\\User', 1, 'pgl_helpdesk_auth_token', 'c4f6c6dc6395cf837c9898b30f2d597b1448b0eaf40ace43f302fb9179f2705f', '[\"*\"]', '2022-05-13 15:30:55', '2022-05-13 15:01:32', '2022-05-13 15:30:55'),
(16, 'App\\Models\\User', 1, 'pgl_helpdesk_auth_token', '962f698e4cb0d6dd11ad0d6104f76953b82deaf4f3a830991c1a7dcf85c8419a', '[\"*\"]', '2022-05-16 13:09:16', '2022-05-16 11:36:37', '2022-05-16 13:09:16'),
(17, 'App\\Models\\User', 1, 'pgl_helpdesk_auth_token', '272d159eedc5ea0d30391322987b11f63b4ed9802a94f344192bc822fb065de2', '[\"*\"]', '2022-05-30 13:46:54', '2022-05-18 15:12:08', '2022-05-30 13:46:54'),
(18, 'App\\Models\\User', 1, 'pgl_helpdesk_auth_token', '2fe511f16eb10daa8ae9519a5a21d83ec24b0ddb7ee939777a47fc3b14010448', '[\"*\"]', '2022-05-30 10:50:51', '2022-05-30 10:11:02', '2022-05-30 10:50:51'),
(19, 'App\\Models\\User', 1, 'pgl_helpdesk_auth_token', 'fd62d4a1825258212088d02e597a0fd7b61cdd1189e1e344e96d7f635f82b214', '[\"*\"]', '2022-05-30 13:27:49', '2022-05-30 10:52:56', '2022-05-30 13:27:49'),
(21, 'App\\Models\\User', 1, 'pgl_helpdesk_auth_token', '8e69b594aaafd16c527ab41ea4d91294cab7772842d442eef217680e35748825', '[\"*\"]', '2022-05-30 14:00:16', '2022-05-30 13:58:46', '2022-05-30 14:00:16');

-- --------------------------------------------------------

--
-- Table structure for table `priorities`
--

CREATE TABLE `priorities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `value` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `priorities`
--

INSERT INTO `priorities` (`id`, `value`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Low', '2022-04-25 15:55:00', '2022-04-25 15:55:00'),
(2, 2, 'Medium', '2022-04-25 15:55:00', '2022-04-25 15:55:00'),
(3, 3, 'High', '2022-04-25 15:55:00', '2022-04-25 15:55:00'),
(4, 4, 'Urgent', '2022-04-25 15:55:00', '2022-04-25 15:55:00');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `project_title`, `description`, `status`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'PGL ERP', 'PGL ERP', 3, 2, '2022-05-30 11:27:02', '2022-05-30 11:56:38');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `is_env` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`key`, `value`, `is_env`, `created_at`, `updated_at`) VALUES
('app_background', 'default', 0, '2022-04-25 15:55:01', '2022-04-25 15:55:01'),
('app_date_format', 'L', 0, '2022-04-25 15:55:01', '2022-04-25 15:55:01'),
('app_date_locale', 'en', 0, '2022-04-25 15:55:01', '2022-04-25 15:55:01'),
('app_default_role', '3', 0, '2022-04-25 15:55:01', '2022-04-25 15:55:01'),
('app_https', '1', 1, '2022-04-25 15:55:00', '2022-05-13 08:49:26'),
('app_icon', 'appearance/icon/TynrBpsBvYFovIDBLNEmT5ZGbvSwnAgmFtN5sVzK.png', 0, '2022-04-25 15:55:01', '2022-05-13 11:20:47'),
('app_locale', 'en', 1, '2022-04-25 15:55:01', '2022-04-25 15:55:01'),
('app_name', 'PGL Helpdesk', 1, '2022-04-25 15:55:00', '2022-05-13 08:49:26'),
('app_timezone', 'Africa/Lagos', 1, '2022-04-25 15:55:01', '2022-05-13 08:50:59'),
('app_url', 'http://pglhelpdesk.test/', 1, '2022-04-25 15:55:00', '2022-05-13 08:49:26'),
('app_user_registration', '0', 0, '2022-04-25 15:55:01', '2022-05-16 11:37:02'),
('mail_encryption', 'SSL', 1, '2022-04-25 15:55:01', '2022-05-13 10:41:34'),
('mail_from_address', 'omeiza.alabi@pglnigeria.com', 1, '2022-04-25 15:55:01', '2022-05-13 14:38:38'),
('mail_from_name', 'PGL Helpdesk', 1, '2022-04-25 15:55:01', '2022-05-13 09:51:41'),
('mail_host', 'mail.pglnigeria.com', 1, '2022-04-25 15:55:01', '2022-05-13 14:40:44'),
('mail_mailer', 'smtp', 1, '2022-04-25 15:55:01', '2022-04-25 15:55:01'),
('mail_password', 'skippy24*#', 1, '2022-04-25 15:55:01', '2022-05-13 14:38:38'),
('mail_port', '465', 1, '2022-04-25 15:55:01', '2022-05-13 10:41:34'),
('mail_username', 'omeiza.alabi@pglnigeria.com', 1, '2022-04-25 15:55:01', '2022-05-13 14:38:38'),
('mailgun_domain', NULL, 1, '2022-04-25 15:55:01', '2022-04-25 15:55:01'),
('mailgun_endpoint', NULL, 1, '2022-04-25 15:55:01', '2022-04-25 15:55:01'),
('mailgun_secret', NULL, 1, '2022-04-25 15:55:01', '2022-04-25 15:55:01'),
('meta_description', 'A clean platform from PGL that allows clients to create tickets and get support from your staff', 0, '2022-04-25 15:55:01', '2022-05-13 08:50:24'),
('meta_home_title', 'PGL - Helpdesk ticketing system', 0, '2022-04-25 15:55:00', '2022-05-13 08:50:24'),
('meta_keywords', 'pgl,helpdesk,tickets', 0, '2022-04-25 15:55:01', '2022-05-13 08:50:24'),
('recaptcha_enabled', '0', 0, '2022-04-25 15:55:01', '2022-04-25 15:55:01'),
('recaptcha_private', NULL, 0, '2022-04-25 15:55:01', '2022-04-25 15:55:01'),
('recaptcha_public', NULL, 0, '2022-04-25 15:55:01', '2022-04-25 15:55:01'),
('sentry_dsn', NULL, 1, '2022-04-25 15:55:01', '2022-04-25 15:55:01');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Open', '2022-04-25 15:55:00', '2022-04-25 15:55:00'),
(2, 'Pending', '2022-04-25 15:55:00', '2022-04-25 15:55:00'),
(3, 'Resolved', '2022-04-25 15:55:00', '2022-04-25 15:55:00'),
(4, 'Closed', '2022-04-25 15:55:00', '2022-04-25 15:55:00');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `priority_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `agent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `closed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `closed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_attachments`
--

CREATE TABLE `ticket_attachments` (
  `ticket_reply_id` bigint(20) UNSIGNED NOT NULL,
  `file_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_labels`
--

CREATE TABLE `ticket_labels` (
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `label_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `avatar`, `role_id`, `status`, `password`, `remember_token`, `created_at`, `updated_at`, `email_verified_at`, `company_id`) VALUES
(1, 'Admin', 'admin@pglnigeria.com', NULL, 1, 1, '$2y$10$zSwmuusWQflmNYeGTUVDkOIT/eOWCnKEwvtTEh82brptGY6.Cpp0O', NULL, '2022-04-25 15:55:00', '2022-05-13 09:55:57', NULL, 0),
(3, 'Test User', 'user@pglnigeria.com', NULL, 3, 1, '$2y$10$l3.QeG2p.MzPscpoc8CmR.aNZa2DGiUkGLLAm1HcodpsdFaON9gne', NULL, '2022-05-13 09:55:42', '2022-05-30 13:13:44', NULL, 2),
(4, 'EDSINE', 'edsine@pglnigeria.com', NULL, 4, 1, '$2y$10$u5yRc5Rg6bZvjwgZPcUJLedpjrs7Cr4TJUscgdWS5gfH/SSrgXgqO', NULL, '2022-05-13 11:28:18', '2022-05-13 11:28:18', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_departments`
--

CREATE TABLE `user_departments` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_departments`
--

INSERT INTO `user_departments` (`user_id`, `department_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL DEFAULT '2',
  `permissions` longtext COLLATE utf8mb4_unicode_ci,
  `dashboard_access` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `name`, `type`, `permissions`, `dashboard_access`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 1, '\"[]\"', 1, '2022-04-25 15:55:00', '2022-04-25 15:55:00'),
(2, 'User', 1, '\"[\\\"App.Http.Controllers.Api.Dashboard.StatsController\\\"]\"', 0, '2022-04-25 15:55:00', '2022-04-25 15:55:00'),
(3, 'Customer', 1, '\"[]\"', 0, '2022-04-25 15:55:00', '2022-04-25 15:55:00'),
(4, 'Agent', 2, '\"[\\\"App.Http.Controllers.Api.Dashboard.TicketController\\\",\\\"App.Http.Controllers.Api.Dashboard.StatsController\\\",\\\"App.Http.Controllers.Api.Dashboard.CannedReplyController\\\"]\"', 1, '2022-05-13 11:15:30', '2022-05-13 11:15:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `canned_replies`
--
ALTER TABLE `canned_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `canned_replies_user_id_foreign` (`user_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_verifiers`
--
ALTER TABLE `email_verifiers`
  ADD KEY `email_verifiers_email_index` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_user_id_foreign` (`user_id`),
  ADD KEY `files_uuid_index` (`uuid`);

--
-- Indexes for table `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `priorities`
--
ALTER TABLE `priorities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_status_id_foreign` (`status_id`),
  ADD KEY `tickets_priority_id_foreign` (`priority_id`),
  ADD KEY `tickets_department_id_foreign` (`department_id`),
  ADD KEY `tickets_user_id_foreign` (`user_id`),
  ADD KEY `tickets_agent_id_foreign` (`agent_id`),
  ADD KEY `tickets_closed_by_foreign` (`closed_by`),
  ADD KEY `tickets_uuid_index` (`uuid`);

--
-- Indexes for table `ticket_attachments`
--
ALTER TABLE `ticket_attachments`
  ADD PRIMARY KEY (`ticket_reply_id`,`file_id`),
  ADD KEY `ticket_attachments_file_id_foreign` (`file_id`);

--
-- Indexes for table `ticket_labels`
--
ALTER TABLE `ticket_labels`
  ADD PRIMARY KEY (`ticket_id`,`label_id`),
  ADD KEY `ticket_labels_label_id_foreign` (`label_id`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_replies_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_replies_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_departments`
--
ALTER TABLE `user_departments`
  ADD PRIMARY KEY (`user_id`,`department_id`),
  ADD KEY `user_departments_department_id_foreign` (`department_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `canned_replies`
--
ALTER TABLE `canned_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `labels`
--
ALTER TABLE `labels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `priorities`
--
ALTER TABLE `priorities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `canned_replies`
--
ALTER TABLE `canned_replies`
  ADD CONSTRAINT `canned_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tickets_closed_by_foreign` FOREIGN KEY (`closed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tickets_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tickets_priority_id_foreign` FOREIGN KEY (`priority_id`) REFERENCES `priorities` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tickets_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ticket_attachments`
--
ALTER TABLE `ticket_attachments`
  ADD CONSTRAINT `ticket_attachments_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`),
  ADD CONSTRAINT `ticket_attachments_ticket_reply_id_foreign` FOREIGN KEY (`ticket_reply_id`) REFERENCES `ticket_replies` (`id`);

--
-- Constraints for table `ticket_labels`
--
ALTER TABLE `ticket_labels`
  ADD CONSTRAINT `ticket_labels_label_id_foreign` FOREIGN KEY (`label_id`) REFERENCES `labels` (`id`),
  ADD CONSTRAINT `ticket_labels_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`);

--
-- Constraints for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD CONSTRAINT `ticket_replies_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ticket_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`id`);

--
-- Constraints for table `user_departments`
--
ALTER TABLE `user_departments`
  ADD CONSTRAINT `user_departments_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `user_departments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
