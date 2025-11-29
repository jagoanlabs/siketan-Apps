import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/app/dependency_injector/import.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/features/cek-nik/domain/model/cek_nik_payload_model.dart';
import 'package:siketan/features/cek-nik/domain/model/cek_nik_response_model.dart';
import 'package:siketan/features/cek-nik/domain/repository/cek_nik_repository.dart';
import 'package:siketan/features/cek-nik/presentation/bloc/cek_nik_bloc.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/style/shadow.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ci.dart';
import 'package:siketan/shared/widget/toast_widget.dart';

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
                          BlocConsumer<CekNikBloc, CekNikState>(
                            listener: (context, state) {
                              if (state is CekNikError) {
                                // Show error toast when result is not found or error occurs
                                String errorMessage = state.message;

                                // Check if the error message indicates NIK not found
                                if (errorMessage.toLowerCase().contains('not found') ||
                                    errorMessage.toLowerCase().contains('tidak ditemukan') ||
                                    errorMessage.toLowerCase().contains('404')) {
                                  AppToast.showError(context, 'NIK tidak ditemukan');
                                } else {
                                  AppToast.showError(context, errorMessage);
                                }
                              }
                            },
                            builder: (context, state) {
                              bool isLoading = state is CekNikLoading || state is CekNikProcessing;
                              return ElevatedButton(
                                onPressed: _nikController.text.isEmpty || isLoading
                                    ? null
                                    : () {
                                        // Dispatch CekNikEventPostCekNik event with the NIK
                                        final payload = CekNikPayloadModel(
                                          nik: _nikController.text.trim(),
                                        );
                                        context.read<CekNikBloc>().add(
                                          CekNikEventPostCekNik(payload: payload),
                                        );
                                      },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isLoading ? AppColors.gray200 : AppColors.green4,
                                  foregroundColor: isLoading ? AppColors.gray500 : AppColors.green5,
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
                                child: isLoading
                                  ? SizedBox(
                                      width: 20.w,
                                      height: 20.h,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.w,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      "Cari",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                              );
                            },
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
              // Result Container - Will be updated based on BLoC state
              BlocBuilder<CekNikBloc, CekNikState>(
                builder: (context, state) {
                  if (state is CekNikInitial) {
                    // Show placeholder when initial
                    return _buildResultPlaceholder();
                  } else if (state is CekNikLoading || state is CekNikProcessing) {
                    // Show loading indicator
                    return _buildLoadingResult();
                  } else if (state is CekNikSuccess) {
                    // Show result data
                    return _buildResultWithData(state.data);
                  } else if (state is CekNikError) {
                    // Show error message or empty state
                    return _buildErrorResult();
                  }
                  // Default case - show placeholder
                  return _buildResultPlaceholder();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Loading result widget
  Widget _buildLoadingResult() {
    return Container(
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
          Center(
            child: Padding(
              padding: EdgeInsets.all(24.h),
              child: Column(
                children: [
                  SizedBox(
                    width: 40.w,
                    height: 40.h,
                    child: CircularProgressIndicator(
                      strokeWidth: 3.w,
                      color: AppColors.green5,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Memuat data...",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.gray600,
                      fontWeight: FontWeight.w400,
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

  // Result placeholder widget (initial state)
  Widget _buildResultPlaceholder() {
    return Container(
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
          Center(
            child: Padding(
              padding: EdgeInsets.all(24.h),
              child: Text(
                "Masukkan NIK untuk melihat hasil pencarian",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.gray500,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Error result widget
  Widget _buildErrorResult() {
    return Container(
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
          Center(
            child: Padding(
              padding: EdgeInsets.all(24.h),
              child: Column(
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 40.w,
                    color: AppColors.red5,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Data tidak ditemukan",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.red5,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "NIK tidak ditemukan dalam database",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.gray600,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Result with data widget
  Widget _buildResultWithData(dynamic data) {
    // Check if data exists and has user information
    final user = data.user;
    if (user == null) {
      return _buildErrorResult();
    }

    return Container(
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
          // Profile Picture and Name
          Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 50.r,
                  backgroundColor: AppColors.gray200,
                  backgroundImage: user.foto != null && user.foto!.isNotEmpty
                      ? NetworkImage(user.foto!)
                      : null,
                  child: user.foto == null || user.foto!.isEmpty
                      ? Iconify(
                          MaterialSymbols.person_outline_rounded,
                          size: 50.r,
                          color: AppColors.gray500,
                        )
                      : null,
                ),
              ),
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  user.nama ?? "Nama Tidak Ditemukan",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.gray900,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              if (user.desa != null || user.kecamatan != null) ...[
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
                        "${user.desa ?? ''}${user.desa != null && user.kecamatan != null ? ', ' : ''}${user.kecamatan ?? ''}",
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
              ],
              if (user.noTelp != null) ...[
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
                        user.noTelp ?? "",
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
              ],
            ],
          ),
          _sectionInformasiPersonal(user),
          if (user.desa != null || user.kecamatan != null) ...[
            SizedBox(height: 28.h),
            _sectionLokasi(user),
          ],
          if (user.kelompok != null) ...[
            SizedBox(height: 28.h),
            _sectionStatusKelompok(user),
          ],
          if (user.tanamanPetanis != null && user.tanamanPetanis!.isNotEmpty) ...[
            SizedBox(height: 28.h),
            _sectionInformasiTanaman(user),
          ],
        ],
      ),
    );
  }

  // section informasi personal
  Widget _sectionInformasiPersonal(User user) {
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
        _buildInfo(title: "Nama", value: user.nama ?? "-"),
        SizedBox(height: 12.h),
        _buildInfo(title: "NIK", value: user.nik ?? "-"),
        SizedBox(height: 12.h),
        _buildInfo(title: "NKK", value: user.nkk ?? "-"),
        SizedBox(height: 12.h),
        _buildInfo(title: "Alamat", value: user.alamat ?? "-"),
        if (user.noTelp != null) ...[
          SizedBox(height: 12.h),
          _buildInfo(title: "Nomor Telepon", value: user.noTelp ?? "-"),
        ],
        if (user.email != null) ...[
          SizedBox(height: 12.h),
          _buildInfo(title: "Email", value: user.email ?? "-"),
        ],
      ],
    );
  }

  // section informasi Tanaman
  Widget _sectionInformasiTanaman(User user) {
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
        _buildInfo(
          title: "Jumlah Tanaman",
          value: "${user.tanamanPetanis?.length ?? 0} Tanaman"
        ),
        if (user.tanamanPetanis != null && user.tanamanPetanis!.isNotEmpty) ...[
          SizedBox(height: 12.h),
          _buildInfo(
            title: "Terdaftar Sejak",
            value: user.createdAt != null ?
              "${user.createdAt!.day} ${_getMonthName(user.createdAt!.month)} ${user.createdAt!.year}" :
              "-"
          ),
        ],
      ],
    );
  }

  // section lokasi
  Widget _sectionLokasi(User user) {
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
        _buildInfo(title: "Desa", value: user.desa ?? "-"),
        SizedBox(height: 12.h),
        _buildInfo(title: "Kecamatan", value: user.kecamatan ?? "-"),
      ],
    );
  }

  // section Status Kelompok
  Widget _sectionStatusKelompok(User user) {
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
        _buildInfo(title: "Gapoktan", value: user.kelompok?.gapoktan ?? "-"),
        SizedBox(height: 12.h),
        _buildInfo(title: "Nama Kelompok", value: user.kelompok?.namaKelompok ?? "-"),
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

  String _getMonthName(int month) {
    const months = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    if (month >= 1 && month <= 12) {
      return months[month - 1];
    }
    return '';
  }
}
