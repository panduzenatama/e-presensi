# E-Presensi

Sistem presensi (absensi) siswa berbasis **QR Code** dan **web**, dibangun dengan **CodeIgniter 3** + **MySQL** + **Bootstrap 4 (AdminLTE)**.

Aplikasi ini memungkinkan admin mengelola data siswa, kelas, dan event (kegiatan), lalu membuat **QR Code presensi** untuk setiap event. Siswa melakukan absen masuk/keluar dengan scan QR, dan admin dapat mencetak laporan (rekap) presensi dalam bentuk **PDF**.

---

## ✨ Fitur

- 🔐 **Multi-role login** — Admin & Siswa (dengan verifikasi password `bcrypt`)
- 👨‍🎓 **Manajemen siswa** — CRUD data siswa, pencarian & pagination
- 🏫 **Manajemen kelas** — CRUD data kelas
- 📅 **Manajemen event** — buat kegiatan + generate **QR Code presensi** otomatis
- 📱 **Scan QR presensi** — absen masuk & keluar, deteksi keterlambatan otomatis
- 📄 **Izin / surat keterangan** — siswa dapat mengajukan izin + upload surat
- 🖨️ **Laporan PDF** — rekap presensi per event (menggunakan **mPDF**)
- 🖼️ **Upload foto profil** — untuk admin & siswa
- 🔑 **Lupa password** — reset via token email (SMTP)

## 🛠️ Tech Stack

| Layer      | Teknologi                          |
|------------|------------------------------------|
| Backend    | PHP 7.3+ (CodeIgniter 3.1.11)      |
| Database   | MySQL / MariaDB                    |
| Frontend   | Bootstrap 4, AdminLTE, jQuery      |
| PDF        | mPDF 8                             |
| QR Code    | PHP QR Code (GD)                   |

## 📁 Struktur Proyek

```
e-presensi/
├── application/          # Controller, Model, View (MVC CodeIgniter)
│   ├── controllers/      # Auth, Admin, Students, Pdf, Generator, ...
│   ├── models/           # Admin_Model, Siswa_Model, Kelas, Presensi
│   ├── helpers/          # security_helper (encrypt URL), epresensi_helper
│   └── views/            # Tampilan admin, siswa, auth, template
├── assets/               # CSS, JS, gambar, upload (user, qr, izin)
├── db/
│   ├── e_presensi.sql    # Skema database
│   └── seed.sql          # Data demo (admin, kelas, siswa, event)
├── system/               # Core CodeIgniter
├── vendor/               # Dependensi Composer (mPDF) — diinstall via composer
├── application/config/   # config.php, database.php, autoload.php, ...
└── security.ini          # Konfigurasi enkripsi URL (encrypt/decrypt)
```

## 🚀 Cara Menjalankan (Local)

### Prasyarat

- PHP 7.3 – 8.x dengan ekstensi: `mysqli`, `pdo_mysql`, `mbstring`, `gd`, `curl`, `openssl`
- MySQL / MariaDB
- Composer (untuk install mPDF)

### 1. Clone repo

```bash
git clone https://github.com/panduzenatama/e-presensi.git
cd e-presensi
```

### 2. Install dependensi (mPDF)

```bash
composer install
```

### 3. Buat database & import

```bash
mysql -u root -p -e "CREATE DATABASE e_presensi CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;"
mysql -u root -p e_presensi < db/e_presensi.sql
mysql -u root -p e_presensi < db/seed.sql   # data demo (opsional)
```

### 4. Konfigurasi

Edit `application/config/database.php`:

```php
'hostname' => 'localhost',
'username' => 'root',
'password' => '',
'database' => 'e_presensi',
```

Edit `application/config/config.php`:

```php
$config['base_url'] = 'http://localhost/e-presensi/';
```

### 5. Jalankan

```bash
php -S localhost:8080
# atau gunakan Apache/Nginx/XAMPP dengan document root menunjuk ke folder proyek
```

Akses: `http://localhost:8080`

## 🔑 Akun Demo

| Role   | Email                 | Password   |
|--------|-----------------------|------------|
| Admin  | `admin@presensi.id`   | `admin123` |
| Siswa  | `andi@student.presensi.id` | `siswa123` |

> Siswa juga bisa login menggunakan **NIM**, contoh: `2026001` / `siswa123`.

## ⚙️ Catatan Konfigurasi

- **`security.ini`** — berisi `encryption_key`, `iv`, dan `encryption_mechanism` yang dipakai helper `encrypt_url()` / `decrypt_url()` untuk mengamankan URL presensi. Ganti nilainya untuk produksi.
- **Email SMTP** — konfigurasi ada di `application/controllers/Auth.php` (method `exampleemail`). Isi `smtp_user` / `smtp_pass` dengan kredensial SMTP Anda (contoh: Gmail App Password).
- **Upload path** — folder `assets/app-assets/user/`, `assets/app-assets/izin/`, dan `assets/app-assets/qr/img/` harus **writable** oleh web server.

## 📸 Screenshot

Lihat halaman portofolio untuk tangkapan layar.

## ⚠️ Disclaimer

Proyek ini dibuat untuk keperluan pembelajaran/portofolio. Jangan gunakan di produksi tanpa melakukan hardening keamanan (ganti kredensial default, aktifkan CSRF, validasi upload, dsb).

## 📄 Lisensi

CodeIgniter 3 dilisensikan di bawah [MIT License](https://github.com/bcit-ci/CodeIgniter/blob/develop/license.txt).
