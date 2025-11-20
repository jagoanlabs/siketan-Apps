
import 'package:siketan/app/dependency_injector/import.dart';
import 'package:siketan/core/network/network_service.dart';
import 'package:siketan/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:siketan/features/auth/domain/repository/auth_repository.dart';
import 'package:siketan/features/login/data/datasources/login_local_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource authLocalDataSource;
  final NetworkService networkService;
  AuthRepositoryImpl({required this.authLocalDataSource, required this.networkService});

  @override
  Future<bool> setOnboardingCompleted() {
    return authLocalDataSource.setOnboardingCompleted();
  }

  @override
  bool isOnboardingCompleted() {
    return authLocalDataSource.isOnboardingCompleted();
  }

  @override
  Future<void> clearOnboardingStatus() {
    return authLocalDataSource.clearOnboardingStatus();
  }
  Future<String?> getToken() {
    return networkService.getToken();
  }

  @override
  Future<void> logout() {
    networkService.clearToken(); //clear token
    return getIt<LoginLocalDataSource>().clearAuthData(); // clear user data from shared preferences
  }
}
