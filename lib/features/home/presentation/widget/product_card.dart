import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/shared/style/color.dart';

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
  final List<Map<String, dynamic>> _products = [
    {
      'image': ImageConfig.homeBackground,
      'name': 'Pisang Salju',
      'price': 'Rp20.000',
    },
    {
      'image': ImageConfig.welcomeCard,
      'name': 'Pisang Karamel',
      'price': 'Rp20.000',
    },
    {
      'image': ImageConfig.authBackground,
      'name': 'Pisang Keju',
      'price': 'Rp25.000',
    },
  ];

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
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
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
          height: 290.h, // Tinggi card untuk gambar + teks + tombol
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _products.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final product = _products[index];
              return Padding(
                padding: index == 0
                    ? EdgeInsets.only(left: 24.w, right: 12.w)
                    : index == _products.length - 1
                        ? EdgeInsets.only(right: 24.w)
                        : EdgeInsets.only(right: 12.w),
                child: GestureDetector(
                  onTap: () {
                    debugPrint("Klik produk: ${product['name']}");
                  },
                  child: Container(
                    width: 200.w,
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
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                          child: Image.asset(
                            product['image'],
                            width: double.infinity,
                            height: 160.h,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // Konten teks & tombol
                        Padding(
                          padding: EdgeInsets.all(12.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Nama Produk
                              Text(
                                product['name'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.gray900,
                                ),
                              ),
                              SizedBox(height: 4.h),

                              // Harga
                              Text(
                                product['price'],
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.green4,
                                ),
                              ),
                              SizedBox(height: 12.h),

                              // Tombol Beli Sekarang
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    debugPrint("Beli: ${product['name']}");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.blue4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Iconify(
                                        MaterialSymbols.shop_outline_rounded,
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
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}