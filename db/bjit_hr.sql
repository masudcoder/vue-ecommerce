-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2020 at 09:46 AM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bjit_hr`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin_type` tinyint(1) NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `admin_type`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'super@admin.com', 1, '$2y$10$hZRZiBmJWAk1WK4T6eGYS.QAp9rl.A8LcLilY.q/kK8Ffu62VF3Kq', 'lYEtWDeSrN1tuzO57N8Hv1QYxvVi5r49xguLhVA7n1zr9VYo1ERgethqlFUZ', NULL, '2016-08-26 19:46:06'),
(2, 'admin', 'info@gramerponno.com', 2, '$2y$10$hZRZiBmJWAk1WK4T6eGYS.QAp9rl.A8LcLilY.q/kK8Ffu62VF3Kq', '5xxDNiCBaslyk1Vw7n1hFGqH6OTaGt5BXdef0WFwKpBE6rZPC1pjsYfdM7Sk', NULL, '2017-02-20 21:13:06');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `bill_row_id` int(5) NOT NULL,
  `bill_title` varchar(255) NOT NULL,
  `bill_description` text NOT NULL,
  `bill_party_date` date NOT NULL,
  `bill_amount` float(8,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `submitted_by` int(11) NOT NULL,
  `approved_by_admin_row_id` int(5) NOT NULL COMMENT 'First approval',
  `bill_final_by_admin_row_id` int(5) NOT NULL COMMENT 'Final- money will go to account'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`bill_row_id`, `bill_title`, `bill_description`, `bill_party_date`, `bill_amount`, `created_at`, `updated_at`, `submitted_by`, `approved_by_admin_row_id`, `bill_final_by_admin_row_id`) VALUES
