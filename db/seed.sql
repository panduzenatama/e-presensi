-- Seed data for E-Presensi (demo)
SET NAMES utf8mb4;

-- Admin (role=1), password: admin123
INSERT INTO `admin` (`id_admin`, `nama_admin`, `email`, `password`, `role`, `date_created`, `is_active`, `gambar`) VALUES
(1, 'Administrator', 'admin@presensi.id', '$2y$10$FhKAh9TjirydXvYc4MkDReA8iHmMaMxYVONhVP189SEw.Zkx6RVf6', 1, UNIX_TIMESTAMP(), 1, 'default.jpg');

-- Kelas
INSERT INTO `kelas` (`id_kelas`, `kode_kelas`, `nama_kelas`) VALUES
(1, 'RPL-1', 'Rekayasa Perangkat Lunak 1'),
(2, 'RPL-2', 'Rekayasa Perangkat Lunak 2'),
(3, 'TKJ-1', 'Teknik Komputer & Jaringan 1'),
(4, 'MM-1',  'Multimedia 1');

-- Siswa (role=2), password: siswa123
INSERT INTO `siswa` (`id_siswa`, `nim`, `nama_siswa`, `kelas_siswa`, `jenis_kelamin`, `tanggal_lahir`, `tempat_lahir`, `email`, `password`, `role`, `date_created`, `is_active`, `gambar`) VALUES
(1, '2026001', 'Andi Saputra',    'RPL-1', 'Laki-laki', '2005-03-12', 'Karawang',  'andi@student.presensi.id',   '$2y$10$VMhvxV6jb6d5iNWlZ.7Y8.wI8lgwUe0bA1NM5jbZ8ohIfbh2O6IjC', 2, UNIX_TIMESTAMP(), 1, 'default.jpg'),
(2, '2026002', 'Budi Santoso',    'RPL-1', 'Laki-laki', '2004-11-02', 'Bekasi',    'budi@student.presensi.id',   '$2y$10$VMhvxV6jb6d5iNWlZ.7Y8.wI8lgwUe0bA1NM5jbZ8ohIfbh2O6IjC', 2, UNIX_TIMESTAMP(), 1, 'default.jpg'),
(3, '2026003', 'Citra Lestari',   'RPL-2', 'Perempuan', '2005-07-21', 'Jakarta',   'citra@student.presensi.id',  '$2y$10$VMhvxV6jb6d5iNWlZ.7Y8.wI8lgwUe0bA1NM5jbZ8ohIfbh2O6IjC', 2, UNIX_TIMESTAMP(), 1, 'default.jpg'),
(4, '2026004', 'Dewi Anggraini',  'TKJ-1', 'Perempuan', '2005-01-30', 'Bandung',   'dewi@student.presensi.id',   '$2y$10$VMhvxV6jb6d5iNWlZ.7Y8.wI8lgwUe0bA1NM5jbZ8ohIfbh2O6IjC', 2, UNIX_TIMESTAMP(), 1, 'default.jpg');

-- Event (demo)
INSERT INTO `event` (`id_event`, `no_event`, `nama_event`, `tgl_event`, `dari_jam`, `sampai_jam`, `qr_event`) VALUES
(1, 'EVNT-001', 'Seminar Teknologi Informasi 2026', '2026-06-25', '08:00:00', '12:00:00', '');

-- Absensi (demo) untuk event EVNT-001
INSERT INTO `absen` (`id_absen`, `no_event`, `nama_siswa`, `nim_siswa`, `kelas`, `absen_masuk`, `is_telat`, `absen_keluar`, `izinkan`, `suket`, `keterangan`) VALUES
(1, 'EVNT-001', 'Andi Saputra',   '2026001', 'RPL-1', UNIX_TIMESTAMP('2026-06-25 07:50:00'), '0', UNIX_TIMESTAMP('2026-06-25 12:05:00'), '0', '', 'Hadir'),
(2, 'EVNT-001', 'Budi Santoso',   '2026002', 'RPL-1', UNIX_TIMESTAMP('2026-06-25 08:15:00'), '1', UNIX_TIMESTAMP('2026-06-25 12:00:00'), '0', '', 'Telat'),
(3, 'EVNT-001', 'Citra Lestari',  '2026003', 'RPL-2', UNIX_TIMESTAMP('2026-06-25 07:58:00'), '0', UNIX_TIMESTAMP('2026-06-25 12:02:00'), '0', '', 'Hadir');
