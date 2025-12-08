import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:siketan/shared/widget/select_field_widget.dart';
import 'package:siketan/shared/widget/text_field_widget.dart';
import 'package:image_picker/image_picker.dart'; // Tambahkan ini
import 'dart:io' show File; // Untuk handle file lokal

class BiodataForm extends StatefulWidget {
  final Function(Map<String, dynamic>)? onCollectData;
  const BiodataForm({super.key, this.onCollectData});

  @override
  State<BiodataForm> createState() => BiodataFormState();
}

class BiodataFormState extends State<BiodataForm> {
  bool _isExpanded = false;

  final TextEditingController nikController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController hpController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  String? selectedTipePenyuluh;

  // Variabel untuk menyimpan file gambar yang dipilih
  File? selectedImage;

  // Fungsi untuk memilih gambar dari galeri
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

  void collectFormData() {
    if (widget.onCollectData != null) {
      widget.onCollectData!({
        'nik': nikController.text,
        'nama': namaController.text,
        'email': emailController.text,
        'hp': hpController.text,
        'password': passController.text,
        'confirmPassword': confirmPassController.text,
        'tipePenyuluh': selectedTipePenyuluh,
        'alamat': alamatController.text,
        'foto': selectedImage?.path,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      elevation: 0, // hilangkan shadow jika mau flat
      dividerColor: Colors.transparent, // hilangkan garis antar panel
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (_, isExpanded) {
        setState(() => _isExpanded = !_isExpanded);
      },
      children: [
        ExpansionPanel(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          backgroundColor: AppColors.gray50,
          isExpanded: _isExpanded,
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
                  "Data Biodata Penyuluh",
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
                // foto profile
                CircleAvatar(
                  radius: 50.r,
                  backgroundColor: AppColors.gray100,
                  backgroundImage: selectedImage != null
                      ? FileImage(selectedImage!)
                      : null, // Jika belum ada gambar, tampilkan background abu-abu
                  child: selectedImage == null
                      ? Iconify(
                          MaterialSymbols.person_outline_rounded,
                          color: AppColors.gray400,
                          size: 40.w,
                        )
                      : null, // Jika sudah ada gambar, tidak perlu ikon
                ),

                SizedBox(height: 12.h),

                // Tombol Pilih Foto
                ElevatedButton(
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
                        "Pilih foto",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 4.h),

                // Teks informasi format
                Text(
                  "Format: PNG, JPG, JPEG, GIF. Maksimal 5MB.",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.gray500,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 4.h),
                TextFieldWidget(
                  controller: nikController,
                  label: "NIK",
                  hintText: "NIK",
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'Wajib diisi'),
                  ]),
                  obscureText: false,
                  isPasswordField: false,
                ),
                TextFieldWidget(
                  controller: namaController,
                  label: "Nama",
                  hintText: "Nama",
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'Wajib diisi'),
                  ]),
                  obscureText: false,
                  isPasswordField: false,
                ),
                TextFieldWidget(
                  controller: emailController,
                  label: "Email",
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'Wajib diisi'),
                  ]),
                  obscureText: false,
                  isPasswordField: false,
                ),
                TextFieldWidget(
                  controller: hpController,
                  label: "No HP",
                  hintText: "08xxxxxx",
                  keyboardType: TextInputType.phone,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'Wajib diisi'),
                  ]),
                  obscureText: false,
                  isPasswordField: false,
                ),
                TextFieldWidget(
                  controller: passController,
                  label: "Password",
                  hintText: "Password",
                  obscureText: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'Wajib diisi'),
                    (val) {
                      if (val != confirmPassController.text) {
                        return 'Password tidak sama dengan konfirmasi password';
                      }
                      return null;
                    },
                  ]),
                  isPasswordField: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                TextFieldWidget(
                  controller: confirmPassController,
                  label: "Konfirmasi Password",
                  hintText: "Konfirmasi Password",
                  obscureText: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'Wajib diisi'),
                    (val) {
                      if (val != passController.text) {
                        return 'Password tidak sama dengan konfirmasi password';
                      }
                      return null;
                    },
                  ]),
                  isPasswordField: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                // tipe penyuluh
                SelectFieldWidget(
                  label: "Tipe Penyuluh",
                  hintText: "Pilih tipe penyuluh",
                  value: selectedTipePenyuluh,
                  items: const ["Reguler", "Swadaya"],
                  validator: FormBuilderValidators.required(
                    errorText: "Wajib dipilih",
                  ),
                  onChanged: (value) =>
                      setState(() => selectedTipePenyuluh = value),
                ),

                TextFieldWidget(
                  controller: alamatController,
                  label: "Alamat",
                  hintText: "Alamat Lengkap",
                  keyboardType: TextInputType.streetAddress,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'Wajib diisi'),
                  ]),
                  obscureText: false,
                  isPasswordField: false,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
