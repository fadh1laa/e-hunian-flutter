# Architecture – e-Hunian Flutter

## 1. Overview

e-Hunian adalah aplikasi layanan dan pengelolaan Rusunawa berbasis mobile.

Project Flutter ini merupakan starter project untuk sisi frontend/mobile application. Pada tahap Pertemuan 5, struktur aplikasi disiapkan berdasarkan pembagian tanggung jawab yang jelas dan belum mengimplementasikan business logic secara lengkap.

---

## 2. Architecture

Project Flutter menggunakan pendekatan MVVM dengan pemisahan tanggung jawab ke dalam empat layer utama:

- `app` – konfigurasi aplikasi, konstanta, tema, dan routing.
- `data` – model data dan service untuk komunikasi dengan backend.
- `presentation` – tampilan aplikasi, screen, dan reusable widget.
- `utils` – fungsi utilitas umum yang digunakan oleh aplikasi.

Alur data aplikasi:

```text
User
  |
  v
Presentation
  |
  v
ViewModel / Service
  |
  v
Laravel REST API
  |
  v
Database
  |
  v
JSON Response
  |
  v
Data Model
  |
  v
Presentation

## 3. Struktur Folder Utama

```text
lib/
├── app/
│   ├── constants/
│   ├── routes/
│   └── theme/
├── data/
│   ├── models/
│   └── services/
├── presentation/
│   ├── screens/
│   │   ├── application/
│   │   ├── home/
│   │   ├── review/
│   │   ├── rusunawa/
│   │   └── unit/
│   └── widgets/
├── utils/
└── main.dart