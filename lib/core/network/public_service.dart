import 'package:dio/dio.dart';
import 'package:siketan/core/network/api_endpoints.dart';
import 'base_service.dart';

class PublicService {
  final PublicBaseService _baseService;

  PublicService(this._baseService);

  // login
  Future<Response> login() async {
    return await _baseService.post(ApiEndpoints.login);
  }
}