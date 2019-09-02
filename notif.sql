-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Sep 2019 pada 07.07
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
  `presensi_id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `nis` int(11) DEFAULT NULL,
  `nama_siswa` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `keterangan` enum('presensi','ijin','sakit','alpa','dispen') COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

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
(8, '1', 'daffa', '$2y$10$uDH.3HSidkOTd3bAMLeD/.VxhqL2xTK3dTKOapBpZtvFxAqeQG8CS', '0862622'),
(11, '12', 'daffaq', '$2y$10$9pPpXu9If13juYySibsWW.BIKJHwB3kT53p5bfo4zgg.nVInkCAwO', '62'),
(12, '54', 'deki', '$2y$10$LfYVGw3mCzAv3EwDX3oKb.cz46Sw.pDYrDEzZEW7/msmbz/i4maTi', '087655232'),
(13, '54', 'Arif', '$2y$10$ek/HYxAhGqACrlUlIvE3POIRb28Vycvm/bono5oBDs314A.qPjBNS', '087655232');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kbm`
--

CREATE TABLE `tb_kbm` (
  `tanggal` date DEFAULT NULL,
  `kelas` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `hari` char(10) COLLATE latin1_general_ci DEFAULT NULL,
  `jam1` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `jam2` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `jam3` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `jam4` varchar(100) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `tb_kbm`
--

INSERT INTO `tb_kbm` (`tanggal`, `kelas`, `hari`, `jam1`, `jam2`, `jam3`, `jam4`) VALUES
('2019-08-15', 'XII TKJ', 'Senin', 'Agama', 'Sbk', 'Matematika', 'B. Indonesia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kelas`
--

CREATE TABLE `tb_kelas` (
  `id_kelas` int(11) NOT NULL,
  `kelas` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `id_kbm` char(10) COLLATE latin1_general_ci DEFAULT NULL,
  `id_guru` char(10) COLLATE latin1_general_ci DEFAULT NULL,
  `judul_materi` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `pr` varchar(100) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

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
(1, 111, 'Hamzah Arfah', 'hamzah123', 'X RPL', 'bubulak', '089634903810'),
(2, 113, 'Muhamad Abdul Fahmi', 'fahmi123', 'X TKJ', 'Kebon Pedes', '0857792365757'),
(3, 114, 'Alfiansyah', 'alfiansyah123', 'XI RPL', 'Bojong Gede', '085775429195'),
(4, 115, 'Taufik Saefulloh', 'taufik123', 'XI TKJ', 'Ciomas', '089757635437'),
(5, 116, 'Mohammad Dimas Saputro', 'dimas123', 'XII RPL', 'Grobongan', '085691696215'),
(6, 117, 'Hendrawan', 'Bogor', 'XII TKJ', 'Bogor', '085693069706'),
(7, 118, 'Muhammad Zulkifli', 'zulkifli123', 'X RPL', 'Bogor', '-'),
(8, 119, 'Zulvan Lindan', 'zulvan123', 'X TKJ', 'Ciapus', '082299039542'),
(9, 120, 'adjpafok', 'fhjaskf', 'XI RPL', 'sdfkjk', 'sldgkjk'),
(10, 121, 'Azkia Satria Virga Aztiandi', 'azkia123', 'XI TKJ', 'Tajur', '087885549199'),
(11, 122, 'Hendriansyach Nurhayanto', 'hendri123', 'XII RPL', 'Cikaret', '081281283403'),
(12, 123, 'Egi Septiagi', 'egi123', 'XII TKJ', 'Cikaret', '085887912048'),
(13, 124, 'Niki Rizki A', 'niki123', 'X RPL', 'Cibeureum', '087870309610'),
(14, 126, 'Wahyu Maulana Rifai', 'wahyu123', 'X TKJ', 'Bondongan', '+6289520621475'),
(15, 127, 'Adji Gimnastiar Putra', 'adji123', 'XI RPL', 'Perumahan Vila Tamansari', '085782940530'),
(16, 129, 'Muhammad Rizqi Ramadhan', 'rizqi123', 'XI TKJ', 'Pasir Jaya Muara', '081281209010'),
(17, 130, 'Muhamad Faisal Darmawan', 'faisal123', 'XII RPL', 'Dekeng', '081902701249'),
(18, 131, 'Nendi irawan', 'nendi123', 'XII TKJ', 'Pamoyanan', '08581227772'),
(19, 132, 'Fahmi', 'fahmi123', 'X RPL', 'Pamoyanan', '089520168555'),
(20, 133, 'Fajri Setiawan', 'fajri123', 'X TKJ', 'cimanglid', '081617474882'),
(21, 134, 'M Rian Ramadhan', 'rian123', 'XI RPL', 'Jl Jero Kuta Kaum', '0895326769246'),
(22, 135, 'Deri Abdul Aziz', 'deri123', 'XI TKJ', 'Cihideung', '085714155507'),
(23, 136, 'Ananda Prayoga', 'ananda123', 'XII RPL', 'Jl Warung Bandrek', '089685946505'),
(24, 137, 'Rizal Alatas', 'rizal123', 'XII TKJ', 'Bondongan', '089634903811'),
(25, 138, 'Syalwa Fajrilianti Zahra', 'syalwa123', 'X RPL', 'cimanglid', '085765435445'),
(31, 1991, 'nini', 'nini', 'XI RPL', 'nana bela sari Rt. 01', '099090');

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
  ADD PRIMARY KEY (`presensi_id`);

--
-- Indeks untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`id_guru`);

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
  MODIFY `presensi_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tb_kelas`
--
ALTER TABLE `tb_kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
