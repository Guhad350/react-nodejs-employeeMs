-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2024 at 09:41 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employeems`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(140) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`) VALUES
(1, 'admin@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Development'),
(4, 'Designin'),
(5, 'Software Eng'),
(6, 'cleaner'),
(7, 'nasir'),
(8, 'data analyst'),
(9, 'pylot'),
(10, 'data Engeeer'),
(11, 'network engeer'),
(12, 'network engeer'),
(13, 'network engeer'),
(14, 'civil engneering');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(150) NOT NULL,
  `salary` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `image` varchar(60) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `email`, `password`, `salary`, `address`, `image`, `category_id`) VALUES
(16, 'Abdirahman Hassan Mohamed', 'Abdi@gmail.com', '$2b$10$LUo.a8ihXllclrO5WlyjZeInsZ6UNMRkmZ9NI.kg3u31B2Umn44Be', 10001, 'dayniile', 'image_1703165969919.jpeg', 3),
(17, 'farah', 'farah@gmail.com', '$2b$10$fLbj3JizNA7ZU.AH.RRsRu9ndrwok4h0thsaiH.9h2E0yseb1hzNa', 2000, 'muqdisho', 'image_1703167066093.jpg', 3),
(18, 'ibrahim', 'ibrahim@gmail.com', '$2b$10$6T18eFZRvcVuo.7biDzM.uNvtxmvSqhIzPaUO7.XkQ.TIfeRJi4MG', 3000, 'Garoowe', 'image_1703167391353.jpg', 5),
(19, 'fadumo', 'fadumo@gmail.com', '$2b$10$sz9nhr7.gTRhewfJ4PcWYece7VZQJ3kUGJqhpI4eFWpQTyN2QVreq', 600, 'Galkacyo', 'image_1703167559715.jpg', 2),
(20, 'naciimo', 'nacimo@gmail.com', '$2b$10$/FGtOrGnrXK95x2FWrtx4.DBdGw3jR/zPO1mRWZHWZS1ol/gnmqcm', 500, 'hodan', 'image_1703167696364.jpg', 7),
(21, 'Zaki', 'zaki@gmail.com', '$2b$10$x7CrxhIR4B9y.rOizZXG9uHd.cjx9gXGGb5BaqI81HunPPMp3by0a', 4000, 'warta nabada', 'image_1703167974573.jpg', 4),
(22, 'haruuse', 'haruse@gmail.com', '$2b$10$0oltCWCDAgw0tcVioVZ1L.nGqMNkvGfzVfzz0zBfc78IsszoyYFhC', 5000, 'Nairobi', 'image_1703168137561.jpg', 8),
(30, 'osman', 'osman@gmail.com', '$2b$10$V6sINQ67SAdsnpq.w1HfgOMmN024ijjUHBBvFy9Huvdepdm.1M3N.', 5000, 'hiliwaa', 'image_1704020536049.jpg', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
