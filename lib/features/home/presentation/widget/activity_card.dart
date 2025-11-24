import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siketan/app/helper/date_format_helper.dart';
import 'package:siketan/app/helper/kegiatan_status_helper.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/features/home/presentation/bloc/kegiatan_bloc.dart';
import 'package:siketan/shared/widget/shimmer_container_widget.dart';

class ActivityCard extends StatelessWidget {
  final void Function(int index)? onNavigateToTab;
  const ActivityCard({super.key, this.onNavigateToTab});

  @override
  Widget build(BuildContext context) {
    return ActivityCardView(onNavigateToTab: onNavigateToTab);
  }
}

class ActivityCardView extends StatefulWidget {
  final void Function(int index)? onNavigateToTab;
  const ActivityCardView({super.key, this.onNavigateToTab});

  @override
  State<ActivityCardView> createState() => _ActivityCardViewState();
}

class _ActivityCardViewState extends State<ActivityCardView> {
  @override
  void initState() {
    context.read<KegiatanBloc>().add(KegiatanEventFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                "Kegiatan",
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
                  widget.onNavigateToTab!(2);
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
        // berita card horizontal scroll
        SizedBox(
          height: 200.h, // Tinggi card
          child: BlocBuilder<KegiatanBloc, KegiatanState>(
            builder: (context, state) {
              if (state is KegiatanError) {
                return Center(child: Text(state.message));
              }
              if (state is KegiatanLoading) {
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
                        height: 200.h,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    );
                  },
                );
              }
              if (state is KegiatanLoaded) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (state.kegiatan.infotani?.length ?? 0) > 5
                      ? 5
                      : (state.kegiatan.infotani?.length ?? 0),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final activity = state.kegiatan.infotani?[index];
                    final status = getEventStatus(activity?.tanggalAcara);
                    final statusText = getEventStatusText(status);
                    final statusColor = getEventStatusColor(status);

                    return Padding(
                      padding: index == 0
                          ? EdgeInsets.only(left: 24.w, right: 12.w)
                          : index == state.kegiatan.infotani!.length - 1
                          ? EdgeInsets.only(right: 24.w)
                          : EdgeInsets.only(right: 12.w),
                      child: Container(
                        width: 280.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.gray200.withValues(alpha: 0.3),
                              blurRadius: 8.r,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            // Gambar
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12.r),
                                bottom: Radius.circular(12.r),
                              ),
                              child: Image.network(
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
                                activity?.fotoKegiatan ?? '',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),

                            // Overlay semi-transparent hijau di bagian bawah
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(12.r),
                                    ),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        AppColors.green4.withValues(alpha: 0.4),
                                        AppColors.green7.withValues(alpha: 0.7),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // Status badge
                            Positioned(
                              top: 8.h,
                              left: 8.w,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: statusColor,
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Text(
                                  statusText,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                            // Judul & Tanggal
                            Positioned(
                              bottom: 12.h,
                              left: 12.w,
                              right: 12.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    activity?.namaKegiatan ?? "",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    formatDateNullable(activity?.tanggalAcara),
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.white.withValues(
                                        alpha: 0.8,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
