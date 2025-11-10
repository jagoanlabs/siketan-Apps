
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:siketan/app/theme/theme.dart';
import 'package:siketan/app/routes/route_name.dart';
import 'package:siketan/app/routes/route_page.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const BuildApp();
  }
}

class BuildApp extends StatelessWidget {
  const BuildApp({super.key});
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('id', 'ID'), // Set default ke Indonesia
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('id', 'ID'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Siketan',
      debugShowCheckedModeBanner: false,
      theme: siketanTheme,
      onGenerateRoute: MyRoute.generateRoute,
      initialRoute: RoutesName.splashScreen,
      // home: const AnakListScreen(),
    );
  }
}
