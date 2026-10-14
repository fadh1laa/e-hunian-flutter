# Architecture – e-Hunian Flutter

## 1. Overview

e-Hunian adalah aplikasi layanan dan pengelolaan Rusunawa berbasis mobile.

Project Flutter ini merupakan starter project untuk sisi frontend/mobile application. Pada tahap Pertemuan 5, struktur aplikasi disiapkan berdasarkan pembagian tanggung jawab yang jelas dan belum mengimplementasikan business logic secara lengkap.

---

## 2. Architecture

Flutter menggunakan struktur aplikasi berlapis dengan pemisahan antara:

- `core` – konfigurasi dan utilitas umum aplikasi.
- `models` – representasi data aplikasi.
- `services` – komunikasi dengan backend/API.
- `screens` – halaman atau tampilan aplikasi.
- `widgets` – komponen UI yang dapat digunakan kembali.
- `routes` – pengaturan navigasi aplikasi.

Alur umum:

```text
User
  |
  v
Screen / View
  |
  v
Service
  |
  v
Laravel REST API
  |
  v
JSON Response
  |
  v
Model
  |
  v
Screen / Widget

## 3. Struktur Folder Utama

```text
lib/
├── core/
│   ├── constants/
│   ├── theme/
│   └── utils/
├── models/
├── routes/
├── screens/
│   ├── application/
│   ├── home/
│   ├── review/
│   ├── rusunawa/
│   └── unit/
├── services/
└── widgets/