(1, 'Office\'s Colleague Farewel PArty', 'Office\'s Colleague Farewel PArtyOffice\'s Colleague Farewel PArty. \r\n\r\nOffice\'s Colleague Farewel PArty\r\nOffice\'s Colleague Farewel PArty.', '2019-09-05', 500.00, '2019-09-09 14:18:23', '2019-09-09 14:18:23', 3, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_row_id` int(11) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_short_description` text COLLATE utf8_unicode_ci,
  `category_long_description` longtext COLLATE utf8_unicode_ci,
  `parent_id` int(11) DEFAULT NULL,
  `has_child` int(11) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `level` int(11) DEFAULT NULL,
  `count_product` int(11) DEFAULT NULL,
  `category_sort_order` int(11) DEFAULT NULL,
  `meta_key` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_row_id`, `category_name`, `category_slug`, `category_image`, `category_short_description`, `category_long_description`, `parent_id`, `has_child`, `is_featured`, `level`, `count_product`, `category_sort_order`, `meta_key`, `meta_description`, `created_at`, `updated_at`) VALUES
(61, 'Fruits and vegetables ', 'Food', NULL, NULL, NULL, 0, 1, 0, 0, NULL, NULL, NULL, NULL, '2016-10-24 08:10:25', '2018-11-24 02:25:16'),
(62, 'Office Productss', 'Office Products', NULL, NULL, NULL, 0, 1, 0, 0, NULL, NULL, NULL, NULL, '2016-10-24 08:10:59', '2018-11-09 07:32:56'),
(63, 'Baby Care', 'Baby Care', NULL, NULL, NULL, 0, 1, 0, 0, NULL, NULL, NULL, NULL, '2017-01-13 06:57:07', '2017-01-13 06:57:07'),
(64, 'Home Appliances & cleaning ', 'Home Appliances', NULL, NULL, NULL, 0, 1, 0, 0, NULL, NULL, NULL, NULL, '2017-01-13 06:57:29', '2018-11-24 03:18:18'),
(65, 'Beauty products', 'Beauty & Health', NULL, NULL, NULL, 0, 1, 0, 0, NULL, NULL, NULL, NULL, '2017-01-13 06:59:20', '2018-11-24 03:24:46'),
(66, 'Fresh Fruits', 'fresh-fruits', NULL, NULL, NULL, 61, 0, 0, 1, NULL, NULL, NULL, NULL, '2018-11-09 07:21:14', '2018-12-15 17:00:47'),
(67, 'Baby food ', 'baby-food', NULL, NULL, NULL, 63, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-09 07:22:11', '2018-12-15 17:01:28'),
(69, 'Meat and fish ', NULL, NULL, NULL, NULL, 0, 1, 0, 0, NULL, NULL, NULL, NULL, '2018-11-09 21:42:14', '2018-11-24 02:29:17'),
(70, 'Fresh vegetables ', 'fresh-vegetables', NULL, NULL, NULL, 61, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-10 04:12:36', '2018-12-15 17:00:38'),
(71, 'Frozen Fish', 'frozen-fish', NULL, NULL, NULL, 69, 0, 0, 1, NULL, NULL, NULL, NULL, '2018-11-10 04:23:15', '2018-12-15 17:05:51'),
(72, 'Frozen Meat', 'frozen-meat', NULL, NULL, NULL, 69, 0, 0, 1, NULL, NULL, NULL, NULL, '2018-11-10 04:23:32', '2018-12-15 17:06:09'),
(73, 'Popular ', NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '2018-11-10 06:08:15', '2018-11-10 06:08:15'),
(75, 'Cloth ', NULL, NULL, NULL, NULL, 0, 1, 0, 0, NULL, NULL, NULL, NULL, '2018-11-23 07:34:47', '2018-11-23 07:34:47'),
(76, 'Lungi', 'lungi', NULL, NULL, NULL, 75, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-23 07:35:41', '2018-11-23 07:35:41'),
(77, 'Gamsa', 'gamsa', NULL, NULL, NULL, 75, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-23 07:36:29', '2018-11-23 07:36:29'),
(78, 'Bed sheets ', 'bed-sheets', NULL, NULL, NULL, 75, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-23 07:37:45', '2018-11-23 07:37:45'),
(79, 'Shares ', 'sharees', NULL, NULL, NULL, 75, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-23 07:45:56', '2018-11-23 07:45:56'),
(80, 'Milk', 'milk', NULL, NULL, NULL, 69, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-23 07:47:05', '2018-11-23 07:47:05'),
(87, 'Dry fish ', 'dry-fish', NULL, NULL, NULL, 69, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 02:32:18', '2018-11-24 02:32:18'),
(88, 'Fresh Fish ', 'fresh-fish', NULL, NULL, NULL, 69, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 02:39:29', '2018-11-24 02:39:29'),
(89, 'Fresh meat ', 'fresh-meat', NULL, NULL, NULL, 69, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 02:40:25', '2018-11-24 02:40:25'),
(90, 'Writing and printing ', 'writing-printing', NULL, NULL, NULL, 62, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 02:45:03', '2018-12-15 17:01:04'),
(91, 'Organising ', 'organising', NULL, NULL, NULL, 62, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 02:46:07', '2018-12-15 17:01:18'),
(92, 'Cleaning and laundry ', 'cleaning-laundry', NULL, NULL, NULL, 64, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:19:58', '2018-12-15 17:02:34'),
(93, 'Dish & kitchen  accessories ', 'dish-kitchen-accessories', NULL, NULL, NULL, 64, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:21:22', '2018-12-15 17:02:54'),
(94, 'Air freshener ', 'air-freshener ', NULL, NULL, NULL, 64, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:22:26', '2018-12-15 17:03:19'),
(95, 'Napkins and paper product ', 'napkins-paper-product', NULL, NULL, NULL, 64, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:23:32', '2018-12-15 17:03:43'),
(96, 'Body care ', 'body-care', NULL, NULL, NULL, 65, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:26:12', '2018-12-15 17:04:02'),
(97, 'Bath needs ', 'bath-needs', NULL, NULL, NULL, 65, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:27:28', '2018-12-15 17:04:14'),
(98, 'Facial care ', 'facial-care', NULL, NULL, NULL, 65, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:29:11', '2018-12-15 17:04:32'),
(99, 'Oral care ', 'oral-care', NULL, NULL, NULL, 65, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:29:54', '2018-12-15 17:04:52'),
(100, 'Hair care ', 'hair-care ', NULL, NULL, NULL, 65, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:31:40', '2018-12-15 17:05:08'),
(101, 'Feminine care ', 'feminine-care', NULL, NULL, NULL, 65, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:32:34', '2018-12-15 17:05:24'),
(102, 'Diapers', 'diaper', NULL, NULL, NULL, 63, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:34:52', '2018-12-15 17:01:37'),
(103, 'Feeder and nipples ', 'feeder-nipples', NULL, NULL, NULL, 63, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:35:45', '2018-12-15 17:01:59'),
(104, 'Baby beauty care ', 'baby-beauty-care', NULL, NULL, NULL, 63, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:36:33', '2018-12-15 17:02:20'),
(105, 'Beverages ', NULL, NULL, NULL, NULL, 0, 1, 0, 0, NULL, NULL, NULL, NULL, '2018-11-24 03:38:40', '2018-11-24 03:38:40'),
(106, 'Tea&coffee ', 'tea-coffee', NULL, NULL, NULL, 105, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:40:25', '2018-11-24 03:40:25'),
(107, 'Juice', 'juice', NULL, NULL, NULL, 105, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:41:09', '2018-11-24 03:41:09'),
(108, 'Soft drinks ', 'soft-drinks', NULL, NULL, NULL, 105, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:41:53', '2018-11-24 03:41:53'),
(109, 'Energy drinks ', 'energy-drinks', NULL, NULL, NULL, 105, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:42:26', '2018-11-24 03:42:26'),
(110, 'Syrup and powder product ', 'Syrup-powder', NULL, NULL, NULL, 105, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:44:48', '2018-11-24 03:44:48'),
(111, 'Water ', 'water', NULL, NULL, NULL, 105, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:45:22', '2018-11-24 03:45:22'),
(112, 'Cooking & Groceries ', NULL, NULL, NULL, NULL, 0, 1, 0, 0, NULL, NULL, NULL, NULL, '2018-11-24 03:46:31', '2018-11-24 03:46:31'),
(113, 'Rice', 'rice', NULL, NULL, NULL, 112, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:47:22', '2018-11-24 03:47:22'),
(114, 'Oil', 'oil', NULL, NULL, NULL, 112, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:47:45', '2018-11-24 03:47:45'),
(115, 'Ready mix', 'ready-mix', NULL, NULL, NULL, 112, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:48:16', '2018-11-24 03:48:16'),
(116, 'Salt and  sugar ', 'salt-sugar', NULL, NULL, NULL, 112, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:49:01', '2018-11-24 03:49:01'),
(117, 'Dal', 'dal', NULL, NULL, NULL, 112, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:49:46', '2018-11-24 03:49:46'),
(118, 'Spices', 'spices', NULL, NULL, NULL, 112, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:50:26', '2018-11-24 03:50:26'),
(119, 'Ate, semai& suji ', 'ata-semai-suji', NULL, NULL, NULL, 112, NULL, 0, 1, NULL, NULL, NULL, NULL, '2018-11-24 03:51:32', '2018-11-24 03:51:32');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dailyattendance`
--

CREATE TABLE `dailyattendance` (
  `id` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `goouttime` datetime DEFAULT NULL,
  `intime` datetime DEFAULT NULL,
  `outtime` datetime DEFAULT NULL,
  `returntime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employeebasicinfo`
--

CREATE TABLE `employeebasicinfo` (
  `employee_id` varchar(255) NOT NULL,
  `birth_date` datetime DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `department` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `joining_date` datetime DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `id` char(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `menu_row_id` int(11) NOT NULL,
  `link_dynamic` tinyint(1) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `menu_link` varchar(255) NOT NULL,
  `menu_content` longtext NOT NULL,
  `parent_id` int(11) NOT NULL,
  `has_child` tinyint(1) NOT NULL,
  `level` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `menu_sort_order` int(5) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`menu_row_id`, `link_dynamic`, `menu_name`, `menu_link`, `menu_content`, `parent_id`, `has_child`, `level`, `is_active`, `menu_sort_order`, `created_at`, `updated_at`) VALUES
(1, 0, 'Home', '', '<p>hom</p>', 0, 0, 0, 0, 0, '2016-06-01 16:39:38', '2016-06-01 16:39:38'),
(2, 0, 'About Us', '', '<p>&nbsp;</p>\r\n<p>It is About us page. You can update the content from Admin panel.It is About us page. You can update the content from Admin panel.<br />It is About us page. You can update the content from Admin panel.<br />It is About us page. You can update the content from Admin panel.<br />It is About us page. You can update the content from Admin panel.</p>\r\n<p>It is About us page. You can update the content from Admin panel.It is About us page. You can update the content from Admin panel.It is About us page. You can update the content from Admin panel.&nbsp;It is About us page. You can update the content from Admin panel.It is About us page. You can update the content from Admin panel.It is About us page. You can update the content from Admin panel.It is About us page. You can update the content from Admin panel.It is About us page. You can update the content from Admin panel.It is About us page. You can update the content from Admin panel.</p>\r\n<p><strong>It is About us page.</strong> You can update the content from Admin panel.It is About us page. You can update the content from Admin panel.It is About us page. You can update the content from Admin panel.It is About us page. You can update the content from Admin panel.&nbsp;It is About us page. You can update the content from Admin panel.</p>\r\n<p>It is About us page. You can update the content from Admin panel.<br />It is About us page. You can update the content from Admin panel.<br />It is About us page. You can update the content from Admin panel.<br />It is About us page. You can update the content from Admin panel.</p>\r\n<p>&nbsp;</p>\r\n<p>It is About us page. You can update the content from Admin panel.&nbsp;It is About us page. You can update the content from Admin panel.&nbsp;It is About us page. You can update the content from Admin panel.&nbsp;It is About us page. You can update the content from Admin panel.&nbsp;It is About us page. You can update the content from Admin panel.&nbsp;It is About us page. You can update the content from Admin panel.&nbsp;It is About us page. You can update the content from Admin panel.&nbsp;It is About us page. You can update the content from Admin panel.&nbsp;It is About us page. You can update the content from Admin panel.&nbsp;It is About us page. You can update the content from Admin panel.&nbsp;It is About us page. You can update the content from Admin panel.&nbsp;It is About us page. You can update the content from Admin panel.&nbsp;It is About us page. You can update the content from Admin panel.&nbsp;It is About us page. You can update the content from Admin panel.</p>\r\n<p>&nbsp;</p>\r\n<p>It is About us page. You can update the content from Admin panel.&nbsp;It is AboIt is About us page. You can update the content from Admin panel.It is About us page. You can update the content from Admin panel.It is About us page. You can update the content from Admin panel.ut us page. You can update the content from Admin panel. &nbsp; &nbsp; &nbsp; &nbsp;It is About us page. You can update the content from Admin panel.&nbsp;It is About us page. You can update the content from Admin panel. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;It is About us page. You can update the content from Admin panel.&nbsp;It is About us page. You can update the content from Admin panel.&nbsp;It is About us page. You can update the content from Admin panel.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>It is About us page. You can update the content from Admin panel.&nbsp;It is About us page. You can update the content from Admin panel.&nbsp;It is About us page. You can update the content from Admin panel.&nbsp;</p>', 0, 0, 0, 1, 0, '2016-06-01 16:39:48', '2016-06-15 13:50:25'),
(3, 0, 'Contact Us', '', '<p>Email: enggmasud1983 @ gmail.com</p>\r\n<p>Skype: enggmasud1983</p>', 0, 0, 0, 1, 0, '2016-06-01 16:40:00', '2016-06-15 13:55:06'),
(4, 1, 'What is Lorem Ipsum?', 'what-is-lorem-ipsum', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 0, 0, 0, 1, 4, '0000-00-00 00:00:00', '2016-08-18 22:07:19'),
(9, 1, 'MY new Page', 'my-new-page', '<p>my new page &nbsp;</p>', 0, 0, 0, 1, 0, '2016-08-18 21:53:24', '2016-08-18 21:53:24');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('enggmasud1983@gmail.com', 'a6688bb5b60f5c4149352dd10ed8e7e1d9b16acd57ea39571786b33faccebdd5', '2018-11-09 08:10:39');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_price` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_image`, `product_name`, `product_price`) VALUES
(1, 'shirt.jpg', 'shirt', 120),
(2, 'asda', 'asdasd', 332);

-- --------------------------------------------------------

--
-- Table structure for table `temp_orders`
--

CREATE TABLE `temp_orders` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `user_track_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_orders`
--

INSERT INTO `temp_orders` (`id`, `pid`, `amount`, `user_track_id`) VALUES
(32, 1, 2, 'track_id_123'),
(33, 1, 1, 'track_id_123'),
(34, 1, 1, 'track_id_123'),
(35, 1, 1, 'track_id_123'),
(36, 1, 1, 'track_id_123');

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE `userinfo` (
  `id` bigint(20) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` varchar(255) NOT NULL,
  `passwords` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `occupation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `education` text COLLATE utf8_unicode_ci,
  `skills` text COLLATE utf8_unicode_ci,
  `experience` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'User.jpg',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `address`, `phone`, `occupation`, `education`, `skills`, `experience`, `about`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Masud', 'enggmasud1983@gmail.com', 'users/default.png', '$2y$10$oOMYQmav5iITE3EHZQJpUumJWRwIkuMeJoqheJm0CFZ43see6VVrS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User.jpg', 'pb3IMRPPYQ0hneXoYh9edc0eoCvNT4AD06HyMtWmM81adM0G0l6I40KGaJUe', '2018-11-09 08:19:12', '2018-11-10 00:24:51'),
(2, NULL, 'Monir', 'monirpust45@gmail.com', 'users/default.png', NULL, '   MIRPUR-1 ', NULL, NULL, NULL, NULL, NULL, NULL, 'User.jpg', NULL, '2018-11-09 23:40:09', '2018-11-09 23:40:09'),
(3, NULL, 'Masud', 'masud@masud.com', 'users/default.png', NULL, 'Mirpur, Dhaka  ', NULL, NULL, NULL, NULL, NULL, NULL, 'User.jpg', NULL, '2019-01-02 21:00:54', '2019-01-02 21:00:54'),
(4, NULL, 'mmaa', '', 'users/default.png', NULL, '  sadsa', NULL, NULL, NULL, NULL, NULL, NULL, 'User.jpg', NULL, '2019-01-03 07:13:05', '2019-01-03 07:13:05'),
(5, NULL, 'masdu', 'ma@gmail.com', 'users/default.png', '$2y$10$KxjFnRVR2q3pOMaVsv4XpuA4uubMco/jWNkXDG.jtkvr4zbEDBKTW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User.jpg', 'r1zgxvZGyTvgFcYYWZfgUgGRnxP1tOF53BxK0A4kTCHTQYb3MULSxLu1vkX5', '2019-05-24 16:30:57', '2019-05-24 16:30:57'),
(6, NULL, 'rahi', 'rahi@gmail.com', 'users/default.png', '$2y$10$w2gEq6.fjLGn1qD9Skc2eeEBXEAvGW48M15FKGC.f1uuKPyz.DW9y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User.jpg', 'Gttccz17hsBGUmNcNxDP5tPVKkyi5n2pbLP0d2IUT0S5qeNZpV3wCC4pxbNW', '2019-05-24 16:31:31', '2019-05-24 16:31:31'),
(7, NULL, 'masud', 'masud452@gmail.com', 'users/default.png', '$2y$10$S41eav5E1NWV2QBNwuXa3uciOOYjfcBG3yXJCGORz1xKZOhofOMou', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User.jpg', 'oqVOV5ZOuKwy0slPy44OC4AaFYpDf5PNGICclVB8GthbVwqUTzjKIOTMnGYe', '2019-05-24 17:04:59', '2019-05-24 17:04:59'),
(8, NULL, 'masd09', 'masud0992@gmail.com', 'users/default.png', '$2y$10$r2a6io78yMx.aZf1/mB/GOrzGGWHCpiIKB8p92dBrUJPFVD4rPc1u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User.jpg', 'L9I9L2K5VxJcBck4iTJYXA7l3I55oNpowndjCJCq8TDB2uSYJFxfXvjwNpOI', '2019-05-24 17:06:13', '2019-05-24 17:06:13'),
(9, NULL, 'lsadas', 'salsad@gmail.com', 'users/default.png', '$2y$10$pMt9A8T5V6vPSWmPVT3Z/uWlk13ypJWT1S5rMbus1pacWImyTJTKO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User.jpg', 'DLDPunY8C7sl43YqLkY4l8MppOhx1unsuUfixJnp1CDwUPsTo58UQppe0NPt', '2019-05-24 17:09:11', '2019-05-24 17:09:11'),
(10, NULL, 'sadfsad', 'sfsdfdsfsd@gmail.com', 'users/default.png', '$2y$10$7mlMLrgNUlKO0eocO8a5iug3FE06EbLLrJ1evU/Rk2VjR3hyzQV5K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User.jpg', 'w33Vh0Tmj4FLqqUSUP6zUYAbdOc9EiXFzHeDkUG0Ja7M6mB74Ly0GeuMFBod', '2019-05-24 17:09:52', '2019-05-24 17:09:52'),
(11, NULL, 'msmdas', 'masd123@gmail.com', 'users/default.png', '$2y$10$LwxwawOmWkaTVseMFH..g.WdayCA9694IQz2zaGVnlEt34wF0v3HC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User.jpg', 'dKchn3KYcPgV0uJvgObcZX2gQGoczRzVC0pzEba5X6VRmOBWlPRnjww1reac', '2019-05-24 17:12:06', '2019-05-24 17:12:06'),
(12, NULL, 'sadas', 'dsfsdsds@gmail.com', 'users/default.png', '$2y$10$O92fSqe7sYkjjguCbHekbuaWVVrMJTO4NufwoP7M7KoO2quDXxwu.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User.jpg', NULL, '2019-05-24 17:16:13', '2019-05-24 17:16:13'),
(13, NULL, 'mamun', 'mamun@gmail.com', 'users/default.png', '$2y$10$G9OkYg9rmqAV.QEB/8lWHeMtefKFGqgrgFooxPQ09VIE7oTguAogy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User.jpg', 'Uya4qjIBuL3bj4RoGUDNQRW1SXQ3h3CmqX8GVvnUwq3jADnHeKYsvLYzuq8s', '2019-05-24 19:32:01', '2019-05-24 19:32:01');

-- --------------------------------------------------------

--
-- Table structure for table `visitdetails`
--

CREATE TABLE `visitdetails` (
  `id` bigint(20) NOT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `goouttime` datetime DEFAULT NULL,
  `returntime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`bill_row_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_row_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dailyattendance`
--
ALTER TABLE `dailyattendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employeebasicinfo`
--
ALTER TABLE `employeebasicinfo`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `FKrsljgkly20c5hu4fychts91kn` (`company_id`),
  ADD KEY `FKnpc1wkfkcl7s8cb0gtt9w8mck` (`department`),
  ADD KEY `FKkin4ff8gnv15iax9kad8tkm5d` (`sex`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`menu_row_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_orders`
--
ALTER TABLE `temp_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitdetails`
--
ALTER TABLE `visitdetails`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `bill_row_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_row_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `dailyattendance`
--
ALTER TABLE `dailyattendance`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `temp_orders`
--
ALTER TABLE `temp_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `visitdetails`
--
ALTER TABLE `visitdetails`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
