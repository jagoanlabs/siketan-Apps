import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/style/shadow.dart';

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
                      price,
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
