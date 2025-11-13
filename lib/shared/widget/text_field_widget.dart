// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class TextFieldWidget extends StatelessWidget {
  final int? maxLength;
  final String? label;
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool isPasswordField;
  final VoidCallback? onToggleVisibility;
  final bool? isEnable;
  final FormFieldValidator<String>? validator;
  final ValueSetter<String>? valueSet;
  final FocusNode? focusNode;

  const TextFieldWidget({
    super.key,
    this.focusNode,
    this.label,
    this.isEnable,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    required this.obscureText,
    required this.isPasswordField,
    this.onToggleVisibility,
    this.validator,
    this.maxLength,
    this.valueSet,
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
          child: TextFormField(
            focusNode: focusNode,
            maxLength: maxLength,
            enabled: isEnable ?? true,
            controller: controller,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.gray900,
                ),
            keyboardType: keyboardType,
            obscureText: obscureText,
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
        
              // 🔹 Password Visibility
              suffixIcon: isPasswordField
                  ? IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        size: 20.w,
                        color: AppColors.gray400,
                      ),
                      onPressed: onToggleVisibility,
                    )
                  : null,
            ),
            validator: validator ??
                FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: 'Wajib diisi'),
                ]),
            onChanged: (value) {
              if (valueSet != null) valueSet!(value);
            },
          ),
        ),
      ],
    );
  }
}
