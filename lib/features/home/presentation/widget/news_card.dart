import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/app/helper/date_format_helper.dart';
import 'package:siketan/app/helper/html_to_text_helper.dart';
import 'package:siketan/app/routes/route_name.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/core/utils/logger/logger.dart';
import 'package:siketan/features/detail-berita/domain/model/detail_berita_dto.dart';
import 'package:siketan/features/home/presentation/bloc/berita_bloc.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/widget/shimmer_container_widget.dart';

class NewsCard extends StatelessWidget {
  final void Function(int index)? onNavigateToTab;
  const NewsCard({super.key, this.onNavigateToTab});

  @override
  Widget build(BuildContext context) {
    return NewsCardView(onNavigateToTab: onNavigateToTab);
  }
}

class NewsCardView extends StatefulWidget {
  final void Function(int index)? onNavigateToTab;
  const NewsCardView({super.key, this.onNavigateToTab});

  @override
  State<NewsCardView> createState() => _NewsCardViewState();
}

class _NewsCardViewState extends State<NewsCardView> {
  @override
  void initState() {
    context.read<BeritaBloc>().add(BeritaEventFetch());
    super.initState();
  }

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
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 8.h,
                  ),
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
          child: BlocBuilder<BeritaBloc, BeritaState>(
            builder: (context, state) {
              if (state is BeritaLoading) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: index == 0
                          ? EdgeInsets.only(left: 24.w, right: 12.w)
                          : index == 5
                          ? EdgeInsets.only(right: 24.w)
                          : EdgeInsets.only(right: 12.w),
                      child: ShimmerContainerWidget(
                        width: 280.w,
                        height: 320.h,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    );
                  },
                );
              } else if (state is BeritaError) {
                return Center(
                  child: Text(
                    state.message,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray900,
                    ),
                  ),
                );
              }
              if (state is BeritaLoaded) {
                logger.d(state.berita.infotani![0].judul);
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (state.berita.infotani?.length ?? 0) > 5
                      ? 5
                      : (state.berita.infotani?.length ?? 0),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final news = state.berita.infotani?[index];
                    return Padding(
                      padding: index == 0
                          ? EdgeInsets.only(left: 24.w, right: 12.w)
                          : index == state.berita.infotani!.length - 1
                          ? EdgeInsets.only(right: 24.w)
                          : EdgeInsets.only(right: 12.w),
                      child: GestureDetector(
                        onTap: () {
                          DetailBeritaDto detailBeritaDto = DetailBeritaDto(
                            id: news.id.toString(),
                            title: news.judul!,
                            author: news.createdBy!,
                            date: formatDateNullable(news.tanggal),
                            imageUrl: news.fotoBerita!,
                            content: news.isi!,
                          );
                          Navigator.pushNamed(
                            context,
                            RoutesName.detailBerita,
                            arguments: detailBeritaDto,
                          );
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
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12.r),
                                ),
                                child: Image.network(
                                  news!.fotoBerita!,
                                  width: double.infinity,
                                  height: 160.h,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      ImageConfig.imagePlaceholder,
                                      width: double.infinity,
                                      height: 160.h,
                                      fit: BoxFit.fitHeight,
                                    );
                                  },
                                ),
                              ),

                              // Konten teks
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(12.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Penulis
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Iconify(
                                                MaterialSymbols
                                                    .person_outline_rounded,
                                                size: 16.w,
                                                color: AppColors.gray500,
                                              ),
                                              SizedBox(width: 6.w),
                                              Text(
                                                news.createdBy ?? "Anonymous",
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
                                            news.judul ??
                                                "Judul tidak tersedia",
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
                                            htmlToPlainText(news.isi ?? ""),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),

                                      //
                                      Row(
                                        children: [
                                          Iconify(
                                            MaterialSymbols
                                                .calendar_today_rounded,
                                            size: 16.w,
                                            color: AppColors.gray500,
                                          ),
                                          SizedBox(width: 6.w),
                                          Text(
                                            formatDateNullable(news.tanggal),
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
                      ),
                    );
                  },
                );
              }
              return Container();
            },
          ),
        ),
      ],
    );
  }
}
