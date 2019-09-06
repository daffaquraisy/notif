-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Sep 2019 pada 11.31
-- Versi server: 10.1.39-MariaDB
-- Versi PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `notif`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_absen`
--

CREATE TABLE `tb_absen` (
  `id_presensi` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan1` enum('presensi','ijin','sakit','alpa','dispen') NOT NULL,
  `keterangan2` enum('presensi','ijin','sakit','alpa','dispen') NOT NULL,
  `keterangan3` enum('presensi','ijin','sakit','alpa','dispen') NOT NULL,
  `keterangan4` enum('presensi','ijin','sakit','alpa','dispen') NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_pelajaran` int(11) NOT NULL,
  `id_kbm` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_catatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_absen`
--

INSERT INTO `tb_absen` (`id_presensi`, `tanggal`, `keterangan1`, `keterangan2`, `keterangan3`, `keterangan4`, `id_siswa`, `id_pelajaran`, `id_kbm`, `id_guru`, `id_kelas`, `id_catatan`) VALUES
(1, '2019-09-05', 'presensi', 'presensi', 'ijin', 'dispen', 1, 1, 1, 5, 1, 1),
(2, '2019-09-05', 'presensi', 'sakit', 'ijin', 'sakit', 2, 3, 2, 7, 1, 2),
(4, '2019-09-05', 'presensi', 'presensi', 'ijin', 'dispen', 1, 3, 2, 7, 1, 2),
(5, '2019-09-05', 'presensi', 'sakit', 'ijin', 'sakit', 2, 1, 1, 5, 1, 1),
(6, '2019-09-05', 'presensi', 'presensi', 'ijin', 'dispen', 1, 2, 3, 15, 1, 3),
(7, '2019-09-05', 'presensi', 'presensi', 'sakit', 'dispen', 2, 2, 3, 15, 1, 3),
(8, '2019-09-05', 'ijin', 'sakit', 'presensi', 'dispen', 1, 4, 4, 14, 1, 4),
(9, '2019-09-05', 'presensi', 'presensi', 'presensi', 'presensi', 2, 4, 4, 14, 1, 4),
(10, '2019-09-06', 'sakit', 'sakit', 'sakit', 'sakit', 1, 2, 1, 5, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_guru`
--

CREATE TABLE `tb_guru` (
  `id_guru` int(11) NOT NULL,
  `kode_guru` char(10) COLLATE latin1_general_ci NOT NULL,
  `nama_guru` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `password_guru` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `tlp_guru` varchar(100) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `tb_guru`
--

INSERT INTO `tb_guru` (`id_guru`, `kode_guru`, `nama_guru`, `password_guru`, `tlp_guru`) VALUES
(5, '64', 'Muhamad Ramdani, S.Kom', 'danid04nk', '0896349038108'),
(7, '70', 'Taufik, S.kom', 'taufik', '089672202828'),
(14, '54', 'Deki Kurnia, S.Kom', '$2y$10$FLWAbaPNsFLue3tXbBSXmOC5wpKVgnqqyF1FTw5CjqhQ9Yi6REDgm', '087655232'),
(15, '1', 'Daffa Quraisy, S.Kom', '$2y$10$9eHaddxuZwPJ8iLkKetGV.o9CzsC/Au0cxkGsyn5/7xRUqb.Rg./W', '62');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kbm`
--

CREATE TABLE `tb_kbm` (
  `id_kbm` int(11) NOT NULL,
  `jam` enum('jam1','jam2','jam3','jam4') NOT NULL,
  `id_pelajaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_kbm`
--

INSERT INTO `tb_kbm` (`id_kbm`, `jam`, `id_pelajaran`) VALUES
(1, 'jam1', 1),
(2, 'jam2', 2),
(3, 'jam3', 3),
(4, 'jam4', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kelas`
--

CREATE TABLE `tb_kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_kelas`
--

INSERT INTO `tb_kelas` (`id_kelas`, `nama_kelas`) VALUES
(1, 'X RPL'),
(2, 'X TKJ'),
(3, 'X MM'),
(4, 'XI RPL'),
(5, 'XI TKJ'),
(6, 'XI MM');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `id_siswa` int(11) NOT NULL,
  `nis` int(11) DEFAULT NULL,
  `nama_siswa` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `password_siswa` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `kelas` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `alamat` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `telp_siswa` varchar(100) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `tb_siswa`
--

INSERT INTO `tb_siswa` (`id_siswa`, `nis`, `nama_siswa`, `password_siswa`, `kelas`, `alamat`, `telp_siswa`) VALUES
(1, 111, 'Zahwa Aisyah', '$2y$10$1OFDe5sw/5sB1FehpxfmUuoDt1IFNMybrPnKQlRlLNqR5r2.ud/si', 'X RPL', 'Jakarta', '089736464'),
(2, 113, 'Jaka Sugih', '$2y$10$uTY/18tGc36LN7C6fZTEgemHAISxudX8p3VNCKkWTl6RU7n0isoQW', NULL, 'Bogor', '08976456755'),
(3, 114, 'Dzulkifli', '$2y$10$QvdzTfjSmSckfjsQ8fA8o.QhlhrHvLfU5WJBWJSx7sNgjIT/ixrkS', NULL, 'Bogor', '08976458675');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `password` varchar(100) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`) VALUES
(1, 'dani', '$2y$10$jk3dTadavgLhMgJVtOFidudqGvDXsCQG5fWoDRk8js1CjSRVrVhbe'),
(2, 'Taufik', 'D4305D7ED2EC97107CD6EB8DD4B6F6B7'),
(3, 'admin', '21232f297a57a5a743894a0e4a801fc3');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_absen`
--
ALTER TABLE `tb_absen`
  ADD PRIMARY KEY (`id_presensi`);

--
-- Indeks untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indeks untuk tabel `tb_kbm`
--
ALTER TABLE `tb_kbm`
  ADD PRIMARY KEY (`id_kbm`);

--
-- Indeks untuk tabel `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_absen`
--
ALTER TABLE `tb_absen`
  MODIFY `id_presensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tb_kbm`
--
ALTER TABLE `tb_kbm`
  MODIFY `id_kbm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_kelas`
--
ALTER TABLE `tb_kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
