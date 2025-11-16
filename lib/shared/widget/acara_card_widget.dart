import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/style/shadow.dart';

class AcaraCard extends StatelessWidget {
  final String imageUrl;
  final String status;
  final Color statusColor;
  final String title;
  final String date;
  final String time;
  final String location;

  const AcaraCard({
    super.key,
    required this.imageUrl,
    required this.status,
    required this.statusColor,
    required this.title,
    required this.date,
    required this.time,
    required this.location,
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
        boxShadow: shadowSm,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar + Status Badge
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  bottomLeft: Radius.circular(12.r),
                ),
                child: Image.network(
                  // imageUrl
                  "https://ik.imagekit.io/hw6fintvt1/IMG-1758077527726_rV634MeuT.jpeg",
                  width: 120.w,
                  height: 120.h,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8.h,
                left: 8.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(width: 12.w),

          // Detail Acara
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                          color: AppColors.gray600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
              
                  // Waktu
                  Row(
                    children: [
                      Iconify(
                        MaterialSymbols.timer_rounded,
                        size: 16.w,
                        color: AppColors.gray500,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.gray600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
              
                  // Lokasi
                  Row(
                    children: [
                      Iconify(
                        MaterialSymbols.location_on_rounded,
                        size: 16.w,
                        color: AppColors.gray500,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        location,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.gray600,
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