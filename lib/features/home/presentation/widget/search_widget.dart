import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siketan/shared/style/color.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final VoidCallback? onSearchTap;

  const SearchBarWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          /// Text Field
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.gray900,
                ),
                decoration: InputDecoration(
                  hintText: "Cari produk, toko, atau event ...",
                  hintStyle: TextStyle(
                    color: AppColors.gray400,
                    fontSize: 14.sp,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          /// Tombol Search
          GestureDetector(
            onTap: onSearchTap,
            child: Container(
              height: 48.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: const Color(0xFFC6F8D8), // hijau muda (lihat gambar)
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                ),
              ),
              child: Icon(
                Icons.search_rounded,
                color: AppColors.green4,
                size: 24.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
