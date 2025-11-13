import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:siketan/shared/widget/text_field_widget.dart';

class WilayahBinaanForm extends StatefulWidget {
  const WilayahBinaanForm({super.key});

  @override
  State<WilayahBinaanForm> createState() => _WilayahBinaanFormState();
}

class _WilayahBinaanFormState extends State<WilayahBinaanForm> {
  bool _isExpanded = false;

  final _kecamatanBinaan = TextEditingController();
  final _desaBinaan = TextEditingController();
  final _kelompokBinaan = TextEditingController();

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
                    Bx.group,
                    color: AppColors.green4,
                  ),

                  Text(
                    "Wilayah Binaan",
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
                TextFieldWidget(
                  controller: _kecamatanBinaan,
                  label: "Kecamatan",
                  hintText: "Kecamatan",
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'Wajib diisi'),
                  ]),
                  obscureText: false,
                  isPasswordField: false,
                ),
                TextFieldWidget(
                  controller: _desaBinaan,
                  label: "Desa",
                  hintText: "Desa",
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'Wajib diisi'),
                  ]),
                  obscureText: false,
                  isPasswordField: false,
                ),
                TextFieldWidget(
                  controller: _kelompokBinaan,
                  label: "Kelompok",
                  hintText: "Kelompok",
                  keyboardType: TextInputType.name,
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
