import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/app/dependency_injector/import.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/features/cek-nik/domain/repository/cek_nik_repository.dart';
import 'package:siketan/features/cek-nik/presentation/bloc/cek_nik_bloc.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/style/shadow.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ci.dart';

class CekNIK extends StatelessWidget {
  const CekNIK({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CekNikBloc(cekNikRepository: getIt<CekNikRepository>()),
      child: const CekNIKView(),
    );
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
  void initState() {
    super.initState();
    _nikController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray50,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.gray200, width: 1),
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
                    Text(
                      "Cek data petani berdasarkan Nomor Induk Kependudukan di sini!",
                      style: TextStyle(
                        fontSize: 9.sp,
                        color: AppColors.gray500,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              // COntainer Result
              Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  boxShadow: shadowSm,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hasil Pencarian",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.gray900,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    // CircleAvatar(
                    //   radius: 50.r,
                    //   backgroundColor:
                    //       AppColors.gray200, // A fallback background color
                    //   backgroundImage:
                    //       (state.data.data?[0].tblAkun?.foto != null &&
                    //           state.data.data![0].tblAkun!.foto!.isNotEmpty)
                    //       ? NetworkImage(state.data.data![0].tblAkun!.foto!)
                    //       : null,
                    //   child:
                    //       (state.data.data?[0].tblAkun?.foto == null ||
                    //           state.data.data![0].tblAkun!.foto!.isEmpty)
                    //       ? Iconify(
                    //           MaterialSymbols.person_outline_rounded,
                    //           size: 50.r, // Icon size to fill the circle
                    //           color: AppColors.gray500,
                    //         )
                    //       : null,
                    // ),
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 50.r,
                        backgroundColor:
                            AppColors.gray200, // A fallback background color
                        child: Iconify(
                          MaterialSymbols.person_outline_rounded,
                          size: 50.r, // Icon size to fill the circle
                          color: AppColors.gray500,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        textAlign: TextAlign.center,
                        "SAIFUDIN",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.gray900,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 2.w,
                        children: [
                          Iconify(
                            MaterialSymbols.location_on_outline_rounded,
                            size: 20.w,
                            color: AppColors.gray500,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "Karang Ploso, Kendal",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.gray900,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.h),

                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 4.w,
                        children: [
                          Iconify(
                            Bi.telephone,
                            size: 16.w,
                            color: AppColors.gray500,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "08123456789",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.gray900,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    _sectionInformasiPersonal(),
                    SizedBox(height: 28.h),
                    _sectionLokasi(),
                    SizedBox(height: 28.h),
                    _sectionSttatusKelompok(),
                    SizedBox(height: 28.h),
                    _sectionInformasiTanaman(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // section informasi personal
  Widget _sectionInformasiPersonal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          spacing: 8.w,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Iconify(
              MaterialSymbols.person_3_outline_rounded,
              color: AppColors.gray900,
              size: 20.w,
            ),
            Text(
              "Informasi Personal",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.gray900,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        _buildInfo(title: "Nama", value: "SAIFUDIN"),
        SizedBox(height: 12.h),
        _buildInfo(title: "NIK", value: "123456789"),
        SizedBox(height: 12.h),
        _buildInfo(title: "NKK", value: "123456789"),
        SizedBox(height: 12.h),
        _buildInfo(title: "Alamat", value: "Karang Ploso, Kendal"),
        SizedBox(height: 12.h),
        _buildInfo(title: "Nomor Telepon", value: "08123456789"),
        SizedBox(height: 12.h),
        _buildInfo(title: "Email", value: "saifudin@gmail.com"),
      ],
    );
  }

  // section informasi Tanaman
  Widget _sectionInformasiTanaman() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          spacing: 8.w,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Iconify(Carbon.tree, color: AppColors.gray900, size: 20.w),
            Text(
              "Informasi Tanaman",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.gray900,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        _buildInfo(title: "Jumlah Tanaman", value: "12 Tanaman"),
        SizedBox(height: 12.h),
        _buildInfo(title: "Terdaftar Sejak", value: "12 Agustus 2022"),
      ],
    );
  }

  // section lokasi
  Widget _sectionLokasi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          spacing: 8.w,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Iconify(
              MaterialSymbols.location_on_outline_rounded,
              color: AppColors.gray900,
              size: 20.w,
            ),
            Text(
              "Informasi Lokasi",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.gray900,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        _buildInfo(title: "Desa", value: "Karang Ploso"),
        SizedBox(height: 12.h),
        _buildInfo(title: "Kecamatan", value: "Kendal"),
        SizedBox(height: 12.h),
      ],
    );
  }

  // section Sttatus Kelompok
  Widget _sectionSttatusKelompok() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          spacing: 8.w,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Iconify(Ci.group, color: AppColors.gray900, size: 20.w),
            Text(
              "Informasi Kelompok",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.gray900,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        _buildInfo(title: "Gapoktam", value: "Tani Maju"),
        SizedBox(height: 12.h),
        _buildInfo(title: "Nama Kelompok", value: "Sri Lestari"),
      ],
    );
  }

  Widget _buildInfo({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 4.h,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.gray700,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.gray900,
          ),
        ),
      ],
    );
  }
}
