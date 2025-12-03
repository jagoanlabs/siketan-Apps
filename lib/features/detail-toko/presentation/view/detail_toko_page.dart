import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/app/dependency_injector/import.dart';
import 'package:siketan/app/helper/string_extenstion.dart';
import 'package:siketan/features/detail-toko/domain/repository/toko_product_repository.dart';
import 'package:siketan/features/detail-toko/presentation/bloc/toko_product_bloc.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:colorful_iconify_flutter/icons/logos.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siketan/shared/widget/shimmer_container_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../toko/presentation/widget/product_card_widget.dart'
    show ProductCardWidget;

class DetailTokoPage extends StatelessWidget {
  final String id;
  const DetailTokoPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TokoProductBloc(repository: getIt<TokoProductRepository>()),
      child: DetailTokoView(id: id),
    );
  }
}

class DetailTokoView extends StatefulWidget {
  final String id;
  const DetailTokoView({super.key, required this.id});

  @override
  State<DetailTokoView> createState() => _DetailTokoViewState();
}

class _DetailTokoViewState extends State<DetailTokoView> {
  ScrollController _scroll = ScrollController();
  bool isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      if (_scroll.offset > 80 && !isScrolled) {
        setState(() => isScrolled = true);
      } else if (_scroll.offset <= 80 && isScrolled) {
        setState(() => isScrolled = false);
      }
    });
    context.read<TokoProductBloc>().add(
      TokoProductEventGetDetailToko(id: widget.id),
    );
  }

  @override
  void dispose() {
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
              child: const Text("Detail Toko"),
            ),
            centerTitle: false,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scroll,
        physics: const BouncingScrollPhysics(),
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
            BlocBuilder<TokoProductBloc, TokoProductState>(
              builder: (context, state) {
                if (state is TokoProductLoading) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: kToolbarHeight + 24.h,
                      left: 24.w,
                      right: 24.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 32.h),
                        // Row profile
                        Row(
                          spacing: 16.w,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerContainerWidget(
                              width: 100.w,
                              height: 100.h,
                              isRounded: true,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ShimmerContainerWidget(
                                  width: 150.w,
                                  height: 20.h,
                                ),
                                SizedBox(height: 8.h),
                                ShimmerContainerWidget(
                                  width: 100.w,
                                  height: 24.h,
                                ),
                                SizedBox(height: 8.h),
                                ShimmerContainerWidget(
                                  width: 150.w,
                                  height: 32.h,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 32.h),
                        // tentang penjual/toko shimmer
                        ShimmerContainerWidget(width: 120.w, height: 24.h),
                        SizedBox(height: 16.h),
                        ShimmerContainerWidget(width: 160.w, height: 24.h),
                        SizedBox(height: 16.h),
                        ShimmerContainerWidget(width: 160.w, height: 24.h),
                        SizedBox(height: 16.h),
                        ShimmerContainerWidget(width: 160.w, height: 24.h),
                        SizedBox(height: 16.h),
                        ShimmerContainerWidget(width: 160.w, height: 24.h),
                        // content product shimmer
                        SizedBox(height: 32.h),

                        ShimmerContainerWidget(width: 100.w, height: 24.h),
                        SizedBox(height: 12.h),

                        GridView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 6,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16.h,
                                crossAxisSpacing: 16.w,
                                childAspectRatio: 0.6,
                              ),
                          itemBuilder: (context, index) {
                            return ShimmerContainerWidget(
                              width: 100.w,
                              height: 120.h,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }
                if (state is TokoProductError) {
                  return Center(child: Text(state.message));
                }
                if (state is TokoProductLoaded) {
                  return Padding(
                    padding: EdgeInsets.only(top: kToolbarHeight + 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 32.h),
                        // content
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 50.r,
                                backgroundColor: AppColors
                                    .gray200, // A fallback background color
                                backgroundImage:
                                    (state.data.data?[0].tblAkun?.foto !=
                                            null &&
                                        state
                                            .data
                                            .data![0]
                                            .tblAkun!
                                            .foto!
                                            .isNotEmpty)
                                    ? NetworkImage(
                                        state.data.data![0].tblAkun!.foto!,
                                      )
                                    : null,
                                child:
                                    (state.data.data?[0].tblAkun?.foto ==
                                            null ||
                                        state
                                            .data
                                            .data![0]
                                            .tblAkun!
                                            .foto!
                                            .isEmpty)
                                    ? Iconify(
                                        MaterialSymbols.person_outline_rounded,
                                        size: 50
                                            .r, // Icon size to fill the circle
                                        color: AppColors.gray500,
                                      )
                                    : null,
                              ),
                              SizedBox(width: 16.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.data.data?[0].tblAkun?.nama ?? '',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.gray900,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.w,
                                      vertical: 4.h,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      color: AppColors.green0,
                                    ),
                                    child: Text(
                                      (state.data.data?[0].tblAkun?.peran ?? "")
                                          .capitalize(),
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: AppColors.green5,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  _buildButton(
                                    'Hubungi Penjual',
                                    Logos.whatsapp_icon,
                                    () {
                                      final message =
                                          "Halo, saya tertarik dengan produk Anda. Apakah masih tersedia?";

                                      launchUrl(
                                        Uri.parse(
                                          "https://wa.me/${state.data.data?[0].tblAkun?.noWa}?text=${Uri.encodeComponent(message)}",
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 24.w,
                            right: 24.w,
                            top: 24.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tentang Penjual',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.gray900,
                                ),
                              ),
                              SizedBox(height: 16.h),
                              _buildMenuProfile(
                                icon: Ph.phone_call_light,
                                value:
                                    state.data.data?[0].tblAkun?.noWa ??
                                    'Tidak Memiliki No. Whatsapp',
                              ),
                              SizedBox(height: 16.h),
                              _buildMenuProfile(
                                icon: MaterialSymbols.alternate_email_rounded,
                                value:
                                    state.data.data?[0].tblAkun?.email ??
                                    'Tidak Memiliki Email',
                              ),
                              SizedBox(height: 16.h),
                              _buildMenuProfile(
                                icon: Carbon.product,
                                value:
                                    "${state.data.data?.length.toString() ?? "0"} Produk",
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 24.w,
                            right: 24.w,
                            top: 24.h,
                          ),
                          child: Text(
                            "Produk",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.gray900,
                            ),
                          ),
                        ),

                        // list Product
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 12.h,
                          ),
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.data.data?.length ?? 0,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 16.h,
                                  crossAxisSpacing: 16.w,
                                  childAspectRatio: 0.6,
                                ),
                            itemBuilder: (context, index) {
                              final product = state.data.data?[index];
                              return ProductCardWidget(
                                imageUrl: product?.fotoTanaman ?? "",
                                name: product?.namaProducts ?? "",
                                price: product?.harga ?? "",
                                id: product?.id.toString() ?? "",
                              );
                            },
                          ),
                        ),
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
    );
  }

  ElevatedButton _buildButton(String text, String icon, Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
    );
  }

  Row _buildMenuProfile({required String icon, required String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 8.w,
      children: [
        Iconify(icon, size: 24.sp, color: AppColors.blue4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.gray900,
          ),
        ),
      ],
    );
  }
}
