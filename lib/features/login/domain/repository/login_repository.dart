import 'package:siketan/features/login/domain/model/login_payload_model.dart';
import 'package:siketan/features/login/domain/model/login_response_model.dart';

abstract class LoginRepository {
  Future<LoginResponseModel> login(LoginPayloadModel payload);
}
