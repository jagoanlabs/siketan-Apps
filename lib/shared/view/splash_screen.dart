import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:siketan/app/routes/route_name.dart';
import 'package:siketan/core/utils/logger/logger.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siketan/features/auth/presentation/bloc/authentication_bloc.dart';

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
      if (mounted) {
        BlocProvider.of<AuthenticationBloc>(context).add(AppStartEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        logger.d('state is  $state');
        if (state is AuthenticationFirstTime) {
          Navigator.pushReplacementNamed(context, RoutesName.onBoarding);
        } else if (state is AuthenticationTrue) {
          Navigator.pushReplacementNamed(context, RoutesName.home);
        } else if (state is AuthenticationFalse) {
          Navigator.pushReplacementNamed(context, RoutesName.login);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.gray100,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Center(child: Image.asset(ImageConfig.logoSiketan, width: 300)),
          ],
        ),
      ),
    );
  }
}
