import 'package:siketan/core/network/api_endpoints.dart';
import 'package:siketan/core/network/base_service.dart';
import 'package:siketan/features/login/domain/model/login_payload_model.dart';
import 'package:siketan/features/login/domain/model/petani_login_payload_model.dart';
import 'package:siketan/features/login/domain/model/login_response_model.dart';
import 'package:siketan/core/utils/logger/logger.dart';

class LoginRemoteDataSource {
  final PublicBaseService baseService;
  LoginRemoteDataSource({required this.baseService});

  Future<LoginResponseModel> login(LoginPayloadModel payload) async {
    try {
      final response = await baseService.post(
        ApiEndpoints.login,
        data: payload.toJson(),
      );
      return LoginResponseModel.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<LoginResponseModel> loginPetani(PetaniLoginPayloadModel payload) async {
    try {
      final response = await baseService.post(
        ApiEndpoints.loginPetani,
        data: payload.toJson(),
      );
      return LoginResponseModel.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
