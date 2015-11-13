-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2015 at 03:14 AM
-- Server version: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rentcar`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `id_car` int(11) NOT NULL,
  `maker` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `engine` varchar(45) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `passenger` int(11) DEFAULT NULL,
  `gear` varchar(45) DEFAULT NULL,
  `picture` varchar(150) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`id_car`, `maker`, `model`, `color`, `engine`, `cost`, `passenger`, `gear`, `picture`, `status`) VALUES
(1, 'HONDA', 'Pilot', 'Black', 'Diesel', 3300, 6, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/BENTLEY_Continental-GT-2015_main.jpg', 'available'),
(2, 'HONDA', 'Civic', 'Black', 'Petrol', 1500, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/HONDA_Civic-5-Doors-2015_main.jpg', 'available'),
(3, 'HONDA', 'HR-V 5 Doors', 'Blue', 'Diesel', 2000, 6, 'manual', 'http://s1.cdn.autoevolution.com/images/models/HONDA_HR-V-5DR-2015_main.jpg', 'available'),
(4, 'HONDA', 'Accord Coupe', 'Red', 'Petrol', 1700, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/HONDA_Accord-Coupe-2012_main.jpg', 'available'),
(5, 'HONDA', 'S660', 'White', 'Diesel', 7000, 2, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/HONDA_S660-2015_main.jpg', 'available'),
(6, 'HONDA', 'Legend Sedan', 'White', 'Diesel', 3000, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/HONDA_Legend-2014_main.jpg', 'available'),
(7, 'HONDA', 'Mobilio', 'Blue', 'Petrol', 3500, 6, 'manual', 'http://s1.cdn.autoevolution.com/images/models/HONDA_Mobilio-2004_main.jpg', 'available'),
(8, 'BMW', '1 Series', 'White', 'Petrol', 3500, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/BMW_1-Series-LCI--F20--2015_main.jpg', 'unvailable'),
(9, 'BMW', '7 Series', 'Black', 'Petrol', 4000, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/BMW_7-Series-2016_main.jpg', 'available'),
(10, 'BMW', 'M6 Coupe', 'Red', 'Diesel', 3000, 4, 'manual', 'http://s1.cdn.autoevolution.com/images/models/BMW_M6-Coupe-LCI-2015_main.jpg', 'available'),
(11, 'BMW', 'M4', 'Yellow', 'Diesel', 3000, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/BMW_BMW-M4--F82--2013_main.jpg', 'available'),
(12, 'BMW', 'X6M', 'Blue', 'Petrol', 3500, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/BMW_X6M-2014_main.jpg', 'available'),
(13, 'BMW', 'i8', 'Grey', 'Petrol', 6000, 2, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/BMW_i8-2013_main.jpg', 'available'),
(14, 'CHEVROLET', 'Cruze', 'Blue', 'Petrol', 1500, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/CHEVROLET_Cruze-2016_main.jpg', 'available'),
(15, 'CHEVROLET', 'Camaro', 'Red', 'Petrol', 1000, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/CHEVROLET_Camaro-2016_main.jpg', 'available'),
(16, 'CHEVROLET', 'SS', 'Brown', 'Diesel', 1200, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/CHEVROLET_SS-2013_main.jpg', 'available'),
(17, 'CHEVROLET', 'Spin', 'Black', 'Petrol', 2500, 6, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/CHEVROLET_Spin-2012_main.png', 'available'),
(18, 'CHEVROLET', 'Onix', 'White', 'Petrol', 1500, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/CHEVROLET_Onix-2012_main.jpg', 'available'),
(19, 'CHEVROLET', 'Impala', 'Black', 'Diesel', 1500, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/CHEVROLET_Impala-2012_main.jpg', 'available'),
(20, 'CHEVROLET', 'Corvette Convertible', 'Black', 'Diesel', 7500, 2, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/CHEVROLET_Corvette-Stingray-Convertible-C7-2013_main.jpg', 'available'),
(21, 'CHEVROLET', 'Corvette Z06', 'Yellow', 'Petrol', 8000, 2, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/CHEVROLET_Corvette-Z06-2014_main.jpg', 'available'),
(22, 'MAZDA', 'CX-3', 'Red', 'Petrol', 2300, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/MAZDA_CX-3-2015_main.jpg', 'available'),
(23, 'MAZDA', 'Flairwagon', 'Blue', 'Petrol', 2500, 6, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/MAZDA_Flairwagon-2012_main.png', 'available'),
(24, 'MAZDA', 'Premacy', 'Black', 'Diesel', 2800, 6, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/MAZDA_5---Premacy-2010_main.jpg', 'available'),
(25, 'MAZDA', 'Verisa', 'Black', 'Diesel', 3000, 4, 'manual', 'http://s1.cdn.autoevolution.com/images/models/MAZDA_Verisa-2004_main.jpg', 'available'),
(26, 'MAZDA', 'CX-9', 'Violet', 'Petrol', 3500, 6, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/MAZDA_CX-9-2007_main.jpg', 'available'),
(27, 'TOYOTA', 'Avalon', 'White', 'Petrol', 2000, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/TOYOTA_Avalon-2015_main.jpg', 'available'),
(28, 'TOYOTA', 'Vios', 'Red', 'Petrol', 1200, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/TOYOTA_Vios-2013_main.png', 'available'),
(29, 'TOYOTA', 'Hilux', 'Grey', 'Petrol', 1500, 6, 'manual', 'http://s1.cdn.autoevolution.com/images/models/TOYOTA_Hilux-SW4-2006_main.jpg', 'available'),
(30, 'TOYOTA', 'Corolla', 'White', 'Petrol', 1500, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/TOYOTA_Corolla-Altis-2014_main.jpg', 'available'),
(31, 'TOYOTA', 'Camry', 'Red', 'Petrol', 2000, 4, 'manual', 'http://s1.cdn.autoevolution.com/images/models/TOYOTA_Camry-2014_main.jpg', 'available'),
(32, 'TOYOTA', 'Yaris', 'Red', 'Petrol', 1000, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/TOYOTA_Yaris-5-Doors-2014_main.jpg', 'available'),
(33, 'MERCEDES BENZ', 'CLS AMG', 'Grey', 'Petrol', 5000, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/MERCEDES-BENZ_CLS-63-AMG-2014_main.jpg', 'available'),
(34, 'MERCEDES BENZ', 'SLK-Klasse', 'Red', 'Diesel', 5500, 4, 'manual', 'http://s1.cdn.autoevolution.com/images/models/MERCEDES-BENZ_SLK--R172--2011_main.jpg', 'available'),
(35, 'MERCEDES BENZ', 'CLS-Klasse', 'Brown', 'Diesel', 5500, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/MERCEDES-BENZ_CLS-Class-2014_main.jpg', 'available'),
(36, 'MERCEDES BENZ', 'AMG GT', 'Yellow', 'Petrol', 7000, 2, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/MERCEDES-BENZ_AMG-GT-2015_main.jpg', 'available'),
(37, 'FORD', 'Focus RS', 'Blue', 'Petrol', 2000, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/FORD_Focus-RS-2016_main.jpg', 'available'),
(38, 'FORD', 'Galaxy', 'Black', 'Diesel', 2500, 6, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/FORD_Galaxy-2016_main.jpg', 'available'),
(39, 'FORD', 'Focus Sedan', 'Blue', 'Petrol', 2200, 4, 'manual', 'http://s1.cdn.autoevolution.com/images/models/FORD_Focus-Sedan-2014_main.jpg', 'available'),
(40, 'FORD', 'Focus ST', 'Yellow', 'Diesel', 2200, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/FORD_Focus-ST-5-Doors-2014_main.jpg', 'available'),
(41, 'FORD', 'Taurus', 'Brown', 'Pentrol', 2400, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/FORD_Taurus-2012_main.jpg', 'available'),
(42, 'FORD', 'Escape', 'Red', 'Pentrol', 2000, 6, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/FORD_Ford-Escape-2012_main.jpg', 'available'),
(43, 'FORD', 'Fiesta', 'Brown', 'Pentrol', 2000, 6, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/FORD_Fiesta-3-Doors-2013_main.jpg', 'available'),
(44, 'FORD', 'Wagon', 'Blue', 'Pentrol', 2500, 6, 'manual', 'http://s1.cdn.autoevolution.com/images/models/FORD_Focus-Estate-2014_main.jpg', 'available'),
(45, 'FORD', 'Edge', 'Red', 'Pentrol', 3000, 6, 'manual', 'http://s1.cdn.autoevolution.com/images/models/FORD_Edge-2014_main.jpg', 'available'),
(46, 'FORD', 'Mustang', 'White', 'Pentrol', 5000, 2, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/FORD_Mustang-Shelby-GT350-2015_main.jpg', 'available'),
(47, 'NISSAN', 'Sunny', 'Brown', 'Diesel', 2500, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/NISSAN_Tiida-Versa-Sedan-2012_main.jpg', 'available'),
(48, 'NISSAN', 'Skyline', 'Black', 'Pentrol', 2000, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/NISSAN_Skyline-Sedan-2006_main.jpg', 'available'),
(49, 'NISSAN', '370Z', 'White', 'Pentrol', 3000, 2, 'manual', 'http://s1.cdn.autoevolution.com/images/models/NISSAN_370Z-2012_main.jpg', 'available'),
(50, 'NISSAN', 'GT-R Nismo', 'White', 'Pentrol', 3000, 2, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/NISSAN_GT-R--R35--Nismo-2014_main.jpg', 'available'),
(51, 'NISSAN', 'Maxima', 'Blue', 'Diesel', 2500, 4, 'manual', 'http://s1.cdn.autoevolution.com/images/models/NISSAN_Maxima-2016_main.jpg', 'available'),
(52, 'NISSAN', 'Note', 'Orange', 'Diesel', 1600, 6, 'manual', 'http://s1.cdn.autoevolution.com/images/models/NISSAN_Note-2013_main.jpg', 'available'),
(53, 'NISSAN', 'Micra', 'Blue', 'Pentrol', 1500, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/NISSAN_Micra-2013_main.jpg', 'available'),
(54, 'NISSAN', 'Murano', 'Orange', 'Pentrol', 2000, 6, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/NISSAN_Murano-2015_main.jpg', 'available'),
(55, 'MINI', 'Clubman', 'Brown', 'Diesel', 4000, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/MINI_Clubman-2016_main.jpg', 'available'),
(56, 'MINI', 'Roadster', 'White', 'Diesel', 5000, 2, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/MINI_Cooper-Roadster-2011_main.jpg', 'available'),
(57, 'LOTUS', 'Evora', 'Grey', 'Petrol', 6000, 2, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/LOTUS_Evora-400-2015_main.jpg', 'available'),
(58, 'LOTUS', 'Exige', 'Green', 'Diesel', 6500, 2, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/LOTUS_Exige-2012_main.jpg', 'available'),
(59, 'BMW', '2 Eleven', 'Black', 'Diesel', 6500, 2, 'manual', 'http://s1.cdn.autoevolution.com/images/models/LOTUS_2-Eleven-2007_main.jpg', 'available'),
(60, 'PORSCHE', 'Boxster Spyder', 'White', 'Petrol', 7500, 2, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/PORSCHE_Boxster-Spyder-2016_main.jpg', 'available'),
(61, 'PORSCHE', '918', 'Grey', 'Diesel', 8000, 2, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/PORSCHE_918-Spyder-2014_main.jpg', 'available'),
(62, 'PORSCHE', '911 GT3', 'Red', 'Petrol', 8000, 2, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/PORSCHE_911-GT3-2013_main.jpg', 'available'),
(63, 'PORSCHE', 'Cayman', 'Grey', 'Diesel', 9500, 2, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/PORSCHE_Cayman--981--2012_main.jpg', 'available'),
(64, 'AUDI', 'TT Roadster', 'Yellow', 'Petrol', 6000, 2, 'manual', 'http://s1.cdn.autoevolution.com/images/models/AUDI_TTS-Roadster-2014_main.jpg', 'unvailable'),
(65, 'AUDI', 'S1', 'Red', 'Diesel', 5000, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/AUDI_S1-2014_main.jpg', 'available'),
(66, 'AUDI', 'A5 Cabriolet', 'White', 'Diesel', 6500, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/AUDI_A5-Cabriolet-2012_main.jpg', 'available'),
(67, 'LAMBORGHINI', 'Aventador', 'Red', 'Diesel', 12000, 2, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/LAMBORGHINI_Aventador-LP750-4-SV-2015_main.jpg', 'available'),
(68, 'LAMBORGHINI', 'Huracan', 'Yellow', 'Petrol', 11000, 2, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/LAMBORGHINI_Huracan-2014_main.jpg', 'available'),
(69, 'LAMBORGHINI', 'Veneno Roadster', 'Red', 'Petrol', 14000, 2, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/LAMBORGHINI_Veneno-Roadster-2014_main.jpg', 'available'),
(70, 'VOLVO', 'S60', 'Red', 'Petrol', 4000, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/VOLVO_S60-2013_main.jpeg', 'available'),
(71, 'VOLVO', 'V40', 'Blue', 'Diesel', 4500, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/VOLVO_V40-2012_main.jpg', 'available'),
(72, 'LEXUS', 'RC', 'Red', 'Diesel', 4000, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/LEXUS_RC-2014_main.png', 'available'),
(73, 'ASTON MARTIN', 'DB9 Carbon Edition', 'Grey', 'Petrol', 12000, 2, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/ASTON-MARTIN_DB9-Carbon-Edition-2014_main.jpg', 'unvailable'),
(74, 'ASTON MARTIN', 'Rapide S', 'Red', 'Petrol', 15000, 2, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/ASTON-MARTIN_Rapide-S-2013_main.png', 'unvailable'),
(75, 'HYUNDAI', 'i10', 'Blue', 'Petrol', 1500, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/HYUNDAI_i10-2014_main.jpg', 'available'),
(76, 'HYUNDAI', 'Genesis', 'Red', 'Diesel', 3500, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/HYUNDAI_Genesis--2013_main.jpg', 'available'),
(77, 'HYUNDAI', 'Veloster', 'Orange', 'Diesel', 4000, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/HYUNDAI_Veloster-2011_main.jpg', 'available'),
(78, 'BENTLEY', 'Bentayga', 'Brown', 'Petrol', 12000, 4, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/BENTLEY_Bentayga-2015_main.jpg', 'available'),
(79, 'BENTLEY', 'Continental GTC', 'Brown', 'Petrol', 10000, 2, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/BENTLEY_Continental-GTC-2015_main.jpg', 'available'),
(81, 'JAGUAR', 'F-Type Coupe', 'White', 'Diesel', 7000, 2, 'manual', 'http://s1.cdn.autoevolution.com/images/models/JAGUAR_F-Type-Coupe-2014_main.jpg', 'available'),
(82, 'JAGUAR', 'XJR', 'Grey', 'Petrol', 8000, 4, 'manual', 'http://s1.cdn.autoevolution.com/images/models/JAGUAR_XJR-2013_main.jpg', 'available'),
(83, 'LAND ROVER', 'Range Rover Evoque', 'White', 'Petrol', 5000, 6, 'automatic', 'http://s1.cdn.autoevolution.com/images/models/LAND-ROVER_Range-Rover-Evoque-5-Door-2015_main.jpg', 'available'),
(84, 'GMC', 'Terrian', 'Red', 'Petrol', 5000, 6, 'manual', 'http://s1.cdn.autoevolution.com/images/models/GMC_Terrain-2016_main.jpg', 'available');

-- --------------------------------------------------------

--
-- Table structure for table `logo`
--

CREATE TABLE `logo` (
  `id_logo` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `picture` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logo`
