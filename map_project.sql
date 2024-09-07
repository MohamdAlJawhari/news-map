-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 06, 2024 at 10:42 PM
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
-- Database: `map_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `markers`
--

CREATE TABLE `markers` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `marker_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `markers`
--

INSERT INTO `markers` (`id`, `title`, `date`, `image_path`, `description`, `lat`, `lng`, `marker_type`) VALUES
(1, 'red', '0000-00-00', NULL, NULL, 33.0869, 35.1315, NULL),
(2, 'yudasyu', '0000-00-00', NULL, NULL, 40.0339, -74.7729, NULL),
(3, 'save this', '0000-00-00', NULL, NULL, 39.7642, -74.4763, NULL),
(4, 'event', '0000-00-00', NULL, NULL, 33.1376, 35.5078, NULL),
(5, 'this an event', '2024-07-11', 'gun', 'aasdvuhyasduyasbdudiewuod', 33.2019, 35.56, 'fwsfcwefw'),
(6, 'hala', '0000-00-00', '', 'DSdwadwedw', 33.0984, 35.1837, '');

-- --------------------------------------------------------

--
-- Table structure for table `polygons`
--

CREATE TABLE `polygons` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(7) NOT NULL,
  `coordinates` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `polygons`
--

INSERT INTO `polygons` (`id`, `name`, `color`, `coordinates`) VALUES
(1, '', 'red', '[[{\"lat\":33.158247668082396,\"lng\":35.35675048828126},{\"lat\":33.151349385342535,\"lng\":35.71380615234376},{\"lat\":32.9764120829052,\"lng\":35.59570312500001},{\"lat\":32.92801287395169,\"lng\":35.32653808593751}]]'),
(2, '', 'blue', '[[{\"lat\":40.000267972646796,\"lng\":-75.79467773437501},{\"lat\":39.977120098439634,\"lng\":-75.21514892578126},{\"lat\":39.76632525654491,\"lng\":-75.20141601562501},{\"lat\":39.675484393594814,\"lng\":-75.58319091796876},{\"lat\":39.787433886224406,\"lng\":-75.71228027343751}]]'),
(3, '', 'green', '[[{\"lat\":40.15788524950653,\"lng\":-74.73724365234376},{\"lat\":40.15158756460002,\"lng\":-74.26208496093751},{\"lat\":39.96238554917605,\"lng\":-74.27032470703126},{\"lat\":39.930800820752765,\"lng\":-74.71801757812501}]]'),
(4, '', 'red', '[[{\"lat\":40.073868105094846,\"lng\":-74.62188720703126},{\"lat\":39.958175094600094,\"lng\":-74.42138671875001},{\"lat\":39.79376521264888,\"lng\":-74.53125000000001},{\"lat\":39.812755695478145,\"lng\":-74.93225097656251}]]'),
(5, '', '#ff0000', '[[{\"lat\":33.142150831105354,\"lng\":35.39657592773438},{\"lat\":33.28691595686207,\"lng\":35.61904907226563},{\"lat\":33.13410130507293,\"lng\":35.64514160156251},{\"lat\":32.95797741405952,\"lng\":35.35263061523438},{\"lat\":33.075432481213326,\"lng\":35.36773681640626},{\"lat\":33.128351191631566,\"lng\":35.38970947265626}]]'),
(6, 'aefdaEDF', 'green', '[[{\"lat\":33.22720064403193,\"lng\":35.40618896484376},{\"lat\":33.39705230475205,\"lng\":35.71380615234376},{\"lat\":33.13065128220444,\"lng\":35.64514160156251},{\"lat\":33.01326987686983,\"lng\":35.28533935546876}]]'),
(7, 'war', 'blue', '[[{\"lat\":33.14904983719869,\"lng\":35.37322998046876},{\"lat\":33.1398510418607,\"lng\":35.69458007812501},{\"lat\":32.895732015669815,\"lng\":35.65063476562501},{\"lat\":32.865746395474766,\"lng\":35.28259277343751},{\"lat\":33.119150226768866,\"lng\":35.38146972656251}]]');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `marker_id` int(11) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `mini_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$UpBnLRS5uU28MdS/9/WR4e5yH6/ey.7khqI8Ek7msrGcNPWvEgxjK');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `markers`
--
ALTER TABLE `markers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `polygons`
--
ALTER TABLE `polygons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marker_id` (`marker_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `markers`
--
ALTER TABLE `markers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `polygons`
--
ALTER TABLE `polygons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`marker_id`) REFERENCES `markers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
