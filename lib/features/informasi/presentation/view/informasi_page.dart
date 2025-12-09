import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siketan/app/dependency_injector/import.dart';
import 'package:siketan/app/helper/date_format_helper.dart';
import 'package:siketan/app/helper/kegiatan_status_helper.dart';
import 'package:siketan/core/utils/logger/logger.dart';
import 'package:siketan/features/home/domain/model/berita_petani_response_model.dart';
import 'package:siketan/features/home/domain/model/kegiatan_petani_response_model.dart';
import 'package:siketan/features/home/domain/repository/home_repository.dart';
import 'package:siketan/features/home/presentation/bloc/berita_bloc.dart';
import 'package:siketan/features/home/presentation/bloc/kegiatan_bloc.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siketan/shared/widget/acara_card_widget.dart';
import 'package:siketan/shared/widget/banner_home_widget.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/shared/widget/error_widget.dart';
import 'package:siketan/shared/widget/news_card_widget.dart';
import 'package:siketan/shared/widget/shimmer_container_widget.dart';

class InformasiPage extends StatelessWidget {
  const InformasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              KegiatanBloc(homeRepository: getIt<HomeRepository>()),
        ),
        BlocProvider(
          create: (context) =>
              BeritaBloc(homeRepository: getIt<HomeRepository>()),
        ),
      ],
      child: const InformasiPageView(),
    );
  }
}

class InformasiPageView extends StatefulWidget {
  const InformasiPageView({super.key});

  @override
  State<InformasiPageView> createState() => _InformasiPageViewState();
}

