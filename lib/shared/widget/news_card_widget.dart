import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/app/helper/html_to_text_helper.dart';
import 'package:siketan/core/constant/image/image_config.dart' show ImageConfig;
import 'package:siketan/features/detail-berita/presentation/view/detail_berita_page.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/style/shadow.dart';
import 'package:siketan/shared/widget/shimmer_container_widget.dart';

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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailBeritaPage(
              title: title,
              content: description,
              imageUrl: imageUrl,
              author: author,
              date: date,
            ),
          ),
        );
      },
      child: Container(
        height: 160.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.gray200, width: 1.w),
          boxShadow: shadowSm,
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
                imageUrl,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return ShimmerContainerWidget(
                    width: 120.w,
                    height: 160.h,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      bottomLeft: Radius.circular(12.r),
                    ),
                  );
                },
                // 3. JIKA URL ADA TAPI ERROR (404/Not Found), TAMPILKAN PLACEHOLDER
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 120.w,
                    height: 160.h,
                    color: AppColors.gray200,
                    child: Transform.scale(
                      scale: 0.7,
                      child: Image.asset(
                        ImageConfig.imagePlaceholder,
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },

                width: 120.w,
                height: 160.h,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: 12.w),

            // Detail Berita
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // Penulis
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Iconify(
                              MaterialSymbols.person_outline_rounded,
                              size: 16.w,
                              color: AppColors.gray500,
                            ),
                            SizedBox(width: 6.w),
                            Expanded(
                              child: Text(
                                author,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.gray700,
                                ),
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
                          htmlToPlainText(description),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.gray600,
                            height: 1.4,
                          ),
                        ),
                        SizedBox(height: 12.h),
                      ],
                    ),
                    Spacer(),
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
      ),
    );
  }
}
