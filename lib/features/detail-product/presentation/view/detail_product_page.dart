import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:siketan/app/dependency_injector/import.dart';
import 'package:siketan/app/helper/format_currency_helper.dart';
import 'package:siketan/app/helper/share_helper.dart';
import 'package:siketan/app/helper/string_extenstion.dart';
import 'package:siketan/core/constant/env.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/core/utils/logger/logger.dart';
import 'package:siketan/features/detail-product/domain/repository/detail_product_repository.dart';
import 'package:siketan/features/detail-product/presentation/bloc/detail_product_bloc.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:colorful_iconify_flutter/icons/logos.dart';
import 'package:siketan/shared/widget/error_widget.dart';
import 'package:siketan/shared/widget/shimmer_container_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailProductPage extends StatelessWidget {
  final String id;
  const DetailProductPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailProductBloc(repository: getIt<DetailProductRepository>()),
      child: DetailProductPageView(id: id),
    );
  }
}

class DetailProductPageView extends StatefulWidget {
  final String id;
  const DetailProductPageView({super.key, required this.id});

  @override
  State<DetailProductPageView> createState() => _DetailProductPageViewState();
}

class _DetailProductPageViewState extends State<DetailProductPageView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scroll = ScrollController();
  bool isScrolled = false;
  String? phoneNumber;
  String? title;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scroll.addListener(() {
      if (_scroll.offset > 80 && !isScrolled) {
        setState(() => isScrolled = true);
      } else if (_scroll.offset <= 80 && isScrolled) {
        setState(() => isScrolled = false);
      }
    });
    context.read<DetailProductBloc>().add(GetDetailProductEvent(id: widget.id));
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // 🔥 wajib agar AppBar tidak menutupi gradient
      extendBodyBehindAppBar:
          true, // 🔥 wajib agar AppBar tidak menutupi gradient
      backgroundColor:
          Colors.white, // agar background di bawah appbar menjadi putih

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AnimatedTheme(
          data: Theme.of(context).copyWith(
            appBarTheme: AppBarTheme(
              backgroundColor: isScrolled ? Colors.white : Colors.transparent,
              elevation: isScrolled ? 1 : 0,
              iconTheme: IconThemeData(color: AppColors.gray900),
            ),
          ),
          child: AppBar(
            leadingWidth: 30,
            leading: IconButton(
              iconSize: 36,
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.gray900,
              ),
              child: const Text("Detail Product"),
            ),
            centerTitle: false,
          ),
        ),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(color: Colors.white),
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  final message =
                      "Halo, saya tertarik dengan produk Anda. Apakah masih tersedia?";

                  launchUrl(
                    Uri.parse(
                      "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}",
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  backgroundColor: AppColors.green4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Iconify(Logos.whatsapp_icon),
                    SizedBox(width: 8.w),
                    Text(
                      'Hubungi Penjual',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 16.w),
            ElevatedButton(
              onPressed: () {
                // bagikan
                shareContent(
                  title ?? "",
                  Env.frontend + '/home/toko/product/${widget.id}',
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.white,
                foregroundColor: AppColors.blue4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  side: BorderSide(color: AppColors.blue4, width: 2),
                ),
              ),
              child: Iconify(
                Ph.share_network_fill,
                color: AppColors.blue4,
                size: 24,
              ),
            ),
          ],
        ),
      ),

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
          context.read<DetailProductBloc>().add(
            GetDetailProductEvent(id: widget.id),
          );
        },
        child: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          controller: _scroll,
          child: Stack(
            children: [
              // 🔵 Background Gradient
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

              // 🔵 Konten scroll
              BlocBuilder<DetailProductBloc, DetailProductState>(
                builder: (context, state) {
                  if (state is DetailProductLoading) {
                    return Padding(
                      padding: EdgeInsets.only(top: kToolbarHeight + 24.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24.h),
                          // gambar
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 24.w),
                            child: ShimmerContainerWidget(
                              width: double.infinity,
                              height: 320.h,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          // title
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 24.w),
                            child: ShimmerContainerWidget(
                              width: double.infinity,
                              height: 40.h,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          // desc singkat
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 24.w),
                            child: ShimmerContainerWidget(
                              width: 120.w,
                              height: 24.h,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          // harga
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 24.w),
                            child: ShimmerContainerWidget(
                              width: MediaQuery.of(context).size.width / 3,
                              height: 32.h,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          // harga
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 24.w),
                            child: ShimmerContainerWidget(
                              width: MediaQuery.of(context).size.width / 3,
                              height: 12.h,
                            ),
                          ),
                          SizedBox(height: 32.h),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 24.w),
                            child: ShimmerContainerWidget(
                              width: MediaQuery.of(context).size.width,
                              height: 200.h,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  if (state is DetailProductError) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      child: Center(
                        child: ErrorMessageWidget(
                          size: ErrorSize.L,
                          message: state.message,
                        ),
                      ),
                    );
                  }
                  if (state is DetailProductLoaded) {
                    phoneNumber =
                        state.detailProduct.data?.tblAkun?.petani?.noTelp ??
                        state.detailProduct.data?.tblAkun?.penyuluh?.noTelp;
                    title = state.detailProduct.data?.namaProducts;
                    return Padding(
                      padding: EdgeInsets.only(top: kToolbarHeight + 24.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24.h),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 24.w),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: Image.network(
                                state.detailProduct.data?.fotoTanaman ?? "",
                                width: double.infinity,
                                height: 320.h,
                                fit: BoxFit.cover,
                                // 🔥 FIX DI SINI
                                loadingBuilder:
                                    (context, child, loadingProgress) {
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
                          SizedBox(height: 24.h),
                          // title
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.detailProduct.data?.namaProducts ?? "",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.gray900,
                                  ),
                                ),
                                Text(
                                  "Satuan : ${state.detailProduct.data?.satuan ?? ""}",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.gray900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 24.w,
                              right: 24.w,
                              top: 16.h,
                              bottom: 24.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FormatCurrencyHelper.currency(
                                    state.detailProduct.data?.harga ?? "",
                                  ),
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.gray900,
                                  ),
                                ),
                                Text(
                                  "${state.detailProduct.data?.status} :${state.detailProduct.data?.stok ?? "0"}",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.green4,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Tab Bar: Detail Produk & Penjual
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 24.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.gray200.withOpacity(0.2),
                                  blurRadius: 8.r,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: TabBar(
                              tabAlignment: TabAlignment.start,
                              padding: EdgeInsets.zero,
                              labelPadding: EdgeInsets.only(right: 24),
                              isScrollable: true,
                              dividerColor: Colors.transparent,
                              dividerHeight: 0,
                              controller: _tabController,
                              labelColor: AppColors.blue4,
                              unselectedLabelColor: AppColors.gray500,
                              indicator: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColors.blue4,
                                    width: 3,
                                  ),
                                ),
                              ),
                              tabs: [
                                Tab(
                                  child: Text(
                                    'Detail Produk',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Penjual',
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

                          // Tab Content
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 24.w),
                            child: SizedBox(
                              height: 300.h, // Atur tinggi konten tab
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  // Tab Detail Produk
                                  _buildTabContent(
                                    child: Text(
                                      state.detailProduct.data?.deskripsi ?? "",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),

                                  // Tab Penjual
                                  _buildTabContent(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          spacing: 8.w,
                                          children: [
                                            CircleAvatar(
                                              radius: 24.r,
                                              backgroundColor: AppColors.blue1,
                                              child:
                                                  state
                                                              .detailProduct
                                                              .data!
                                                              .tblAkun!
                                                              .foto !=
                                                          null &&
                                                      state
                                                          .detailProduct
                                                          .data!
                                                          .tblAkun!
                                                          .foto!
                                                          .isNotEmpty
                                                  ? Image.network(
                                                      state
                                                          .detailProduct
                                                          .data!
                                                          .tblAkun!
                                                          .foto!,
                                                      height: 48.h,
                                                      width: 48.w,
                                                    )
                                                  : Icon(
                                                      Icons.person,
                                                      color: AppColors.blue4,
                                                    ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              spacing: 2.h,
                                              children: [
                                                Text(
                                                  state
                                                          .detailProduct
                                                          .data
                                                          ?.tblAkun
                                                          ?.nama ??
                                                      "",
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 8.w,
                                                    vertical: 4.h,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12.r,
                                                        ),
                                                    color: AppColors.green0,
                                                  ),
                                                  child: Text(
                                                    (state
                                                                .detailProduct
                                                                .data
                                                                ?.tblAkun
                                                                ?.peran ??
                                                            "")
                                                        .capitalize(),
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: AppColors.green5,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16.h),
                                        _buildMenuProfile(
                                          icon: MaterialSymbols
                                              .location_on_outline_rounded,
                                          value:
                                              state
                                                  .detailProduct
                                                  .data
                                                  ?.tblAkun
                                                  ?.penyuluh
                                                  ?.alamat ??
                                              state
                                                  .detailProduct
                                                  .data
                                                  ?.tblAkun
                                                  ?.petani
                                                  ?.alamat ??
                                              "",
                                        ),
                                        SizedBox(height: 16.h),
                                        _buildMenuProfile(
                                          icon: MaterialSymbols
                                              .alternate_email_rounded,
                                          value:
                                              state
                                                  .detailProduct
                                                  .data
                                                  ?.tblAkun
                                                  ?.email ??
                                              "",
                                        ),
                                        SizedBox(height: 16.h),
                                        _buildMenuProfile(
                                          icon: MaterialSymbols
                                              .phone_android_outline_rounded,
                                          value:
                                              state
                                                  .detailProduct
                                                  .data
                                                  ?.tblAkun
                                                  ?.noWa ??
                                              "",
                                        ),
                                        SizedBox(height: 24.h),
                                        Text(
                                          "Lokasi",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.gray900,
                                          ),
                                        ),
                                        SizedBox(height: 16.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                spacing: 8.h,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Kecamatan:",
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.gray400,
                                                    ),
                                                  ),
                                                  Text(
                                                    state
                                                            .detailProduct
                                                            .data
                                                            ?.tblAkun
                                                            ?.petani
                                                            ?.kecamatan ??
                                                        state
                                                            .detailProduct
                                                            .data
                                                            ?.tblAkun
                                                            ?.penyuluh
                                                            ?.kecamatan ??
                                                        "",
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.gray900,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                spacing: 8.h,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Kabupaten:",
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.gray400,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Ngawi",
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.gray900,
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
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 32.h),
                        ],
                      ),
                    );
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildMenuProfile({required String icon, required String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 4.w,
      children: [
        Iconify(icon, size: 20.sp, color: AppColors.blue4),
        Expanded(
          child: Text(
            value,
            maxLines: 1,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.gray900,
            ),
          ),
        ),
      ],
    );
  }

  // Widget reusable untuk konten tab
  Widget _buildTabContent({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray200.withValues(alpha: 0.2),
            blurRadius: 8.r,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
