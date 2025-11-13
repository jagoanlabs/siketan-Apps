import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:siketan/shared/widget/text_field_widget.dart';

class WilayahForm extends StatefulWidget {
  const WilayahForm({super.key});

  @override
  State<WilayahForm> createState() => _WilayahFormState();
}

class _WilayahFormState extends State<WilayahForm> {
  bool _isExpanded = false;

  final _kecamatan = TextEditingController();
  final _desa = TextEditingController();

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
              spacing: 13.w,
              children: [
                Iconify(
                  MaterialSymbols.location_on_outline,
                  color: AppColors.green4,
                ),
                Text(
                  "Wilayah Tempat Tinggal",
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
            padding: EdgeInsets.all(16.w),
            child: Column(
              spacing: 8.h,
              children: [
                TextFieldWidget(
                  controller: _kecamatan,
                  label: "Kecamatan",
                  hintText: "Kecamatan",
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'Wajib diisi'),
                  ]),
                  obscureText: false,
                  isPasswordField: false,
                ),
                TextFieldWidget(
                  controller: _desa,
                  label: "Desa",
                  hintText: "Desa",
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
