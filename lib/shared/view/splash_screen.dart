
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/app/routes/route_name.dart';
import 'package:siketan/core/constant/image/image_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.pushReplacementNamed(context, RoutesName.detailBerita);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray100,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Image.asset(
              ImageConfig.logoSiketan,
              width: 300,
            ),
          ),
        ],
      ),
    );
  }
}
