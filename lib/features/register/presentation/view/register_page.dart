import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/app/dependency_injector/import.dart';
import 'package:siketan/app/routes/route_name.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/features/register/domain/model/register_payload_model.dart';
import 'package:siketan/features/register/domain/repository/register_repository.dart';
import 'package:siketan/features/register/presentation/bloc/register_bloc.dart';
import 'package:siketan/features/register/presentation/bloc/register_wilayah_binaan_bloc.dart';
import 'package:siketan/features/register/presentation/bloc/register_wilayah_bloc.dart';
import 'package:siketan/features/register/presentation/widget/biodata_form.dart';
import 'package:siketan/features/register/presentation/widget/wilayah_binaan_form.dart';
import 'package:siketan/features/register/presentation/widget/wilayah_form.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/style/shadow.dart';
import 'package:siketan/shared/widget/primary_button_widget.dart';
import 'package:collection/collection.dart';
import 'package:siketan/shared/widget/toast_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterWilayahBloc(
            registerRepository: getIt<RegisterRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => RegisterWilayahBinaanBloc(
            registerRepository: getIt<RegisterRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) =>
              RegisterBloc(registerRepository: getIt<RegisterRepository>()),
        ),
      ],
      child: const RegisterPageView(),
    );
  }
}

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({super.key});

  @override
  State<RegisterPageView> createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView> {
  // FORM KEYS
  final biodataKey = GlobalKey<FormState>();
  final wilayahKey = GlobalKey<FormState>();
  final binaanKey = GlobalKey<FormState>();
  // BIODATA
  final nik = TextEditingController();
  final nama = TextEditingController();
  final email = TextEditingController();
  final hp = TextEditingController();
  final pass = TextEditingController();
  final confirmPass = TextEditingController();
  final alamat = TextEditingController();
  File? foto;
  String? tipePenyuluh;

  //  wilayah

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(ImageConfig.authBackground, width: double.infinity),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 60.h),
                  Text.rich(
                    TextSpan(
                      text: "Melesat ",
                      style: TextStyle(
                        fontSize: 24.sp,
                        color: AppColors.gray100,
                      ),
                      children: [
                        TextSpan(
                          text: "Lebih Cepat",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: "Bertumbuh ",
                      style: TextStyle(
                        fontSize: 24.sp,
                        color: AppColors.gray100,
                      ),
                      children: [
                        TextSpan(
                          text: "Lebih Baik",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.h),
                  _BuildForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildForm extends StatefulWidget {
  _BuildForm({super.key});

  @override
  State<_BuildForm> createState() => _BuildFormState();
}

class _BuildFormState extends State<_BuildForm> {
  final biodataKey = GlobalKey<FormState>();
  final wilayahKey = GlobalKey<FormState>();
  final wilayahBinaanKey = GlobalKey<FormState>();

  final biodataFormKey = GlobalKey<BiodataFormState>();
  final wilayahFormKey = GlobalKey<WilayahFormState>();
  final wilayahBinaanFormKey = GlobalKey<WilayahBinaanFormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: shadowMd,
        color: AppColors.gray50,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterFailed) {
            Toast.show(message: state.message, type: ToastType.error);
          }
          if (state is RegisterSuccess) {
            Toast.show(
              message: state.data.message ?? "Berhasil Mendaftar Penyuluh",
              type: ToastType.success,
            );
            Navigator.pushNamed(context, RoutesName.login);
          }
        },
        child: Form(
          key: biodataKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(ImageConfig.logoSiketan, width: 171.w),
              ),
              SizedBox(height: 24.h),

              // Tab Masuk / Daftar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20.w,
                children: [
                  Column(
                    spacing: 4.h,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.login);
                        },
                        child: Text(
                          "Masuk",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.gray400,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 40.w, height: 3.w),
                    ],
                  ),
                  Column(
                    spacing: 4.h,
                    children: [
                      Text(
                        "Daftar",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.gray900,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        width: 40.w,
                        height: 3.w,
                        color: AppColors.green4,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Daftar Akun Penyuluh",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.gray900,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Lengkapi data diri Anda sebagai Penyuluh!",
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.gray400,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.w),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.home);
                    },
                    child: Iconify(
                      MaterialSymbols.home_rounded,
                      size: 32.w,
                      color: AppColors.blue4,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),
              BiodataForm(key: biodataFormKey),
              SizedBox(height: 24.h),
              Form(
                key: wilayahKey,
                child: WilayahForm(key: wilayahFormKey),
              ),
              SizedBox(height: 24.h),
              Form(
                key: wilayahBinaanKey,
                child: WilayahBinaanForm(key: wilayahBinaanFormKey),
              ),
              SizedBox(height: 24.h),
              ButtonPrimary(
                isGradient: true,
                gradient: const LinearGradient(
                  colors: [AppColors.blue5, AppColors.blue4],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                isLoading: false,
                mainButtonMessage: "Daftar",
                mainButton: () {
                  _validateAndSubmit();
                },
                color: AppColors.blue4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validateAndSubmit() {
    final biodataFormState = biodataKey.currentState;
    final wilayahFormState = wilayahKey.currentState;

    bool isBiodataValid = biodataFormState?.validate() ?? false;
    bool isWilayahValid = wilayahFormState?.validate() ?? false;

    // For wilayah binaan form, we need custom validation for the multi-select
    bool isWilayahBinaanValid = true; // For the dropdowns that have validators

    // Check if the multi select fields have items selected
    final wilayahBinaanBloc = context.read<RegisterWilayahBinaanBloc>();
    final selectedKelompok = wilayahBinaanBloc.state.selectedKelompokIds;
    final selectedDesa = wilayahBinaanBloc.state.selectedDesaIds;

    // Check if kecamatan has been selected first
    bool kecamatanBinaanSelected =
        wilayahBinaanBloc.state.selectedKecamatanId != null;

    if (!kecamatanBinaanSelected) {
      isWilayahBinaanValid = false;
      Toast.show(
        message: 'Silakan pilih Kecamatan Binaan terlebih dahulu',
        type: ToastType.error,
      );
    } else if (selectedDesa.isEmpty) {
      isWilayahBinaanValid = false;
      Toast.show(
        message: 'Silakan pilih Desa Binaan terlebih dahulu',
        type: ToastType.error,
      );
    } else if (selectedKelompok.isEmpty) {
      isWilayahBinaanValid = false;
      Toast.show(
        message: 'Silakan pilih Kelompok Binaan terlebih dahulu',
        type: ToastType.error,
      );
    }

    if (isBiodataValid && isWilayahValid && isWilayahBinaanValid) {
      _collectAndLogData();
    }
  }

  void _collectAndLogData() {
    // Data from BiodataForm
    final biodataState = biodataFormKey.currentState;

    // Data from WilayahForm
    final wilayahState = wilayahFormKey.currentState;

    // Data from WilayahBinaanForm
    final wilayahBinaanBloc = context.read<RegisterWilayahBinaanBloc>();
    RegisterPaylaodModel payload = RegisterPaylaodModel(
      nip: biodataState?.nikController.text,
      nama: biodataState?.namaController.text,
      email: biodataState?.emailController.text,
      noWa: biodataState?.hpController.text,
      password: biodataState?.passController.text,
      alamat: biodataState?.alamatController.text,
      desa: _getNamaDesa(wilayahState?.selectedDesaId),
      desaId: wilayahState?.selectedDesaId,
      kecamatan: _getNamaKecamatan(wilayahState?.selectedKecamatanId),
      kecamatanId: wilayahState?.selectedKecamatanId,
      kecamatanBinaan: _getNamaKecamatan(
        wilayahBinaanBloc.state.selectedKecamatanId,
      ),
      desaBinaan: wilayahBinaanBloc.state.selectedDesaIds
          .map((id) => _getNamaDesa(id))
          .toList(),
      selectedKelompokIds: wilayahBinaanBloc.state.selectedKelompokIds,
      tipe: biodataState?.selectedTipePenyuluh,
      pekerjaan: 'Penyuluh Pertanian',
    );

    // Collect and log all the data in the requested format
    print('=== REGISTRASI DATA ===');
    print('NIP: ${biodataState?.nikController.text}');
    print('nama: ${biodataState?.namaController.text}');
    print('email: ${biodataState?.emailController.text}');
    print('NoWa: ${biodataState?.hpController.text}');
    print('password: ${biodataState?.passController.text}');
    print('alamat: ${biodataState?.alamatController.text}');
    print('tipe: ${biodataState?.selectedTipePenyuluh}');
    print('kecamatanId: ${wilayahState?.selectedKecamatanId}');
    print(
      'kecamatan: ${_getNamaKecamatan(wilayahState?.selectedKecamatanId)}',
    ); // You'll need to implement this
    print('desaId: ${wilayahState?.selectedDesaId}');
    print(
      'desa: ${_getNamaDesa(wilayahState?.selectedDesaId)}',
    ); // You'll need to implement this
    print(
      'kecamatanBinaan: ${_getNamaKecamatan(wilayahBinaanBloc.state.selectedKecamatanId)}',
    ); // You'll need to implement this
    print(
      'desaBinaan: ${_getNamaDesaList(wilayahBinaanBloc.state.selectedDesaIds)}',
    ); // You'll need to implement this
    print(
      'selectedKelompokIds: ${wilayahBinaanBloc.state.selectedKelompokIds.join(',')}',
    );
    print('pekerjaan: Penyuluh Pertanian');
    print('=====================');

    context.read<RegisterBloc>().add(RegisterProccess(payload));
  }

  // Helper methods to get names from IDs by accessing the bloc states
  String _getNamaKecamatan(int? kecamatanId) {
    if (kecamatanId == null) return '';

    // Access the wilayah bloc to find the kecamatan name
    final wilayahBloc = context.read<RegisterWilayahBloc>();
    if (wilayahBloc.state.kecamatanList?.data != null) {
      for (var kec in wilayahBloc.state.kecamatanList!.data!) {
        if (kec.id == kecamatanId) {
          return kec.nama ?? '';
        }
      }
    }

    // Also check in wilayah binaan bloc
    final wilayahBinaanBloc = context.read<RegisterWilayahBinaanBloc>();
    if (wilayahBinaanBloc.state.kecamatanList?.data != null) {
      for (var kec in wilayahBinaanBloc.state.kecamatanList!.data!) {
        if (kec.id == kecamatanId) {
          return kec.nama ?? '';
        }
      }
    }

    return '';
  }

  String _getNamaDesa(int? desaId) {
    if (desaId == null) return '';

    // Access the wilayah bloc to find the desa name
    final wilayahBloc = context.read<RegisterWilayahBloc>();
    if (wilayahBloc.state.desaList?.data != null) {
      for (var desa in wilayahBloc.state.desaList!.data!) {
        if (desa.id == desaId) {
          return desa.nama ?? '';
        }
      }
    }

    // Also check in wilayah binaan bloc
    final wilayahBinaanBloc = context.read<RegisterWilayahBinaanBloc>();
    if (wilayahBinaanBloc.state.desaList?.data != null) {
      for (var desa in wilayahBinaanBloc.state.desaList!.data!) {
        if (desa.id == desaId) {
          return desa.nama ?? '';
        }
      }
    }

    return '';
  }

  String _getNamaDesaList(List<int> desaIds) {
    if (desaIds.isEmpty) return '';

    final wilayahBinaanBloc = context.read<RegisterWilayahBinaanBloc>();
    final desaNames = <String>[];

    if (wilayahBinaanBloc.state.desaList?.data != null) {
      for (int id in desaIds) {
        bool found = false;
        for (var desa in wilayahBinaanBloc.state.desaList!.data!) {
          if (desa.id == id) {
            desaNames.add(desa.nama ?? '');
            found = true;
            break;
          }
        }
        if (!found) {
          // Fallback if not found
          desaNames.add('Desa $id');
        }
      }
    } else {
      // If the data is not loaded, just return the IDs as fallback
      for (int id in desaIds) {
        desaNames.add('Desa $id');
      }
    }

    return desaNames.join(', ');
  }
}
