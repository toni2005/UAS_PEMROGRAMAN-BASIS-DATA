-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 08 Jan 2024 pada 06.50
-- Versi Server: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(11) NOT NULL,
  `nama_dokter` varchar(50) DEFAULT NULL,
  `spesialisasi` varchar(30) DEFAULT NULL,
  `jam_praktek` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `spesialisasi`, `jam_praktek`) VALUES
(101, 'Dr. Amanda Johnson', 'Bedah Umum', 'Sen-Jum 08:00-15:00'),
(102, 'Dr. Kevin Tan', 'Kardiologi', 'Sen-Kam 10:00-17:00'),
(103, 'Dr. Lisa Chen', 'Anestesiologi', 'Sel-Rab 09:00-16:00'),
(104, 'Dr. Robert Smith', 'Ginekologi', 'Sen-Jum 08:00-14:00'),
(105, 'Dr. Emily Wong', 'Ortopedi', 'Rab-Jum 11:00-18:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL,
  `nm_pasien` varchar(200) DEFAULT NULL,
  `umur` int(10) DEFAULT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nm_pasien`, `umur`, `jenis_kelamin`, `alamat`) VALUES
(1, 'Rizki Pratama', 23, 'Laki-laki', 'Jl. Harapan Indah 45, Bandung'),
(2, 'Irfan Maulana', 28, 'Laki-laki', 'Jl. Kenanga 15, Medan'),
(3, 'Reza Wijaya', 29, 'Laki-laki', 'Jl. Merak 9, Semarang'),
(4, 'Dewi Sari', 28, 'Perempuan', 'Jl. Merdeka No. 123, Jakarta'),
(5, 'Maya Putri', 25, 'Perempuan', 'Jl. Pahlawan 87, Surabaya'),
(6, 'Nia Kusuma', 27, 'Perempuan', 'Jl. Cendana 32, Yogyakarta'),
(7, 'Aryo Nugroho', 31, 'Laki-laki', 'Jl. Teratai 21, Makassar'),
(8, 'Sinta Rahayu', 20, 'Perempuan', 'Jl. Anggrek 55, Denpasar'),
(10, 'Muhammad Reza Aditya', 19, 'Laki-laki', 'Jl. Dahlia 8, Malang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rawat_inap`
--

CREATE TABLE `rawat_inap` (
  `id_rawatinap` int(11) NOT NULL,
  `id_pasien` int(11) DEFAULT NULL,
  `id_dokter` int(11) DEFAULT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `tgl_keluar` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rawat_inap`
--

INSERT INTO `rawat_inap` (`id_rawatinap`, `id_pasien`, `id_dokter`, `tgl_masuk`, `tgl_keluar`) VALUES
(501, 1, 101, '2024-01-05', '2024-01-08'),
(502, 3, 103, '2024-01-10', '2024-01-15'),
(503, 2, 102, '2024-01-12', '2024-01-14'),
(504, 4, 104, '2024-01-18', '2024-01-21'),
(505, 5, 105, '2024-01-22', '2024-01-25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `rawat_inap`
--
ALTER TABLE `rawat_inap`
  ADD PRIMARY KEY (`id_rawatinap`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `rawat_inap`
--
ALTER TABLE `rawat_inap`
  ADD CONSTRAINT `rawat_inap_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `rawat_inap_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
