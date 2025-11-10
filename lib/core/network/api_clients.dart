import 'package:siketan/core/network/api_client.dart';
import 'package:siketan/core/services/secure_storage/secure_storage_service.dart';
import 'token_interceptor.dart';

class PublicApiClient extends ApiClient {
  PublicApiClient({TokenInterceptor? tokenInterceptor})
      : super(
          tokenInterceptor: tokenInterceptor ?? TokenInterceptor(
            secureStorageService: SecureStorageService(),
          ),
          enableLogging: true,
        );
}

class AuthApiClient extends ApiClient {
  AuthApiClient({required TokenInterceptor tokenInterceptor})
      : super(tokenInterceptor: tokenInterceptor, enableLogging: true);
}