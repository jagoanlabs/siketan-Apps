import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/style/shadow.dart';

class CekNIK extends StatelessWidget {
  const CekNIK({super.key});

  @override
  Widget build(BuildContext context) {
    return const CekNIKView();
  }
}

class CekNIKView extends StatefulWidget {
  const CekNIKView({super.key});

  @override
  State<CekNIKView> createState() => _CekNIKViewState();
}

class _CekNIKViewState extends State<CekNIKView> {
   final TextEditingController _nikController = TextEditingController();

  @override
  void dispose() {
    _nikController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cek NIK Petani',
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.gray900,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_rounded,
            size: 32.w,
            color: AppColors.gray900,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.green0,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: shadowSm,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(ImageConfig.imageCekNik, fit: BoxFit.contain),
                    SizedBox(height: 16.h),
                    Text(
                      textAlign: TextAlign.start,
                      'Cek NIK Petani',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.gray900,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    // searching bar
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 2.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: AppColors.gray200,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.gray200.withOpacity(0.3),
                            blurRadius: 8.r,
                            offset: Offset(0, 2),
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
                          SizedBox(width: 8.w),
                          Expanded(
                            child: TextField(
                              controller: _nikController,
                              decoration: InputDecoration(
                                hintText: "Masukkan NIK",
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
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.gray900,
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          ElevatedButton(
                            onPressed: _nikController.text.isEmpty
                                ? null
                                : () {
                                    // TODO: Logika cek NIK
                                    print(
                                      "Mencari NIK: ${_nikController.text}",
                                    );
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.green4,
                              foregroundColor: AppColors.green5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              disabledBackgroundColor: AppColors.gray200,
                              disabledForegroundColor: AppColors.gray500,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 8.h,
                              ),
                            ),
                            child: Text(
                              "Cari",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text("Cek data petani berdasarkan Nomor Induk Kependudukan di sini!",
                    style: TextStyle(
                      fontSize: 9.sp,
                      color: AppColors.gray500,
                      fontWeight: FontWeight.w400,
                    ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
