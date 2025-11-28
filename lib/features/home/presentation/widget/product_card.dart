import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:siketan/app/helper/format_currency_helper.dart';
import 'package:siketan/app/routes/route_name.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/features/home/presentation/bloc/product_bloc.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/widget/shimmer_container_widget.dart';

class ProductCard extends StatelessWidget {
  final void Function(int index)? onNavigateToTab;
  const ProductCard({super.key, this.onNavigateToTab});

  @override
  Widget build(BuildContext context) {
    return ProductCardView(onNavigateToTab: onNavigateToTab);
  }
}

class ProductCardView extends StatefulWidget {
  final void Function(int index)? onNavigateToTab;
  const ProductCardView({super.key, this.onNavigateToTab});

  @override
  State<ProductCardView> createState() => _ProductCardViewState();
}

class _ProductCardViewState extends State<ProductCardView> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ProductBloc>().add(ProductEventFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header: Produk + Selengkapnya
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                "Produk",
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
                  widget.onNavigateToTab?.call(3); // navigasi ke halaman produk
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

        // Horizontal Scroll Product Cards
        SizedBox(
          height: 300.h, // Tinggi card untuk gambar + teks + tombol
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductError) {
                return Center(child: Text(state.message));
              }
              if (state is ProductLoading) {
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
                        width: 200.w,
                        height: 310.h,
                      ),
                    );
                  },
                );
              }
              if (state is ProductLoaded) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.product.data?.length != null
                      ? (state.product.data!.length > 5
                            ? 5
                            : state.product.data!.length)
                      : 0,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final product = state.product.data?[index];
                    return Padding(
                      padding: index == 0
                          ? EdgeInsets.only(left: 24.w, right: 12.w)
                          : index ==
                                (state.product.data!.length > 5
                                        ? 5
                                        : state.product.data!.length) -
                                    1
                          ? EdgeInsets.only(right: 24.w)
                          : EdgeInsets.only(right: 12.w),
                      child: GestureDetector(
                        onTap: () {
                          debugPrint(
                            "Klik produk: ${product?.namaProducts}, ${product?.id}",
                          );
                          Navigator.pushNamed(
                            context,
                            RoutesName.detailProduct,
                            arguments: product?.id.toString(),
                          );
                        },
                        child: Container(
                          width: 200.w,
                          height: 310.h,
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
                              // Gambar Produk
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12.r),
                                ),
                                child: Image.network(
                                  product?.fotoTanaman ?? "",
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

                              // Konten teks & tombol
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(12.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // BAGIAN ATAS
                                      Text(
                                        product?.namaProducts ?? "",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.gray900,
                                        ),
                                      ),
                                      SizedBox(height: 4.h),

                                      Text(
                                        FormatCurrencyHelper.currency(
                                          product?.harga,
                                        ),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.green4,
                                        ),
                                      ),

                                      // --- INI YANG MEMBUAT SPACEBETWEEN BEKERJA ---
                                      Expanded(
                                        child: SizedBox(),
                                      ), // PENGGANTI Spacer()
                                      // TOMBOL BELI
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.blue4,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              vertical: 8.h,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Iconify(
                                                MaterialSymbols
                                                    .shop_outline_rounded,
                                                size: 16.w,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 6.w),
                                              Text(
                                                "Beli sekarang",
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
