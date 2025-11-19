// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class TextFieldWidget extends StatefulWidget {
  final int? maxLength;
  final String? label;
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool isPasswordField;
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
    this.validator,
    this.maxLength,
    this.valueSet,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText; // ambil default dari widget
  }

  void onToggleVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: TextStyle(fontSize: 13.sp, color: AppColors.gray900),
          ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          child: TextFormField(
            focusNode: widget.focusNode,
            maxLength: widget.maxLength,
            enabled: widget.isEnable ?? true,
            controller: widget.controller,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.gray900,
                ),
            keyboardType: widget.keyboardType,
            obscureText: _isObscure, // ✔ gunakan state local
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 14.w,
              ),
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
              filled: true,
              fillColor: AppColors.gray100,

              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(width: 1.w, color: Colors.red),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(width: 1.w, color: AppColors.green4),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(width: 1.w, color: AppColors.gray400),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(width: 1.w, color: AppColors.blue4),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(width: 1.w, color: Colors.red),
              ),

              // ✔ TOGGLE VISIBILITY FIX
              suffixIcon: widget.isPasswordField
                  ? IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                        size: 20.w,
                        color: AppColors.gray400,
                      ),
                      onPressed: onToggleVisibility,
                    )
                  : null,
            ),
            validator: widget.validator ??
                FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: 'Wajib diisi'),
                ]),
            onChanged: (value) {
              if (widget.valueSet != null) widget.valueSet!(value);
            },
          ),
        ),
      ],
    );
  }
}
