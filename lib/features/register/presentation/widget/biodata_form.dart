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
  const BiodataForm({super.key});

  @override
  State<BiodataForm> createState() => _BiodataFormState();
}

class _BiodataFormState extends State<BiodataForm> {
  bool _isExpanded = false;

  final _nik = TextEditingController();
  final _nama = TextEditingController();
  final _email = TextEditingController();
  final _hp = TextEditingController();
  final _pass = TextEditingController();
  final _confirmPass = TextEditingController();
  final _alamat = TextEditingController();

  String? _selectedTipePenyuluh;

  // Variabel untuk menyimpan file gambar yang dipilih
  File? _selectedImage;

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
        _selectedImage = File(pickedFile.path);
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
                  backgroundImage: _selectedImage != null
                      ? FileImage(_selectedImage!)
                      : null, // Jika belum ada gambar, tampilkan background abu-abu
                  child: _selectedImage == null
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
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
                  controller: _nik,
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
                  controller: _nama,
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
                  controller: _email,
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
                  controller: _hp,
                  label: "No HP",
                  hintText: "No HP",
                  keyboardType: TextInputType.phone,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'Wajib diisi'),
                  ]),
                  obscureText: false,
                  isPasswordField: false,
                ),
                TextFieldWidget(
                  controller: _pass,
                  label: "Password",
                  hintText: "Password",
                  obscureText: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'Wajib diisi'),
                  ]),
                  isPasswordField: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                TextFieldWidget(
                  controller: _confirmPass,
                  label: "Konfirmasi Password",
                  hintText: "Konfirmasi Password",
                  obscureText: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'Wajib diisi'),
                  ]),
                  isPasswordField: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                // tipe penyuluh
                SelectFieldWidget(
                  label: "Tipe Penyuluh",
                  hintText: "Pilih tipe penyuluh",
                  value: _selectedTipePenyuluh,
                  items: const ["Lapangan", "Swasta", "PNS"],
                  validator: FormBuilderValidators.required(
                    errorText: "Wajib dipilih",
                  ),
                  onChanged: (value) =>
                      setState(() => _selectedTipePenyuluh = value),
                ),

                TextFieldWidget(
                  controller: _alamat,
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
