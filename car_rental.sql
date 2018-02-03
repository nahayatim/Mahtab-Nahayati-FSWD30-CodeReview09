-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 03, 2018 at 10:55 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `additional_charge`
--

CREATE TABLE `additional_charge` (
  `additional_charge_id` int(11) NOT NULL,
  `fk_location_id` int(11) NOT NULL,
  `fk_company_id` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `color` varchar(55) NOT NULL,
  `rental_price` float NOT NULL,
  `category` varchar(100) NOT NULL,
  `fk_reservation_id` int(11) NOT NULL,
  `fk_location_id` int(11) NOT NULL,
  `fk_insurance_id` int(11) NOT NULL,
  `fk_company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `fk_car_id` int(11) NOT NULL,
  `fk_additional_charge_id` int(11) NOT NULL,
  `address` varchar(155) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `website` varchar(155) NOT NULL,
  `email_address` varchar(155) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `first_name` varchar(55) NOT NULL,
  `last_name` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `address` varchar(155) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `driver_license_num` int(11) NOT NULL,
  `credit_card_num` int(11) NOT NULL,
  `fk_reservation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`first_name`, `last_name`, `customer_id`, `address`, `phone_number`, `email_address`, `driver_license_num`, `credit_card_num`, `fk_reservation_id`) VALUES
('maria', 'fg', 1, 'hhight street', 123456, '', 234, 4567, 1),
('marta', 'qw', 2, 'doe street', 456789, '', 5678, 8765, 2),
('john', 'koo', 3, 'fill street', 543267, '', 1256, 8943, 3),
('nikolas', 'khol', 4, 'dd street', 9874352, '', 8734, 874532, 4),
('mahyar', 'df', 5, 'er street', 7659372, '', 756372, 958463, 5),
('manuela', 'hjre', 6, 'reuvu', 8574922, '', 95463, 75648246, 6);

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `insurance_id` int(11) NOT NULL,
  `fk_car_id` int(11) NOT NULL,
  `insurance_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `fk_location_id` int(11) DEFAULT NULL,
  `description` text,
  `invoice_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `fk_reservation_id`, `fk_location_id`, `description`, `invoice_date`) VALUES
(1, 1, NULL, 'hgewd hgvuwuh bbhdwubs', '2018-02-06'),
(2, 2, NULL, 'jgeiwi jgwjeifoaq  hugeiw  fua bhea  bhwauifbvae ', '2018-02-13'),
(3, 3, NULL, 'hwquic   gyuqwa  wuqf qe hquwa bfqai ', '2018-02-13'),
(4, 4, NULL, 'hjeiwc wgfuewi  fhuia cer huwia cw3 gyuw9 ', '2018-02-14'),
(5, 5, NULL, 'gyuq v gyq gyq rqgy9 r4gqyu9 rqhfbaq ', '2018-02-26');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `fk_additional_charge_id` int(11) NOT NULL,
  `pick_up_location` varchar(255) NOT NULL,
  `drop_of_location` varchar(255) NOT NULL,
  `city` varchar(55) NOT NULL,
  `street` varchar(55) NOT NULL,
  `zip` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `country` varchar(155) NOT NULL,
  `fk_invoice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `fk_additional_charge_id`, `pick_up_location`, `drop_of_location`, `city`, `street`, `zip`, `state`, `country`, `fk_invoice_id`) VALUES
(1, 1, 'frgrw', 'wvhy4ht hw  htw ', 'london', 'hfjd street', 6352, 43, 'uk', 1),
(2, 2, 'gsv', 'hevba', 'vienna', 'landstrasse', 432, 5, 'austria', 2),
(3, 3, 'tqgq', 'hwhw', 'perth', 'gwerb', 345, 43, 'australia', 3),
(4, 4, 'brwfc', 'brwfc ', 'vienna', 'gurtel', 454, 3, 'austria', 4),
(5, 5, 'ktjry', 'krn4w', 'boston', 'esav ', 431, 343, 'usa', 5);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_invoice_id` int(11) DEFAULT NULL,
  `pick_up_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `drop_of_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `fk_customer_id`, `fk_car_id`, `fk_invoice_id`, `pick_up_date`, `drop_of_date`) VALUES
(1, 3, NULL, NULL, '2018-02-07 03:21:00', '2018-02-14 10:33:00'),
(2, 5, NULL, NULL, '2018-02-05 05:44:00', '2018-02-21 08:00:22'),
(3, 6, NULL, NULL, '2018-02-08 06:32:00', '2018-02-21 07:33:00'),
(4, 1, NULL, NULL, '2018-02-14 05:00:00', '2018-02-28 09:00:00'),
(5, 2, NULL, NULL, '2018-02-08 09:27:00', '2018-02-26 11:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_charge`
--
ALTER TABLE `additional_charge`
  ADD PRIMARY KEY (`additional_charge_id`),
  ADD KEY `fk_location_id` (`fk_location_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`),
  ADD KEY `fk_location_id` (`fk_location_id`),
  ADD KEY `fk_company_id` (`fk_company_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `fk_additional_charge_id` (`fk_additional_charge_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`insurance_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`),
  ADD KEY `fk_location_id` (`fk_location_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `additional_charge`
--
ALTER TABLE `additional_charge`
  MODIFY `additional_charge_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `insurance`
--
ALTER TABLE `insurance`
  MODIFY `insurance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `additional_charge`
--
ALTER TABLE `additional_charge`
  ADD CONSTRAINT `additional_charge_ibfk_1` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`),
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`),
  ADD CONSTRAINT `car_ibfk_3` FOREIGN KEY (`fk_company_id`) REFERENCES `company` (`company_id`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`fk_additional_charge_id`) REFERENCES `additional_charge` (`additional_charge_id`);

--
-- Constraints for table `insurance`
--
ALTER TABLE `insurance`
  ADD CONSTRAINT `insurance_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
