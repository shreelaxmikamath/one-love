-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2024 at 09:45 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asteria_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `contact_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `users`
ADD CONSTRAINT `username_unique` UNIQUE (`username`);
ALTER TABLE `users`
ADD COLUMN `full_name` varchar(100) NOT NULL AFTER `username`;

--
-- Dumping data for table `users`
--
INSERT INTO users (id, username, full_name, email, password, contact_number) VALUES
(1, 'anita', 'Anita Sharma', 'anita.sharma@gmail.com', 'password', '9876543210'),
(2, 'lakshmi', 'Lakshmi Iyer', 'lakshmi.iyer@gmail.com', 'password', '9876509876'),
(3, 'meera', 'Meera Gupta', 'meera.gupta@gmail.com', 'password', '9876512345');
-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `diet` varchar(50) DEFAULT NULL,
  `months` int(11) DEFAULT NULL,
  `children` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO user_profiles (id, user_id, age, weight, height, diet, months, children, created_at) VALUES
(1, 1, 30, 55, 160, 'vegetarian', 0, 0, '2024-06-27 06:46:30'),
(2, 2, 28, 62, 165, 'non-vegetarian', 0, 0, '2024-06-27 06:49:20'),
(3, 3, 32, 58, 170, 'vegan', 0, 0, '2024-06-27 06:50:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- Table structure for table `notes`
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `note` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `fk_notes_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO notes (id, user_id, date, note, created_at) VALUES
(1, 1, '2024-06-27', 'Buy groceries', '2024-06-27 07:00:00'),
(2, 2, '2024-06-27', 'Finish project report', '2024-06-27 08:00:00'),
(3, 3, '2024-06-27', 'Plan vacation', '2024-06-27 09:00:00');

CREATE TABLE categories (
    id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
    category_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);
INSERT INTO categories (id, user_id, category_name) VALUES
(1, 1, 'Groceries'),
(2, 2, 'Work'),
(3, 3, 'Personal');

CREATE TABLE items (
    id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    item_name VARCHAR(255) NOT NULL,
    is_done BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (category_id) REFERENCES categories (id)
);
INSERT INTO items (id, user_id, category_id, item_name, is_done) VALUES
(1, 1, 1, 'Buy rice', FALSE),
(2, 2, 2, 'Complete project report', TRUE),
(3, 3, 3, 'Plan birthday party', FALSE);
ALTER TABLE items ADD COLUMN is_done BOOLEAN DEFAULT FALSE;








