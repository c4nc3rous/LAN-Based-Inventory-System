-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2025 at 03:57 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `surname` varchar(60) NOT NULL,
  `middle_name` varchar(60) NOT NULL,
  `birthdate` date NOT NULL,
  `contact` varchar(50) NOT NULL,
  `address` varchar(60) NOT NULL,
  `gmail` varchar(150) NOT NULL,
  `type` varchar(20) NOT NULL,
  `start_date` date NOT NULL,
  `department` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `employee_id`, `first_name`, `surname`, `middle_name`, `birthdate`, `contact`, `address`, `gmail`, `type`, `start_date`, `department`, `role`, `username`, `password`, `code`) VALUES
(1, '10001', 'JOANNA', 'GALANGA', 'CABRAL', '2025-03-11', '09671234587', 'CALOOCAN CITY', 'JOANNAGALANGA10@GMAIL.COM', 'STAFF', '2025-03-18', 'FINANCE', 'STAFF', 'STAFF', '123', '1234'),
(2, '10002', 'MICHAEL', 'DELACRUZ', 'BUSTAMANTE', '2025-03-11', '09456789421', 'NAVOTAS CITY', 'MJDBC14@GMAIL.COM', 'ADMIN', '2025-03-18', 'FINANCE', 'ADMIN', 'ADMIN', '1234', '779024'),
(8, '10003', 'CHRISTIAN', 'DAGAMI', 'LOUIE', '2025-03-17', '09123456789', 'SDADAD', 'LOUIEDAGAMI124@GMAIL.COM', 'ADMIN', '2025-03-17', 'TEST', 'TEST', 'TEST', '123', '382487');

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `user_id`, `user_name`, `activity`, `timestamp`) VALUES
(162, 10003, 'CHRISTIAN DAGAMI', 'USER LOGGED IN.', '2025-04-28 09:53:06'),
(163, 10003, 'CHRISTIAN DAGAMI', 'USER LOGGED OUT.', '2025-04-28 09:53:42'),
(164, 10001, 'JOANNA GALANGA', 'USER LOGGED IN.', '2025-04-28 09:53:46'),
(165, 10001, 'JOANNA GALANGA', 'USER LOGGED OUT.', '2025-04-28 09:54:01');

-- --------------------------------------------------------

--
-- Table structure for table `backup_history`
--

CREATE TABLE `backup_history` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `upload_date` date DEFAULT NULL,
  `file_size_kb` varchar(255) DEFAULT NULL,
  `gdrive_file_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `intransac`
--

CREATE TABLE `intransac` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `transaction_id` varchar(50) NOT NULL,
  `employee_id` varchar(50) NOT NULL,
  `employee_name` varchar(100) NOT NULL,
  `supplier_id` varchar(50) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `outtransact`
--

CREATE TABLE `outtransact` (
  `id` int(11) NOT NULL,
  `transaction_id` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `employee_id` varchar(50) NOT NULL,
  `employee_name` varchar(100) NOT NULL,
  `team_leaderId` varchar(50) NOT NULL,
  `team_leaderName` varchar(100) NOT NULL,
  `team_number` varchar(100) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `outtransact`
--

INSERT INTO `outtransact` (`id`, `transaction_id`, `date`, `employee_id`, `employee_name`, `team_leaderId`, `team_leaderName`, `team_number`, `product_id`, `product_name`, `type`, `price`, `quantity`) VALUES
(10, 'TXN-7327', '2025-04-24', '10002', 'MICHAEL DELACRUZ', '10003', 'LEADER B', 'TEAM 3', '5S31DAFFAS', 'HUB BUTTON', 'HUB', 8000, 40);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(255) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `quantity` int(255) NOT NULL,
  `price` int(255) NOT NULL,
  `description` varchar(200) NOT NULL,
  `barcode` varchar(50) NOT NULL,
  `exdate` date NOT NULL,
  `supplier_id` varchar(50) NOT NULL,
  `supplier_name` varchar(50) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `photo` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(50) NOT NULL,
  `employee_name` varchar(100) NOT NULL,
  `reports_id` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `subject` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `supplier_id` varchar(50) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `date`, `supplier_id`, `supplier_name`, `contact`, `address`) VALUES
(6, '2025-02-08', 'S10006', 'SUPPLIER A', '09671234567', 'ADDRESS A'),
(7, '2025-02-09', 'S10007', 'SUPPLIER B', '09781234567', 'ADDRESS B'),
(8, '2025-02-10', 'S10008', 'SUPPLIER C', '09891234567', 'ADDRESS C'),
(9, '2025-02-11', 'S10009', 'SUPPLIER D', '09901234567', 'ADDRESS D'),
(10, '2025-02-12', 'S10010', 'SUPPLIER E', '09011234567', 'ADDRESS E'),
(11, '2025-03-17', 'S10011', 'SUPPLIER F', '09123456788', 'MANILA CITY'),
(12, '2025-03-17', '1563542', 'JAMES SABANDO', '098750989845', '10TH AVVE CALOOCAN CITY'),
(13, '2025-03-17', '4324256QAA', 'JAMES BOND', '08763526', 'JRAMOS STREET CALOOCAN CITY');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `team_leaderId` varchar(255) NOT NULL,
  `team_leaderName` varchar(255) NOT NULL,
  `team_number` varchar(50) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `subcon` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `date`, `team_leaderId`, `team_leaderName`, `team_number`, `contact`, `subcon`, `type`) VALUES
(2, '2025-02-02', '10002', 'LEADER A', 'TEAM 2', '0912345678', 'SUBCON A', 'SUBCON'),
(3, '2025-02-03', '10003', 'LEADER B', 'TEAM 3', '0923456789', 'SUBCON B', 'SUBCON'),
(4, '2025-02-04', '10004', 'LEADER C', 'TEAM 4', '0934567890', 'TEST', 'ORGANIC'),
(5, '2025-02-05', '10005', 'LEADER D', 'TEAM 5', '0945678901', 'SUBCON C', 'SUBCON'),
(6, '2025-02-06', '10006', 'LEADER E', 'TEAM 6', '0956789012', 'TEST', 'ORGANIC');

-- --------------------------------------------------------

--
-- Table structure for table `userlockout`
--

CREATE TABLE `userlockout` (
  `UserID` int(11) NOT NULL,
  `FailedAttempts` int(11) NOT NULL DEFAULT 0,
  `LockoutEndTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userlockout`
--

INSERT INTO `userlockout` (`UserID`, `FailedAttempts`, `LockoutEndTime`) VALUES
(10001, 0, NULL),
(10002, 0, NULL),
(10003, 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `backup_history`
--
ALTER TABLE `backup_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `intransac`
--
ALTER TABLE `intransac`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `outtransact`
--
ALTER TABLE `outtransact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlockout`
--
ALTER TABLE `userlockout`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `backup_history`
--
ALTER TABLE `backup_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `intransac`
--
ALTER TABLE `intransac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `outtransact`
--
ALTER TABLE `outtransact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `userlockout`
--
ALTER TABLE `userlockout`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10004;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
