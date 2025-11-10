import 'package:dio/dio.dart';
import 'package:siketan/core/services/secure_storage/secure_storage_service.dart';

class TokenInterceptor extends Interceptor {
  String? _token;
  final SecureStorageService _secureStorageService;

  TokenInterceptor({
    required SecureStorageService secureStorageService,
  }) : _secureStorageService = secureStorageService;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Menambahkan token ke header jika tersedia
    if (_token == null) {
      _token = await _secureStorageService.getToken();
    }

    if (_token != null) {
      options.headers['Authorization'] = 'Bearer $_token';
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Menyimpan token baru jika server mengembalikan token baru
    final newToken = response.headers.value('new-token');
    if (newToken != null) {
      _saveToken(newToken);
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Menangani error 401 - Unauthorized
    if (err.response?.statusCode == 401) {
      // Mungkin token telah kadaluarsa, coba refresh token
      bool tokenRefreshed = await _refreshToken();
      if (tokenRefreshed) {
        // Ulangi request setelah token diperbarui
        final options = err.requestOptions;
        if (_token != null) {
          options.headers['Authorization'] = 'Bearer $_token';
        }
        handler.resolve(await Dio().fetch(options));
        return;
      } else {
        // Jika refresh token gagal, arahkan ke halaman login
        _handleTokenExpired();
      }
    }
    handler.next(err);
  }

  Future<bool> _refreshToken() async {
    // Implementasi refresh token di sini
    // Contoh: panggil API refresh token
    try {
      // Cek apakah refresh token tersedia
      String? refreshToken = await _secureStorageService.getRefreshToken();
      if (refreshToken == null) {
        return false;
      }

      // Contoh panggilan API untuk refresh token
      // Perlu disesuaikan dengan API spesifik Anda
      /*
      final dio = Dio();
      final response = await dio.post(
        'https://api.example.com/refresh',
        data: {'refresh_token': refreshToken},
      );

      if (response.statusCode == 200 && response.data['access_token'] != null) {
        String newToken = response.data['access_token'];
        _saveToken(newToken);
        return true;
      }
      */

      // Untuk sekarang, hanya mengembalikan false sebagai contoh
      // Implementasi sebenarnya tergantung pada API yang Anda gunakan
      return false;
    } catch (e) {
      // Jika refresh token gagal, hapus token yang ada
      await _removeToken();
      return false;
    }
  }

  Future<void> _saveToken(String token) async {
    _token = token;
    await _secureStorageService.saveToken(token);
  }

  Future<String?> getToken() async {
    if (_token == null) {
      _token = await _secureStorageService.getToken();
    }
    return _token;
  }

  Future<String?> getRefreshToken() async {
    return await _secureStorageService.getRefreshToken();
  }

  Future<void> _removeToken() async {
    _token = null;
    await _secureStorageService.removeToken();
  }

  void _handleTokenExpired() {
    // Lakukan tindakan ketika token kadaluarsa dan refresh gagal
    // Misalnya, arahkan pengguna ke halaman login
    print('Token expired and refresh failed. Redirect to login.');
    // Implementasikan navigasi ke halaman login di sini
  }

  Future<void> setToken(String token) async {
    _saveToken(token);
  }

  Future<void> clearToken() async {
    await _removeToken();
  }
}