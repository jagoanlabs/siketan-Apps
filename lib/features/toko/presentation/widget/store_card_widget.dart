import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/shared/style/color.dart';

class StoreCardWidget extends StatelessWidget {
  final String imageUrl;
  final String location;
  final String name;
  final String id;
  const StoreCardWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
     return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray200.withValues(alpha: 0.3),
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
                    location,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray500,
                    ),
                  ),

                  Spacer(),
            
                  // Tombol Beli Sekarang
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
                            MaterialSymbols.location_on,
                            size: 16.w,
                            color: Colors.white,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            "Kunjungi Toko",
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
    );
  }
}
