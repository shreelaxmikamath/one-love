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

-- Charset settings
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Database: asteria_db
--

-- Table structure for table users
CREATE TABLE users (
  id int(11) NOT NULL,
  username varchar(50) NOT NULL,
  email varchar(50) NOT NULL,
  password varchar(50) NOT NULL,
  contact_number varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Add unique constraint and full_name column
ALTER TABLE users
ADD CONSTRAINT username_unique UNIQUE (username);
ALTER TABLE users
ADD COLUMN full_name varchar(100) NOT NULL AFTER username;

-- Dumping data for table users
INSERT INTO users (id, username, full_name, email, password, contact_number) VALUES
(1, 'anita', 'Anita Sharma', 'anita.sharma@gmail.com', 'password', '9876543210'),
(2, 'lakshmi', 'Lakshmi Iyer', 'lakshmi.iyer@gmail.com', 'password', '9876509876'),
(3, 'meera', 'Meera Gupta', 'meera.gupta@gmail.com', 'password', '9876512345');

-- Table structure for table user_profiles
CREATE TABLE user_profiles (
  id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  age int(11) DEFAULT NULL,
  weight float DEFAULT NULL,
  height float DEFAULT NULL,
  diet varchar(50) DEFAULT NULL,
  months int(11) DEFAULT NULL,
  children int(11) DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table user_profiles
INSERT INTO user_profiles (id, user_id, age, weight, height, diet, months, children, created_at) VALUES
(1, 1, 30, 55, 160, 'vegetarian', 0, 0, '2024-06-27 06:46:30'),
(2, 2, 28, 62, 165, 'non-vegetarian', 0, 0, '2024-06-27 06:49:20'),
(3, 3, 32, 58, 170, 'vegan', 0, 0, '2024-06-27 06:50:10');

-- Indexes for table users
ALTER TABLE users
  ADD PRIMARY KEY (id);

-- Indexes for table user_profiles
ALTER TABLE user_profiles
  ADD PRIMARY KEY (id),
  ADD KEY user_id (user_id);

-- AUTO_INCREMENT for table users
ALTER TABLE users
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-- AUTO_INCREMENT for table user_profiles
ALTER TABLE user_profiles
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

-- Constraints for table user_profiles
ALTER TABLE user_profiles
  ADD CONSTRAINT user_profiles_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;

-- Commit transaction
COMMIT;

-- Charset reset
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- Table structure for table notes
CREATE TABLE notes (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  date date NOT NULL,
  note text NOT NULL,
  created_at timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (id),
  KEY user_id (user_id),
  CONSTRAINT fk_notes_users FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table notes
INSERT INTO notes (id, user_id, date, note, created_at) VALUES
(1, 1, '2024-06-27', 'Buy groceries', '2024-06-27 07:00:00'),
(2, 2, '2024-06-27', 'Finish project report', '2024-06-27 08:00:00'),
(3, 3, '2024-06-27', 'Plan vacation', '2024-06-27 09:00:00');

-- Table structure for table categories
CREATE TABLE categories (
    id INT(11) NOT NULL AUTO_INCREMENT,
    user_id INT(11) NOT NULL,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY user_id (user_id),
    CONSTRAINT fk_categories_users FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table checklist_items
CREATE TABLE checklist_items (
    id INT(11) NOT NULL AUTO_INCREMENT,
    category_id INT(11) NOT NULL,
    name VARCHAR(255) NOT NULL,
    is_checked BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY category_id (category_id),
    CONSTRAINT fk_checklist_items_categories FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO categories (user_id, name) VALUES
(1, 'Hospital Bag'),
(1, 'Nursery Setup'),
(1, 'Baby Essentials'),
(2, 'Hospital Bag'),
(2, 'Nursery Setup'),
(2, 'Baby Essentials'),
(3, 'Hospital Bag'),
(3, 'Nursery Setup'),
(3, 'Baby Essentials');

-- User 1's Checklist Items
INSERT INTO checklist_items (category_id, name, is_checked) VALUES
(1, 'Maternity Clothes', FALSE),
(1, 'Toiletries', FALSE),
(1, 'Baby Clothes', FALSE),
(2, 'Crib', FALSE),
(2, 'Changing Table', FALSE),
(2, 'Baby Monitor', FALSE),
(3, 'Diapers', FALSE),
(3, 'Wipes', FALSE),
(3, 'Formula', FALSE);

-- User 2's Checklist Items
INSERT INTO checklist_items (category_id, name, is_checked) VALUES
(4, 'Maternity Clothes', FALSE),
(4, 'Toiletries', FALSE),
(4, 'Baby Clothes', FALSE),
(5, 'Crib', FALSE),
(5, 'Changing Table', FALSE),
(5, 'Baby Monitor', FALSE),
(6, 'Diapers', FALSE),
(6, 'Wipes', FALSE),
(6, 'Formula', FALSE);

-- User 3's Checklist Items
INSERT INTO checklist_items (category_id, name, is_checked) VALUES
(7, 'Maternity Clothes', FALSE),
(7, 'Toiletries', FALSE),
(7, 'Baby Clothes', FALSE),
(8, 'Crib', FALSE),
(8, 'Changing Table', FALSE),
(8, 'Baby Monitor', FALSE),
(9, 'Diapers', FALSE),
(9, 'Wipes', FALSE),
(9, 'Formula', FALSE);

CREATE TABLE doctors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

INSERT INTO doctors (name) VALUES ('Dr. Lily'), ('Dr. Jessica '), ('Dr. Williams');

CREATE TABLE booked_appointments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    reason TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),  -- Adjust based on your users table
    FOREIGN KEY (doctor_id) REFERENCES doctors(id)  -- Adjust based on your doctors table
);
ALTER TABLE booked_appointments
ADD COLUMN status VARCHAR(50) DEFAULT 'pending';

INSERT INTO booked_appointments (user_id, doctor_id, appointment_date, appointment_time, reason, status)
VALUES
    (1, 1, '2024-07-14', '09:00:00', 'Routine checkup', 'pending'),
    (1, 2, '2024-07-15', '10:30:00', 'Follow-up appointment', 'pending'),
    (1, 3, '2024-07-16', '14:00:00', 'Medical consultation', 'pending'),
    (2, 1, '2024-07-17', '11:00:00', 'Dental checkup', 'pending'),
    (2, 2, '2024-07-18', '15:30:00', 'Eye exam', 'pending'),
    (2, 3, '2024-07-19', '16:30:00', 'Physical therapy', 'pending'),
    (3, 1, '2024-07-20', '08:30:00', 'Orthopedic consultation', 'pending'),
    (3, 2, '2024-07-21', '13:00:00', 'Cardiology appointment', 'pending'),
    (3, 3, '2024-07-22', '17:00:00', 'ENT checkup', 'pending');


CREATE TABLE prescriptions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    prescription_date DATE NOT NULL,
    doctor_name VARCHAR(255) NOT NULL,
    diagnosis TEXT,
    medications TEXT,
    instructions TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO prescriptions (user_id, prescription_date, doctor_name, diagnosis, medications, instructions)
VALUES
    (1, '2024-07-14', 'Dr. Lily', 'Common cold', 'Aspirin, Vitamin C', 'Take rest and drink plenty of fluids'),
    (1, '2024-07-15', 'Dr. Jessica ', 'Allergic reaction', 'Antihistamines', 'Avoid allergens and take medication as prescribed'),
    (1, '2024-07-16', 'Dr. Williams', 'Back pain', 'Muscle relaxants, Painkillers', 'Apply ice, gentle stretching, and rest'),
    (2, '2024-07-17', 'Dr. Lily', 'High blood pressure', 'Beta-blockers', 'Monitor blood pressure regularly and follow diet and exercise regimen'),
    (2, '2024-07-18', 'Dr. Jessica ', 'Diabetes management', 'Insulin, Metformin', 'Monitor blood sugar levels and follow dietary recommendations'),
    (2, '2024-07-19', 'Dr. Williams', 'Anxiety', 'SSRIs', 'Practice relaxation techniques and cognitive-behavioral therapy'),
    (3, '2024-07-20', 'Dr. Lily', 'Sinus infection', 'Antibiotics', 'Complete full course of medication and stay hydrated'),
    (3, '2024-07-21', 'Dr. Jessica ', 'Asthma control', 'Inhalers', 'Avoid triggers and use inhalers as directed'),
    (3, '2024-07-22', 'Dr. Williams', 'Joint pain', 'Pain relievers, Physical therapy', 'Follow physical therapy exercises and medication schedule');

