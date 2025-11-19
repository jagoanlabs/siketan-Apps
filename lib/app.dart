import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:siketan/app/dependency_injector/import.dart';
import 'package:siketan/app/theme/theme.dart';
import 'package:siketan/app/routes/route_name.dart';
import 'package:siketan/app/routes/import.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:siketan/core/config/screen_config.dart';
import 'package:siketan/features/auth/domain/repository/auth_repository.dart';
import 'package:siketan/features/auth/presentation/bloc/authentication_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthenticationBloc(authRepository: getIt<AuthRepository>()),
      child: const BuildApp(),
    );
  }
}

class BuildApp extends StatelessWidget {
  const BuildApp({super.key});
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    // Gunakan LayoutBuilder agar context punya MediaQuery
    return LayoutBuilder(
      builder: (context, constraints) {
        final designSize = ScreenConfig.getDesignSize(context);

        return ScreenUtilInit(
          designSize: designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              navigatorKey: navigatorKey,
              locale: const Locale('id', 'ID'),
              supportedLocales: const [Locale('en', 'US'), Locale('id', 'ID')],
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              title: 'Siketan',
              debugShowCheckedModeBanner: false,
              theme: siketanTheme,
              builder: (context, child) => ResponsiveBreakpoints.builder(
                breakpoints: [
                  const Breakpoint(start: 0, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 800, name: TABLET),
                  const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                  const Breakpoint(
                    start: 1921,
                    end: double.infinity,
                    name: 'DESKTOP',
                  ),
                ],
                child: child!,
              ),
              onGenerateRoute: MyRoute.generateRoute,
              initialRoute: RoutesName.splashScreen,
            );
          },
        );
      },
    );
  }
}