class _InformasiPageViewState extends State<InformasiPageView>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;

  // State search
  String _searchQueryAcara = '';
  String _searchQueryBerita = '';

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<KegiatanBloc>().add(KegiatanEventFetch());
    context.read<BeritaBloc>().add(BeritaEventFetch());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.gray50,
      body: EasyRefresh(
        header: const ClassicHeader(
          showMessage: false,
          armedText: 'Lepaskan',
          dragText: 'Tarik ke bawah untuk refresh',
          failedText: 'Refresh gagal',
          readyText: 'Merefresh...',
          processingText: "Merefresh...",
          processedText: "Refresh berhasil",
        ),
        triggerAxis: Axis.vertical,
        onRefresh: () {
          logger.d('refresh');
          // aksi ketika icon search ditekan
          context.read<KegiatanBloc>().add(KegiatanEventFetch());
          context.read<BeritaBloc>().add(BeritaEventFetch());
        },
        child: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          child: Stack(
            children: [
              // Gradient Background
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
                  BannerHomeWidget(
                    title: 'Informasi Pertanian',
                    subtitle:
                        'Informasi Statistik Data Pertanian di Kab. Ngawi',
                  ),
                  SizedBox(height: 16.h),

                  // Tab Bar
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.gray200.withOpacity(0.2),
                          blurRadius: 8.r,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TabBar(
                      controller: _tabController,
                      labelColor: AppColors.green4,
                      unselectedLabelColor: AppColors.gray500,
                      dividerHeight: 0,
                      indicatorColor: AppColors.green4,
                      tabs: [
                        Tab(
                          child: Text(
                            'Acara',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Berita',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Tab Content - DINAMIS HEIGHT
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    child: AnimatedBuilder(
                      animation: _tabController,
                      builder: (context, child) {
                        // Logic manual switch tab
                        return _tabController.index == 0
                            ? BlocBuilder<KegiatanBloc, KegiatanState>(
                                builder: (context, state) {
                                  if (state is KegiatanLoading) {
                                    return Column(
                                      children: [
                                        ShimmerContainerWidget(
                                          width: double.infinity,
                                          height: 48.h,
                                        ),
                                        SizedBox(height: 16.h),
                                        ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: 5,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                bottom: 16.h,
                                              ),
                                              child: ShimmerContainerWidget(
                                                width: double.infinity,
                                                height: 120.h,
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  }
                                  if (state is KegiatanError) {
                                    return ErrorMessageWidget(
                                      message: state.message,
                                      size: ErrorSize.L,
                                      padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                            0.15,
                                      ),
                                    );
                                  }
                                  if (state is KegiatanLoaded) {
                                    return _AcaraTabContent(
                                      searchQuery: _searchQueryAcara,
                                      onSearchChanged: (value) {
                                        setState(() {
                                          _searchQueryAcara = value;
                                        });
                                      },
                                      acaraData: state.kegiatan,
                                    );
                                  }
                                  return const SizedBox();
                                },
                              )
                            : BlocBuilder<BeritaBloc, BeritaState>(
                                builder: (context, state) {
                                  if (state is BeritaLoading) {
                                    return Column(
                                      children: [
                                        ShimmerContainerWidget(
                                          width: double.infinity,
                                          height: 48.h,
                                        ),
                                        SizedBox(height: 16.h),
                                        ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: 5,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                bottom: 16.h,
                                              ),
                                              child: ShimmerContainerWidget(
                                                width: double.infinity,
                                                height: 200.h,
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  }
                                  if (state is BeritaError) {
                                    return ErrorMessageWidget(
                                      padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                            0.15,
                                      ),
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      message: state.message,
                                      size: ErrorSize.L,
                                    );
                                  }
                                  if (state is BeritaLoaded) {
                                    return _BeritaTabContent(
                                      searchQuery: _searchQueryBerita,
                                      onSearchChanged: (value) {
                                        setState(() {
                                          _searchQueryBerita = value;
                                        });
                                      },
                                      beritaData: state.berita,
                                    );
                                  }
                                  return const SizedBox();
                                },
                              );
                      },
                    ),
                  ),

                  // Extra padding bottom agar tidak mentok
                  SizedBox(height: 24.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================== WIDGET UNTUK TAB ACARA ==================
class _AcaraTabContent extends StatelessWidget {
  final String searchQuery;
  final Function(String) onSearchChanged;
  final KegiatanPetaniResponseModel acaraData;

  const _AcaraTabContent({
    Key? key,
    required this.searchQuery,
    required this.onSearchChanged,
    required this.acaraData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter data berdasarkan search query
    final filteredData = acaraData.infotani?.where((item) {
      final title = item.namaKegiatan.toString().toLowerCase();
      final isi = item.isi.toString().toLowerCase();
      final lokasi = item.tempat.toString().toLowerCase();
      final query = searchQuery.toLowerCase();
      return title.contains(query) ||
          isi.contains(query) ||
          lokasi.contains(query);
    }).toList();

    return Column(
      children: [
        // Search Bar untuk Acara
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.gray200, width: 1),
            boxShadow: [
              BoxShadow(
                color: AppColors.gray200.withOpacity(0.3),
                blurRadius: 8.r,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Iconify(
                MaterialSymbols.search_rounded,
                size: 20.w,
                color: AppColors.gray500,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: TextField(
                  onChanged: onSearchChanged,
                  decoration: InputDecoration(
                    hintText: "Cari Acara...",
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.gray400,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 14.sp, color: AppColors.gray900),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),

        // Daftar AcaraCard
        filteredData?.isEmpty ?? true
            ? Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: Text(
                    'Tidak ada acara ditemukan',
                    style: TextStyle(color: AppColors.gray500, fontSize: 14.sp),
                  ),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.zero,
                // KUNCI: shrinkWrap true & NeverScrollable
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredData?.length ?? 0,
                itemBuilder: (context, index) {
                  final item = filteredData?[index];
                  final status = getEventStatus(item?.tanggalAcara);
                  final statusText = getEventStatusText(status);
                  final statusColor = getEventStatusColor(status);
                  return AcaraCard(
                    imageUrl: item?.fotoKegiatan ?? "",
                    status: statusText,
                    statusColor: statusColor,
                    title: item?.namaKegiatan ?? "-",
                    date: formatDateNullable(item?.tanggalAcara),
                    time: item?.waktuAcara ?? "-",
                    location: item?.tempat ?? "-",
                  );
                },
              ),
      ],
    );
  }
}

// ================== WIDGET UNTUK TAB BERITA ==================
class _BeritaTabContent extends StatelessWidget {
  final String searchQuery;
  final Function(String) onSearchChanged;
  final BeritaPetaniResponseModel beritaData;

  const _BeritaTabContent({
    Key? key,
    required this.searchQuery,
    required this.onSearchChanged,
    required this.beritaData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter data berdasarkan search query
    final filteredData = beritaData.infotani?.where((item) {
      final title = item.judul.toString().toLowerCase();
      final description = item.isi.toString().toLowerCase();
      final author = item.createdBy.toString().toLowerCase();
      final query = searchQuery.toLowerCase();
      return title.contains(query) ||
          description.contains(query) ||
          author.contains(query);
    }).toList();

    return Column(
      children: [
        // Search Bar untuk Berita
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.gray200, width: 1),
            boxShadow: [
              BoxShadow(
                color: AppColors.gray200.withOpacity(0.3),
                blurRadius: 8.r,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Iconify(
                MaterialSymbols.search_rounded,
                size: 20.w,
                color: AppColors.gray500,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: TextField(
                  onChanged: onSearchChanged,
                  decoration: InputDecoration(
                    hintText: "Cari Berita...",
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.gray400,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 14.sp, color: AppColors.gray900),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),

        // Daftar BeritaCard
        filteredData?.isEmpty ?? true
            ? Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: Text(
                    'Tidak ada berita ditemukan',
                    style: TextStyle(color: AppColors.gray500, fontSize: 14.sp),
                  ),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.zero,
                // KUNCI: shrinkWrap true & NeverScrollable
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredData?.length ?? 0,
                itemBuilder: (context, index) {
                  final item = filteredData?[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: BeritaCard(
                      id: item?.id.toString() ?? "",
                      imageUrl: item?.fotoBerita ?? "",
                      author: item?.createdBy ?? "",
                      title: item?.judul ?? "",
                      description: item?.isi ?? "",
                      date: formatDateNullable(item?.tanggal),
                    ),
                  );
                },
              ),
      ],
    );
  }
}
