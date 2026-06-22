import 'dart:io' show File;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:image_picker/image_picker.dart';
import 'package:siketan/app/dependency_injector/import.dart';
import 'package:siketan/core/utils/logger/logger.dart';
import 'package:siketan/features/register/domain/model/opsi_penyuluh_response_model.dart';
import 'package:siketan/features/register/domain/model/kelompok_tani_desa_response_model.dart';
import 'package:siketan/features/register/domain/model/register_petani_payload_model.dart';
import 'package:siketan/features/register/domain/repository/register_repository.dart';
import 'package:siketan/features/register/presentation/bloc/register_wilayah_bloc.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/widget/text_field_widget.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegisterPetaniForm extends StatefulWidget {
  const RegisterPetaniForm({super.key});

  @override
  State<RegisterPetaniForm> createState() => RegisterPetaniFormState();
}

class RegisterPetaniFormState extends State<RegisterPetaniForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<bool> _isExpanded = [true, false, false];

  // Controllers
  final TextEditingController nikController = TextEditingController();
  final TextEditingController nkkController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController hpController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController gapoktanController = TextEditingController();

  // Selections
  int? selectedKecamatanId;
  String? selectedKecamatanName;
  int? selectedDesaId;
  String? selectedDesaName;
  int? selectedPenyuluhId;
  String? selectedKelompokName;

  // Files
  File? selectedImage;

  // Options lists
  List<PenyuluhOption> _penyuluhOptions = [];
  List<KelompokTaniItem> _kelompokOptions = [];
  bool _loadingPenyuluh = false;
  bool _loadingKelompok = false;

  @override
  void initState() {
    super.initState();
    context.read<RegisterWilayahBloc>().add(GetAllKecamatanEvent());
    _loadPenyuluhOptions();
  }

  Future<void> _loadPenyuluhOptions() async {
    setState(() => _loadingPenyuluh = true);
    try {
      final repository = getIt<RegisterRepository>();
      final res = await repository.getOpsiPenyuluh();
      setState(() {
        _penyuluhOptions = res.dataDaftarPenyuluh ?? [];
      });
    } catch (e) {
      logger.e("Gagal memuat opsi penyuluh: $e");
    } finally {
      setState(() => _loadingPenyuluh = false);
    }
  }

  Future<void> _loadKelompokTaniByDesa(int desaId) async {
    setState(() {
      _loadingKelompok = true;
      _kelompokOptions = [];
      selectedKelompokName = null;
      gapoktanController.text = "";
    });

    try {
      final repository = getIt<RegisterRepository>();
      final res = await repository.getKelompokByDesaId(desaId);
      setState(() {
        _kelompokOptions = res.kelompokTani ?? [];
        if (_kelompokOptions.isNotEmpty) {
          // Auto-fill Gapoktan by system
          gapoktanController.text = _kelompokOptions.first.gapoktan ?? "";
        }
      });
    } catch (e) {
      logger.e("Gagal memuat kelompok tani per desa: $e");
    } finally {
      setState(() => _loadingKelompok = false);
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 85,
    );

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  bool validate() {
    return _formKey.currentState?.validate() ?? false;
  }

  RegisterPetaniPayloadModel getPayload() {
    return RegisterPetaniPayloadModel(
      nik: nikController.text,
      nkk: nkkController.text.isEmpty ? nikController.text : nkkController.text,
      nama: namaController.text,
      email: emailController.text.isEmpty
          ? '${namaController.text.split(' ')[0].toLowerCase()}@gmail.com'
          : emailController.text,
      alamat: alamatController.text,
      desa: selectedDesaName,
      desaId: selectedDesaId,
      kecamatan: selectedKecamatanName,
      kecamatanId: selectedKecamatanId,
      password: passController.text,
      noWa: hpController.text,
      gapoktan: gapoktanController.text,
      penyuluh: selectedPenyuluhId,
      namaKelompok: selectedKelompokName,
    );
  }

  File? getFotoKtp() {
    return selectedImage;
  }

  @override
  void dispose() {
    nikController.dispose();
    nkkController.dispose();
    namaController.dispose();
    emailController.dispose();
    hpController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    alamatController.dispose();
    gapoktanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ExpansionPanelList(
        elevation: 0,
        dividerColor: Colors.transparent,
        expandedHeaderPadding: EdgeInsets.zero,
        expansionCallback: (index, isExpanded) {
          setState(() {
            _isExpanded[index] = !_isExpanded[index];
          });
        },
        children: [
          // 1. DATA PRIBADI
          ExpansionPanel(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            backgroundColor: AppColors.gray50,
            isExpanded: _isExpanded[0],
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) {
              return Row(
                spacing: 16.w,
                children: [
                  Iconify(
                    MaterialSymbols.person_outline_rounded,
                    color: AppColors.green4,
                  ),
                  Text(
                    "Data Pribadi",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray900,
                    ),
                  ),
                ],
              );
            },
            body: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                spacing: 8.h,
                children: [
                  // NIK
                  TextFieldWidget(
                    controller: nikController,
                    label: "NIK",
                    hintText: "Nomor Induk Kependudukan (16 digit)",
                    keyboardType: TextInputType.number,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'Wajib diisi'),
                      FormBuilderValidators.numeric(errorText: 'NIK harus berupa angka'),
                      FormBuilderValidators.equalLength(16, errorText: 'NIK harus 16 digit'),
                    ]),
                    obscureText: false,
                    isPasswordField: false,
                  ),
                  // NKK
                  TextFieldWidget(
                    controller: nkkController,
                    label: "NKK (Opsional)",
                    hintText: "Nomor Kartu Keluarga (16 digit)",
                    keyboardType: TextInputType.number,
                    validator: FormBuilderValidators.compose([
                      (val) {
                        if (val != null && val.isNotEmpty) {
                          if (double.tryParse(val) == null) {
                            return 'NKK harus berupa angka';
                          }
                          if (val.length != 16) {
                            return 'NKK harus 16 digit';
                          }
                        }
                        return null;
                      }
                    ]),
                    obscureText: false,
                    isPasswordField: false,
                  ),
                  // Nama
                  TextFieldWidget(
                    controller: namaController,
                    label: "Nama Lengkap",
                    hintText: "Nama sesuai KTP",
                    keyboardType: TextInputType.name,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'Wajib diisi'),
                    ]),
                    obscureText: false,
                    isPasswordField: false,
                  ),
                  // No WA
                  TextFieldWidget(
                    controller: hpController,
                    label: "No WhatsApp",
                    hintText: "Contoh: 08xxxxxx",
                    keyboardType: TextInputType.phone,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'Wajib diisi'),
                      (val) {
                        if (val != null && !val.startsWith('08')) {
                          return 'Awalan nomor harus 08';
                        }
                        return null;
                      },
                    ]),
                    obscureText: false,
                    isPasswordField: false,
                  ),
                  // Email
                  TextFieldWidget(
                    controller: emailController,
                    label: "Email (Opsional)",
                    hintText: "Alamat email Anda",
                    keyboardType: TextInputType.emailAddress,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.email(errorText: 'Format email tidak valid'),
                    ]),
                    obscureText: false,
                    isPasswordField: false,
                  ),
                  // Password
                  TextFieldWidget(
                    controller: passController,
                    label: "Password",
                    hintText: "Password",
                    obscureText: true,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'Wajib diisi'),
                      FormBuilderValidators.minLength(6, errorText: 'Minimal 6 karakter'),
                      (val) {
                        if (val != confirmPassController.text) {
                          return 'Password tidak cocok';
                        }
                        return null;
                      },
                    ]),
                    isPasswordField: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  // Confirm Password
                  TextFieldWidget(
                    controller: confirmPassController,
                    label: "Konfirmasi Password",
                    hintText: "Konfirmasi Password",
                    obscureText: true,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'Wajib diisi'),
                      (val) {
                        if (val != passController.text) {
                          return 'Password tidak cocok';
                        }
                        return null;
                      },
                    ]),
                    isPasswordField: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 12.h),

                  // KTP Picture Upload
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Foto KTP (Opsional)",
                      style: TextStyle(fontSize: 13.sp, color: AppColors.gray900, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: _pickImage,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          side: BorderSide(
                            color: AppColors.gray300,
                            style: BorderStyle.solid,
                            width: 1.5,
                          ),
                        ),
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.gray700,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Iconify(
                            MaterialSymbols.upload_rounded,
                            size: 20.w,
                            color: AppColors.gray700,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            selectedImage != null ? "Ubah foto KTP" : "Pilih foto",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (selectedImage != null) ...[
                    SizedBox(height: 8.h),
                    Container(
                      height: 150.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        image: DecorationImage(
                          image: FileImage(selectedImage!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),

          // 2. WILAYAH ALAMAT
          ExpansionPanel(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            backgroundColor: AppColors.gray50,
            isExpanded: _isExpanded[1],
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) {
              return Row(
                spacing: 16.w,
                children: [
                  Iconify(
                    MaterialSymbols.location_on_outline,
                    color: AppColors.green4,
                  ),
                  Text(
                    "Alamat",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray900,
                    ),
                  ),
                ],
              );
            },
            body: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  // Alamat Lengkap
                  TextFieldWidget(
                    controller: alamatController,
                    label: "Alamat Lengkap",
                    hintText: "Nama Jalan, RT/RW, Dusun",
                    keyboardType: TextInputType.streetAddress,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'Wajib diisi'),
                    ]),
                    obscureText: false,
                    isPasswordField: false,
                  ),

                  // Kecamatan Dropdown
                  Text(
                    'Kecamatan',
                    style: TextStyle(fontSize: 13.sp, color: AppColors.gray900),
                  ),
                  BlocBuilder<RegisterWilayahBloc, RegisterWilayahState>(
                    buildWhen: (prev, curr) =>
                        prev.loadingKecamatan != curr.loadingKecamatan ||
                        prev.kecamatanList != curr.kecamatanList,
                    builder: (context, state) {
                      if (state.loadingKecamatan) {
                        return const Center(child: CircularProgressIndicator(color: AppColors.green4));
                      }

                      return DropdownButtonFormField<int>(
                        isExpanded: true,
                        value: selectedKecamatanId,
                        decoration: _buildDropdownDecoration("Pilih Kecamatan"),
                        validator: (value) => value == null ? 'Wajib dipilih' : null,
                        items: state.kecamatanList?.data?.map((e) {
                          return DropdownMenuItem(
                            value: e.id,
                            child: Text(
                              e.nama ?? '',
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          final item = state.kecamatanList?.data
                              ?.firstWhere((element) => element.id == value);
                          setState(() {
                            selectedKecamatanId = value;
                            selectedKecamatanName = item?.nama;
                            selectedDesaId = null;
                            selectedDesaName = null;
                            selectedKelompokName = null;
                            _kelompokOptions = [];
                            gapoktanController.text = "";
                          });

                          context.read<RegisterWilayahBloc>().add(
                                GetDesaByKecamatanEvent(value!),
                              );
                        },
                      );
                    },
                  ),

                  // Desa Dropdown
                  Text(
                    'Desa',
                    style: TextStyle(fontSize: 13.sp, color: AppColors.gray900),
                  ),
                  BlocBuilder<RegisterWilayahBloc, RegisterWilayahState>(
                    buildWhen: (prev, curr) =>
                        prev.loadingDesa != curr.loadingDesa ||
                        prev.desaList != curr.desaList,
                    builder: (context, state) {
                      if (state.loadingDesa) {
                        return const Center(child: CircularProgressIndicator(color: AppColors.green4));
                      }

                      return DropdownButtonFormField<int>(
                        isExpanded: true,
                        value: selectedDesaId,
                        decoration: _buildDropdownDecoration(
                          selectedKecamatanId == null
                              ? "Pilih Kecamatan dulu"
                              : "Pilih Desa",
                        ),
                        validator: (value) => value == null ? 'Wajib dipilih' : null,
                        disabledHint: const Text("Pilih Kecamatan dahulu"),
                        items: selectedKecamatanId == null
                            ? null
                            : state.desaList?.data?.map((desa) {
                                return DropdownMenuItem(
                                  value: desa.id,
                                  child: Text(
                                    desa.nama ?? '',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              }).toList(),
                        onChanged: selectedKecamatanId == null
                            ? null
                            : (value) {
                                final item = state.desaList?.data
                                    ?.firstWhere((element) => element.id == value);
                                setState(() {
                                  selectedDesaId = value;
                                  selectedDesaName = item?.nama;
                                });

                                _loadKelompokTaniByDesa(value!);
                              },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // 3. DATA KELOMPOK TANI
          ExpansionPanel(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            backgroundColor: AppColors.gray50,
            isExpanded: _isExpanded[2],
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) {
              return Row(
                spacing: 16.w,
                children: [
                  Iconify(
                    MaterialSymbols.agriculture_outline,
                    color: AppColors.green4,
                  ),
                  Text(
                    "Kelompok Tani",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray900,
                    ),
                  ),
                ],
              );
            },
            body: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  // Dropdown Penyuluh
                  Text(
                    'Penyuluh',
                    style: TextStyle(fontSize: 13.sp, color: AppColors.gray900),
                  ),
                  if (_loadingPenyuluh)
                    const Center(child: CircularProgressIndicator(color: AppColors.green4))
                  else
                    DropdownButtonFormField<int>(
                      isExpanded: true,
                      value: selectedPenyuluhId,
                      decoration: _buildDropdownDecoration("Pilih Penyuluh"),
                      validator: (value) => value == null ? 'Wajib dipilih' : null,
                      items: _penyuluhOptions.map((e) {
                        return DropdownMenuItem(
                          value: e.id,
                          child: Text(
                            e.nama ?? '',
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedPenyuluhId = value;
                        });
                      },
                    ),

                  // Textfield Gapoktan (Auto-filled by system)
                  TextFieldWidget(
                    controller: gapoktanController,
                    label: "Gapoktan (Terisi Otomatis)",
                    hintText: "Pilih Desa untuk memuat Gapoktan",
                    keyboardType: TextInputType.text,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'Wajib diisi'),
                    ]),
                    obscureText: false,
                    isPasswordField: false,
                  ),

                  // Dropdown Nama Kelompok Tani
                  Text(
                    'Nama Kelompok Tani',
                    style: TextStyle(fontSize: 13.sp, color: AppColors.gray900),
                  ),
                  if (_loadingKelompok)
                    const Center(child: CircularProgressIndicator(color: AppColors.green4))
                  else
                    DropdownButtonFormField<String>(
                      isExpanded: true,
                      value: selectedKelompokName,
                      decoration: _buildDropdownDecoration(
                        selectedDesaId == null
                            ? "Pilih Desa dulu"
                            : "Pilih Kelompok Tani",
                      ),
                      validator: (value) => value == null ? 'Wajib dipilih' : null,
                      disabledHint: const Text("Pilih Desa dahulu"),
                      items: selectedDesaId == null
                          ? null
                          : _kelompokOptions.map((e) {
                              return DropdownMenuItem(
                                value: e.namaKelompok,
                                child: Text(
                                  e.namaKelompok ?? '',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }).toList(),
                      onChanged: selectedDesaId == null
                          ? null
                          : (value) {
                              setState(() {
                                selectedKelompokName = value;
                              });
                            },
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildDropdownDecoration(String hint) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 14.w,
      ),
      hintText: hint,
      hintStyle: Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(fontSize: 12.sp, color: Colors.grey),
      filled: true,
      fillColor: AppColors.gray100,
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(width: 1.w, color: Colors.red),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          width: 1.w,
          color: AppColors.green4,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          width: 1.w,
          color: AppColors.gray400,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          width: 1.w,
          color: AppColors.blue4,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(width: 1.w, color: Colors.red),
      ),
    );
  }
}
