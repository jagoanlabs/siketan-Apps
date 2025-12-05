import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:siketan/core/constant/env.dart';
import 'package:siketan/core/network/token_interceptor.dart';

class ApiClient {
  static const String baseUrl = Env.backend;
  late final Dio _dio;

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

    /// Interceptor Token
    _dio.interceptors.add(tokenInterceptor);

    /// Logging jika debug
    if (enableLogging) {
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          error: true,
        ),
      );
    }

    /// BYPASS SSL hanya jika debug / bukan release
    // final isRelease = bool.fromEnvironment('dart.vm.product');
    // if (!isRelease) {
    //   (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
    //       (HttpClient client) {
    //         client.badCertificateCallback =
    //             (X509Certificate cert, String host, int port) {
    //               print("⚠️ SSL BYPASSED for host: $host");
    //               return true;
    //             };
    //         return client;
    //       };
    // }
  }

  Dio get dio => _dio;

  /// --------------------
  /// REQUEST HELPERS
  /// --------------------
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _execute(
      () => _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      ),
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _execute(
      () => _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      ),
    );
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _execute(
      () => _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      ),
    );
  }

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _execute(
      () => _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      ),
    );
  }

  /// --------------------
  /// ERROR HANDLER
  /// --------------------
  Future<Response<T>> _execute<T>(
    Future<Response<T>> Function() request,
  ) async {
    try {
      return await request();
    } on DioException catch (e) {
      throw _mapError(e);
    }
  }

  ApiException _mapError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return TimeoutException('Request timeout');

      case DioExceptionType.badCertificate:
        return CertificateException('SSL Certificate invalid');

      case DioExceptionType.connectionError:
        return ConnectionException('Failed to connect');

      case DioExceptionType.badResponse:
        final code = e.response?.statusCode ?? 0;
        final data = e.response?.data;

        switch (code) {
          case 400:
            return BadRequestException('$data');
          case 401:
            return UnauthorizedException('$data');
          case 403:
            return ForbiddenException('$data');
          case 404:
            return NotFoundException('$data');
          case 500:
            return ServerException('$data');
          default:
            return ServerException('Error $code: $data');
        }

      case DioExceptionType.cancel:
        return CancelledException('Request cancelled');

      default:
        return NetworkException('Unknown network error');
    }
  }
}

/// ===============================
/// CUSTOM EXCEPTIONS
/// ===============================
class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => message;
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
