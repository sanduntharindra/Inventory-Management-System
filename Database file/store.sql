-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2021 at 07:25 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store`
--
CREATE DATABASE IF NOT EXISTS `store` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `store`;

-- --------------------------------------------------------

--
-- Table structure for table `defect_items`
--

CREATE TABLE `defect_items` (
  `d_id` int(10) NOT NULL,
  `d_name` varchar(100) NOT NULL,
  `d_type` varchar(100) NOT NULL,
  `d_quanity` int(255) NOT NULL,
  `d_date` date NOT NULL,
  `w_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `defect_items`
--

INSERT INTO `defect_items` (`d_id`, `d_name`, `d_type`, `d_quanity`, `d_date`, `w_id`) VALUES
(4, 'Fiber Patch', 'Fiber Accessories', 10, '2021-02-07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `o_id` int(10) NOT NULL,
  `o_type` varchar(100) NOT NULL,
  `o_prodname` varchar(100) NOT NULL,
  `o_qty` int(255) NOT NULL,
  `o_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`o_id`, `o_type`, `o_prodname`, `o_qty`, `o_date`) VALUES
(1, 'Fiber Accessories', 'Fiber Patch', 150, '2021-02-07'),
(2, 'Cables', 'Telephone', 120, '2021-02-07');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `p_id` int(10) NOT NULL,
  `p_name` varchar(100) NOT NULL,
  `p_type` varchar(100) NOT NULL,
  `p_availability` int(255) NOT NULL,
  `p_date` date NOT NULL,
  `w_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`p_id`, `p_name`, `p_type`, `p_availability`, `p_date`, `w_id`) VALUES
(1, 'Copper', 'Cables', 100, '2021-02-07', 1),
(2, 'Fiber Optic', 'Cables', 50, '2021-02-07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products_orders`
--

CREATE TABLE `products_orders` (
  `p_id` int(10) NOT NULL,
  `o_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `s_id` int(10) NOT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_addres` int(200) NOT NULL,
  `s_email` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers_cont_nu`
--

CREATE TABLE `suppliers_cont_nu` (
  `s_id` int(10) NOT NULL,
  `cont_nu` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers_products`
--

CREATE TABLE `suppliers_products` (
  `s_id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int(10) NOT NULL,
  `u_pwd` varchar(100) NOT NULL,
  `u_name` varchar(100) NOT NULL,
  `u_address` varchar(200) NOT NULL,
  `u_email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `u_pwd`, `u_name`, `u_address`, `u_email`) VALUES
(101, 'test', 'Sandun', 'Colombo', 'sandun@test.com');

-- --------------------------------------------------------

--
-- Table structure for table `users_cont_no`
--

CREATE TABLE `users_cont_no` (
  `u_id` int(10) NOT NULL,
  `cont_nu` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users_orders`
--

CREATE TABLE `users_orders` (
  `u_id` int(10) NOT NULL,
  `o_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `w_id` int(10) NOT NULL,
  `location` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`w_id`, `location`) VALUES
(1, 'Colombo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `defect_items`
--
ALTER TABLE `defect_items`
  ADD PRIMARY KEY (`d_id`),
  ADD KEY `fk_dw_id` (`w_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`o_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `fk_w_id` (`w_id`);

--
-- Indexes for table `products_orders`
--
ALTER TABLE `products_orders`
  ADD KEY `fk_po_id` (`o_id`),
  ADD KEY `fk_pp_id` (`p_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `suppliers_cont_nu`
--
ALTER TABLE `suppliers_cont_nu`
  ADD KEY `fk_ss_id` (`s_id`);

--
-- Indexes for table `suppliers_products`
--
ALTER TABLE `suppliers_products`
  ADD KEY `fk_s_id` (`s_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `users_cont_no`
--
ALTER TABLE `users_cont_no`
  ADD KEY `fk_uu_id` (`u_id`);

--
-- Indexes for table `users_orders`
--
ALTER TABLE `users_orders`
  ADD KEY `fk_u_id` (`u_id`),
  ADD KEY `fk_o_id` (`o_id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`w_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `defect_items`
--
ALTER TABLE `defect_items`
  MODIFY `d_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `defect_items`
--
ALTER TABLE `defect_items`
  ADD CONSTRAINT `fk_dw_id` FOREIGN KEY (`w_id`) REFERENCES `warehouse` (`w_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_w_id` FOREIGN KEY (`w_id`) REFERENCES `warehouse` (`w_id`);

--
-- Constraints for table `products_orders`
--
ALTER TABLE `products_orders`
  ADD CONSTRAINT `fk_po_id` FOREIGN KEY (`o_id`) REFERENCES `orders` (`o_id`),
  ADD CONSTRAINT `fk_pp_id` FOREIGN KEY (`p_id`) REFERENCES `products` (`p_id`);

--
-- Constraints for table `suppliers_cont_nu`
--
ALTER TABLE `suppliers_cont_nu`
  ADD CONSTRAINT `fk_ss_id` FOREIGN KEY (`s_id`) REFERENCES `suppliers` (`s_id`);

--
-- Constraints for table `suppliers_products`
--
ALTER TABLE `suppliers_products`
  ADD CONSTRAINT `fk_s_id` FOREIGN KEY (`s_id`) REFERENCES `suppliers` (`s_id`);

--
-- Constraints for table `users_cont_no`
--
ALTER TABLE `users_cont_no`
  ADD CONSTRAINT `fk_uu_id` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`);

--
-- Constraints for table `users_orders`
--
ALTER TABLE `users_orders`
  ADD CONSTRAINT `fk_o_id` FOREIGN KEY (`o_id`) REFERENCES `orders` (`o_id`),
  ADD CONSTRAINT `fk_u_id` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
