# e-Hunian Design Tokens

Version: 1.0
Application: e-Hunian — Aplikasi Layanan dan Pengelolaan Rusunawa Berbasis Mobile

## 1. Color Tokens

### Primary
| Token | Hex |
|---|---|
| primary-50 | #EFF6FF |
| primary-100 | #DBEAFE |
| primary-300 | #93C5FD |
| primary-500 | #3B82F6 |
| primary-700 | #1D4ED8 |
| primary-900 | #1E3A8A |

### Semantic
| Token | Hex | Usage |
|---|---|---|
| success-500 | #16A34A | Tersedia / berhasil |
| warning-500 | #F59E0B | Menunggu |
| error-500 | #DC2626 | Error / gagal |
| info-500 | #2563EB | Informasi |

### Neutral
| Token | Hex |
|---|---|
| neutral-50 | #F9FAFB |
| neutral-100 | #F3F4F6 |
| neutral-200 | #E5E7EB |
| neutral-400 | #9CA3AF |
| neutral-600 | #4B5563 |
| neutral-800 | #1F2937 |

## 2. Typography

Font family: Inter

| Token | Size | Weight |
|---|---|---|
| display-large | 32px | Bold |
| heading-1 | 24px | Bold |
| heading-2 | 20px | Semi Bold |
| body-large | 16px | Regular |
| body-medium | 14px | Regular |
| caption | 12px | Medium |

## 3. Spacing

| Token | Value |
|---|---|
| space-4 | 4px |
| space-8 | 8px |
| space-16 | 16px |
| space-24 | 24px |
| space-32 | 32px |
| space-48 | 48px |

## 4. Components

### Primary Button
- Label example: Ajukan Sewa
- Height: 48px
- Border radius: 12px
- Background: primary-700
- Text: white

### Search Bar
- Placeholder: Cari Rusunawa..
- Height: 44px
- Border radius: 12px
- Background: neutral-100

### Housing Card
- Content: photo, name, rating, rental price, availability
- Border radius: 16px
- Background: white
- Example: Rusunawa Pasar Rumput, 4.8, Rp650.000/bln, Tersedia

### Unit Card
- Content: unit name, facilities, floor, rental price, status
- Example: Unit B-0304, 2 KT, 1 KM, Lantai 3, Rp650.000/bulan

### Status Badge
- Available: success-500
- Pending: warning-500
- Rented: neutral-400

### Bottom Navigation
- Items: Home, Hunian, Pengajuan, Profil
- Height: 72px
- Active: primary-700
- Inactive: neutral-400

## 5. Design Rules

- Gunakan color tokens yang tersedia.
- Gunakan sistem spacing berbasis 4px sesuai nilai token.
- Gunakan typography sesuai hierarki.
- Gunakan reusable components.
- Jangan membuat warna hex atau spacing baru tanpa persetujuan desain.
- Jangan membuat komponen tanpa dokumentasi.
