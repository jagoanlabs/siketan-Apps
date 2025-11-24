import 'package:siketan/features/login/data/datasources/login_local_data_source.dart';
import 'package:siketan/features/login/data/datasources/login_remote_data_source.dart';
import 'package:siketan/features/login/domain/model/login_payload_model.dart';
import 'package:siketan/features/login/domain/model/login_response_model.dart';
import 'package:siketan/features/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final LoginLocalDataSource localDataSource;

  LoginRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<LoginResponseModel> login(LoginPayloadModel payload) async {
    return await remoteDataSource.login(payload);
  }
  
  Future<bool> clearAuthData() {
    return localDataSource.clearAuthData();
  }
  
  Map<String, dynamic> getUserData() {
    return localDataSource.getUserData();
  }
  

  bool? isUserLoggedIn() {
    return localDataSource.isUserLoggedIn();
  }
  
  Future<bool> setIsUserLoggedIn(bool isLoggedIn) {
    return localDataSource.setIsUserLoggedIn(isLoggedIn);
  }
  
  
  Future<bool> storeUserDataFromResponse(LoginResponseModel response) {
    return localDataSource.storeUserDataFromResponse(response);
  }
  
}