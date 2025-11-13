// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:siketan/shared/style/color.dart';

class SelectFieldWidget extends StatelessWidget {
  final String? label;
  final String? value;
  final String hintText;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final FormFieldValidator<String>? validator;
  final bool? isEnable;

  const SelectFieldWidget({
    super.key,
    this.label,
    this.value,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.validator,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.gray900,
            ),
          ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          child: DropdownButtonFormField<String>(
            value: value,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 12.sp, color: Colors.grey),
              filled: true,
              fillColor: AppColors.gray100,

              // 🔹 Focused Error Border
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(width: 1.w, color: Colors.red),
              ),

              // 🔹 Default Border
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(width: 1.w, color: AppColors.green4),
              ),

              // 🔹 Enabled Border
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(width: 1.w, color: AppColors.gray400),
              ),

              // 🔹 Focused Border
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(width: 1.w, color: AppColors.blue4),
              ),

              // 🔹 Error Border
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(width: 1.w, color: Colors.red),
              ),
            ),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.gray900,
                ),
            items: items
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.gray900,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: isEnable! ? onChanged : null,
            validator: validator ??
                FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: 'Wajib dipilih'),
                ]),
            icon: Icon(
              Icons.arrow_drop_down_rounded,
              color: AppColors.gray400,
              size: 24.w,
            ),
            borderRadius: BorderRadius.circular(10.r),
            dropdownColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
