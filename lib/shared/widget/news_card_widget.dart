import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/style/shadow.dart';

class BeritaCard extends StatelessWidget {
  final String imageUrl;
  final String author;
  final String title;
  final String description;
  final String date;

  const BeritaCard({
    super.key,
    required this.imageUrl,
    required this.author,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.gray200,
          width: 1.w,
        ),
        boxShadow: shadowSm
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              bottomLeft: Radius.circular(12.r),
            ),
            child: Image.network(
              // imageUrl
              "https://ik.imagekit.io/hw6fintvt1/IMG-1758077527726_rV634MeuT.jpeg",
              width: 120.w,
              height: 160.h,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 12.w),

          // Detail Berita
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
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
                        author,
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
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.gray900,
                    ),
                  ),
                  SizedBox(height: 8.h),
              
                  // Deskripsi
                  Text(
                    description,
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
                        date,
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
          ),
        ],
      ),
    );
  }
}