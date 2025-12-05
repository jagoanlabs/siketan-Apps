import 'package:dio/dio.dart';
import 'package:siketan/core/constant/env.dart';
import 'package:siketan/core/network/token_interceptor.dart';

class ApiClient {
  static const String baseUrl = Env.backend; // Ganti dengan base URL Anda
  late Dio _dio;

  ApiClient({
    required TokenInterceptor tokenInterceptor,
    bool enableLogging = false,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Menambahkan interceptor untuk menangani token
    _dio.interceptors.add(tokenInterceptor);

    // Menambahkan interceptor opsional untuk logging
    if (enableLogging) {
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
          error: true,
        ),
      );
    }
  }

  Dio get dio => _dio;

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<Response<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<Response<T>> put<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<Response<T>> delete<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  void _handleDioError(DioException e) {
    // Menangani error Dio di sini
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw TimeoutException('Request timeout');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        switch (statusCode) {
          case 400:
            throw BadRequestException('Bad Request: ${e.response?.data}');
          case 401:
            throw UnauthorizedException('Unauthorized: ${e.response?.data}');
          case 403:
            throw ForbiddenException('Forbidden: ${e.response?.data}');
          case 404:
            throw NotFoundException('Not Found: ${e.response?.data}');
          case 500:
            throw ServerException('Internal Server Error: ${e.response?.data}');
          default:
            throw ServerException('Error: ${e.response?.data}');
        }
      case DioExceptionType.connectionError:
        throw ConnectionException('Connection error');
      case DioExceptionType.badCertificate:
        throw CertificateException('Certificate error');
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
        throw NetworkException('Network error');
    }
  }
}

// Kelas exception kustom untuk menangani berbagai jenis error
class ApiException implements Exception {
  final String message;
  ApiException(this.message);
}

class BadRequestException extends ApiException {
  BadRequestException(super.message);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(super.message);
}

class ForbiddenException extends ApiException {
  ForbiddenException(super.message);
}

class NotFoundException extends ApiException {
  NotFoundException(super.message);
}

class ServerException extends ApiException {
  ServerException(super.message);
}

class TimeoutException extends ApiException {
  TimeoutException(super.message);
}

class ConnectionException extends ApiException {
  ConnectionException(super.message);
}

class CertificateException extends ApiException {
  CertificateException(super.message);
}

class NetworkException extends ApiException {
  NetworkException(super.message);
}

class CancelledException extends ApiException {
  CancelledException(super.message);
}
