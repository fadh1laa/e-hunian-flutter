# AGENTS.md — E-Hunian Flutter

## 1. Project Overview

E-Hunian Flutter merupakan aplikasi frontend untuk sistem E-Hunian.
Project menggunakan Flutter dan mengikuti struktur aplikasi yang telah
ditetapkan pada `docs/architecture.md`.

## 2. Architecture Rules

- Gunakan struktur dan pola arsitektur yang telah ditentukan project.
- Pisahkan layer presentation, data, dan application sesuai kebutuhan.
- Jangan menempatkan business logic kompleks langsung pada widget.
- Gunakan model yang konsisten dengan API backend E-Hunian.
- Pertahankan struktur folder yang sudah ada.

## 3. API Rules

- Gunakan endpoint API yang terdokumentasi pada `docs/api_contract.md`.
- Jangan membuat endpoint baru tanpa memperbarui dokumentasi API.
- Pertahankan nama field request dan response yang telah disepakati.
- Gunakan authentication dan authorization sesuai kontrak API.
- Tangani response dan error API secara konsisten.

## 4. UI and State Management

- Pertahankan konsistensi UI dan design system project.
- Jangan mengubah alur aplikasi tanpa alasan yang jelas.
- Pisahkan state management dari widget apabila logic menjadi kompleks.
- Hindari duplikasi kode pada widget dan screen.

## 5. AI Safety Rules

AI wajib:

- Memeriksa struktur project sebelum melakukan perubahan.
- Mengikuti `docs/architecture.md`, `docs/api_contract.md`, dan
  `docs/project_guidelines.md`.
- Melakukan perubahan seminimal mungkin sesuai kebutuhan.
- Tidak menghapus file atau data tanpa instruksi.
- Tidak mengubah credential atau file `.env` tanpa instruksi.
- Tidak melakukan perubahan destruktif pada repository.
- Tidak menjalankan `git push --force`.
- Tidak mengubah kontrak API tanpa memperbarui dokumentasi terkait.

## 6. Git Workflow

- Jangan bekerja langsung pada branch `main`.
- Gunakan branch `dev` untuk integrasi.
- Gunakan branch `feature/*` untuk pengembangan fitur atau perubahan.
- Gunakan Conventional Commits.
- Perubahan pada `main` dilakukan melalui Pull Request.
- Jangan menggunakan `git push --force`.
- Untuk membatalkan commit yang sudah dipush, gunakan `git revert`.

## 7. Documentation

Jika perubahan berdampak pada:

- arsitektur,
- API,
- struktur folder,
- workflow,
- atau integrasi dengan Laravel,

maka dokumentasi terkait harus diperbarui.

Dokumen utama:

- `AGENTS.md`
- `docs/architecture.md`
- `docs/api_contract.md`
- `docs/project_guidelines.md`
