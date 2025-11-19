import 'package:shared_preferences/shared_preferences.dart';
import 'api_client.dart';
import 'token_interceptor.dart';

class NetworkService {
  static NetworkService? _instance;
  static NetworkService get instance {
    _instance ??= NetworkService._init();
    return _instance!;
  }

  late final ApiClient apiClient;
  late final TokenInterceptor tokenInterceptor;

  NetworkService._init();

  static NetworkService initializeWithDependencies({
    required TokenInterceptor tokenInterceptor,
    required ApiClient apiClient,
    required SharedPreferences sharedPrefs,
  }) {
    _instance ??= NetworkService._init();
    _instance!.tokenInterceptor = tokenInterceptor;
    _instance!.apiClient = apiClient;
    return _instance!;
  }

  static Future<NetworkService> initialize() async {
    final instance = NetworkService.instance;
    // Ambil token yang mungkin sudah tersimpan sebelumnya
    await instance.tokenInterceptor.getToken();
    return instance;
  }

  Future<void> setToken(String token) => tokenInterceptor.setToken(token);

  Future<void> clearToken() => tokenInterceptor.clearToken();

  Future<String?> getToken() => tokenInterceptor.getToken();
}