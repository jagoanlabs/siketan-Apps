// import.dart
// External packages
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siketan/features/login/data/datasources/login_remote_datasource.dart';
import 'package:siketan/features/login/data/repository_impl/login_repository_impl.dart';
import 'package:siketan/features/login/domain/repository/login_repository.dart';

// Core dependencies
import '../../core/network/api_clients.dart';
import '../../core/network/network_service.dart';
import '../../core/network/token_interceptor.dart';
import '../../core/network/base_service.dart';
import '../../core/services/secure_storage/secure_storage_service.dart';

// Declare part
part 'di.dart';
