-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2025 at 04:00 PM
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
-- Database: `rumahsakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `nama_lengkap`) VALUES
(1, 'adminrs@gmail.com', '$2y$10$TLgORZlUzhAKawWD9q7LLOogD.tM9ewAgXvJX1Ouz9Cz2HnY8ggV6', 'Admin Rumah Sakit');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `jadwal_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jenis_layanan` enum('bpjs','nonbpjs') NOT NULL,
  `status` enum('Menunggu','Diterima','Ditolak') DEFAULT 'Menunggu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `user_id`, `jadwal_id`, `tanggal`, `jenis_layanan`, `status`) VALUES
(1, 3, 1, '2025-05-29', 'bpjs', 'Diterima'),
(2, 3, 1, '2025-05-19', 'bpjs', 'Ditolak'),
(3, 4, 1, '2025-05-22', 'bpjs', 'Diterima'),
(4, 4, 1, '2025-05-21', 'bpjs', 'Menunggu'),
(5, 10, 1, '2025-06-03', 'bpjs', 'Diterima');

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `spesialis` varchar(100) DEFAULT NULL,
  `hari` varchar(50) DEFAULT NULL,
  `jam` varchar(50) DEFAULT NULL,
  `hari_praktik` varchar(50) DEFAULT NULL,
  `jam_praktik` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `spesialis`, `hari`, `jam`, `hari_praktik`, `jam_praktik`) VALUES
(1, 'Hisyam Sayyid Alzam', 'dokter gigi', 'rabu,kamis,minggu', '09.00-15.50', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id` int(11) NOT NULL,
  `dokter_id` int(11) NOT NULL,
  `hari` varchar(20) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id`, `dokter_id`, `hari`, `jam_mulai`, `jam_selesai`) VALUES
(1, 1, 'senin,selasa', '13:00:00', '20:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_dokter`
--

CREATE TABLE `jadwal_dokter` (
  `id` int(11) NOT NULL,
  `nama_dokter` varchar(100) DEFAULT NULL,
  `spesialis` varchar(100) DEFAULT NULL,
  `hari` varchar(20) DEFAULT NULL,
  `jam_mulai` time DEFAULT NULL,
  `jam_selesai` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `jenis_kelamin`, `alamat`, `telepon`) VALUES
(1, 'Sabitha Naura Zahra', 'Perempuan', 'penggilingan cakung', '082198828132');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user','pasien') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `role`) VALUES
(1, 'Nesya Ainurrosi', 'nesya.ainurrosi26@smk.belajar.id', '$2y$10$Ft6ypnkkD14iqxqwN92HQe7tyyG.JdyBDFQihcpp2VHuqXPS1rRx2', 'user'),
(3, 'nesya', 'nesya@gmail.com', '$2y$10$zEefBiwhhlao6izQoaM7ROZBjKlP.9nx1sm6G3uFTF90xDBKDfH9K', 'user'),
(4, 'Sabitha Naura Zahra', 'sabitha@gmail.com', '$2y$10$k3DO78/Lyx9MGGxnwTwbp.pUL9XDHdC7tVOnWYhm4OyyXtBAQ30n.', 'user'),
(5, 'Hisyam Sayyid Alzam', 'hisyam@gmail.com', '$2y$10$0.3Xys8e/waq94I51DR6Au69cu5u739aCB0jj5sgp1fcLfuSRZCsW', 'user'),
(6, 'sapi', 'sapi@gmail.com', '$2y$10$spE9.YG3SyxbLZoGIEmLFe9CNuIP37Kt4t8j3zpI9vzTSaYbPy/Ma', 'user'),
(7, 'nesya', 'nesyaar@gmail.com', '$2y$10$CZAyZ00AZ2aR9r13jUJwVeO4blLn.A1jksf.pQhEw7grJlcsPYpvS', 'user'),
(8, 'nesyah', 'nesyah@gmail.com', '$2y$10$v.hiy1hCfixLWxmbz7A.juvvhjdxIkwqgnUJAszvx7klmdTU7Z6Xm', 'user'),
(9, 'eca', 'eca@gmail.com', '$2y$10$kyGtUdOHVwX7RJp3ThUTneG5QFY59PoXHvCsW105LjKPgNZVsdX1a', 'user'),
(10, 'ARKHAN AINURROSI', 'arkhan@gmail.com', '$2y$10$7v2SOmJ8E6fR0jC.TlJ5keeIhjEo3cDlIEa8B2/xlv2QVeQmTVz2e', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `jadwal_id` (`jadwal_id`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dokter_id` (`dokter_id`);

--
-- Indexes for table `jadwal_dokter`
--
ALTER TABLE `jadwal_dokter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jadwal_dokter`
--
ALTER TABLE `jadwal_dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`jadwal_id`) REFERENCES `jadwal` (`id`);

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`dokter_id`) REFERENCES `dokter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
