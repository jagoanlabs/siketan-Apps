import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/app/routes/route_name.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/style/shadow.dart';
import 'package:siketan/shared/widget/primary_button_widget.dart';
import 'package:siketan/shared/widget/text_field_widget.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginPageView();
  }
}

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Image.asset(ImageConfig.authBackground, width: double.infinity),
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
              ),
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
          ),
        ],
      ),
    );
  }
}

class _BuildForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  _BuildForm({super.key});

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
                  Text(
                    "Masuk",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.gray900,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(width: 40.w, height: 3.w, color: AppColors.green4),
                ],
              ),
              Column(
                spacing: 4.h,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.register,);
                    },
                    child: Text(
                      "Daftar",
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
                      "Masuk Siketan Ngawi",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: AppColors.gray900,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Selamat datang kembali, Penyuluh!",
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

          // Email
          TextFieldWidget(
            label: "Email",
            obscureText: false,
            isPasswordField: false,
            controller: emailController,
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'Wajib diisi'),
              FormBuilderValidators.email(errorText: 'Email tidak valid'),
            ]),
          ),
          SizedBox(height: 16.h),

          // Password
          TextFieldWidget(
            label: "Password",
            obscureText: true,
            isPasswordField: true,
            controller: passwordController,
            hintText: "Password",
            keyboardType: TextInputType.visiblePassword,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'Wajib diisi'),
            ]),
          ),
          SizedBox(height: 24.h),
          ButtonPrimary(
            isGradient: true,
            gradient: const LinearGradient(
              colors: [
                AppColors.blue5,
                AppColors.blue4,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            isLoading: false,
            mainButtonMessage: "Masuk",
            mainButton: () {},
            color: AppColors.blue4,
          ),
        ],
      ),
    );
  }
}
