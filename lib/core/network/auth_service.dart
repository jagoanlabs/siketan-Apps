import 'package:dio/dio.dart';
import 'package:siketan/core/network/api_endpoints.dart';
import 'base_service.dart';

class AuthService {
  final AuthBaseService _baseService;

  AuthService(this._baseService);

  Future<Response> login(String email, String password) async {
    return await _baseService.post(
      ApiEndpoints.login,
      data: {
        'email': email,
        'password': password,
      },
    );
  }

  Future<Response> register(String name, String email, String password) async {
    return await _baseService.post(
      ApiEndpoints.register,
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
    );
  }

  Future<Response> logout() async {
    return await _baseService.post(ApiEndpoints.logout);
  }

  Future<Response> refreshToken() async {
    return await _baseService.post(ApiEndpoints.refreshToken);
  }

  Future<Response> verifyToken() async {
    return await _baseService.post(ApiEndpoints.verifyToken);
  }
}