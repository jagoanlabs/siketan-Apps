# 🌾 SIKETAN — Smart Information Ketahanan dan Pertanian Ngawi

A modern, modular, and clean-architected **Flutter application** for the *Dinas Ketahanan Pangan dan Pertanian Kabupaten Ngawi*.

> **Siketan Apps** adalah aplikasi mobile versi dari website **Siketan**, yang menyediakan fitur analisis, visualisasi, dan manajemen data pertanian dengan pendekatan **Clean Architecture** dan **modular feature structure**.

---

## 🧱 Project Architecture

Proyek ini menggunakan pola **Clean Architecture** dengan pendekatan **Feature-based Modularization** untuk menjaga skalabilitas, keterpisahan tanggung jawab, dan kemudahan testing.

```bash
lib/
├─ app/ # Konfigurasi global aplikasi
│ ├─ routes/ # Routing global
│ ├─ theme/ # ThemeData (light/dark)
│ └─ di/ # Dependency Injection
│
├─ core/ # Logic & konfigurasi lintas fitur
│ ├─ config/ # Image config, env config, dll.
│ ├─ constants/ # App keys, strings, API endpoints
│ ├─ services/ # Shared preferences, local storage, dll.
│ ├─ utils/ # Logger, formatter, helper
│ ├─ error/ # Exception & Failure class
│ └─ model/ # Model global (mis. PaginationModel)
│
├─ shared/ # Reusable UI components
│ ├─ widget/ # Widget global (AppButton, NotFoundPage)
│ ├─ styles/ # Token warna, text style, radius, spacing
│ ├─ mixins/ # Helper untuk UI (loading, snackbar)
│ └─ extensions/ # Extension method (context, string, dll.)
│
└─ features/ # Fitur modular utama
├─ auth/
│ ├─ data/
│ │ ├─ datasources/
│ │ └─ repository_impl/
│ ├─ domain/
│ │ ├─ model/
│ │ └─ repository/
│ └─ presentation/
│ ├─ view/
│ └─ widget/
├─ dashboard/
├─ user/
└─ ...
```

---

## 🧠 Clean Architecture Layering

```bash
Domain Layer
│ ├─ Model → representasi entity
│ └─ Repository → abstraksi operasi data
│
Data Layer
│ ├─ Datasource → akses API / database
│ └─ Repository Impl → implementasi kontrak repository
│
Presentation Layer
│ ├─ View → widget layar / halaman
│ └─ Widget → komponen UI reusable
```

---

## ⚙️ Feature Generator CLI

Proyek ini dilengkapi dengan **fitur generator otomatis** untuk membuat struktur fitur baru secara konsisten.  
Script ini berada di:  
📂 `tool/generate_feature.dart`

### 🪄 Cara Menggunakan

#### 🔸 Generate folder kosong (empty)
```bash
dart run tool/generate_feature.dart nama_fitur
```

```bash
lib/features/nama_fitur/
 ├─ data/
 │   ├─ datasources/
 │   └─ repository_impl/
 ├─ domain/
 │   ├─ model/
 │   └─ repository/
 └─ presentation/
     ├─ view/
     └─ widget/
```

#### 🔹 Generate folder dengan isi (with-content)
```bash
dart run tool/generate_feature.dart nama_fitur --with-content
```

```bash
lib/features/nama_fitur/
 ├─ data/
 │   ├─ datasources/nama_fitur_remote_datasource.dart
 │   └─ repository_impl/nama_fitur_repository_impl.dart
 ├─ domain/
 │   ├─ model/nama_fitur_model.dart
 │   └─ repository/nama_fitur_repository.dart
 └─ presentation/
     ├─ view/nama_fitur_page.dart
     └─ widget/nama_fitur_widget.dart
```

🎨 Design System

Aplikasi ini menggunakan Custom Design System yang terinspirasi dari palet Figma dan Tailwind, terdiri dari:

shared/styles/colors.dart → palet warna utama & grayscale

shared/styles/text_styles.dart → gaya tipografi (Poppins)


| Purpose              | Package                 |
| -------------------- | ----------------------- |
| Dependency Injection | `get_it`                |
| State Management     | `flutter_bloc`          |
| Local Storage        | `shared_preferences`    |
| Logging              | `logger`                |
| Splash Screen        | `flutter_native_splash` |
| Icon Set             | `iconify_flutter`       |
| Networking           | `dio`                   |


# Clone project

```bash
git clone https://github.com/your-username/siketan-apps.git
cd siketan-apps
```

# Install dependencies
```bash
flutter pub get
```

# Generate feature (optional)
```bash
dart run tool/generate_feature.dart dashboard --with-content
```

# Run app
```bash
flutter run
```


🧾 License

© 2025 — Siketan Apps
Developed for Dinas Ketahanan Pangan dan Pertanian Kabupaten Ngawi


❤️ Maintained by:

JagoanLabs Team - Nasrul Fahmi — Frontend Developer & Flutter Engineer