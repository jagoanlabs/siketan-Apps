import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/app/helper/format_currency_helper.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/style/shadow.dart';
import 'package:siketan/shared/widget/shimmer_container_widget.dart';

class ProductCardWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final String id;
  const ProductCardWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: shadowMd,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Produk
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 120.h,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return ShimmerContainerWidget(
                  width: double.infinity,
                  height: 120.h,
                );
              },
              // 3. JIKA URL ADA TAPI ERROR (404/Not Found), TAMPILKAN PLACEHOLDER
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 120.h,
                  color: Colors.grey[200],
                  child: Transform.scale(
                    scale: 0.7,
                    child: Image.asset(
                      ImageConfig.imagePlaceholder,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
          ),

          // Konten Teks & Tombol
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: SizedBox(
                height: 120.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nama Produk
                    Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.gray900,
                      ),
                    ),

                    // Harga
                    Text(
                      FormatCurrencyHelper.currency(price),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.green4,
                      ),
                    ),

                    // Tombol Beli Sekarang
                    Spacer(), // tombol selalu turun ke bawah
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          debugPrint("Beli produk: $name (ID: $id)");
                          // Navigasi ke halaman detail atau checkout
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
                              MaterialSymbols.shopping_bag_outline,
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
          ),
        ],
      ),
    );
  }
}
