-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2018 at 06:27 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `joyride_migrations`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_content`
--

CREATE TABLE `app_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `fleet_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `battery_log`
--

CREATE TABLE `battery_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `vehicle_id` int(10) UNSIGNED NOT NULL,
  `voltage` int(10) UNSIGNED DEFAULT NULL,
  `timestamp` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billing_plans`
--

CREATE TABLE `billing_plans` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `required_deposit_amount` double(8,2) DEFAULT NULL,
  `first_billing_unit_free` double(8,2) DEFAULT NULL,
  `next_billing_unit_free` double(8,2) DEFAULT NULL,
  `tax_inclusive` tinyint(4) NOT NULL,
  `start_timestamp` int(10) UNSIGNED DEFAULT NULL,
  `end_timestamp` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billing_plans`
--

INSERT INTO `billing_plans` (`id`, `name`, `description`, `required_deposit_amount`, `first_billing_unit_free`, `next_billing_unit_free`, `tax_inclusive`, `start_timestamp`, `end_timestamp`, `status`, `state`) VALUES
(1, 'Standard', 'this is standard billing paln', 500.00, 5.00, 1.00, 0, NULL, NULL, 'Active', 0),
(2, 'Premium', 'this is premium billing paln', 1000.00, 5.00, 1.00, 0, NULL, NULL, 'Active', 0),
(3, 'Node', 'node', 10000.00, 22.00, 2.00, 55, 1542844800, 1542844800, 'Active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_no` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone_utc` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`, `currency`, `currency_code`, `code_no`, `timezone`, `timezone_utc`) VALUES
(1, 'Afghanistan', 'AF', 'Afghani', 'AFA', '', 'Afghanistan', '+04:30'),
(3, 'Albania', 'AL', 'Lek', 'ALL', '', 'Central European', '+01:00'),
(5, 'Algeria', 'DZ', 'Algerian Dinar', 'DZD', '', 'Central European', '+01:00'),
(7, 'American Samoa', 'AS', 'US Dollar', 'USD', '', 'Samoa', '-11:00'),
(9, 'Andorra', 'AD', 'Euro', 'EUR', '', 'Central European', '+01:00'),
(11, 'Angola', 'AO', 'Kwanza', 'AOA', '', 'West Africa', '+01:00'),
(13, 'Anguilla', 'AI', 'East Caribbean Dollar', 'XCD', '', 'Eastern Caribbean', '-04:00'),
(15, 'Antarctica', 'AQ', 'Norwegian Krone', 'NOK', '', '', '0'),
(17, 'Antigua and Barbuda', 'AG', 'East Caribbean Dollar', 'XCD', '', 'Atlantic', '-04:00'),
(19, 'Argentina', 'AR', 'Austral and Argenintinian Neuvo Peso', 'ARA', '', 'Argentina', '-03:00'),
(21, 'Armenia', 'AM', 'Dram', 'AMD', '', 'Armenia', '+04:00'),
(23, 'Aruba', 'AW', 'Aruban Guilder (Florin)', 'AWG', '', 'Atlantic', '-04:00'),
(25, 'Australia', 'AU', 'Australian Dollar', 'AUD', '', '', '0'),
(27, 'Austria', 'AT', 'Euro', 'EUR', '', 'Central European', '+01:00'),
(29, 'Azerbaijan', 'AZ', 'Azerbaijani Manat ', 'AZM', '', 'Azerbaijan', '+04:00'),
(31, 'Bahamas', 'BS', 'Bahamian Dollar', 'BSD', '', 'Eastern', '-05:00'),
(33, 'Bahrain', 'BH', 'Bahraini Dinar', 'BHD', '', '', '+03:00'),
(35, 'Bangladesh', 'BD', 'Taka', 'BDT', '', 'Bangladesh', '+06:00'),
(37, 'Barbados', 'BB', 'Barbados Dollar', 'BBD', '', '', '-04:00'),
(39, 'Belarus (formerly known as Byelorussia)', 'BY', 'Belarussian Rouble ', 'BYR', '', 'FET', '+03:00'),
(41, 'Belgium', 'BE', 'Euro', 'EUR', '', 'Central European', '+01:00'),
(43, 'Belize', 'BZ', 'Belize Dollar', 'BZD', '', '', '-06:00'),
(45, 'Benin', 'BJ', 'Franc de la Communauté financière africaine', 'XAF', '', 'West Africa', '+01:00'),
(47, 'Bermuda', 'BM', 'Bermudian Dollar', 'BMD', '', 'Atlantic', '-04:00'),
(49, 'Bhutan', 'BT', 'Ngultrum', 'BTN', '', 'Bhutan', '+06:00'),
(51, 'Bolivia', 'BO', 'Boliviano and Bolivian Peso', 'BOB', '', '', '-04:00'),
(53, 'Bosnia & Herzegowina', 'BA', 'Convertible Mark', 'BAM', '', 'Central European', '+01:00'),
(55, 'Botswana', 'BW', 'Pula', 'BWP', '', 'Central Africa', '+02:00'),
(57, 'Bouvet Island', 'BV', 'Norwegian Krone', 'NOK', '', '', '00:00'),
(59, 'Brazil', 'BR', 'Real', 'BRL', '', '', '0'),
(61, 'British Indian Ocean Territory', 'IO', 'Pound Sterling and Seychelles ', 'GBP', '', '', '+06:00'),
(63, 'Brunei Darussalam', 'BN', 'Brunei Dollar', 'BND', '', '', '+08:00'),
(65, 'Bulgaria', 'BG', 'Lev', 'BGL', '', 'Eastern European', '+02:00'),
(67, 'Burkina Faso', 'BF', 'Franc de la Communauté financière africaine', 'XAF', '', '', '00:00'),
(69, 'Burma', 'Former nam', '', '', '', 'Myanmar Standatd', '+06:30'),
(71, 'Burundi', 'BI', 'Burundi Franc', 'BIF', '', 'Central Africa', '+02:00'),
(73, 'Byelorussia', 'Former nam', '', '', '', 'FET', '+03:00'),
(75, 'Cambodia (formerly Kampuchea)', 'KH', 'Riel', 'KHR', '', '', '+07:00'),
(77, 'Cameroon', 'CM', 'Franc de la Communauté financière africaine', 'XAF', '', 'West Africa', '+01:00'),
(79, 'Canada', 'CA', 'Canadian Dollar', 'CAD', '', '', '0'),
(81, 'Cape Verde', 'CV', 'Escudo Caboverdiano', 'CVE', '', 'Cape Verde', '-01:00'),
(83, 'Cayman Islands', 'KY', 'Cayman Islands Dollar', 'KYD', '', '', '-05:00'),
(85, 'Central African Republic', 'CF', 'Franc de la Communauté financière africaine', 'XAF', '', 'West Africa', '+01:00'),
(87, 'Chad', 'TD', 'Franc de la Communauté financière africaine', 'XAF', '', 'West Africa', '+01:00'),
(89, 'Chile', 'CL', 'Unidades de Fomento and Chilean Peso', 'CLF', '', 'Chile', '-03:00'),
(91, 'China', 'CN', 'Yuan Renminbi', 'CNY', '', 'Chinese Standard', '+08:00'),
(93, 'Christmas Island', 'CX', 'Australian Dollar', 'AUD', '', '', '0'),
(95, 'Cocos (Keeling) Islands', 'CC', 'Australian Dollar', 'AUD', '', 'Cocos Island', '+06:30'),
(97, 'Colombia', 'CO', 'Colombian Peso', 'COP', '', '', '-05:00'),
(99, 'Comoros', 'KM', 'Comorian Franc', 'KMF', '', 'East Africa', '+03:00'),
(101, 'Congo, Democratic Republic of the (formerly Zaïre)', 'CD (former', 'New Zaïre', 'CDZ ', '', 'West Africa', '+01:00'),
(103, 'Congo', 'CG', 'Franc de la Communauté financière africaine', 'XAF', '', 'Central Africa', '+02:00'),
(105, 'Cook Islands', 'CK', 'New Zealand Dollar', 'NZD', '', 'Cook Island', '-10:00'),
(107, 'Costa Rica', 'CR', 'Costa Rican Colón', 'CRC', '', '', '-06:00'),
(109, 'Côte d\'Ivoire', 'See Ivory ', '', '', '', 'Greenwich Mean', '00:00'),
(111, 'Croatia (local name: Hrvatska)', 'HR', 'Kuna and Croatian Dinar', 'HRK', '', 'Central European', '+01:00'),
(113, 'Cuba', 'CU', 'Cuban Peso', 'CUP', '', '', '-05:00'),
(115, 'Cyprus', 'CY', 'Euro', 'EUR', '', 'Eastern European', '+02:00'),
(117, 'Czech Republic', 'CZ', 'Czech Koruna', 'CZK', '', 'Central European', '+01:00'),
(119, 'Czechoslovakia', 'Now split ', '', '', '', 'Central European', '+01:00'),
(121, 'Denmark', 'DK', 'Danish Krone', 'DKK', '', 'Central European', '+01:00'),
(123, 'Djibouti', 'DJ', 'Djibouti Franc', 'DJF', '', 'East Africa', '+03:00'),
(125, 'Dominica', 'DM', 'East Caribbean Dollar', 'XCD', '', '', '-04:00'),
(127, 'Dominican Republic', 'DO', 'Dominican Republic Peso', 'DOP', '', '', '-04:00'),
(129, 'East Timor', 'TP', 'Timorian Escudo', 'TPE', '', '', '+09:00'),
(131, 'Ecuador', 'EC', 'US Dollar (superseded Sucre in 2000)', 'USD', '', '', '0'),
(133, 'Egypt', 'EG', 'Egytian Pound', 'EGP', '', 'Eastern European', '+02:00'),
(135, 'El Salvador', 'SV', 'US Dollar', 'USD', '', '', '-06:00'),
(137, 'Equatorial Guinea', 'GQ', 'Franc de la Communauté financière africaine and Ek', 'XAF', '', 'West Africa', '+01:00'),
(139, 'Eritrea', 'ER', 'Eritreian Nakfa, Ethiopian Birr', 'ERN', '', 'East Africa', '+03:00'),
(141, 'Estonia', 'EE', 'Kroon', 'EEK', '', 'Eastern European', '+02:00'),
(143, 'Ethiopia', 'ET', 'Birr', 'ETB', '', 'East Africa', '+03:00'),
(145, 'European Community', 'EU', 'Euro (formerly known as the ECU)', 'EUR', '', '', '0'),
(147, 'Falkland Islands (Malvinas)', 'FK', 'Falkland Pound', 'FKP', '', '', '0'),
(149, 'Faroe Islands', 'FO', 'Danish Krone', 'DKK', '', '', '0'),
(151, 'Fiji Islands', 'FJ', 'Fiji Dollar', 'FJD', '', '', '+12:00'),
(153, 'Finland', 'FI', 'Euro', 'EUR', '', 'Eastern European', '+02:00'),
(155, 'France', 'FR', 'Euro', 'EUR', '', 'Central European', '+01:00'),
(157, 'France, Metropolitan', 'FX', 'Euro', 'EUR', '', '', '0'),
(159, 'French Guiana', 'GF', 'Euro', 'EUR', '', 'French Guiana', '-03:00'),
(161, 'French Polynesia', 'PF', 'Franc des Comptoirs français du Pacifique', 'XPF', '', '', '0'),
(163, 'French Southern and Antarctic Territories', 'TF', 'Euro', 'EUR', '', '', '+05:00'),
(165, 'Gabon', 'GA', 'Franc de la Communauté financière africaine', 'XAF', '', 'West Africa', '+01:00'),
(167, 'Gambia', 'GM', 'Dalasi', 'GMD', '', 'Greenwich', '00:00'),
(169, 'Georgia', 'GE', 'Lari (Russian Ruble [RUR] was formerly in use)', 'GEL', '', '', '+04:00'),
(171, 'Germany (West and East)', 'DE (former', 'Euro', 'EUR', '', 'Central European', '+01:00'),
(173, 'Ghana', 'GH', 'Cedi', 'GHC', '', 'Greenwich Mean', '00:00'),
(175, 'Gibraltar', 'GI', 'Gibraltar Pound', 'GIP', '', 'Central European', '+01:00'),
(177, 'Greece', 'GR', 'Euro', 'EUR', '', 'Eastern European', '+02:00'),
(179, 'Greenland', 'GL', 'Danish Krone', 'DKK', '', '', '0'),
(181, 'Grenada', 'GD', 'East Caribbean Dollar', 'XCD', '', '', '-04:00'),
(183, 'Guadeloupe', 'GP', 'Euro', 'EUR', '', '', '-04:00'),
(185, 'Guam', 'GU', 'US Dollar', 'USD', '', '', '+10:00'),
(187, 'Guatemala', 'GT', 'Quetzal', 'GTQ', '', '', '-06:00'),
(189, 'Guinea', 'GN', 'Guinea Syli (also known as Guinea Franc)', 'GNS', '', 'Greenwich Mean', '00:00'),
(191, 'Guinea-Bissau', 'GW', 'Guinea-Bissau Peso and Franc de la Communauté fina', 'GWP', '', 'Greenwich Mean', '00:00'),
(193, 'Guyana', 'GY', 'Guyana Dollar', 'GYD', '', '', '-04:00'),
(195, 'Haiti', 'HT', 'Gourde', 'HTG', '', '', '-05:00'),
(197, 'Heard and McDonald Islands', 'HM', 'Australian Dollar', 'AUD', '', '', '+05:00'),
(199, 'Holy See (Vatican City State)', 'VA', 'Euro', 'EUR', '', 'Central European', '+01:00'),
(201, 'Honduras', 'HN', 'Lempira', 'HNL', '', '', '-06:00'),
(203, 'Hong Kong', 'HK', 'Hong Kong Dollar', 'HKD', '', 'Hong Kong', '+08:00'),
(205, 'Hrvatska', 'Local name', '', '', '', 'Central European', '+01:00'),
(207, 'Hungary', 'HU', 'Forint', 'HUF', '', 'Central European', '+01:00'),
(209, 'Iceland', 'IS', 'Icelandic Króna', 'ISK', '', 'Greenwich Mean', '00:00'),
(213, 'Indonesia', 'ID', 'Rupiah', 'IDR', '', '', '0'),
(215, 'Iran, Islamic Republic of', 'IR', 'Iranian Rial', 'IRR', '', 'Iran Standard', '+03:30'),
(217, 'Iraq', 'IQ', 'Iraqi Dinar', 'IQD', '', '', '+03:00'),
(219, 'Ireland', 'IE', 'Euro', 'EUR', '', 'Western European', '00:00'),
(221, 'Israel', 'IL', 'Shekel', 'ILS', '', 'Israel Standard', '+02:00'),
(223, 'Italy', 'IT', 'Euro', 'EUR', '', 'Central European', '+01:00'),
(225, 'Ivory Coast (Côte d\'Ivoire)', 'CI', 'Franc de la Communauté financière africaine', 'XAF', '', 'Greenwich Mean', '00:00'),
(227, 'Jamaica', 'JM', 'Jamaican Dollar', 'JMD', '', '', '-05:00'),
(229, 'Japan', 'JP', 'Yen', 'JPY', '', 'Japan Standard', '+09:00'),
(231, 'Jordan', 'JO', 'Jordanian Dinar', 'JOD', '', 'Jordan', '+02:00'),
(233, 'Kampuchea', 'Former nam', '', '', '', 'Indochina', '+07:00'),
(235, 'Kazakhstan', 'KZ', 'Tenge (Russian Ruble [RUR] was formerly in use)', 'KZT', '', 'Alma-Ata', '+06:00'),
(237, 'Kenya', 'KE', 'Kenyan Shilling', 'KES', '', 'East Africa', '+03:00'),
(239, 'Kiribati', 'KI', 'Australian Dollar', 'AUD', '', '', '0'),
(241, 'Korea, Democratic People\'s Republic of (North Kore', 'KP', 'North Korean Won', 'KPW', '', 'Pyongyang', '+08:30'),
(243, 'Korea, Republic of (South Korea)', 'KR', 'South Korean Won', 'KRW', '', 'Korea Standard', '+09:00'),
(245, 'Kosova and Metohia', 'See Serbia', '', '', '', '', '0'),
(247, 'Kuwait', 'KW', 'Kuwaiti Dinar', 'KWD', '', 'Arabia Standard', '+03:00'),
(249, 'Kyrgyzstan', 'KG', 'Kyrgyzstani Som', 'KGS', '', '', '+06:00'),
(251, 'Lao People\'s Democratic Republic (formerly Laos)', 'LA', 'Kip', 'LAK', '', '', '+07:00'),
(253, 'Latvia', 'LV', 'Lats', 'LVL', '', 'Eastern European', '+02:00'),
(255, 'Lebanon', 'LB', 'Lebanese Pound', 'LBP', '', 'Eastern European', '+02:00'),
(257, 'Lesotho', 'LS', 'Loti, Maloti and South African Rand', 'LSL', '', '', '+02:00'),
(259, 'Liberia', 'LR', 'Liberian Dollar', 'LRD', '', 'Greenwich Mean', '00:00'),
(261, 'Libyan Arab Jamahiriya', 'LY', 'Libyan Dinar', 'LYD', '', 'Eastern European', '+02:00'),
(263, 'Liechtenstein', 'LI', 'Swiss Franc', 'CHF', '', 'Central European', '+01:00'),
(265, 'Lithuania', 'LT', 'Litas', 'LTL', '', 'Eastern European', '+02:00'),
(267, 'Luxembourg', 'LU', 'Euro', 'EUR', '', 'Central European', '+01:00'),
(269, 'Macao (also spelled Macau)', 'MO', 'Pataca', 'MOP', '', 'Macau Standard', '+08:00'),
(271, 'Macedonia, the Former Yugoslav Republic of', 'MK', 'Macedonian Dinar', 'MKD', '', 'Central European', '+01:00'),
(273, 'Madagascar', 'MG', 'Malagasy Franc', 'MGF', '', 'East Africa', '+03:00'),
(275, 'Malawi', 'MW', 'Malawian Kwacha', 'MWK', '', 'Central Africa', '+02:00'),
(277, 'Malaysia', 'MY', 'Ringgit (Malaysian Dollar)', 'MYR', '', 'Malaysian Standard', '+08:00'),
(279, 'Maldives', 'MV', 'Rufiyaa', 'MVR', '', '', '+05:00'),
(281, 'Mali', 'ML', 'Franc de la Communauté financière africaine and Ma', 'XAF', '', 'Greenwich Mean', '00:00'),
(283, 'Malta', 'MT', 'Euro', 'EUR', '', 'Central European', '+01:00'),
(285, 'Malvinas', 'See Falkla', '', '', '', 'Falkland Islands', '-04:00'),
(287, 'Marshall Islands', 'MH', 'US Dollar', 'USD', '', '', '+12:00'),
(289, 'Martinique', 'MQ', 'Euro', 'EUR', '', 'Eastern Caribbean', '-04:00'),
(291, 'Mauritania', 'MR', 'Ouguiya', 'MRO', '', '', '00:00'),
(293, 'Mauritius', 'MU', 'Mauritius Rupee', 'MUR', '', 'Mauritius', '+04:00'),
(295, 'Mayotte', 'YT', 'Euro', 'EUR', '', 'East Africa', '+03:00'),
(297, 'Mexico', 'MX', 'Mexican New Peso (replacement for Mexican Peso)', 'MXN', '', '', '0'),
(299, 'Micronesia, Federated States of', 'FM', 'US Dollar', 'USD', '', '', '0'),
(301, 'Moldova, Republic of', 'MD', 'Moldovian Leu', 'MDL', '', 'Eastern European', '+02:00'),
(303, 'Monaco', 'MC', 'Euro', 'EUR', '', 'Central European', '+01:00'),
(305, 'Mongolia', 'MN', 'Tugrik', 'MNT', '', '', '0'),
(307, 'Montenegro', 'See Serbia', '', '', '', 'Central European', '+01:00'),
(309, 'Montserrat', 'MS', 'East Caribbean Dollar', 'XCD', '', 'Eastern Caribbean', '-04:00'),
(311, 'Morocco', 'MA', 'Moroccan Dirham', 'MAD', '', 'Western European', '00:00'),
(313, 'Mozambique', 'MZ', 'Metical', 'MZM', '', 'Central Africa', '+02:00'),
(315, 'Myanmar (formerly Burma)', 'MM (former', 'Kyat', 'MMK', '', 'Myanmar Standard', '+06:30'),
(317, 'Namibia', 'NA', 'Namibia Dollar and South African Rand', 'NAD', '', 'West Africa', '+01:00'),
(319, 'Nauru', 'NR', 'Australian Dollar', 'AUD', '', '', '+12:00'),
(321, 'Nepal', 'NP', 'Nepalese Rupee', 'NPR', '', 'Nepal', '+05:45'),
(323, 'Netherlands', 'NL', 'Euro', 'EUR', '', '', '0'),
(325, 'Netherlands Antilles', 'AN', 'Netherlands Antilles Guilder (Florin)', 'ANG', '', 'Atlantic', '-04:00'),
(327, 'New Caledonia', 'NC', 'Franc des Comptoirs français du Pacifique', 'XPF', '', 'New Caledonia', '+11:00'),
(329, 'New Zealand', 'NZ', 'New Zealand Dollar', 'NZD', '', '', '0'),
(331, 'Nicaragua', 'NI', 'Córdoba', 'NIC', '', '', '-06:00'),
(333, 'Niger', 'NE', 'West African Franc and Franc de la Communauté fina', 'XOF', '', 'West Africa', '+01:00'),
(335, 'Nigeria', 'NG', 'Naira', 'NGN', '', 'West Africa', '+01:00'),
(337, 'Niue', 'NU', 'New Zealand Dollar', 'NZD', '', 'Niue', '-11:00'),
(339, 'Norfolk Island', 'NF', 'Australian Dollar', 'AUD', '', 'Norfolk', '+11:00'),
(341, 'Northern Mariana Islands', 'MP', 'US Dollar', 'USD', '', 'Chamorro', '+10:00'),
(343, 'Norway', 'NO', 'Norwegian Krone', 'NOK', '', 'Central European', '+01:00'),
(345, 'Oman', 'OM', 'Rial Omani', 'OMR', '', '', '+04:00'),
(347, 'Pakistan', 'PK', 'Pakistani Rupee', 'PKR', '', 'Pakistan Standard', '+05:00'),
(349, 'Palau', 'PW', 'US Dollar', 'USD', '', '', '+09:00'),
(351, 'Panama', 'PA', 'Balboa and US Dollar', 'PAB', '', '', '-05:00'),
(353, 'Papua New Guinea', 'PG', 'Kina', 'PGK', '', 'Papua New Guinea', '+10:00'),
(355, 'Paraguay', 'PY', 'Guarani', 'PYG', '', '', '-04:00'),
(357, 'Peru', 'PE', 'Inti and New Sol (New Sol replaced Sol)', 'PEI', '', 'Peru', '-05:00'),
(359, 'Philippines', 'PH', 'Philippines Peso', 'PHP', '', 'Philippine Standard', '+08:00'),
(361, 'Pitcairn Island', 'PN', 'New Zealand Dollar', 'NZD', '', 'Pitcairn Standard', '-08:00'),
(363, 'Poland', 'PL', 'New Zloty (replacement for Zloty)', 'PLN', '', 'Central European', '+01:00'),
(365, 'Portugal', 'PT', 'Euro', 'EUR', '', 'Western European', '00:00'),
(367, 'Puerto Rico', 'PR', 'US Dollar', 'USD', '', '', '-04:00'),
(369, 'Qatar', 'QA', 'Qatari Riyal', 'QAR', '', 'Arabia Standard', '+03:00'),
(371, 'Réunion', 'RE', 'Euro', 'EUR', '', '', '+04:00'),
(373, 'Romania', 'RO', 'Romanian Leu', 'ROL', '', 'Eastern European', '+02:00'),
(375, 'Russian Federation', 'RU', 'Russian Federation Rouble', 'RUB', '', '', '0'),
(377, 'Rwanda', 'RW', 'Rwanda Franc', 'RWF', '', 'Central Africa', '+02:00'),
(379, 'Saint', 'See also S', '', '', '', '', '0'),
(381, 'Saint Kitts (Christopher) and Nevis', 'KN', 'East Caribbean Dollar', 'XCD', '', '', '-04:00'),
(383, 'Saint Lucia', 'LC', 'East Caribbean Dollar', 'XCD', '', '', '-04:00'),
(385, 'Saint Vincent and the Grenadines', 'VC', 'East Caribbean Dollar', 'XCD', '', '', '-04:00'),
(387, 'Samoa', 'WS', 'Tala', 'WST', '', '', '+13:00'),
(389, 'San Marino', 'SM', 'Euro', 'EUR', '', 'Central European', '+01:00'),
(391, 'São Tomé and Príncipe', 'ST', 'Dobra', 'STD', '', '', '00:00'),
(393, 'Saudi Arabia', 'SA', 'Saudi Riyal', 'SAR', '', 'Arabia Standard', '+03:00'),
(395, 'Senegal', 'SN', 'West African Franc and Franc de la Communauté fina', 'XOF', '', '', '00:00'),
(397, 'Serbia and Montenegro (formerly Yugoslavia)', 'CS', 'Serbian Dinar (Serbia), Euro (Montenegro), Euro (K', 'CSD', '', 'Central European', '+01:00'),
(399, 'Seychelles', 'SC', 'Seychelles Rupee', 'SCR', '', 'Seychelles', '+04:00'),
(401, 'Sierra Leone', 'SL', 'Leone', 'SLL', '', '', '00:00'),
(403, 'Singapore', 'SG', 'Singapore Dollar', 'SGD', '', 'Singapore Standard', '+08:00'),
(405, 'Slovakia (Slovak Republic)', 'SK', 'Euro', 'EUR', '', 'Central European', '+01:00'),
(407, 'Slovenia', 'SI', 'Euro', 'EUR', '', 'Central European', '+01:00'),
(409, 'Solomon Islands', 'SB', 'Solomon Islands Dollar', 'SBD', '', '', '+11:00'),
(411, 'Somalia', 'SO', 'Somali Shilling', 'SOS', '', 'East Africa', '+03:00'),
(413, 'South Africa', 'ZA', 'Rand', 'ZAR', '', 'South Africa', '+02:00'),
(415, 'South Georgia and the South Sandwich Islands', 'GS', 'Pound Sterling', 'GBP', '', '', '-02:00'),
(417, 'Spain', 'ES', 'Euro', 'EUR', '', 'Central European', '+01:00'),
(419, 'Sri Lanka', 'LK', 'Sri Lankan Rupee', 'LKR', '', 'Sri Lanka Standard', '+05:30'),
(423, 'St Helena', 'SH', 'St Helena Pound', 'SHP', '', 'Greenwich Mean', '00:00'),
(425, 'St Pierre and Miquelon', 'PM', 'Euro', 'EUR', '', '', '-03:00'),
(427, 'Sudan', 'SD', 'Sudanese Pound (Dinar no longer used)', 'SDG', '', 'East Africa', '+03:00'),
(429, 'Suriname', 'SR', 'Surinam Guilder (also known as Florin)', 'SRG', '', 'Argentina', '-03:00'),
(431, 'Svalbard and Jan Mayen Islands', 'SJ', 'Norwegian Krone', 'NOK', '', '', '+01:00'),
(433, 'Swaziland', 'SZ', 'Lilangeni', 'SZL', '', '', '+02:00'),
(435, 'Sweden', 'SE', 'Swedish Krona', 'SEK', '', 'Central European', '+01:00'),
(437, 'Switzerland', 'CH', 'Swiss Franc', 'CHF', '', 'Central European', '+01:00'),
(439, 'Syrian Arab Republic', 'SY', 'Syrian Pound', 'SYP', '', 'Eastern European', '+02:00'),
(441, 'Taiwan, Province of China', 'TW', 'New Taiwan Dollar', 'TWD', '', '', '+08:00'),
(443, 'Tajikistan', 'TJ', 'Tajik Rouble (Russian Ruble [RUR] was formerly in ', 'TJR', '', '', '+05:00'),
(445, 'Tanzania, United Republic of', 'TZ', 'Tanzanian Shilling', 'TZS', '', 'East Africa', '+03:00'),
(447, 'Thailand', 'TH', 'Baht', 'THB', '', 'Thailand', '+07:00'),
(449, 'Timor', 'See East T', '', '', '', 'Timor Leste', '+09:00'),
(451, 'Togo', 'TG', 'Franc de la Communauté financière africaine', 'XAF', '', '', '00:00'),
(453, 'Tokelau', 'TK', 'New Zealand Dollar', 'NZD', '', 'Tokelau', '+13:00'),
(455, 'Tonga', 'TO', 'Pa\'anga', 'TOP', '', '', '+13:00'),
(457, 'Trinidad and Tobago', 'TT', 'Trinidad and Tobago Dollar', 'TTD', '', '', '-04:00'),
(459, 'Tunisia', 'TN', 'Tunisian Dinar', 'TND', '', 'Central European', '+01:00'),
(461, 'Turkey', 'TR', 'New Turkish Lira', 'TRY', '', 'Time in Turkey', '+03:00'),
(463, 'Turkmenistan', 'TM', 'Turkmenistani Manat', 'TMM', '', '', '+05:00'),
(465, 'Turks and Caicos Islands', 'TC', 'US Dollar', 'USD', '', 'Atlantic ', '-04:00'),
(467, 'Tuvalu', 'TV', 'Australian Dollar', 'AUD', '', '', '+12:00'),
(469, 'Uganda', 'UG', 'Ugandan Shilling', 'UGS', '', 'East Africa', '+03:00'),
(471, 'Ukraine', 'UA', 'Hryvna and Karbovanet', 'UAH', '', 'Eastern European', '+02:00'),
(473, 'Union of Soviet Socialist Republics', 'SU', 'USSR Rouble', 'SUR', '', '', '0'),
(475, 'United Arab Emirates', 'AE', 'UAE Dirham', 'AED', '', '', '+04:00'),
(477, 'United Kingdom', 'GB', 'Pound Sterling', 'GBP', '', 'Greenwich Mean', '00:00'),
(479, 'United States of America', 'US', 'US Dollar', 'USD', '', '', '0'),
(481, 'United States Minor Outlying Islands', 'UM', 'US Dollar', 'USD', '', '', '0'),
(483, 'Uruguay', 'UY', 'Uruguayan Peso', 'UYU', '', '', '-03:00'),
(485, 'Uzbekistan', 'UZ', 'Uzbekistani Som (Russian Ruble [RUR] was formerly ', 'UZS', '', 'Uzbekistan', '+05:00'),
(487, 'Vanautu', 'VU', 'Vatu', 'VUV', '', '', '+11:00'),
(489, 'Vatican City State', 'Now known ', '', '', '', 'Central European', '+01:00'),
(491, 'Venezuela', 'VE', 'Bolivar Fuerte', 'VEF', '', '', '-04:00'),
(493, 'Viet Nam', 'VN', 'Dông', 'VND', '', 'Indochina', '+07:00'),
(495, 'Virgin Islands (British)', 'VG', 'US Dollar (Pound Sterling and East Caribbean Dolla', 'USD', '', 'Atlantic', '-04:00'),
(497, 'Virgin Islands (US)', 'VI', 'US Dollar', 'USD', '', 'Atlantic', '-04:00'),
(499, 'Wallis and Futuna Islands', 'WF', 'Franc des Comptoirs français du Pacifique', 'XPF', '', '', '+12:00'),
(501, 'West Africa', 'XO?', 'West African Franc', 'XOF', '', '', '0'),
(503, 'Western Sahara', 'EH', 'Moroccan Dirham and Mauritanian Ouguiya', 'MAD', '', 'Western Sahara', '00:00'),
(505, 'Yemen (unified North and South)', 'YE (former', 'Riyal (Dinar was used in South Yemen)', 'YER', '', '', '+03:00'),
(507, 'Yugoslavia', 'See Serbia', '', '', '', '', '0'),
(509, 'Zaïre', 'Former nam', '', '', '', '', '0'),
(511, 'Zambia', 'ZM', 'Zambian Kwacha', 'ZMK', '', 'Central Africa', '+02:00'),
(513, 'Zimbabwe', 'ZW', 'US Dollar (and other currencies)', 'USD', '', 'Central Africa', '+02:00'),
(514, 'India', 'IN', 'Indian Rupee', 'INR', '', 'Indian Standard', '+05:30'),
(515, 'France', 'FR', 'Euro', 'EUR', '', 'Central Eu', '0'),
(516, 'Canada', 'CA', 'Canadian Dollar', 'CAD', '', 'Eastern St', '0'),
(517, 'Canada', 'CA', 'Canadian Dollar', 'CAD', '', 'Eastern', '-05:00'),
(518, 'Canada', 'CA', 'Canadian Dollar', 'CAD', '', 'Mountain', '-07:00'),
(519, 'Canada', 'CA', 'Canadian Dollar', 'CAD', '', 'Central', '-06:00'),
(520, 'Canada', 'CA', 'Canadian Dollar', 'CAD', '', 'Atlantic', '-04:00'),
(521, 'Canada', 'CA', 'Canadian Dollar', 'CAD', '', 'Newfoundland', '-03:00'),
(522, 'Germany (West and East)', 'DE (former', 'Euro', 'EUR', '', 'Central European', '+01:00'),
(523, 'China', 'CN', 'Yuan Renminbi', 'CNY', '', 'Beijing Ti', '0'),
(524, 'Chile', 'CL', 'Unidades de Fomento and Chilean Peso', 'CLF', '', 'Easter Island', '-05:00'),
(525, 'Congo', 'CG', 'Franc de la Communauté financière africaine', 'XAF', '', 'West Africa', '+01:00'),
(526, 'Kazakhstan', 'KZ', 'Tenge (Russian Ruble [RUR] was formerly in use)', 'KZT', '', 'Oral', '+05:00'),
(527, 'Spain', 'ES', 'Euro', 'EUR', '', 'Western European', '00:00');

-- --------------------------------------------------------

--
-- Table structure for table `fleets`
--

CREATE TABLE `fleets` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organisation_id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `billing_plan_id` int(10) UNSIGNED NOT NULL,
  `latitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_reservation_duration` int(10) UNSIGNED DEFAULT NULL,
  `support_email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alert_email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_private` tinyint(4) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `created_at` int(10) UNSIGNED DEFAULT NULL,
  `timestamp` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fleets`
--

INSERT INTO `fleets` (`id`, `name`, `organisation_id`, `country_id`, `billing_plan_id`, `latitude`, `longitude`, `vehicle_reservation_duration`, `support_email`, `alert_email`, `is_private`, `state`, `created_at`, `timestamp`) VALUES
(1, 'joyride only', 1, 1, 1, '33.3652478', '33.698214', 10, 'joyride@gmail.com', 'joyride@gmail.com', 1, 0, 1542672000, NULL),
(2, 'EI Paso', 2, 3, 2, '34.3652478', '34.698214', 20, 'eipaso@gmail.com', 'eipaso@gmail.com', 1, 0, 1542672000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fleet_promo`
--

CREATE TABLE `fleet_promo` (
  `fleet_id` int(11) NOT NULL,
  `promo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fleet_promo`
--

INSERT INTO `fleet_promo` (`fleet_id`, `promo_id`) VALUES
(1, 2),
(1, 4),
(2, 1),
(2, 3),
(2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `fleet_vehicle_map`
--

CREATE TABLE `fleet_vehicle_map` (
  `fleet_id` int(10) UNSIGNED NOT NULL,
  `vehicle_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fleet_vehicle_map`
--

INSERT INTO `fleet_vehicle_map` (`fleet_id`, `vehicle_id`) VALUES
(1, 2),
(1, 4),
(2, 3),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `location_history`
--

CREATE TABLE `location_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `ride_id` int(10) UNSIGNED NOT NULL,
  `vehicle_id` int(10) UNSIGNED NOT NULL,
  `latitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` int(10) UNSIGNED DEFAULT NULL,
  `app_timestamp` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `map_markers`
--

CREATE TABLE `map_markers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fleet_id` int(10) UNSIGNED NOT NULL,
  `latitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `zone_accuracy_radius` double(8,2) DEFAULT NULL,
  `state` tinyint(4) NOT NULL,
  `timestamp` int(10) UNSIGNED DEFAULT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `map_markers`
--

INSERT INTO `map_markers` (`id`, `name`, `type`, `fleet_id`, `latitude`, `longitude`, `description`, `zone_accuracy_radius`, `state`, `timestamp`, `created_at`) VALUES
(1, 'Khalda Parking Lot', 'parking1', 1, '31.98294711996688', '35.84214638689161', 'Parking 1 Khalda Parking Lot', 23.34, 0, 1542672000, 0),
(2, 'Reza Parking Lot', 'parking2', 2, '33.98294711996688', '31.84214638689161', 'Parking 2 Khalda Parking Lot', 23.34, 0, 1232345456, 0),
(3, 'Sifa Parking Lot', 'parking3', 1, '34.98294711996688', '32.84214638689161', 'Parking 3 Khalda Parking Lot', 23.34, 0, 1234324345, 0),
(4, 'Zooya Parking Lot', 'parking4', 2, '35.98294711996688', '33.84214638689161', 'Parking 4 Khalda Parking Lot', 23.34, 0, 1542844800, 0),
(5, 'Sam Parking Lot', 'parking5', 1, '36.98294711996688', '34.84214638689161', 'Parking 5 Khalda Parking Lot', 23.34, 0, 1234324345, 0),
(6, 'Alpha One Parking Lot', 'Parking 6', 2, '23.0401', '72.53155', 'Peking 6', 21.32, 0, 1542844800, 1542844800);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2018_11_13_053717_create_billing_plans_table', 1),
(9, '2018_11_13_065738_create_country_table', 1),
(10, '2018_11_13_070415_create_organisation_table', 1),
(11, '2018_11_13_070943_create_promo_table', 1),
(12, '2018_11_13_071659_create_fleet_table', 1),
(13, '2018_11_13_072439_create_app_content_table', 1),
(14, '2018_11_13_072957_create_vehicle_table', 1),
(15, '2018_11_13_074013_create_battery_log_table', 1),
(16, '2018_11_13_074250_create_rides_table', 1),
(17, '2018_11_13_075521_create_rides_log_table', 1),
(18, '2018_11_13_084858_create_location_history_table', 1),
(19, '2018_11_13_085235_create_map_marker_table', 1),
(20, '2018_11_13_085737_create_offer_table', 1),
(21, '2018_11_13_091208_create_payment_receive_table', 1),
(22, '2018_11_13_091632_create_payment_sent_table', 1),
(23, '2018_11_13_092101_create_promo_accounts_table', 1),
(24, '2018_11_13_092609_create_reservation_table', 1),
(25, '2018_11_13_092754_create_supports_table', 1),
(26, '2018_11_13_093256_create_user_map_table', 1),
(27, '2018_11_13_093912_create_vehicle_log_table', 1),
(28, '2018_11_13_093931_create_vehicl_status_table', 1),
(29, '2018_11_14_083919_create_fleet_promo_table', 1),
(30, '2018_11_14_110332_create_fleet_vehicle_table', 1),
(31, '2018_11_20_092348_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `fleet_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_timestamp` int(10) UNSIGNED DEFAULT NULL,
  `end_timestamp` int(10) UNSIGNED DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `category` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `radius_km` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `query_string` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `fleet_id`, `title`, `body`, `image`, `website`, `start_timestamp`, `end_timestamp`, `code`, `state`, `category`, `notes`, `latitude`, `longitude`, `radius_km`, `status`, `query_string`, `timestamp`) VALUES
(1, 1, 'node', 'sdsf', 'upstack_logo.png', 'techflack.com', 1542931200, 1542931200, '123', 0, 'abc', 'asdsf', '33.365247', '72.53155', 12, 0, 'free ride', 1542931200),
(2, 2, 'node', 'sdsf', 'images (1).png', 'techfilter.com', 1542931200, 1542931200, '123', 0, 'abc', 'sdf', '33.365247', '72.5315', 12, 0, 'free ride', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organisations`
--

CREATE TABLE `organisations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `deposit` double(8,2) DEFAULT NULL,
  `use_deposit` tinyint(4) DEFAULT NULL,
  `timestamp` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organisations`
--

INSERT INTO `organisations` (`id`, `name`, `alias`, `type`, `country_id`, `deposit`, `use_deposit`, `timestamp`) VALUES
(1, 'Joyride', 'J', 'Olive', 1, 1000.00, 0, NULL),
(2, 'Glide', 'G', 'Devile', 2, 1000.00, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments_received`
--

CREATE TABLE `payments_received` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `transaction_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_timestamp` int(10) UNSIGNED DEFAULT NULL,
  `timestamp` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments_sent`
--

CREATE TABLE `payments_sent` (
  `id` int(10) UNSIGNED NOT NULL,
  `bill_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promo_id` int(10) UNSIGNED NOT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `ride_id` int(10) UNSIGNED NOT NULL,
  `timestamp` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promos`
--

CREATE TABLE `promos` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `max_use` int(10) UNSIGNED DEFAULT NULL,
  `max_daily_use` int(10) UNSIGNED DEFAULT NULL,
  `promo_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_timestamp` int(10) UNSIGNED DEFAULT NULL,
  `end_timestamp` int(10) UNSIGNED DEFAULT NULL,
  `timestamp` int(10) UNSIGNED DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `promo_price` double(8,2) DEFAULT NULL,
  `query_string` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_use` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promos`
--

INSERT INTO `promos` (`id`, `type`, `name`, `description`, `max_use`, `max_daily_use`, `promo_code`, `status`, `start_timestamp`, `end_timestamp`, `timestamp`, `state`, `promo_price`, `query_string`, `total_use`) VALUES
(1, 'Free Ride', 'News', 'dlklfmdflkmgdlfkmgdkf;jnm;gohjoimgdovndxlkncvo[sdi', 10, 1, '1234567', 'on', 1542672000, 1545264000, 1542672000, 0, 50000.00, 'fdssdfdgdfdffvbdf', 6),
(2, 'Flat Discount At Bil', 'Node', 'sdfmdslkfm', 5, 1, '143543', 'on', 1234565768, 1276874536, 1567645635, 0, 10000.00, 'sfdnkslfnksl', 2),
(3, 'Wallet Credit', 'Tomcat', 'smcdsigjofiommcsionfriongfbnoifnv', 20, 2, '65768', 'off', 1345267876, 342567687, 1232314546, 0, 15000.00, 'smfdslkfmdskjgmnfds;', 12),
(4, 'Percent Discount At ', 'Demo', 'How to Delete or Remove Mysql Data using Ajax in Laravel', 30, 3, '241235', 'on', 435960545, 1232454653, 1234324345, 0, 20000.00, 'How to Delete or Remove Mysql Data using Ajax in LaravelHow to Delete or Remove Mysql Data using Ajax in LaravelHow to Delete or Remove Mysql Data using Ajax in Laravel', 15),
(5, 'Free Ride', 'Bookmark', 'Free RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree Ride', 15, 1, '3245434', 'on', 1232435656, 1565456456, 1232345456, 0, 90000.00, 'Free RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree Ride', 2),
(6, 'Percent Discount At ', 'Bookmark', 'Free RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree Ride', 15, 1, '3245434', 'on', 1232435656, 1565456456, 1232345456, 0, 90000.00, 'Free RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree Ride', 2),
(7, 'Free Ride', 'Bookmark', 'Free RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree Ride', 15, 1, '3245434', 'on', 1232435656, 1565456456, 1232345456, 0, 90000.00, 'Free RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree Ride', 2),
(8, 'Wallet Credit', 'Bookmark', 'Free RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree Ride', 15, 1, '3245434', 'on', 1232435656, 1565456456, 1232345456, 0, 90000.00, 'Free RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree RideFree Ride', 2),
(9, 'Flat Discount At Bill', 'Node', 'flat discount', 50, 4, '23234', 'active', 1541462400, 1545868800, 1542672000, 0, 45637.00, 'free ride', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promo_accounts`
--

CREATE TABLE `promo_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `promo_id` int(10) UNSIGNED NOT NULL,
  `timestamp` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `vehicle_id` int(10) UNSIGNED NOT NULL,
  `start_timestamp` int(10) UNSIGNED DEFAULT NULL,
  `end_timestamp` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rides`
--

CREATE TABLE `rides` (
  `id` int(10) UNSIGNED NOT NULL,
  `vehicle_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `start_timestamp` int(10) UNSIGNED DEFAULT NULL,
  `end_timestamp` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_latitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_longitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_latitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_longitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_timestamp` int(10) UNSIGNED DEFAULT NULL,
  `server_timestamp` int(10) UNSIGNED DEFAULT NULL,
  `vehicle_timestamp` int(10) UNSIGNED DEFAULT NULL,
  `avg_speed` double(8,2) DEFAULT NULL,
  `distance` double(8,2) DEFAULT NULL,
  `calories` double(8,2) DEFAULT NULL,
  `rating` int(10) UNSIGNED DEFAULT NULL,
  `duration` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rides`
--

INSERT INTO `rides` (`id`, `vehicle_id`, `user_id`, `start_timestamp`, `end_timestamp`, `status`, `start_latitude`, `start_longitude`, `end_latitude`, `end_longitude`, `app_timestamp`, `server_timestamp`, `vehicle_timestamp`, `avg_speed`, `distance`, `calories`, `rating`, `duration`) VALUES
(1, 1, 1, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15.50, NULL, 5, 30),
(2, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20.30, NULL, 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `rides_log`
--

CREATE TABLE `rides_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `ride_id` int(10) UNSIGNED NOT NULL,
  `platform` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destination` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `timestamp` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supports`
--

CREATE TABLE `supports` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `vehicle_id` int(10) UNSIGNED NOT NULL,
  `email_to` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(10) UNSIGNED DEFAULT NULL,
  `timestamp` int(10) UNSIGNED DEFAULT NULL,
  `username` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` double(8,2) DEFAULT NULL,
  `deposite` double(8,2) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `device_id` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_id` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_version` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os_version` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `country_code`, `phone_number`, `email`, `password`, `type`, `created_at`, `timestamp`, `username`, `balance`, `deposite`, `state`, `gender`, `notes`, `device_id`, `fcm_id`, `device_token`, `app_version`, `os_version`, `platform`, `distance`, `language_id`, `remember_token`) VALUES
(1, 'admin', 'admin', NULL, '15621616', 'admin@gmail.com', '$2y$10$Hfw.6DdGtP0OgIBEfI0x1uheGND9IKxjzO2Hs8f46swIWyYujAeve', 'admin', 1542672000, NULL, 'admin', 15.00, 100.00, 0, 'm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_fleet_map`
--

CREATE TABLE `user_fleet_map` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `fleet_id` int(10) UNSIGNED NOT NULL,
  `private_fleets` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_fleet_map`
--

INSERT INTO `user_fleet_map` (`user_id`, `fleet_id`, `private_fleets`) VALUES
(8, 1, NULL),
(9, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imei` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gps_imei` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qr_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_code` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `claim_code` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `mac_address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sim_phone_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(10) UNSIGNED DEFAULT NULL,
  `timestamp` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `name`, `imei`, `gps_imei`, `qr_code`, `key_code`, `claim_code`, `state`, `mac_address`, `type`, `notes`, `sim_phone_number`, `created_at`, `timestamp`) VALUES
(1, '90001', '12321565469', '1656541', '3165184', 'A101', '32156513', 0, '00-14-22-01-23-45', 'cycle', 'this is cycle note', '1236547891', NULL, NULL),
(2, '90002', '764965321', '5461131', '6546413', 'A102', '13541', 0, '03-24-34-21-33-45', 'bike', 'this is bike note', '984624161321', NULL, NULL),
(3, 'Node', '123', '123', '123', '123', '123', 0, '123', 'OGB', '123', '1234567890', 1542672000, NULL),
(4, 'Node1', '1234', '1234', '1234', '1234', '1234', 0, '1234', 'AXA', '1234', '12345678', 1542672000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_log`
--

CREATE TABLE `vehicle_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `vehicle_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `timestamp` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_status`
--

CREATE TABLE `vehicle_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `vehicle_id` int(10) UNSIGNED NOT NULL,
  `latitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_timestamp` int(10) UNSIGNED DEFAULT NULL,
  `status` int(10) UNSIGNED DEFAULT NULL,
  `status_timestamp` int(10) UNSIGNED DEFAULT NULL,
  `server_timestamp` int(10) UNSIGNED DEFAULT NULL,
  `flag_missing` tinyint(4) DEFAULT NULL,
  `flag_maintenance` tinyint(4) DEFAULT NULL,
  `flag_vehicle_fault` tinyint(4) DEFAULT NULL,
  `flag_lock_fault` tinyint(4) DEFAULT NULL,
  `flag_battery_critical` tinyint(4) DEFAULT NULL,
  `flag_unavailable` tinyint(4) DEFAULT NULL,
  `flag_unlock_fails` tinyint(4) DEFAULT NULL,
  `flag_stagnant` tinyint(4) DEFAULT NULL,
  `is_ride_parked` tinyint(4) DEFAULT NULL,
  `vehicle_battery` double(8,2) DEFAULT NULL,
  `gps_battery` double(8,2) DEFAULT NULL,
  `reservation_start_timestamp` int(10) UNSIGNED DEFAULT NULL,
  `reservation_end_timestamp` int(10) UNSIGNED DEFAULT NULL,
  `reservation_user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_content`
--
ALTER TABLE `app_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `battery_log`
--
ALTER TABLE `battery_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_plans`
--
ALTER TABLE `billing_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fleets`
--
ALTER TABLE `fleets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fleet_promo`
--
ALTER TABLE `fleet_promo`
  ADD PRIMARY KEY (`fleet_id`,`promo_id`);

--
-- Indexes for table `location_history`
--
ALTER TABLE `location_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `map_markers`
--
ALTER TABLE `map_markers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organisations`
--
ALTER TABLE `organisations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments_received`
--
ALTER TABLE `payments_received`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments_sent`
--
ALTER TABLE `payments_sent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promos`
--
ALTER TABLE `promos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promo_accounts`
--
ALTER TABLE `promo_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rides`
--
ALTER TABLE `rides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rides_log`
--
ALTER TABLE `rides_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `supports`
--
ALTER TABLE `supports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_log`
--
ALTER TABLE `vehicle_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_status`
--
ALTER TABLE `vehicle_status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_content`
--
ALTER TABLE `app_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `battery_log`
--
ALTER TABLE `battery_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billing_plans`
--
ALTER TABLE `billing_plans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=528;

--
-- AUTO_INCREMENT for table `fleets`
--
ALTER TABLE `fleets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `location_history`
--
ALTER TABLE `location_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `map_markers`
--
ALTER TABLE `map_markers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `organisations`
--
ALTER TABLE `organisations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments_received`
--
ALTER TABLE `payments_received`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments_sent`
--
ALTER TABLE `payments_sent`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promos`
--
ALTER TABLE `promos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `promo_accounts`
--
ALTER TABLE `promo_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rides`
--
ALTER TABLE `rides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rides_log`
--
ALTER TABLE `rides_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supports`
--
ALTER TABLE `supports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vehicle_log`
--
ALTER TABLE `vehicle_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_status`
--
ALTER TABLE `vehicle_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
