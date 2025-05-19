# 🚗 Rental App – Laravel 10

Aplikasi manajemen rental sederhana berbasis **Laravel 10**.

---

## 📋 Daftar Isi

1. [Persyaratan Sistem](#-persyaratan-sistem)  
2. [Instalasi & Setup](#-instalasi--setup)  
   1. [Import Database](#import-database)  
   2. [Install Laravel 10](#install-laravel-10)  
   3. [Konfigurasi File .env](#konfigurasi-file-env)  
   4. [Menjalankan Migrasi](#menjalankan-migrasi)  
   5. [Import Koleksi Postman](#import-koleksi-postman)  
   6. [Menjalankan Server Laravel](#menjalankan-server-laravel)  
3. [Penutup](#penutup)

---

## 🛠️ Persyaratan Sistem

Pastikan sistem Anda telah terinstal:

- PHP **8.1** atau lebih tinggi  
- Composer  
- MySQL / MariaDB  
- Git *(opsional)*  
- Postman *(untuk testing API)*

---

## 🚀 Instalasi & Setup

### Import Database

1. Buka aplikasi database seperti **phpMyAdmin**, **DBeaver**, atau sejenisnya.  
1. Buat database baru dengan nama: `rental_db`.  
1. Import file dump SQL ke dalam database tersebut:  
   - Di **phpMyAdmin**:  
     - Pilih database `rental_db`  
     - Buka tab **Import**  
     - Pilih file `.sql`  
     - Klik **Go**

---

### Install Laravel 10

1. Jika memulai proyek baru, jalankan:

    ```bash
    composer create-project laravel/laravel:^10.0 rental-app
    cd rental-app
    composer install
    cp .env.example .env
    php artisan key:generate
    ```

---

### Konfigurasi File .env

1. Buka file `.env` dan sesuaikan konfigurasi database berikut:

    ```env
    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=rental_db
    DB_USERNAME=root
    DB_PASSWORD=
    ```

---

### Menjalankan Migrasi

1. Jalankan perintah migrasi untuk membuat tabel database:

    ```bash
    php artisan migrate
    ```

---

### Import Koleksi Postman

1. Buka aplikasi **Postman**  
1. Klik tombol **Import** (pojok kiri atas)  
1. Pilih tab **File**, lalu klik **Upload Files**  
1. Pilih file `test-api.postman_collection.json`  
1. Klik **Import**

---

### Menjalankan Server Laravel

1. Jalankan server lokal Laravel dengan perintah:

    ```bash
    php artisan serve
    ```

1. Jika berhasil, akses aplikasi melalui:

    ```
    http://127.0.0.1:8000
    ```

---

## ✅ Penutup

Selamat! Aplikasi **Rental App Laravel 10** Anda sudah siap digunakan.  
Gunakan Postman untuk menguji endpoint-endpoint API yang tersedia.

---

## 🔄 Tips Tambahan

1. Setelah mengubah `.env`, jalankan:

    ```bash
    php artisan config:cache
    ```

1. Untuk reset database sekaligus menjalankan seeder, gunakan:

    ```bash
    php artisan migrate:fresh --seed
    ```

1. Pastikan database sudah dibuat sebelum menjalankan migrasi.

---