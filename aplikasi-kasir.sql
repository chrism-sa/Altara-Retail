-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for aplikasi-kasir
CREATE DATABASE IF NOT EXISTS `aplikasi-kasir` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aplikasi-kasir`;

-- Dumping structure for table aplikasi-kasir.kategori
CREATE TABLE IF NOT EXISTS `kategori` (
  `idkategori` int NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_dibuat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idkategori`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table aplikasi-kasir.kategori: ~2 rows (approximately)
REPLACE INTO `kategori` (`idkategori`, `nama_kategori`, `tgl_dibuat`) VALUES
	(3, 'rokok', '2022-05-05 18:17:58'),
	(5, 'sabun', '2022-05-05 18:19:27');

-- Dumping structure for table aplikasi-kasir.keranjang
CREATE TABLE IF NOT EXISTS `keranjang` (
  `idcart` int NOT NULL AUTO_INCREMENT,
  `no_nota` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `idproduk` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`idcart`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table aplikasi-kasir.keranjang: ~0 rows (approximately)

-- Dumping structure for table aplikasi-kasir.laporan
CREATE TABLE IF NOT EXISTS `laporan` (
  `idlaporan` int NOT NULL AUTO_INCREMENT,
  `no_nota` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `idpelanggan` int NOT NULL,
  `catatan` text COLLATE utf8mb4_general_ci NOT NULL,
  `totalbeli` int NOT NULL,
  `pembayaran` int NOT NULL,
  `kembalian` int NOT NULL,
  `tgl_sub` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idlaporan`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table aplikasi-kasir.laporan: ~4 rows (approximately)
REPLACE INTO `laporan` (`idlaporan`, `no_nota`, `idpelanggan`, `catatan`, `totalbeli`, `pembayaran`, `kembalian`, `tgl_sub`) VALUES
	(16, 'AD6522123001', 6, 'Jangan Sampe Salah', 128000, 130000, 2000, '2022-05-05 18:24:29'),
	(17, 'AL16231049002', 0, '', 62000, 70000, 8000, '2023-06-01 03:50:01'),
	(18, 'AL16231050901', 0, '', 20000, 30000, 10000, '2023-06-01 03:50:56'),
	(19, 'AL16231051091', 7, '', 27000, 30000, 3000, '2023-06-01 03:51:12');

-- Dumping structure for table aplikasi-kasir.login
CREATE TABLE IF NOT EXISTS `login` (
  `id_login` int NOT NULL AUTO_INCREMENT,
  `nama_toko` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `telepon` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_login`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table aplikasi-kasir.login: ~3 rows (approximately)
REPLACE INTO `login` (`id_login`, `nama_toko`, `username`, `password`, `alamat`, `telepon`) VALUES
	(1, 'AplikasiKasir', 'admin', '$2y$10$MVzYXKwkqdw8BNQxrIpDduaF8KGa6TohiH9zrEik1vX9LbDl7sO4K', 'Kp. Lukun Rt.02/01 Ds. Cisoka Kec. Cisoka Kab. Tangerang - Banten', '089635808393'),
	(2, 'Altara', 'kasir', '$2y$10$MVzYXKwkqdw8BNQxrIpDduaF8KGa6TohiH9zrEik1vX9LbDl7sO4K', 'Jl. Mt. Haryono', '089123456234'),
	(3, '', '', '123', '', '');

-- Dumping structure for table aplikasi-kasir.pelanggan
CREATE TABLE IF NOT EXISTS `pelanggan` (
  `idpelanggan` int NOT NULL AUTO_INCREMENT,
  `nama_pelanggan` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `telepon_pelanggan` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `alamat_pelanggan` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idpelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table aplikasi-kasir.pelanggan: ~2 rows (approximately)
REPLACE INTO `pelanggan` (`idpelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
	(6, 'user', '083806368753', 'Tangerang Indonesia'),
	(7, 'al', '081346572301', 'Singosari');

-- Dumping structure for table aplikasi-kasir.produk
CREATE TABLE IF NOT EXISTS `produk` (
  `idproduk` int NOT NULL AUTO_INCREMENT,
  `idkategori` int NOT NULL,
  `kode_produk` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_produk` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `harga_modal` int NOT NULL,
  `harga_jual` int NOT NULL,
  `stock` int NOT NULL,
  `tgl_input` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idproduk`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table aplikasi-kasir.produk: ~4 rows (approximately)
REPLACE INTO `produk` (`idproduk`, `idkategori`, `kode_produk`, `nama_produk`, `harga_modal`, `harga_jual`, `stock`, `tgl_input`) VALUES
	(3, 3, 'BRG001', 'sampoerna mild', 25000, 27000, 100, '2023-06-01 03:51:05'),
	(4, 3, 'BRG002', 'surya 12', 18000, 20000, 48, '2023-06-01 03:50:49'),
	(5, 3, 'BRG003', 'surya 16', 25000, 27000, 48, '2023-05-31 03:31:40'),
	(6, 5, 'BRG004', 'sabun batang give', 3000, 5000, 97, '2023-06-01 03:49:33');

-- Dumping structure for table aplikasi-kasir.tb_nota
CREATE TABLE IF NOT EXISTS `tb_nota` (
  `idnota` int NOT NULL AUTO_INCREMENT,
  `no_nota` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `idproduk` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`idnota`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table aplikasi-kasir.tb_nota: ~8 rows (approximately)
REPLACE INTO `tb_nota` (`idnota`, `no_nota`, `idproduk`, `quantity`) VALUES
	(11, 'AD6522123001', 3, 2),
	(12, 'AD6522123001', 4, 1),
	(13, 'AD6522123001', 5, 2),
	(14, 'AL16231049002', 4, 1),
	(15, 'AL16231049002', 3, 1),
	(16, 'AL16231049002', 6, 3),
	(17, 'AL16231050901', 4, 1),
	(18, 'AL16231051091', 3, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
