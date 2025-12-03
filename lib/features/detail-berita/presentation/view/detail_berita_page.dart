import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:siketan/core/constant/env.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/features/detail-berita/domain/model/detail_berita_dto.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:flutter_html/flutter_html.dart'; // Tambahkan ini
import 'package:siketan/app/helper/share_helper.dart';
import 'package:siketan/shared/widget/shimmer_container_widget.dart';

class DetailBeritaPage extends StatelessWidget {
  final DetailBeritaDto detailBeritaDto;

  const DetailBeritaPage({super.key, required this.detailBeritaDto});

  @override
  Widget build(BuildContext context) {
    return DetailBeritaPageView(
      id: detailBeritaDto.id,
      title: detailBeritaDto.title,
      author: detailBeritaDto.author,
      date: detailBeritaDto.date,
      imageUrl: detailBeritaDto.imageUrl,
      content: detailBeritaDto.content,
    );
  }
}

class DetailBeritaPageView extends StatefulWidget {
  final String id;
  final String title;
  final String author;
  final String date;
  final String imageUrl;
  final String content; // Isi HTML berita

  const DetailBeritaPageView({
    super.key,
    required this.id,
    required this.title,
    required this.author,
    required this.date,
    required this.imageUrl,
    required this.content,
  });

  @override
  State<DetailBeritaPageView> createState() => _DetailBeritaPageViewState();
}

class _DetailBeritaPageViewState extends State<DetailBeritaPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray50,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            // Gradient Background (scrollable)
            Container(
              width: double.infinity,
              height: 300.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: const [0.0, 0.8, 0.9, 1.0],
                  colors: [
                    AppColors.blue2,
                    AppColors.blue1.withValues(alpha: 0.5),
                    AppColors.blue1.withValues(alpha: 0.2),
                    AppColors.blue1.withValues(alpha: 0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 72.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 12.w,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.chevron_left, size: 32.sp),
                      ),
                      Text(
                        "Informasi Pertanian",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.gray900,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  height: 330.h,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,

                      // 🔥 FIX DI SINI
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return ShimmerContainerWidget(
                          width: double.infinity,
                          height: 330.h,
                        );
                      },

                      errorBuilder: (context, error, stackTrace) {
                        return Transform.scale(
                          scale: 0.7,
                          child: Image.asset(
                            ImageConfig.imagePlaceholder,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 4.w,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Iconify(
                            MaterialSymbols.person_2_outline_rounded,
                            size: 20.sp,
                            color: AppColors.gray900,
                          ),
                          Text(
                            widget.author,
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.gray900,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 4.w,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Iconify(
                            MaterialSymbols.calendar_today,
                            size: 20.sp,
                            color: AppColors.gray900,
                          ),
                          Text(
                            widget.date,
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.gray900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray900,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  // Ganti Text biasa dengan Html widget
                  child: Html(
                    data: widget.content,
                    style: {
                      "body": Style(
                        fontSize: FontSize(14.sp),
                        color: AppColors.gray900,
                        lineHeight: LineHeight(1.5),
                      ),
                      "p": Style(
                        margin: Margins.only(bottom: 8.h),
                        textAlign: TextAlign.justify,
                      ),
                      "strong": Style(
                        fontWeight: FontWeight.bold,
                        color: AppColors.gray900,
                      ),
                      "em": Style(fontStyle: FontStyle.italic),
                    },
                  ),
                ),
                SizedBox(height: 24.h),

                // Bagikan Section
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.gray200.withOpacity(0.3),
                        blurRadius: 8.r,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Bagikan',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.gray900,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      // Share Icon
                      IconButton(
                        onPressed: () {
                          // Implementasi share ke platform lain
                          shareContent(
                            widget.title,
                            Env.frontend + '/home/information/${widget.id}',
                          );
                        },
                        icon: Iconify(
                          Ph.share_network_duotone,
                          size: 20.w,
                          color: AppColors.gray700,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      // WhatsApp Icon
                      IconButton(
                        onPressed: () {
                          shareToWhatsApp(
                            context,
                            widget.title,
                            Env.frontend + '/home/information/${widget.id}',
                          );
                        },
                        icon: Iconify(
                          Ph.whatsapp_logo_light,
                          size: 20.w,
                          color: AppColors.gray700,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      // Instagram Icon
                      IconButton(
                        onPressed: () {
                          shareToInstagram(
                            context,
                            widget.title,
                            Env.frontend + '/home/information/${widget.id}',
                          );
                        },
                        icon: Iconify(
                          Ph.instagram_logo_light,
                          size: 20.w,
                          color: AppColors.gray700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
