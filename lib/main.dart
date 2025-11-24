import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:siketan/app.dart';
import 'package:siketan/app/dependency_injector/import.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id_ID', null);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Inisialisasi dependency injection sebelum menjalankan aplikasi
  await setupDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}
