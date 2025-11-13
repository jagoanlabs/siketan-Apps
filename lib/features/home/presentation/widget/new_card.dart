import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/shared/style/color.dart';

class NewCard extends StatelessWidget {
  final void Function(int index)? onNavigateToTab;
  const NewCard({super.key, this.onNavigateToTab});

  @override
  Widget build(BuildContext context) {
    return NewCardView(onNavigateToTab: onNavigateToTab);
  }
}

class NewCardView extends StatefulWidget {
  final void Function(int index)? onNavigateToTab;
  const NewCardView({super.key, this.onNavigateToTab});

  @override
  State<NewCardView> createState() => _NewCardViewState();
}

class _NewCardViewState extends State<NewCardView> {
  final List<Map<String, dynamic>> _news = [
    {
      'image': ImageConfig.homeBackground,
      'author': 'Agus Pasianto, S.P., M.M.A',
      'title': 'Perangkap Tikus dengan Bubu. Salah Satu Strategi Pengendali Tikus...',
      'description':
          'Kalau masih ada yang ramah lingkungan, kenapa pakai yang ekstrim. Perangkap...',
      'date': '16 Agustus 2024',
    },
    {
      'image': ImageConfig.welcomeCard,
      'author': 'Dewi Sartika, M.P.',
      'title': 'Pupuk Organik Lebih Baik dari Kimia?',
      'description':
          'Pupuk organik tidak hanya menyuburkan tanah, tapi juga menjaga kelestarian ekosistem pertanian jangka panjang.',
      'date': '18 Agustus 2024',
    },
    {
      'image': ImageConfig.authBackground,
      'author': 'Budi Santoso, S.T.P.',
      'title': 'Teknologi Pertanian Digital Mulai Masuk Desa',
      'description':
          'Aplikasi mobile untuk pemantauan cuaca, harga pasar, dan prediksi hasil panen kini bisa diakses petani di pelosok desa.',
      'date': '20 Agustus 2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header: Berita + Selengkapnya
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                "Berita",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray900,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ElevatedButton(
                onPressed: () {
                  widget.onNavigateToTab?.call(2);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red1,
                  foregroundColor: AppColors.red1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  disabledBackgroundColor: AppColors.red1,
                  disabledForegroundColor: AppColors.red1,
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                ),
                child: Text(
                  "Selengkapnya",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.red4,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // Horizontal Scroll News Cards
        SizedBox(
          height: 320.h, // Tinggi card lebih tinggi karena ada teks di bawah
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _news.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final news = _news[index];
              return Padding(
                padding: index == 0
                    ? EdgeInsets.only(left: 24.w, right: 12.w)
                    : index == _news.length - 1
                        ? EdgeInsets.only(right: 24.w)
                        : EdgeInsets.only(right: 12.w),
                child: GestureDetector(
                  onTap: () {
                    debugPrint("Klik berita: ${news['title']}");
                  },
                  child: Container(
                    width: 280.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.gray200.withOpacity(0.3),
                          blurRadius: 8.r,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                          child: Image.asset(
                            news['image'],
                            width: double.infinity,
                            height: 160.h,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // Konten teks
                        Padding(
                          padding: EdgeInsets.all(12.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Penulis
                              Row(
                                children: [
                                  Iconify(
                                    MaterialSymbols.person_outline_rounded,
                                    size: 16.w,
                                    color: AppColors.gray500,
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    news['author'],
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.gray700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h),

                              // Judul
                              Text(
                                news['title'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.gray900,
                                ),
                              ),
                              SizedBox(height: 8.h),

                              // Deskripsi
                              Text(
                                news['description'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.gray600,
                                  height: 1.4,
                                ),
                              ),
                              SizedBox(height: 12.h),

                              // Tanggal
                              Row(
                                children: [
                                  Iconify(
                                    MaterialSymbols.calendar_today_rounded,
                                    size: 16.w,
                                    color: AppColors.gray500,
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    news['date'],
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.gray500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}