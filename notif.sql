-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Sep 2019 pada 11.33
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
-- Struktur dari tabel `tb_catetan`
--

CREATE TABLE `tb_catetan` (
  `id_catetan` int(11) NOT NULL,
  `pr` enum('pr1','pr2','pr3','pr4') NOT NULL,
  `nama_pr` varchar(100) DEFAULT NULL,
  `judul_materi` enum('judul_materi1','judul_materi2','judul_materi3','judul_materi4') NOT NULL,
  `nama_materi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_catetan`
--

INSERT INTO `tb_catetan` (`id_catetan`, `pr`, `nama_pr`, `judul_materi`, `nama_materi`) VALUES
(1, 'pr1', 'Buat Tabel dengan Bahasa Query', 'judul_materi1', 'Mengenal Bahasa Query'),
(2, 'pr2', 'Design Poster', 'judul_materi2', 'Membuat Logo'),
(3, 'pr3', 'Membuat UML Sequance Diagram', 'judul_materi3', 'Pengenalan UML'),
(4, 'pr4', 'Memasang CCTV', 'judul_materi4', 'Jaringan Keamanan');

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
-- Struktur dari tabel `tb_jadwal_mapel`
--

CREATE TABLE `tb_jadwal_mapel` (
  `id` int(11) NOT NULL,
  `hari` varchar(100) NOT NULL,
  `jam1` varchar(100) NOT NULL,
  `jam2` varchar(100) NOT NULL,
  `jam3` varchar(100) NOT NULL,
  `jam4` varchar(100) NOT NULL,
  `kelas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_jadwal_mapel`
--

INSERT INTO `tb_jadwal_mapel` (`id`, `hari`, `jam1`, `jam2`, `jam3`, `jam4`, `kelas`) VALUES
(1, 'Senin', 'Upacara', 'PKN', 'IPS', 'B Indonesia', 'X MM'),
(2, 'Selasa', 'Olahraga', 'B Sunda', 'B Inggris', 'B Arab', 'X MM'),
(3, 'Rabu', 'Kimia', 'Fisika', 'Teknik Jaringan', 'PAI', 'X MM'),
(4, 'Kamis', 'KWU', 'Basis Data', 'Matematika', 'Sejarah Indo', 'X MM'),
(5, 'Jumat', 'Rohis', 'BTQ', 'Produktif', 'Produktif', 'X MM'),
(6, 'Sabtu', 'Produktif', 'Produktif', 'Produktif', 'Produktif', 'X MM'),
(7, 'Senin', 'Upacara', 'B Indo', 'IPS', 'PKN', 'X TKJ'),
(8, 'Selasa', 'Produktif', 'Produktif', 'Produktif', 'Produktif', 'X TKJ'),
(9, 'Rabu', 'Kimia', 'Fisika', 'Teknik Jaringan', 'PAI', 'X TKJ'),
(10, 'Kamis', 'KWU', 'Basis Data', 'Matematika', 'Sejarah Indo', 'X TKJ'),
(11, 'Jumat', 'Rohis', 'BTQ', 'Produktif', 'Produktif', 'X TKJ'),
(12, 'Sabtu', 'Produktif', 'Produktif', 'Produktif', 'Produktif', 'X TKJ'),
(13, 'Senin', 'Upacara', 'B Indo', 'IPS', 'PKN', 'X RPL'),
(14, 'Selasa', 'Produktif', 'Produktif', 'Produktif', 'Produktif', 'X RPL'),
(15, 'Rabu', 'Kimia', 'Fisika', 'Teknik Jaringan', 'PAI', 'X RPL'),
(16, 'Kamis', 'KWU', 'Basis Data', 'Matematika', 'Sejarah Indo', 'X RPL'),
(17, 'Jumat', 'Rohis', 'BTQ', 'Produktif', 'Produktif', 'X RPL'),
(18, 'Sabtu', 'Produktif', 'Produktif', 'Produktif', 'Produktif', 'X RPL'),
(19, 'Senin', 'Upacara', 'PKN', 'IPS', 'B Indonesia', 'XI RPL'),
(20, 'Selasa', 'Olahraga', 'B Sunda', 'B Inggris', 'B Arab', 'XI RPL'),
(21, 'Rabu', 'Kimia', 'Fisika', 'Teknik Jaringan', 'PAI', 'XI RPL'),
(22, 'Kamis', 'KWU', 'Basis Data', 'Matematika', 'Sejarah Indo', 'XI RPL'),
(23, 'Jumat', 'Rohis', 'BTQ', 'Produktif', 'Produktif', 'XI RPL'),
(24, 'Sabtu', 'Produktif', 'Produktif', 'Produktif', 'Produktif', 'XI RPL'),
(31, 'Senin', 'Upacara', 'B Indo', 'IPS', 'PKN', 'XI MM'),
(32, 'Selasa', 'Produktif', 'Produktif', 'Produktif', 'Produktif', 'XI MM'),
(33, 'Rabu', 'Kimia', 'Fisika', 'Teknik Jaringan', 'PAI', 'XI MM'),
(34, 'Kamis', 'KWU', 'Basis Data', 'Matematika', 'Sejarah Indo', 'XI MM'),
(35, 'Jumat', 'Rohis', 'BTQ', 'Produktif', 'Produktif', 'XI MM'),
(36, 'Sabtu', 'Produktif', 'Produktif', 'Produktif', 'Produktif', 'XI MM'),
(37, 'Senin', 'Upacara', 'B Indo', 'IPS', 'PKN', 'XI TKJ'),
(38, 'Selasa', 'Produktif', 'Produktif', 'Produktif', 'Produktif', 'XI TKJ'),
(39, 'Rabu', 'Kimia', 'Fisika', 'Teknik Jaringan', 'PAI', 'XI TKJ'),
(40, 'Kamis', 'KWU', 'Basis Data', 'Matematika', 'Sejarah Indo', 'XI TKJ'),
(41, 'Jumat', 'Rohis', 'BTQ', 'Produktif', 'Produktif', 'XI TKJ'),
(42, 'Sabtu', 'Produktif', 'Produktif', 'Produktif', 'Produktif', 'XI TKJ'),
(43, 'Senin', 'Upacara', 'PKN', 'IPS', 'B Indonesia', 'XII TKJ'),
(44, 'Selasa', 'Olahraga', 'B Sunda', 'B Inggris', 'B Arab', 'XII TKJ'),
(45, 'Rabu', 'Kimia', 'Fisika', 'Teknik Jaringan', 'PAI', 'XII TKJ'),
(46, 'Kamis', 'KWU', 'Basis Data', 'Matematika', 'Sejarah Indo', 'XII TKJ'),
(47, 'Jumat', 'Rohis', 'BTQ', 'Produktif', 'Produktif', 'XII TKJ'),
(48, 'Sabtu', 'Produktif', 'Produktif', 'Produktif', 'Produktif', 'XII TKJ'),
(49, 'Senin', 'Upacara', 'B Indo', 'IPS', 'PKN', 'XII RPL'),
(50, 'Selasa', 'Produktif', 'Produktif', 'Produktif', 'Produktif', 'XII RPL'),
(51, 'Rabu', 'Kimia', 'Fisika', 'Teknik Jaringan', 'PAI', 'XII RPL'),
(52, 'Kamis', 'KWU', 'Basis Data', 'Matematika', 'Sejarah Indo', 'XII RPL'),
(53, 'Jumat', 'Rohis', 'BTQ', 'Produktif', 'Produktif', 'XII RPL'),
(54, 'Sabtu', 'Produktif', 'Produktif', 'Produktif', 'Produktif', 'XII RPL'),
(55, 'Senin', 'Upacara', 'B Indo', 'IPS', 'PKN', 'XII MM'),
(56, 'Selasa', 'Produktif', 'Produktif', 'Produktif', 'Produktif', 'XII MM'),
(57, 'Rabu', 'Kimia', 'Fisika', 'Teknik Jaringan', 'PAI', 'XII MM'),
(58, 'Kamis', 'KWU', 'Basis Data', 'Matematika', 'Sejarah Indo', 'XII MM'),
(59, 'Jumat', 'Rohis', 'BTQ', 'Produktif', 'Produktif', 'XII MM'),
(60, 'Sabtu', 'Produktif', 'Produktif', 'Produktif', 'Produktif', 'XII MM');

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
-- Struktur dari tabel `tb_pelajaran`
--

CREATE TABLE `tb_pelajaran` (
  `id_pelajaran` int(11) NOT NULL,
  `nama_pelajaran` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pelajaran`
--

INSERT INTO `tb_pelajaran` (`id_pelajaran`, `nama_pelajaran`) VALUES
(1, 'Basis Data'),
(2, 'Pemodelan Perangkat Lunak'),
(3, 'Desain Grafis'),
(4, 'Teknik Komputer Jaringan');

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
-- Indeks untuk tabel `tb_catetan`
--
ALTER TABLE `tb_catetan`
  ADD PRIMARY KEY (`id_catetan`);

--
-- Indeks untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indeks untuk tabel `tb_jadwal_mapel`
--
ALTER TABLE `tb_jadwal_mapel`
  ADD PRIMARY KEY (`id`);

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
-- Indeks untuk tabel `tb_pelajaran`
--
ALTER TABLE `tb_pelajaran`
  ADD PRIMARY KEY (`id_pelajaran`);

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
-- AUTO_INCREMENT untuk tabel `tb_catetan`
--
ALTER TABLE `tb_catetan`
  MODIFY `id_catetan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tb_jadwal_mapel`
--
ALTER TABLE `tb_jadwal_mapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

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
-- AUTO_INCREMENT untuk tabel `tb_pelajaran`
--
ALTER TABLE `tb_pelajaran`
  MODIFY `id_pelajaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
