# Project Guidelines — E-Hunian Flutter

## 1. Tujuan
Project ini merupakan aplikasi Flutter untuk sistem E-Hunian.

## 2. Arsitektur
Project menggunakan pola MVVM dengan struktur:

- app/
- data/
- presentation/
- utils/

## 3. Aturan Pengembangan
- Ikuti struktur folder yang telah ditentukan.
- Pisahkan UI, data, dan business logic.
- Gunakan nama file dan class yang konsisten.
- Jangan menambahkan business logic lengkap pada tahap starter project.
- Perubahan harus dibuat seminimal mungkin sesuai kebutuhan.

## 4. Integrasi API
- Komunikasi dengan backend menggunakan REST API.
- API mengikuti kontrak yang telah disepakati.
- Perubahan endpoint harus didokumentasikan.
- Jangan menyimpan credential atau secret di repository.

## 5. Git Workflow
- `main` digunakan sebagai branch utama.
- `dev` digunakan untuk pengembangan.
- `feature/*` digunakan untuk fitur tertentu.
- Perubahan ke `main` dilakukan melalui Pull Request.
- Jangan menggunakan `git push --force` pada branch bersama.

## 6. AI Safety
AI harus mengikuti `AGENTS.md`.

AI tidak boleh:
- Menghapus file atau data tanpa instruksi.
- Mengubah konfigurasi sensitif.
- Mengubah struktur database secara destruktif.
- Mengubah API contract tanpa memperbarui dokumentasi.
- Melakukan force push.

## 7. Dokumentasi
Perubahan yang berdampak pada:
- arsitektur,
- API,
- struktur folder,
- workflow,
- atau integrasi Laravel

harus diikuti dengan pembaruan dokumentasi terkait.

Dokumen utama:
- `AGENTS.md`
- `docs/architecture.md`
- `docs/project_guidelines.md`