import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:flutter_html/flutter_html.dart'; // Tambahkan ini
import 'package:siketan/app/helper/share_helper.dart';

class DetailBeritaPage extends StatelessWidget {
  final String? title;
  final String? author;
  final String? date;
  final String? imageUrl;
  final String? content; // Isi HTML berita

  const DetailBeritaPage({
    super.key,
    this.title,
    this.author,
    this.date,
    this.imageUrl,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return DetailBeritaPageView(
      title: title,
      author: author,
      date: date,
      imageUrl: imageUrl,
      content: content,
    );
  }
}

class DetailBeritaPageView extends StatefulWidget {
  final String? title;
  final String? author;
  final String? date;
  final String? imageUrl;
  final String? content; // Isi HTML berita

  const DetailBeritaPageView({
    super.key,
    this.title,
    this.author,
    this.date,
    this.imageUrl,
    this.content,
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
                  child: Text(
                    "Informasi Pertanian",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray900,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  height: 330.h,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      widget.imageUrl ??
                          ImageConfig
                              .authBackground, // Gunakan imageUrl dari parameter
                      fit: BoxFit.cover,
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
                            widget.author ?? "Penulis Tidak Diketahui",
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
                            widget.date ?? "Tanggal Tidak Diketahui",
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
                    widget.title ?? "Judul Tidak Diketahui",
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
                    data:
                        widget.content ?? "<p>Isi berita tidak ditemukan.</p>",
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
                            widget.title ?? "",
                            widget.imageUrl ?? "",
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
                            widget.title ?? "",
                            widget.imageUrl ?? "",
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
                            widget.title ?? "",
                            widget.imageUrl ?? "",
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
