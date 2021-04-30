-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2019 at 02:14 PM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mms`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `acc_no` varchar(20) NOT NULL,
  `cost` double(10,3) NOT NULL,
  `member_deposit` double(10,3) DEFAULT NULL,
  `member_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`acc_no`, `cost`, `member_deposit`, `member_id`) VALUES
('1', 786.000, 1100.000, 'member_01'),
('2', 927.000, 13000.000, 'member_02'),
('3', 1000.000, 1200.000, 'member_03'),
('4', 1400.000, 2800.000, 'member_04'),
('5', 589.000, 900.000, 'member_05'),
('6', 2500.000, 2500.000, 'member_06'),
('8', 1700.000, 1899.000, 'member_08');

-- --------------------------------------------------------

--
-- Stand-in structure for view `bazar`
-- (See below for the actual view)
--
CREATE TABLE `bazar` (
`member_id` varchar(20)
,`name` varchar(50)
,`bazaar_name` varchar(50)
,`bazaar_cost` double(10,3)
,`date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `daily_activity`
--

CREATE TABLE `daily_activity` (
  `act_no` int(20) NOT NULL,
  `bazaar_name` varchar(50) NOT NULL,
  `bazaar_cost` double(10,3) NOT NULL,
  `member_id` varchar(20) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `daily_activity`
--

INSERT INTO `daily_activity` (`act_no`, `bazaar_name`, `bazaar_cost`, `member_id`, `date`) VALUES
(1, 'meat,vegitable,fish etc', 2000.000, 'member_01', '2019-07-01'),
(2, 'rice,fish,milk etc', 600.000, 'member_02', '2019-07-01'),
(3, 'rice,etc', 400.000, 'member_03', '2019-07-03'),
(4, 'mosla,meat, etc', 800.000, 'member_04', '2019-07-04'),
(5, 'rice,fish', 550.000, 'member_05', '2019-07-05'),
(6, 'only hen', 400.000, 'member_06', '2019-07-06'),
(7, 'fish,meat,milk', 900.000, 'member_07', '2019-07-06'),
(8, 'rice', 1300.000, 'member_08', '2019-07-08');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `manager_id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `joining_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`manager_id`, `name`, `phone`, `email`, `address`, `joining_date`) VALUES
('man_2019', 'Arif', '+88018-----06', 'arif@gmail.com', 'Comilla', '2019-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `manager_evaluation`
--

CREATE TABLE `manager_evaluation` (
  `eva_no` int(20) NOT NULL,
  `member_id` varchar(20) NOT NULL,
  `breakfast_rating` int(10) NOT NULL,
  `launch_rating` int(10) NOT NULL,
  `dinner_rating` int(10) NOT NULL,
  `total_ratig` int(10) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager_evaluation`
--

INSERT INTO `manager_evaluation` (`eva_no`, `member_id`, `breakfast_rating`, `launch_rating`, `dinner_rating`, `total_ratig`, `date`) VALUES
(1, 'member_03', 3, 5, 3, 11, '2019-03-01'),
(2, 'member_04', 5, 5, 3, 13, '2019-03-01'),
(3, 'member_05', 3, 5, 3, 11, '2019-03-01'),
(4, 'member_06', 3, 5, 3, 11, '2019-03-01'),
(5, 'member_07', 2, 5, 3, 10, '2019-03-01'),
(6, 'member_08', 4, 5, 3, 12, '2019-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `meal`
--

CREATE TABLE `meal` (
  `serial_no` int(20) NOT NULL,
  `member_id` varchar(20) DEFAULT NULL,
  `breakfast` int(10) DEFAULT NULL,
  `launch` int(10) DEFAULT NULL,
  `dinner` int(10) DEFAULT NULL,
  `total` int(10) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meal`
--

INSERT INTO `meal` (`serial_no`, `member_id`, `breakfast`, `launch`, `dinner`, `total`, `date`) VALUES
(1, 'member_01', 1, 1, 1, 3, '2019-07-01'),
(2, 'member_02', 0, 1, 1, 2, '2019-07-01'),
(3, 'member_03', 1, 1, 0, 2, '2019-07-01'),
(4, 'member_04', 1, 1, 2, 4, '2019-07-01'),
(5, 'member_05', 3, 0, 1, 4, '2019-07-01'),
(6, 'member_06', 0, 1, 0, 1, '2019-07-01'),
(7, 'member_07', 2, 2, 2, 6, '2019-07-01'),
(8, 'member_08', 1, 1, 1, 3, '2019-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `member_id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `manager_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`member_id`, `name`, `phone`, `email`, `address`, `manager_id`) VALUES
('member_01', 'Arif', '+018-----06', 'arif@gmail.com', 'Comilla', 'man_2019'),
('member_02', 'Alif', '+016-----44', 'alif@gmail.com', 'comilla', 'man_2019'),
('member_03', 'Sajeb', '+016-----34', 'sajeb3@gmail.com', 'bijoinogor', 'man_2019'),
('member_04', 'Kabir', '+016-----34', 'Kabir@gmail.com', 'Dhaka', 'man_2019'),
('member_05', 'Habib', '+016-----90', 'habib@gmail.com', 'Nohakhali', 'man_2019'),
('member_06', 'Rahman', '+016-----89', 'rahman@gmail.com', 'Barishal', 'man_2019'),
('member_07', 'Jilani', '+016-----82', 'jilani@gmail.com', 'Kustia', 'man_2019'),
('member_08', 'Jidni', '+016-----36', 'jidni@gmail.com', 'Dhaka', 'man_2019');

-- --------------------------------------------------------

--
-- Stand-in structure for view `member_info`
-- (See below for the actual view)
--
CREATE TABLE `member_info` (
`member_id` varchar(20)
,`name` varchar(50)
,`total` int(10)
,`cost` double(10,3)
,`Deposit` double(10,3)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `member_view`
-- (See below for the actual view)
--
CREATE TABLE `member_view` (
`name` varchar(50)
,`total` int(10)
,`member_deposit` double(10,3)
);

-- --------------------------------------------------------

--
-- Table structure for table `total_calculation`
--

CREATE TABLE `total_calculation` (
  `serial` int(20) NOT NULL,
  `member_id` varchar(20) DEFAULT NULL,
  `total_meal` int(10) NOT NULL,
  `meal_rate` double(10,3) NOT NULL,
  `pay_dept` double(10,3) DEFAULT NULL,
  `remaining` double(10,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `total_calculation`
--

INSERT INTO `total_calculation` (`serial`, `member_id`, `total_meal`, `meal_rate`, `pay_dept`, `remaining`) VALUES
(3, 'member_03', 4, 262.000, 48.000, 0.000),
(4, 'member_04', 4, 262.000, 48.000, 0.000),
(5, 'member_05', 4, 262.000, 48.000, 0.000),
(6, 'member_06', 4, 262.000, 48.000, 0.000);

-- --------------------------------------------------------

--
-- Structure for view `bazar`
--
DROP TABLE IF EXISTS `bazar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bazar`  AS  select `m`.`member_id` AS `member_id`,`m`.`name` AS `name`,`d`.`bazaar_name` AS `bazaar_name`,`d`.`bazaar_cost` AS `bazaar_cost`,`d`.`date` AS `date` from (`member` `m` join `daily_activity` `d`) where `m`.`member_id` = `d`.`member_id` ;

-- --------------------------------------------------------

--
-- Structure for view `member_info`
--
DROP TABLE IF EXISTS `member_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `member_info`  AS  select `m`.`member_id` AS `member_id`,`m`.`name` AS `name`,`me`.`total` AS `total`,`ac`.`cost` AS `cost`,`ac`.`member_deposit` AS `Deposit` from ((`account` `ac` join `member` `m`) join `meal` `me`) where `m`.`member_id` = `ac`.`member_id` and `m`.`member_id` = `me`.`member_id` ;

-- --------------------------------------------------------

--
-- Structure for view `member_view`
--
DROP TABLE IF EXISTS `member_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `member_view`  AS  select `m`.`name` AS `name`,`me`.`total` AS `total`,`c`.`member_deposit` AS `member_deposit` from ((`member` `m` join `meal` `me`) join `account` `c`) where `m`.`member_id` = `me`.`member_id` and `m`.`member_id` = `c`.`member_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`acc_no`),
  ADD KEY `account` (`member_id`);

--
-- Indexes for table `daily_activity`
--
ALTER TABLE `daily_activity`
  ADD PRIMARY KEY (`act_no`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`manager_id`);

--
-- Indexes for table `manager_evaluation`
--
ALTER TABLE `manager_evaluation`
  ADD PRIMARY KEY (`eva_no`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `meal`
--
ALTER TABLE `meal`
  ADD PRIMARY KEY (`serial_no`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `member` (`manager_id`);

--
-- Indexes for table `total_calculation`
--
ALTER TABLE `total_calculation`
  ADD PRIMARY KEY (`serial`),
  ADD KEY `member_id` (`member_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daily_activity`
--
ALTER TABLE `daily_activity`
  MODIFY `act_no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `manager_evaluation`
--
ALTER TABLE `manager_evaluation`
  MODIFY `eva_no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `total_calculation`
--
ALTER TABLE `total_calculation`
  MODIFY `serial` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- Constraints for table `daily_activity`
--
ALTER TABLE `daily_activity`
  ADD CONSTRAINT `daily_activity_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- Constraints for table `manager_evaluation`
--
ALTER TABLE `manager_evaluation`
  ADD CONSTRAINT `manager_evaluation_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  ADD CONSTRAINT `manager_evaluation_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- Constraints for table `meal`
--
ALTER TABLE `meal`
  ADD CONSTRAINT `meal_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`);

--
-- Constraints for table `total_calculation`
--
ALTER TABLE `total_calculation`
  ADD CONSTRAINT `total_calculation_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
