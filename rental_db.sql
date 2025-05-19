-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Bulan Mei 2025 pada 07.58
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rental_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cars`
--

CREATE TABLE `cars` (
  `car_id` bigint(20) UNSIGNED NOT NULL,
  `car_name` char(50) NOT NULL,
  `day_rate` double NOT NULL,
  `month_rate` double NOT NULL,
  `image` char(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cars`
--

INSERT INTO `cars` (`car_id`, `car_name`, `day_rate`, `month_rate`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Toyota Avanza', 350000, 7500000, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.jba.co.id%2Fid%2Fnews%2Frekomendasi-mobil-mpv&psig=AOvVaw2LgwJuS-iUFgRhlfhUp3aA&ust=1747713220364000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCNDoo6HRro0DFQAAAAAdAAAAABAE', '2025-05-18 21:03:15', '2025-05-18 21:03:15'),
(3, 'Daihatsu Xenia', 300000, 7000000, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.jba.co.id%2Fid%2Fnews%2Frekomendasi-mobil-mpv&psig=AOvVaw2LgwJuS-iUFgRhlfhUp3aA&ust=1747713220364000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCNDoo6HRro0DFQAAAAAdAAAAABAE', '2025-05-18 22:24:21', '2025-05-18 22:24:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `car_id` bigint(20) UNSIGNED NOT NULL,
  `order_date` date NOT NULL,
  `pickup_date` date NOT NULL,
  `dropoff_date` date NOT NULL,
  `pickup_location` char(50) NOT NULL,
  `dropoff_location` char(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`order_id`, `car_id`, `order_date`, `pickup_date`, `dropoff_date`, `pickup_location`, `dropoff_location`, `created_at`, `updated_at`) VALUES
(3, 1, '2025-05-01', '2025-05-01', '2025-05-05', 'Bogor', 'Jakarta', '2025-05-18 21:49:56', '2025-05-18 21:49:56'),
(4, 1, '2025-05-02', '2025-05-08', '2025-05-10', 'Bogor', 'Jakarta', '2025-05-18 21:50:12', '2025-05-18 21:50:12'),
(7, 1, '2025-05-07', '2025-05-06', '2025-05-07', 'Bogor', 'Jakarta', '2025-05-18 22:56:10', '2025-05-18 22:56:10'),
(8, 1, '2025-05-07', '2025-05-15', '2025-05-20', 'Bogor', 'Jakarta', '2025-05-18 22:56:44', '2025-05-18 22:56:44');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `orders_car_id_foreign` (`car_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
