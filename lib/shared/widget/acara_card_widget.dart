import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/core/constant/image/image_config.dart' show ImageConfig;
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/style/shadow.dart';
import 'package:siketan/shared/widget/shimmer_container_widget.dart';

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
        border: Border.all(color: AppColors.gray200, width: 1.w),
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
                child: (imageUrl.isEmpty)
                    // 1. JIKA URL KOSONG (null dari API), LANGSUNG TAMPILKAN PLACEHOLDER
                    ? Container(
                        width: 120.w,
                        height: 120.h,
                        color: Colors.grey[200], // Background abu-abu biar rapi
                        child: Transform.scale(
                          scale: 0.7,
                          child: Image.asset(
                            ImageConfig.imagePlaceholder,
                            fit: BoxFit
                                .contain, // Gunakan contain agar icon tidak terpotong
                          ),
                        ),
                      )
                    // 2. JIKA URL ADA, COBA LOAD DARI NETWORK
                    : Image.network(
                        imageUrl,
                        width: 120.w,
                        height: 120.h,
                        fit: BoxFit.cover,
                        // Loading builder opsional (biar ada loading muter saat download)
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return ShimmerContainerWidget(
                            width: 120.w,
                            height: 120.h,
                          );
                        },
                        // 3. JIKA URL ADA TAPI ERROR (404/Not Found), TAMPILKAN PLACEHOLDER
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 120.w,
                            height: 120.h,
                            color: Colors.grey[200],
                            child: Transform.scale(
                              scale: 0.7,
                              child: Image.asset(
                                ImageConfig.imagePlaceholder,
                                fit: BoxFit.contain,
                              ),
                            ),
                          );
                        },
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
                      Expanded(
                        child: Text(
                          location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.gray600,
                          ),
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
