// import.dart
// External packages
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siketan/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:siketan/features/auth/data/repository_impl/auth_repository_impl.dart';
import 'package:siketan/features/auth/domain/repository/auth_repository.dart';
import 'package:siketan/features/data/data/datasources/data_remote_data_source.dart';
import 'package:siketan/features/data/data/repository_impl/data_repository_impl.dart';
import 'package:siketan/features/data/domain/repository/data_repository.dart';
import 'package:siketan/features/detail-product/data/datasources/detail_product_remote_data_source.dart';
import 'package:siketan/features/detail-product/data/repository_impl/detail_product_repository_impl.dart';
import 'package:siketan/features/detail-product/domain/repository/detail_product_repository.dart';
import 'package:siketan/features/profile/data/datasources/profile_local_data_source.dart';
import 'package:siketan/features/profile/data/repository_impl/profile_repository_impl.dart';
import 'package:siketan/features/profile/domain/repository/profile_repository.dart';
import 'package:siketan/features/home/domain/repository/home_repository.dart';
import 'package:siketan/features/login/data/datasources/login_local_data_source.dart';
import 'package:siketan/features/login/data/datasources/login_remote_data_source.dart';
import 'package:siketan/features/login/data/repository_impl/login_repository_impl.dart';
import 'package:siketan/features/login/domain/repository/login_repository.dart';
import 'package:siketan/features/register/data/datasources/register_remote_data_source.dart';
import 'package:siketan/features/register/data/repository_impl/register_repository_impl.dart';
import 'package:siketan/features/register/domain/repository/register_repository.dart';
import 'package:siketan/features/home/data/datasources/home_remote_data_source.dart';
import 'package:siketan/features/home/data/repository_impl/home_repository_impl.dart';
import 'package:siketan/features/toko/data/datasources/product_remote_data_source.dart';
import 'package:siketan/features/toko/data/repository_impl/product_repository_impl.dart';
import 'package:siketan/features/toko/domain/repository/product_repository.dart';

// Core dependencies
import '../../core/network/api_clients.dart';
import '../../core/network/network_service.dart';
import '../../core/network/token_interceptor.dart';
import '../../core/network/base_service.dart';
import '../../core/services/secure_storage/secure_storage_service.dart';

// Declare part
part 'di.dart';
