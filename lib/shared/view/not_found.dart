import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:siketan/shared/style/color.dart'; // contoh: paket ikon Material Design
// kamu juga bisa ganti ke set lain seperti "carbon", "ri", "twemoji", dll.

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🔍 Icon besar dari Iconify
                const Iconify(
                  Mdi.emoticon_sad_outline,
                  size: 120,
                  color: AppColors.blue4,
                ),
                const SizedBox(height: 32),

                // 🧾 Judul 404
                const Text(
                  '404',
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 8),

                // 🧭 Subjudul
                const Text(
                  'Halaman tidak ditemukan',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 16),

                // ✨ Deskripsi tambahan
                const Text(
                  'Maaf, halaman yang kamu cari tidak tersedia atau sudah dipindahkan.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black45,
                  ),
                ),

                const SizedBox(height: 32),

                // 🔙 Tombol kembali
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop(); // atau pushNamed('/home')
                  },
                  icon: const Iconify(Mdi.arrow_left, color: Colors.white),
                  label: const Text('Kembali'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blue4,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