--

INSERT INTO `logo` (`id_logo`, `name`, `picture`) VALUES
(1, 'BMW', 'http://s1.cdn.autoevolution.com/images/producers/bmw-sm.jpg'),
(2, 'CHEVROLET', 'http://s1.cdn.autoevolution.com/images/producers/chevrolet-sm.jpg'),
(3, 'FORD', 'http://s1.cdn.autoevolution.com/images/producers/ford-sm.jpg'),
(4, 'HONDA', 'http://s1.cdn.autoevolution.com/images/producers/honda-sm.jpg'),
(5, 'MAZDA', 'http://s1.cdn.autoevolution.com/images/producers/mazda-sm.jpg'),
(6, 'MERCEDES BENZ', 'http://s1.cdn.autoevolution.com/images/producers/mercedes-benz-sm.jpg'),
(7, 'NISSAN', 'http://s1.cdn.autoevolution.com/images/producers/nissan-sm.jpg'),
(8, 'TOYOTA', 'http://s1.cdn.autoevolution.com/images/producers/toyota-sm.jpg'),
(9, 'LOTUS', 'http://s1.cdn.autoevolution.com/images/producers/lotus-sm.jpg'),
(10, 'MINI', 'http://s1.cdn.autoevolution.com/images/producers/mini-sm.jpg'),
(11, 'PORSCHE', 'http://s1.cdn.autoevolution.com/images/producers/porsche-sm.jpg'),
(12, 'AUDI', 'http://s1.cdn.autoevolution.com/images/producers/audi-sm.jpg'),
(13, 'LAMBORGHINI', 'http://s1.cdn.autoevolution.com/images/producers/lamborghini-sm.jpg'),
(14, 'VOLVO', 'http://s1.cdn.autoevolution.com/images/producers/volvo-sm.jpg'),
(15, 'LEXUS', 'http://s1.cdn.autoevolution.com/images/producers/lexus-sm.jpg'),
(16, 'ASTON MARTIN', 'http://s1.cdn.autoevolution.com/images/producers/aston-martin-sm.jpg'),
(17, 'HYUNDAI', 'http://s1.cdn.autoevolution.com/images/producers/hyundai-sm.jpg'),
(18, 'LAND ROVER', 'http://s1.cdn.autoevolution.com/images/producers/land-rover-sm.jpg'),
(19, 'BENTLEY', 'http://s1.cdn.autoevolution.com/images/producers/bentley-sm.jpg'),
(20, 'JAGUAR', 'http://s1.cdn.autoevolution.com/images/producers/jaguar-sm.jpg'),
(21, 'GMC', 'http://s1.cdn.autoevolution.com/images/producers/gmc-sm.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `renting`
--

CREATE TABLE `renting` (
  `id_renting` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_car` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `charge` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `renting`
--

INSERT INTO `renting` (`id_renting`, `id_user`, `id_car`, `start_date`, `end_date`, `return_date`, `total_cost`, `charge`, `status`) VALUES
(2, 1, 8, '2015-11-12', '2015-11-13', '2015-11-12', 3500, 0, 'returned'),
(3, 1, 9, '2015-11-12', '2015-11-13', '2015-11-12', 4000, 0, 'returned'),
(4, 1, 10, '2015-11-12', '2015-11-13', '2015-11-12', 3000, 0, 'returned'),
(8, 1, 1, '2015-11-12', '2015-11-13', '2015-11-12', 3300, 0, 'returned'),
(9, 2, 73, '2015-07-12', '2015-11-01', NULL, 192000, NULL, 'reserved'),
(11, 1, 8, '2015-11-12', '2015-11-17', NULL, 17500, NULL, 'reserved'),
(12, 1, 74, '2015-11-12', '2015-11-21', '2015-11-12', 135000, 0, 'returned'),
(14, 1, 74, '2015-11-12', '2015-12-10', NULL, 420000, NULL, 'reserved'),
(15, 2, 64, '2015-11-12', '2015-11-15', NULL, 18000, NULL, 'reserved');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `firstname`, `lastname`, `telephone`, `email`, `status`) VALUES
(1, 'admin', '1234', 'tanakorns', 'suvanprateeb', '923923', 'tapood@tapood2', 'admin'),
(2, 'asd', 'asd', 'tans2', 'suvansadasd', '023123124', 'tasd@asd', 'member'),
(4, 'bank', 'bank', 'bankza0072', 'mak', '0231232', 'bank@inwza.com', 'member'),
(6, 'kk', 'kk', 'kk', 'kk', '021312', 'kk@kk.com', 'banned'),
(9, 'daraiing', '1234', 'darathorn', ' tititha', '8493840223', 'afvae@eklge.okoo', 'member'),
(10, 'gaz', 'gaz', 'Bank', 'Inwza007', '123123123', 'bank@email.com', 'member'),
(11, 'jay', 'jay', 'tanakorn2', 'suvanprateeb', '000', '111@111', 'member'),
(12, 'bankinw', 'bankinwza', 'asda', 'asd', '23432', 'adsf2sdf@sdf', 'member'),
(13, 'bankinw', 'dfsf', 'asda', 'asd', '23432', 'adsf2sdf@sdf', 'member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id_car`);

--
-- Indexes for table `logo`
--
ALTER TABLE `logo`
  ADD PRIMARY KEY (`id_logo`);

--
-- Indexes for table `renting`
--
ALTER TABLE `renting`
  ADD PRIMARY KEY (`id_renting`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `id_car` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `logo`
--
ALTER TABLE `logo`
  MODIFY `id_logo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `renting`
--
ALTER TABLE `renting`
  MODIFY `id_renting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
