-- --------------------------------------------------------
-- Host:                         db4free.net
-- Server version:               8.0.15 - MySQL Community Server - GPL
-- Server OS:                    linux-glibc2.12
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for car_service
CREATE DATABASE IF NOT EXISTS `car_service` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `car_service`;

-- Dumping structure for table car_service.authorities
CREATE TABLE IF NOT EXISTS `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `username_authority` (`username`,`authority`),
  CONSTRAINT `FK__users` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table car_service.authorities: ~0 rows (approximately)
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` (`username`, `authority`) VALUES
	('admin', 'ROLE_ADMIN'),
	('admin', 'ROLE_USER'),
	('misho', 'ROLE_USER');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;

-- Dumping structure for table car_service.car_event
CREATE TABLE IF NOT EXISTS `car_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `total_price` double NOT NULL,
  `finalized` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `customer_car` FOREIGN KEY (`id`) REFERENCES `customer_cars` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table car_service.car_event: ~0 rows (approximately)
/*!40000 ALTER TABLE `car_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_event` ENABLE KEYS */;

-- Dumping structure for table car_service.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table car_service.customer: ~0 rows (approximately)
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- Dumping structure for table car_service.customer_cars
CREATE TABLE IF NOT EXISTS `customer_cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `VIN` varchar(13) NOT NULL,
  `plate_number` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `VIN_UNIQUE` (`VIN`),
  UNIQUE KEY `plate_number_UNIQUE` (`plate_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table car_service.customer_cars: ~0 rows (approximately)
/*!40000 ALTER TABLE `customer_cars` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_cars` ENABLE KEYS */;

-- Dumping structure for table car_service.make
CREATE TABLE IF NOT EXISTS `make` (
  `make_id` int(11) NOT NULL AUTO_INCREMENT,
  `make_name` varchar(45) NOT NULL,
  PRIMARY KEY (`make_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table car_service.make: ~0 rows (approximately)
/*!40000 ALTER TABLE `make` DISABLE KEYS */;
INSERT INTO `make` (`make_id`, `make_name`) VALUES
	(1, 'Alfa Romeo'),
	(2, 'Audi'),
	(3, 'Citroen'),
	(4, 'Ferrari'),
	(5, 'Fiat'),
	(6, 'Ford'),
	(7, 'Honda'),
	(8, 'Kia'),
	(9, 'Mazda'),
	(10, 'Mercedes-Benz'),
	(11, 'Mitsubishi'),
	(12, 'Nissan'),
	(13, 'Opel'),
	(14, 'Peugeot'),
	(15, 'Porsche'),
	(16, 'Renault'),
	(17, 'Seat'),
	(18, 'Skoda'),
	(19, 'Subaru'),
	(20, 'Suzuki'),
	(21, 'Toyota'),
	(22, 'VW'),
	(23, 'Volvo');
/*!40000 ALTER TABLE `make` ENABLE KEYS */;

-- Dumping structure for table car_service.models
CREATE TABLE IF NOT EXISTS `models` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `make_id` int(11) NOT NULL,
  `model_name` varchar(45) NOT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`model_id`),
  KEY `fk_cars_make_idx` (`make_id`),
  CONSTRAINT `fk_cars_make` FOREIGN KEY (`make_id`) REFERENCES `make` (`make_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1023 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table car_service.models: ~0 rows (approximately)
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
INSERT INTO `models` (`model_id`, `make_id`, `model_name`, `year`) VALUES
	(1, 1, '145', NULL),
	(2, 1, '146', NULL),
	(3, 1, '147', NULL),
	(4, 1, '155', NULL),
	(5, 1, '156', NULL),
	(6, 1, '156 sportwagon', NULL),
	(7, 1, '159', NULL),
	(8, 1, '159 sportwagon', NULL),
	(9, 1, '164', NULL),
	(10, 1, '166', NULL),
	(11, 1, '33', NULL),
	(12, 1, '4C', NULL),
	(13, 1, '75', NULL),
	(14, 1, '76', NULL),
	(15, 1, '8C Competizione', NULL),
	(16, 1, '90', NULL),
	(17, 1, 'Alfetta', NULL),
	(18, 1, 'Berlina', NULL),
	(19, 1, 'Brera', NULL),
	(20, 1, 'Crosswagon q4', NULL),
	(21, 1, 'Giulia', NULL),
	(22, 1, 'Giulietta', NULL),
	(23, 1, 'Gt', NULL),
	(24, 1, 'Gtv', NULL),
	(25, 1, 'MiTo', NULL),
	(26, 1, 'Spider', NULL),
	(27, 1, 'Sprint', NULL),
	(28, 1, 'Stelvio', NULL),
	(29, 1, 'Sud ', NULL),
	(30, 2, '100', NULL),
	(31, 2, '200', NULL),
	(32, 2, '50', NULL),
	(33, 2, '60', NULL),
	(34, 2, '80', NULL),
	(35, 2, '90', NULL),
	(36, 2, 'A1', NULL),
	(37, 2, 'A2', NULL),
	(38, 2, 'A3', NULL),
	(39, 2, 'A4', NULL),
	(40, 2, 'A5', NULL),
	(41, 2, 'A6', NULL),
	(42, 2, 'A7', NULL),
	(43, 2, 'A8', NULL),
	(44, 2, 'Allroad', NULL),
	(45, 2, 'E-Tron', NULL),
	(46, 2, 'Q2', NULL),
	(47, 2, 'Q3', NULL),
	(48, 2, 'Q5', NULL),
	(49, 2, 'Q7', NULL),
	(50, 2, 'Q8', NULL),
	(51, 2, 'R8', NULL),
	(52, 2, 'Rs3', NULL),
	(53, 2, 'Rs4', NULL),
	(54, 2, 'Rs5', NULL),
	(55, 2, 'Rs6', NULL),
	(56, 2, 'Rs7', NULL),
	(57, 2, 'S2', NULL),
	(58, 2, 'S3', NULL),
	(59, 2, 'S4', NULL),
	(60, 2, 'S5', NULL),
	(61, 2, 'S6', NULL),
	(62, 2, 'S7', NULL),
	(63, 2, 'S8', NULL),
	(64, 2, 'SQ5', NULL),
	(65, 2, 'SQ7', NULL),
	(66, 2, 'Tt', NULL),
	(67, 3, '2cv', NULL),
	(68, 3, 'Ax', NULL),
	(69, 3, 'Axel', NULL),
	(70, 3, 'Berlingo', NULL),
	(71, 3, 'Bx', NULL),
	(72, 3, 'C-Zero', NULL),
	(73, 3, 'C-Crosser', NULL),
	(74, 3, 'C-Elysee', NULL),
	(75, 3, 'C1', NULL),
	(76, 3, 'C15', NULL),
	(77, 3, 'C2', NULL),
	(78, 3, 'C3', NULL),
	(79, 3, 'C3 Picasso', NULL),
	(80, 3, 'C3 pluriel', NULL),
	(81, 3, 'C4', NULL),
	(82, 3, 'C4 AIRCROSS', NULL),
	(83, 3, 'C4 Cactus', NULL),
	(84, 3, 'C4 Picasso', NULL),
	(85, 3, 'C5', NULL),
	(86, 3, 'C6', NULL),
	(87, 3, 'C8', NULL),
	(88, 3, 'Cx', NULL),
	(89, 3, 'DS3', NULL),
	(90, 3, 'DS4', NULL),
	(91, 3, 'DS5', NULL),
	(92, 3, 'DS7', NULL),
	(93, 3, 'Ds', NULL),
	(94, 3, 'Evasion', NULL),
	(95, 3, 'Grand C4 Picasso', NULL),
	(96, 3, 'Gsa', NULL),
	(97, 3, 'Gx', NULL),
	(98, 3, 'Ln', NULL),
	(99, 3, 'Nemo', NULL),
	(100, 3, 'Oltcit', NULL),
	(101, 3, 'Saxo', NULL),
	(102, 3, 'Visa', NULL),
	(103, 3, 'Xantia', NULL),
	(104, 3, 'Xm', NULL),
	(105, 3, 'Xsara', NULL),
	(106, 3, 'Xsara picasso', NULL),
	(107, 3, 'Zx', NULL),
	(108, 4, '308', NULL),
	(109, 4, '348', NULL),
	(110, 4, '360 modena', NULL),
	(111, 4, '360 spider', NULL),
	(112, 4, '458 Italia', NULL),
	(113, 4, '488', NULL),
	(114, 4, '599', NULL),
	(115, 4, '812 Superfast', NULL),
	(116, 4, 'California', NULL),
	(117, 4, 'Enzo', NULL),
	(118, 4, 'F12berlinetta', NULL),
	(119, 4, 'F430', NULL),
	(120, 4, 'F456m', NULL),
	(121, 4, 'F575m maranello', NULL),
	(122, 4, 'F612 scaglietti', NULL),
	(123, 4, 'FF', NULL),
	(124, 4, 'GTC4Lusso', NULL),
	(125, 4, 'LaFerrari', NULL),
	(126, 4, 'Mondial 8', NULL),
	(127, 4, 'Testarossa', NULL),
	(128, 5, '1100', NULL),
	(129, 5, '124', NULL),
	(130, 5, '125', NULL),
	(131, 5, '126', NULL),
	(132, 5, '127', NULL),
	(133, 5, '128', NULL),
	(134, 5, '131', NULL),
	(135, 5, '132', NULL),
	(136, 5, '1400', NULL),
	(137, 5, '1500', NULL),
	(138, 5, '1800', NULL),
	(139, 5, '500', NULL),
	(140, 5, '500L', NULL),
	(141, 5, '500X', NULL),
	(142, 5, '600', NULL),
	(143, 5, '650', NULL),
	(144, 5, '750', NULL),
	(145, 5, 'Albea', NULL),
	(146, 5, 'Argenta', NULL),
	(147, 5, 'Barchetta', NULL),
	(148, 5, 'Bertone', NULL),
	(149, 5, 'Brava', NULL),
	(150, 5, 'Bravo', NULL),
	(151, 5, 'Campagnola', NULL),
	(152, 5, 'Cinquecento', NULL),
	(153, 5, 'Coupe', NULL),
	(154, 5, 'Croma', NULL),
	(155, 5, 'Doblo', NULL),
	(156, 5, 'Duna', NULL),
	(157, 5, 'Fiorino', NULL),
	(158, 5, 'Freemont', NULL),
	(159, 5, 'Fullback', NULL),
	(160, 5, 'Idea', NULL),
	(161, 5, 'Linea', NULL),
	(162, 5, 'Marea', NULL),
	(163, 5, 'Multipla', NULL),
	(164, 5, 'Palio', NULL),
	(165, 5, 'Panda', NULL),
	(166, 5, 'Punto', NULL),
	(167, 5, 'Qubo', NULL),
	(168, 5, 'Regata', NULL),
	(169, 5, 'Ritmo', NULL),
	(170, 5, 'Scudo', NULL),
	(171, 5, 'Sedici', NULL),
	(172, 5, 'Seicento', NULL),
	(173, 5, 'Siena', NULL),
	(174, 5, 'Stilo', NULL),
	(175, 5, 'Strada', NULL),
	(176, 5, 'Tempra', NULL),
	(177, 5, 'Tipo', NULL),
	(178, 5, 'Topolino', NULL),
	(179, 5, 'Ulysse', NULL),
	(180, 5, 'Uno', NULL),
	(181, 6, '12m', NULL),
	(182, 6, '15m', NULL),
	(183, 6, '17m', NULL),
	(184, 6, '20m', NULL),
	(185, 6, 'Aerostar', NULL),
	(186, 6, 'B-Max', NULL),
	(187, 6, 'Bronco', NULL),
	(188, 6, 'C-max', NULL),
	(189, 6, 'Capri', NULL),
	(190, 6, 'Connect', NULL),
	(191, 6, 'Consul', NULL),
	(192, 6, 'Cortina', NULL),
	(193, 6, 'Cosworth', NULL),
	(194, 6, 'Cougar', NULL),
	(195, 6, 'Countur', NULL),
	(196, 6, 'Courier', NULL),
	(197, 6, 'Crown victoria', NULL),
	(198, 6, 'EcoSport', NULL),
	(199, 6, 'Ecoline', NULL),
	(200, 6, 'Edge', NULL),
	(201, 6, 'Escape', NULL),
	(202, 6, 'Escort', NULL),
	(203, 6, 'Everest', NULL),
	(204, 6, 'Excursion', NULL),
	(205, 6, 'Expedition', NULL),
	(206, 6, 'Explorer', NULL),
	(207, 6, 'F150', NULL),
	(208, 6, 'F250', NULL),
	(209, 6, 'F350', NULL),
	(210, 6, 'F450', NULL),
	(211, 6, 'F550', NULL),
	(212, 6, 'F650', NULL),
	(213, 6, 'F750', NULL),
	(214, 6, 'Fiesta', NULL),
	(215, 6, 'Flex', NULL),
	(216, 6, 'Focus', NULL),
	(217, 6, 'Fusion', NULL),
	(218, 6, 'Galaxy', NULL),
	(219, 6, 'Granada', NULL),
	(220, 6, 'Ka', NULL),
	(221, 6, 'Kuga', NULL),
	(222, 6, 'Maverick', NULL),
	(223, 6, 'Mercury', NULL),
	(224, 6, 'Mondeo', NULL),
	(225, 6, 'Mustang', NULL),
	(226, 6, 'Orion', NULL),
	(227, 6, 'Probe', NULL),
	(228, 6, 'Puma', NULL),
	(229, 6, 'Ranger', NULL),
	(230, 6, 'Rs', NULL),
	(231, 6, 'S-Max', NULL),
	(232, 6, 'Scorpio', NULL),
	(233, 6, 'Sierra', NULL),
	(234, 6, 'Sportka', NULL),
	(235, 6, 'Streetka', NULL),
	(236, 6, 'Taunus', NULL),
	(237, 6, 'Taurus', NULL),
	(238, 6, 'Thunderbird', NULL),
	(239, 6, 'Windstar', NULL),
	(240, 6, 'Zephyr', NULL),
	(241, 7, 'Accord', NULL),
	(242, 7, 'Cbr', NULL),
	(243, 7, 'Cbx', NULL),
	(244, 7, 'City', NULL),
	(245, 7, 'Civic', NULL),
	(246, 7, 'Civic ballade', NULL),
	(247, 7, 'Concerto', NULL),
	(248, 7, 'Cr-v', NULL),
	(249, 7, 'Crosstour', NULL),
	(250, 7, 'Crx', NULL),
	(251, 7, 'Crz', NULL),
	(252, 7, 'Element', NULL),
	(253, 7, 'Elysion', NULL),
	(254, 7, 'Fit', NULL),
	(255, 7, 'Fr-v', NULL),
	(256, 7, 'Hr-v', NULL),
	(257, 7, 'Insight', NULL),
	(258, 7, 'Integra', NULL),
	(259, 7, 'Jazz', NULL),
	(260, 7, 'Legend', NULL),
	(261, 7, 'Logo', NULL),
	(262, 7, 'Nsx', NULL),
	(263, 7, 'Odyssey', NULL),
	(264, 7, 'Passport', NULL),
	(265, 7, 'Pilot', NULL),
	(266, 7, 'Prelude', NULL),
	(267, 7, 'Quintet', NULL),
	(268, 7, 'Ridgeline', NULL),
	(269, 7, 'S2000', NULL),
	(270, 7, 'Shuttle', NULL),
	(271, 7, 'Stream', NULL),
	(272, 8, 'Avella delta', NULL),
	(273, 8, 'Cadenza', NULL),
	(274, 8, 'Carens', NULL),
	(275, 8, 'Carnival', NULL),
	(276, 8, 'Ceed', NULL),
	(277, 8, 'Cerato', NULL),
	(278, 8, 'Clarus', NULL),
	(279, 8, 'Joecs', NULL),
	(280, 8, 'Joyce', NULL),
	(281, 8, 'Magentis', NULL),
	(282, 8, 'Mohave', NULL),
	(283, 8, 'Morning', NULL),
	(284, 8, 'Niro', NULL),
	(285, 8, 'Opirus', NULL),
	(286, 8, 'Optima', NULL),
	(287, 8, 'Picanto', NULL),
	(288, 8, 'Pride', NULL),
	(289, 8, 'Pro ceed', NULL),
	(290, 8, 'Quoris', NULL),
	(291, 8, 'Ray', NULL),
	(292, 8, 'Retona', NULL),
	(293, 8, 'Rio', NULL),
	(294, 8, 'Sedona', NULL),
	(295, 8, 'Sephia', NULL),
	(296, 8, 'Shuma', NULL),
	(297, 8, 'Sorento', NULL),
	(298, 8, 'Soul', NULL),
	(299, 8, 'Spectra', NULL),
	(300, 8, 'Sportage', NULL),
	(301, 8, 'Stinger', NULL),
	(302, 8, 'Stonic', NULL),
	(303, 8, 'Venga', NULL),
	(304, 8, 'Visto', NULL),
	(305, 8, 'X-Trek', NULL),
	(306, 9, '121', NULL),
	(307, 9, '2', NULL),
	(308, 9, '3', NULL),
	(309, 9, '323', NULL),
	(310, 9, '5', NULL),
	(311, 9, '6', NULL),
	(312, 9, '626', NULL),
	(313, 9, '929', NULL),
	(314, 9, 'B2200', NULL),
	(315, 9, 'B2500', NULL),
	(316, 9, 'B2600', NULL),
	(317, 9, 'BT-50', NULL),
	(318, 9, 'CX-5', NULL),
	(319, 9, 'CX-7', NULL),
	(320, 9, 'CX-9', NULL),
	(321, 9, 'Demio', NULL),
	(322, 9, 'Mpv', NULL),
	(323, 9, 'Mx-3', NULL),
	(324, 9, 'Mx-5', NULL),
	(325, 9, 'Mx-6', NULL),
	(326, 9, 'Premacy', NULL),
	(327, 9, 'Rx-7', NULL),
	(328, 9, 'Rx-8', NULL),
	(329, 9, 'Tribute', NULL),
	(330, 9, 'Xedos', NULL),
	(331, 9, 'СХ-3', NULL),
	(332, 10, '110', NULL),
	(333, 10, '111', NULL),
	(334, 10, '113', NULL),
	(335, 10, '114', NULL),
	(336, 10, '115', NULL),
	(337, 10, '116', NULL),
	(338, 10, '123', NULL),
	(339, 10, '124', NULL),
	(340, 10, '126', NULL),
	(341, 10, '126-260', NULL),
	(342, 10, '150', NULL),
	(343, 10, '170', NULL),
	(344, 10, '180', NULL),
	(345, 10, '190', NULL),
	(346, 10, '200', NULL),
	(347, 10, '220', NULL),
	(348, 10, '230', NULL),
	(349, 10, '240', NULL),
	(350, 10, '250', NULL),
	(351, 10, '260', NULL),
	(352, 10, '280', NULL),
	(353, 10, '290', NULL),
	(354, 10, '300', NULL),
	(355, 10, '320', NULL),
	(356, 10, '350', NULL),
	(357, 10, '380', NULL),
	(358, 10, '420', NULL),
	(359, 10, '450', NULL),
	(360, 10, '500', NULL),
	(361, 10, '560', NULL),
	(362, 10, '600', NULL),
	(363, 10, 'A', NULL),
	(364, 10, 'A 140', NULL),
	(365, 10, 'A 150', NULL),
	(366, 10, 'A 160', NULL),
	(367, 10, 'A 170', NULL),
	(368, 10, 'A 180', NULL),
	(369, 10, 'A 190', NULL),
	(370, 10, 'A 200', NULL),
	(371, 10, 'A 210', NULL),
	(372, 10, 'A 220', NULL),
	(373, 10, 'A 250', NULL),
	(374, 10, 'A45 AMG', NULL),
	(375, 10, 'AMG GT', NULL),
	(376, 10, 'AMG GT S', NULL),
	(377, 10, 'Adenauer', NULL),
	(378, 10, 'B', NULL),
	(379, 10, 'B 150', NULL),
	(380, 10, 'B 160', NULL),
	(381, 10, 'B 170', NULL),
	(382, 10, 'B 180', NULL),
	(383, 10, 'B 200', NULL),
	(384, 10, 'B 220', NULL),
	(385, 10, 'B 250', NULL),
	(386, 10, 'C', NULL),
	(387, 10, 'C 160', NULL),
	(388, 10, 'C 180', NULL),
	(389, 10, 'C 200', NULL),
	(390, 10, 'C 220', NULL),
	(391, 10, 'C 230', NULL),
	(392, 10, 'C 240', NULL),
	(393, 10, 'C 250', NULL),
	(394, 10, 'C 270', NULL),
	(395, 10, 'C 280', NULL),
	(396, 10, 'C 30 AMG', NULL),
	(397, 10, 'C 300', NULL),
	(398, 10, 'C 32 AMG', NULL),
	(399, 10, 'C 320', NULL),
	(400, 10, 'C 350', NULL),
	(401, 10, 'C 36 AMG', NULL),
	(402, 10, 'C 400', NULL),
	(403, 10, 'C 43 AMG', NULL),
	(404, 10, 'C 450 AMG', NULL),
	(405, 10, 'C 55 AMG', NULL),
	(406, 10, 'C 63 AMG', NULL),
	(407, 10, 'CL', NULL),
	(408, 10, 'CL 230', NULL),
	(409, 10, 'CL 320', NULL),
	(410, 10, 'CL 420', NULL),
	(411, 10, 'CL 500', NULL),
	(412, 10, 'CL 55 AMG', NULL),
	(413, 10, 'CL 600', NULL),
	(414, 10, 'CL 63 AMG', NULL),
	(415, 10, 'CL 65 AMG', NULL),
	(416, 10, 'CLA', NULL),
	(417, 10, 'CLA 180', NULL),
	(418, 10, 'CLA 200', NULL),
	(419, 10, 'CLA 220', NULL),
	(420, 10, 'CLA 250', NULL),
	(421, 10, 'CLA 45 AMG', NULL),
	(422, 10, 'CLC', NULL),
	(423, 10, 'CLC 160', NULL),
	(424, 10, 'CLC 180', NULL),
	(425, 10, 'CLC 200', NULL),
	(426, 10, 'CLC 220', NULL),
	(427, 10, 'CLC 230', NULL),
	(428, 10, 'CLC 250', NULL),
	(429, 10, 'CLC 350', NULL),
	(430, 10, 'CLK', NULL),
	(431, 10, 'CLK 55 AMG', NULL),
	(432, 10, 'CLK 63 AMG', NULL),
	(433, 10, 'CLS', NULL),
	(434, 10, 'CLS 250', NULL),
	(435, 10, 'CLS 300', NULL),
	(436, 10, 'CLS 320', NULL),
	(437, 10, 'CLS 350', NULL),
	(438, 10, 'CLS 400', NULL),
	(439, 10, 'CLS 450', NULL),
	(440, 10, 'CLS 500', NULL),
	(441, 10, 'CLS 53 AMG', NULL),
	(442, 10, 'CLS 55', NULL),
	(443, 10, 'CLS 55 AMG', NULL),
	(444, 10, 'CLS 63', NULL),
	(445, 10, 'CLS 63 AMG', NULL),
	(446, 10, 'Citan', NULL),
	(447, 10, 'E', NULL),
	(448, 10, 'E 200', NULL),
	(449, 10, 'E 220', NULL),
	(450, 10, 'E 230', NULL),
	(451, 10, 'E 240', NULL),
	(452, 10, 'E 250', NULL),
	(453, 10, 'E 260', NULL),
	(454, 10, 'E 270', NULL),
	(455, 10, 'E 280', NULL),
	(456, 10, 'E 290', NULL),
	(457, 10, 'E 300', NULL),
	(458, 10, 'E 320', NULL),
	(459, 10, 'E 350', NULL),
	(460, 10, 'E 36 AMG', NULL),
	(461, 10, 'E 400', NULL),
	(462, 10, 'E 420', NULL),
	(463, 10, 'E 43 AMG', NULL),
	(464, 10, 'E 430', NULL),
	(465, 10, 'E 450', NULL),
	(466, 10, 'E 50 AMG', NULL),
	(467, 10, 'E 500', NULL),
	(468, 10, 'E 53 AMG', NULL),
	(469, 10, 'E 55', NULL),
	(470, 10, 'E 55 AMG', NULL),
	(471, 10, 'E 60', NULL),
	(472, 10, 'E 60 AMG', NULL),
	(473, 10, 'E 63 AMG', NULL),
	(474, 10, 'G', NULL),
	(475, 10, 'G 230', NULL),
	(476, 10, 'G 240', NULL),
	(477, 10, 'G 250', NULL),
	(478, 10, 'G 270', NULL),
	(479, 10, 'G 280', NULL),
	(480, 10, 'G 290', NULL),
	(481, 10, 'G 300', NULL),
	(482, 10, 'G 320', NULL),
	(483, 10, 'G 350', NULL),
	(484, 10, 'G 36 AMG', NULL),
	(485, 10, 'G 400', NULL),
	(486, 10, 'G 500', NULL),
	(487, 10, 'G 55 AMG', NULL),
	(488, 10, 'G 63 AMG', NULL),
	(489, 10, 'G 65 AMG', NULL),
	(490, 10, 'GL', NULL),
	(491, 10, 'GL 320', NULL),
	(492, 10, 'GL 350', NULL),
	(493, 10, 'GL 420', NULL),
	(494, 10, 'GL 450', NULL),
	(495, 10, 'GL 500', NULL),
	(496, 10, 'GL 55 AMG', NULL),
	(497, 10, 'GL 63 AMG', NULL),
	(498, 10, 'GLA', NULL),
	(499, 10, 'GLA 180', NULL),
	(500, 10, 'GLA 200', NULL),
	(501, 10, 'GLA 220', NULL),
	(502, 10, 'GLA 250', NULL),
	(503, 10, 'GLA 45 AMG', NULL),
	(504, 10, 'GLC', NULL),
	(505, 10, 'GLC 220', NULL),
	(506, 10, 'GLC 250', NULL),
	(507, 10, 'GLC 300', NULL),
	(508, 10, 'GLC 350', NULL),
	(509, 10, 'GLC 43 AMG', NULL),
	(510, 10, 'GLC 63 AMG', NULL),
	(511, 10, 'GLE', NULL),
	(512, 10, 'GLE 250', NULL),
	(513, 10, 'GLE 350', NULL),
	(514, 10, 'GLE 400', NULL),
	(515, 10, 'GLE 43 AMG', NULL),
	(516, 10, 'GLE 450 AMG', NULL),
	(517, 10, 'GLE 63 AMG', NULL),
	(518, 10, 'GLE 63 S AMG', NULL),
	(519, 10, 'GLE Coupe', NULL),
	(520, 10, 'GLK', NULL),
	(521, 10, 'GLS', NULL),
	(522, 10, 'GLS 350', NULL),
	(523, 10, 'GLS 400', NULL),
	(524, 10, 'GLS 500', NULL),
	(525, 10, 'GLS 63 AMG', NULL),
	(526, 10, 'ML', NULL),
	(527, 10, 'ML 230', NULL),
	(528, 10, 'ML 250', NULL),
	(529, 10, 'ML 270', NULL),
	(530, 10, 'ML 280', NULL),
	(531, 10, 'ML 300', NULL),
	(532, 10, 'ML 320', NULL),
	(533, 10, 'ML 350', NULL),
	(534, 10, 'ML 400', NULL),
	(535, 10, 'ML 420', NULL),
	(536, 10, 'ML 430', NULL),
	(537, 10, 'ML 450', NULL),
	(538, 10, 'ML 500', NULL),
	(539, 10, 'ML 55 AMG', NULL),
	(540, 10, 'ML 63 AMG', NULL),
	(541, 10, 'R', NULL),
	(542, 10, 'R 280', NULL),
	(543, 10, 'R 300', NULL),
	(544, 10, 'R 320', NULL),
	(545, 10, 'R 350', NULL),
	(546, 10, 'R 500', NULL),
	(547, 10, 'R 63 AMG', NULL),
	(548, 10, 'S', NULL),
	(549, 10, 'S 250', NULL),
	(550, 10, 'S 280', NULL),
	(551, 10, 'S 300', NULL),
	(552, 10, 'S 320', NULL),
	(553, 10, 'S 350', NULL),
	(554, 10, 'S 400', NULL),
	(555, 10, 'S 420', NULL),
	(556, 10, 'S 430', NULL),
	(557, 10, 'S 450', NULL),
	(558, 10, 'S 500', NULL),
	(559, 10, 'S 55 AMG', NULL),
	(560, 10, 'S 550', NULL),
	(561, 10, 'S 560', NULL),
	(562, 10, 'S 600', NULL),
	(563, 10, 'S 63', NULL),
	(564, 10, 'S 63 AMG', NULL),
	(565, 10, 'S 65', NULL),
	(566, 10, 'S 65 AMG', NULL),
	(567, 10, 'SL', NULL),
	(568, 10, 'SL 400', NULL),
	(569, 10, 'SL 500', NULL),
	(570, 10, 'SL 55 AMG', NULL),
	(571, 10, 'SL 60 AMG', NULL),
	(572, 10, 'SL 63 AMG', NULL),
	(573, 10, 'SL 65 AMG', NULL),
	(574, 10, 'SLC', NULL),
	(575, 10, 'SLK', NULL),
	(576, 10, 'SLK 32 AMG', NULL),
	(577, 10, 'SLK 55 AMG', NULL),
	(578, 10, 'SLR', NULL),
	(579, 10, 'SLS', NULL),
	(580, 10, 'SLS AMG', NULL),
	(581, 10, 'Unimog', NULL),
	(582, 10, 'Vaneo', NULL),
	(583, 10, 'X-Klasse', NULL),
	(584, 11, '3000 gt', NULL),
	(585, 11, 'ASX', NULL),
	(586, 11, 'Carisma', NULL),
	(587, 11, 'Colt', NULL),
	(588, 11, 'Cordia', NULL),
	(589, 11, 'Eclipse', NULL),
	(590, 11, 'Eclipse Cross', NULL),
	(591, 11, 'Galant', NULL),
	(592, 11, 'Grandis', NULL),
	(593, 11, 'I-MiEV', NULL),
	(594, 11, 'L200', NULL),
	(595, 11, 'Lancer', NULL),
	(596, 11, 'Montero', NULL),
	(597, 11, 'Outlander', NULL),
	(598, 11, 'Pajero', NULL),
	(599, 11, 'Pajero pinin', NULL),
	(600, 11, 'Pajero sport', NULL),
	(601, 11, 'Sapporo', NULL),
	(602, 11, 'Sigma', NULL),
	(603, 11, 'Space gear', NULL),
	(604, 11, 'Space runner', NULL),
	(605, 11, 'Space star', NULL),
	(606, 11, 'Space wagon', NULL),
	(607, 11, 'Starion', NULL),
	(608, 11, 'Tredia', NULL),
	(609, 12, '100 nx', NULL),
	(610, 12, '200 sx', NULL),
	(611, 12, '240 z', NULL),
	(612, 12, '280 z', NULL),
	(613, 12, '300 zx', NULL),
	(614, 12, '350z', NULL),
	(615, 12, '370Z', NULL),
	(616, 12, 'Almera', NULL),
	(617, 12, 'Almera tino', NULL),
	(618, 12, 'Altima', NULL),
	(619, 12, 'Armada', NULL),
	(620, 12, 'Bluebird', NULL),
	(621, 12, 'Cedric', NULL),
	(622, 12, 'Cherry', NULL),
	(623, 12, 'Cube', NULL),
	(624, 12, 'Figaro', NULL),
	(625, 12, 'Frontier', NULL),
	(626, 12, 'Gt-r', NULL),
	(627, 12, 'Juke', NULL),
	(628, 12, 'Kubistar', NULL),
	(629, 12, 'Laurel', NULL),
	(630, 12, 'Leaf ', NULL),
	(631, 12, 'Maxima', NULL),
	(632, 12, 'Micra', NULL),
	(633, 12, 'Murano', NULL),
	(634, 12, 'NP300', NULL),
	(635, 12, 'Navara', NULL),
	(636, 12, 'Note', NULL),
	(637, 12, 'Pathfinder', NULL),
	(638, 12, 'Patrol', NULL),
	(639, 12, 'Pickup', NULL),
	(640, 12, 'Pixo', NULL),
	(641, 12, 'Prairie', NULL),
	(642, 12, 'Primera', NULL),
	(643, 12, 'Pulsar', NULL),
	(644, 12, 'Qashqai', NULL),
	(645, 12, 'Rogue', NULL),
	(646, 12, 'Sentra', NULL),
	(647, 12, 'Serena', NULL),
	(648, 12, 'Silvia', NULL),
	(649, 12, 'Skyline', NULL),
	(650, 12, 'Stantza', NULL),
	(651, 12, 'Sunny', NULL),
	(652, 12, 'Teana', NULL),
	(653, 12, 'Terrano', NULL),
	(654, 12, 'Tiida', NULL),
	(655, 12, 'Titan crew cab', NULL),
	(656, 12, 'Titan king', NULL),
	(657, 12, 'Versa', NULL),
	(658, 12, 'X-trail', NULL),
	(659, 12, 'Xterra', NULL),
	(660, 12, 'e-NV200', NULL),
	(661, 13, 'Adam', NULL),
	(662, 13, 'Admiral', NULL),
	(663, 13, 'Agila', NULL),
	(664, 13, 'Ampera', NULL),
	(665, 13, 'Antara', NULL),
	(666, 13, 'Ascona', NULL),
	(667, 13, 'Astra', NULL),
	(668, 13, 'Calibra', NULL),
	(669, 13, 'Campo', NULL),
	(670, 13, 'Cascada', NULL),
	(671, 13, 'Combo', NULL),
	(672, 13, 'Commodore', NULL),
	(673, 13, 'Corsa', NULL),
	(674, 13, 'Crossland X', NULL),
	(675, 13, 'Diplomat', NULL),
	(676, 13, 'Frontera', NULL),
	(677, 13, 'Grandland X', NULL),
	(678, 13, 'Gt', NULL),
	(679, 13, 'Insignia', NULL),
	(680, 13, 'Kadett', NULL),
	(681, 13, 'Kapitaen', NULL),
	(682, 13, 'Karl', NULL),
	(683, 13, 'Manta', NULL),
	(684, 13, 'Meriva', NULL),
	(685, 13, 'Mokka', NULL),
	(686, 13, 'Monterey', NULL),
	(687, 13, 'Monza', NULL),
	(688, 13, 'Omega', NULL),
	(689, 13, 'Rekord', NULL),
	(690, 13, 'Senator', NULL),
	(691, 13, 'Signum', NULL),
	(692, 13, 'Sintra', NULL),
	(693, 13, 'Speedster', NULL),
	(694, 13, 'Tigra', NULL),
	(695, 13, 'Vectra', NULL),
	(696, 13, 'Zafira', NULL),
	(697, 14, '1007', NULL),
	(698, 14, '104', NULL),
	(699, 14, '106', NULL),
	(700, 14, '107', NULL),
	(701, 14, '108', NULL),
	(702, 14, '2008', NULL),
	(703, 14, '202', NULL),
	(704, 14, '204', NULL),
	(705, 14, '205', NULL),
	(706, 14, '206', NULL),
	(707, 14, '207', NULL),
	(708, 14, '208', NULL),
	(709, 14, '3008', NULL),
	(710, 14, '301', NULL),
	(711, 14, '304', NULL),
	(712, 14, '305', NULL),
	(713, 14, '306', NULL),
	(714, 14, '307', NULL),
	(715, 14, '308', NULL),
	(716, 14, '309', NULL),
	(717, 14, '4007', NULL),
	(718, 14, '4008', NULL),
	(719, 14, '402', NULL),
	(720, 14, '403', NULL),
	(721, 14, '404', NULL),
	(722, 14, '405', NULL),
	(723, 14, '406', NULL),
	(724, 14, '407', NULL),
	(725, 14, '5008', NULL),
	(726, 14, '504', NULL),
	(727, 14, '505', NULL),
	(728, 14, '508', NULL),
	(729, 14, '604', NULL),
	(730, 14, '605', NULL),
	(731, 14, '607', NULL),
	(732, 14, '806', NULL),
	(733, 14, '807', NULL),
	(734, 14, 'Bipper', NULL),
	(735, 14, 'Expert', NULL),
	(736, 14, 'Partner', NULL),
	(737, 14, 'RCZ', NULL),
	(738, 14, 'Range', NULL),
	(739, 14, 'Rifter', NULL),
	(740, 14, 'Traveler', NULL),
	(741, 14, 'iOn', NULL),
	(742, 15, '356 Speedster', NULL),
	(743, 15, '911', NULL),
	(744, 15, '918 Spyder', NULL),
	(745, 15, '924', NULL),
	(746, 15, '928', NULL),
	(747, 15, '935', NULL),
	(748, 15, '944', NULL),
	(749, 15, '956', NULL),
	(750, 15, '968', NULL),
	(751, 15, '991', NULL),
	(752, 15, '993', NULL),
	(753, 15, '996', NULL),
	(754, 15, 'Boxster', NULL),
	(755, 15, 'Carrera', NULL),
	(756, 15, 'Cayenne', NULL),
	(757, 15, 'Cayman', NULL),
	(758, 15, 'Macan', NULL),
	(759, 15, 'Panamera', NULL),
	(760, 16, '10', NULL),
	(761, 16, '11', NULL),
	(762, 16, '12', NULL),
	(763, 16, '14', NULL),
	(764, 16, '16', NULL),
	(765, 16, '18', NULL),
	(766, 16, '19', NULL),
	(767, 16, '20', NULL),
	(768, 16, '21', NULL),
	(769, 16, '25', NULL),
	(770, 16, '29', NULL),
	(771, 16, '30', NULL),
	(772, 16, '4', NULL),
	(773, 16, '5', NULL),
	(774, 16, '8', NULL),
	(775, 16, '9', NULL),
	(776, 16, 'Alpine', NULL),
	(777, 16, 'Avantime', NULL),
	(778, 16, 'Bakara', NULL),
	(779, 16, 'Bulgar', NULL),
	(780, 16, 'Captur', NULL),
	(781, 16, 'Caravelle', NULL),
	(782, 16, 'Chamade', NULL),
	(783, 16, 'Clio', NULL),
	(784, 16, 'Espace', NULL),
	(785, 16, 'Express', NULL),
	(786, 16, 'Floride', NULL),
	(787, 16, 'Fluence', NULL),
	(788, 16, 'Fuego', NULL),
	(789, 16, 'Grand espace', NULL),
	(790, 16, 'Grand scenic', NULL),
	(791, 16, 'Kadjar', NULL),
	(792, 16, 'Kangoo', NULL),
	(793, 16, 'Koleos', NULL),
	(794, 16, 'Laguna', NULL),
	(795, 16, 'Laguna Coupe', NULL),
	(796, 16, 'Latitude', NULL),
	(797, 16, 'Megane', NULL),
	(798, 16, 'Modus', NULL),
	(799, 16, 'Nevada', NULL),
	(800, 16, 'Rapid', NULL),
	(801, 16, 'Safrane', NULL),
	(802, 16, 'Scenic', NULL),
	(803, 16, 'Scenic rx4', NULL),
	(804, 16, 'Symbol', NULL),
	(805, 16, 'Talisman', NULL),
	(806, 16, 'Twingo', NULL),
	(807, 16, 'Twizy', NULL),
	(808, 16, 'Vel satis', NULL),
	(809, 16, 'Wind', NULL),
	(810, 16, 'Zoe', NULL),
	(811, 17, 'Alhambra', NULL),
	(812, 17, 'Altea', NULL),
	(813, 17, 'Arona', NULL),
	(814, 17, 'Arosa', NULL),
	(815, 17, 'Ateca', NULL),
	(816, 17, 'Cordoba', NULL),
	(817, 17, 'Exeo', NULL),
	(818, 17, 'Fura', NULL),
	(819, 17, 'Ibiza', NULL),
	(820, 17, 'Inka', NULL),
	(821, 17, 'Leon', NULL),
	(822, 17, 'Malaga', NULL),
	(823, 17, 'Marbella', NULL),
	(824, 17, 'Mii', NULL),
	(825, 17, 'Ronda', NULL),
	(826, 17, 'Terra', NULL),
	(827, 17, 'Toledo', NULL),
	(828, 17, 'Vario', NULL),
	(829, 18, '100', NULL),
	(830, 18, '1000', NULL),
	(831, 18, '105', NULL),
	(832, 18, '120', NULL),
	(833, 18, '125', NULL),
	(834, 18, '130', NULL),
	(835, 18, '135', NULL),
	(836, 18, '136', NULL),
	(837, 18, 'Citigo', NULL),
	(838, 18, 'Fabia', NULL),
	(839, 18, 'Favorit', NULL),
	(840, 18, 'Felicia', NULL),
	(841, 18, 'Forman', NULL),
	(842, 18, 'Karoq', NULL),
	(843, 18, 'Kodiaq', NULL),
	(844, 18, 'Octavia', NULL),
	(845, 18, 'Praktik', NULL),
	(846, 18, 'Rapid', NULL),
	(847, 18, 'Roomster', NULL),
	(848, 18, 'Superb', NULL),
	(849, 18, 'Yeti', NULL),
	(850, 19, '1800', NULL),
	(851, 19, 'B9 tribeca', NULL),
	(852, 19, 'BRZ', NULL),
	(853, 19, 'Baja', NULL),
	(854, 19, 'E12', NULL),
	(855, 19, 'Forester', NULL),
	(856, 19, 'G3x justy', NULL),
	(857, 19, 'Impreza', NULL),
	(858, 19, 'Justy', NULL),
	(859, 19, 'Legacy', NULL),
	(860, 19, 'Leone', NULL),
	(861, 19, 'Levorg', NULL),
	(862, 19, 'Libero', NULL),
	(863, 19, 'Outback', NULL),
	(864, 19, 'Svx', NULL),
	(865, 19, 'Trezia', NULL),
	(866, 19, 'Vivio', NULL),
	(867, 19, 'XT', NULL),
	(868, 19, 'XV', NULL),
	(869, 20, 'Alto', NULL),
	(870, 20, 'Baleno', NULL),
	(871, 20, 'Celerio', NULL),
	(872, 20, 'Forenza', NULL),
	(873, 20, 'Grand vitara', NULL),
	(874, 20, 'Ignis', NULL),
	(875, 20, 'Jimny', NULL),
	(876, 20, 'Kizashi', NULL),
	(877, 20, 'Liana', NULL),
	(878, 20, 'Maruti', NULL),
	(879, 20, 'Reno', NULL),
	(880, 20, 'SX4', NULL),
	(881, 20, 'SX4 S-Cross', NULL),
	(882, 20, 'Samurai', NULL),
	(883, 20, 'Santana', NULL),
	(884, 20, 'Sg', NULL),
	(885, 20, 'Sidekick', NULL),
	(886, 20, 'Sj', NULL),
	(887, 20, 'Splash', NULL),
	(888, 20, 'Swift', NULL),
	(889, 20, 'Vitara', NULL),
	(890, 20, 'Wagon r', NULL),
	(891, 20, 'X-90', NULL),
	(892, 20, 'XL-7', NULL),
	(893, 21, '4runner', NULL),
	(894, 21, 'Auris', NULL),
	(895, 21, 'Avalon', NULL),
	(896, 21, 'Avensis', NULL),
	(897, 21, 'Avensis verso', NULL),
	(898, 21, 'Aygo', NULL),
	(899, 21, 'C-HR', NULL),
	(900, 21, 'Camry', NULL),
	(901, 21, 'Carina', NULL),
	(902, 21, 'Celica', NULL),
	(903, 21, 'Corolla', NULL),
	(904, 21, 'Corolla Matrix', NULL),
	(905, 21, 'Corolla verso', NULL),
	(906, 21, 'Cressida', NULL),
	(907, 21, 'Crown', NULL),
	(908, 21, 'Fj cruiser', NULL),
	(909, 21, 'GT86', NULL),
	(910, 21, 'Harrier', NULL),
	(911, 21, 'Highlander', NULL),
	(912, 21, 'Hilux', NULL),
	(913, 21, 'IQ', NULL),
	(914, 21, 'Land cruiser', NULL),
	(915, 21, 'Matrix', NULL),
	(916, 21, 'Mr2', NULL),
	(917, 21, 'Paseo', NULL),
	(918, 21, 'Picnic', NULL),
	(919, 21, 'Previa', NULL),
	(920, 21, 'Prius', NULL),
	(921, 21, 'Rav4', NULL),
	(922, 21, 'Scion', NULL),
	(923, 21, 'Sequoia', NULL),
	(924, 21, 'Sienna', NULL),
	(925, 21, 'Starlet', NULL),
	(926, 21, 'Supra', NULL),
	(927, 21, 'Tacoma', NULL),
	(928, 21, 'Tercel', NULL),
	(929, 21, 'Tundra', NULL),
	(930, 21, 'Urban Cruiser', NULL),
	(931, 21, 'Venza', NULL),
	(932, 21, 'Verso', NULL),
	(933, 21, 'Verso S', NULL),
	(934, 21, 'Yaris', NULL),
	(935, 21, 'Yaris verso', NULL),
	(936, 22, '1200', NULL),
	(937, 22, '1300', NULL),
	(938, 22, '1302', NULL),
	(939, 22, '1303', NULL),
	(940, 22, '1500', NULL),
	(941, 22, '1600', NULL),
	(942, 22, 'Alltrack', NULL),
	(943, 22, 'Amarok', NULL),
	(944, 22, 'Arteon', NULL),
	(945, 22, 'Atlas', NULL),
	(946, 22, 'Bora', NULL),
	(947, 22, 'Caddy', NULL),
	(948, 22, 'Corrado', NULL),
	(949, 22, 'Derby', NULL),
	(950, 22, 'Eos', NULL),
	(951, 22, 'Fox', NULL),
	(952, 22, 'Golf', NULL),
	(953, 22, 'Golf Plus', NULL),
	(954, 22, 'Golf Variant', NULL),
	(955, 22, 'Jetta', NULL),
	(956, 22, 'K 70', NULL),
	(957, 22, 'Karmann-ghia', NULL),
	(958, 22, 'Lupo', NULL),
	(959, 22, 'Multivan', NULL),
	(960, 22, 'New beetle', NULL),
	(961, 22, 'Passat', NULL),
	(962, 22, 'Phaeton', NULL),
	(963, 22, 'Polo', NULL),
	(964, 22, 'Rabbit', NULL),
	(965, 22, 'Santana', NULL),
	(966, 22, 'Scirocco', NULL),
	(967, 22, 'Sharan', NULL),
	(968, 22, 'T-Cross', NULL),
	(969, 22, 'T-Roc', NULL),
	(970, 22, 'Taro', NULL),
	(971, 22, 'Tiguan', NULL),
	(972, 22, 'Touareg', NULL),
	(973, 22, 'Touran', NULL),
	(974, 22, 'Up', NULL),
	(975, 22, 'Vento', NULL),
	(976, 23, '142', NULL),
	(977, 23, '144', NULL),
	(978, 23, '145', NULL),
	(979, 23, '164', NULL),
	(980, 23, '1800 es', NULL),
	(981, 23, '240', NULL),
	(982, 23, '244', NULL),
	(983, 23, '245', NULL),
	(984, 23, '262 c', NULL),
	(985, 23, '264', NULL),
	(986, 23, '340', NULL),
	(987, 23, '343', NULL),
	(988, 23, '344', NULL),
	(989, 23, '345', NULL),
	(990, 23, '360', NULL),
	(991, 23, '440', NULL),
	(992, 23, '460', NULL),
	(993, 23, '480', NULL),
	(994, 23, '66', NULL),
	(995, 23, '740', NULL),
	(996, 23, '744', NULL),
	(997, 23, '745', NULL),
	(998, 23, '760', NULL),
	(999, 23, '765', NULL),
	(1000, 23, '770', NULL),
	(1001, 23, '780', NULL),
	(1002, 23, '850', NULL),
	(1003, 23, '940', NULL),
	(1004, 23, '960', NULL),
	(1005, 23, 'C30', NULL),
	(1006, 23, 'C70', NULL),
	(1007, 23, 'P 1800', NULL),
	(1008, 23, 'S40', NULL),
	(1009, 23, 'S60', NULL),
	(1010, 23, 'S70', NULL),
	(1011, 23, 'S80', NULL),
	(1012, 23, 'S90', NULL),
	(1013, 23, 'V40', NULL),
	(1014, 23, 'V50', NULL),
	(1015, 23, 'V60', NULL),
	(1016, 23, 'V70', NULL),
	(1017, 23, 'V90', NULL),
	(1018, 23, 'V90 Cross Country', NULL),
	(1019, 23, 'XC40', NULL),
	(1020, 23, 'XC60', NULL),
	(1021, 23, 'Xc70', NULL),
	(1022, 23, 'Xc90', NULL);
/*!40000 ALTER TABLE `models` ENABLE KEYS */;

-- Dumping structure for table car_service.service
CREATE TABLE IF NOT EXISTS `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table car_service.service: ~0 rows (approximately)
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` (`id`, `name`, `price`) VALUES
	(1, 'oil change', 45);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;

-- Dumping structure for table car_service.service_visit
CREATE TABLE IF NOT EXISTS `service_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  CONSTRAINT `service_id` FOREIGN KEY (`id`) REFERENCES `service` (`id`),
  CONSTRAINT `visit_id` FOREIGN KEY (`id`) REFERENCES `car_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table car_service.service_visit: ~0 rows (approximately)
/*!40000 ALTER TABLE `service_visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_visit` ENABLE KEYS */;

-- Dumping structure for table car_service.users
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(68) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table car_service.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`username`, `password`, `enabled`) VALUES
	('admin', '{noop}pass1', 1),
	('misho', '{noop}pass3', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;