import 'dart:io';

import 'package:dio/dio.dart';
import 'package:siketan/core/network/api_client.dart';

String handleAppError(dynamic error) {
  // Handle network-related errors
  if (error is ConnectionException ||
      error is NetworkException ||
      _isNetworkError(error)) {
    return 'Tidak ada koneksi internet. Silakan periksa koneksi Anda.';
  }

  // Handle timeout errors
  if (error is TimeoutException) {
    return 'Waktu permintaan habis. Silakan coba lagi.';
  }

  // Handle HTTP errors
  if (error is BadRequestException) {
    return 'Permintaan tidak valid. Silakan coba lagi.';
  }

  if (error is UnauthorizedException) {
    return 'Akses ditolak. Silakan login kembali.';
  }

  if (error is ForbiddenException) {
    return 'Akses tidak diizinkan.';
  }

  if (error is NotFoundException) {
    return 'Data tidak ditemukan.';
  }

  if (error is ServerException) {
    return 'Terjadi kesalahan pada server. Silakan coba lagi nanti.';
  }

  // Handle Dio exceptions directly
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Waktu permintaan habis. Silakan coba lagi.';
      case DioExceptionType.connectionError:
        return 'Tidak ada koneksi internet. Silakan periksa koneksi Anda.';
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        if (statusCode == 401) {
          return 'Akses ditolak. Silakan login kembali.';
        } else if (statusCode == 404) {
          return 'Data tidak ditemukan.';
        } else if (statusCode == 500) {
          return 'Terjadi kesalahan pada server. Silakan coba lagi nanti.';
        }
        return 'Terjadi kesalahan jaringan.';
      default:
        return 'Terjadi kesalahan. Silakan coba lagi.';
    }
  }

  // Handle other common exceptions
  if (error is SocketException || error is HandshakeException) {
    return 'Tidak ada koneksi internet. Silakan periksa koneksi Anda.';
  }

  // Default error message
  return 'Terjadi kesalahan. Silakan coba lagi.';
}

bool _isNetworkError(dynamic error) {
  final errorString = error.toString().toLowerCase();
  return errorString.contains('connection') ||
      errorString.contains('network') ||
      errorString.contains('socket') ||
      errorString.contains('handshake');
}
