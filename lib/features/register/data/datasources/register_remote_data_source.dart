import 'dart:io' show File;
import 'package:dio/dio.dart' show FormData, MultipartFile;
import 'package:siketan/core/network/api_endpoints.dart';
import 'package:siketan/core/network/base_service.dart';
import 'package:siketan/core/utils/logger/logger.dart';
import 'package:siketan/features/register/domain/model/desa_response_model.dart';
import 'package:siketan/features/register/domain/model/kelompok_all_response_model.dart';
import 'package:siketan/features/register/domain/model/kecamatan_response_model.dart';
import 'package:siketan/features/register/domain/model/register_payload_model.dart';
import 'package:siketan/features/register/domain/model/register_petani_payload_model.dart';
import 'package:siketan/features/register/domain/model/register_response_model.dart';
import 'package:siketan/features/register/domain/model/opsi_penyuluh_response_model.dart';
import 'package:siketan/features/register/domain/model/kelompok_tani_desa_response_model.dart';

class RegisterRemoteDataSource {
  final PublicBaseService baseService;
  RegisterRemoteDataSource({required this.baseService});

  // get all kelompok
  Future<KelompokAllResponseModel> getAllKelompok() async {
    try {
      final response = await baseService.get(ApiEndpoints.kelompok);
      logger.d(response.data);
      return KelompokAllResponseModel.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
  // get all kecamatan
  Future<KecamatanResponseModel> getAllKecamatan() async {
    try {
      final response = await baseService.get(ApiEndpoints.kecamatan);
      logger.d(response.data);
      return KecamatanResponseModel.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
  // get all desa
  Future<DesaResponseModel> getAllDesa() async {
    try {
      final response = await baseService.get(ApiEndpoints.desa);
      logger.d(response.data);
      return DesaResponseModel.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
  // get desa by kecamatan id
  Future<DesaResponseModel> getDesaByKecamatanId(int kecamatanId) async {
    try {
      final response = await baseService.get(ApiEndpoints.desa, queryParameters: {'kecamatanId': kecamatanId});
      logger.d(response.data);
      return DesaResponseModel.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<OpsiPenyuluhResponseModel> getOpsiPenyuluh() async {
    try {
      final response = await baseService.get(ApiEndpoints.opsiPenyuluh);
      logger.d(response.data);
      return OpsiPenyuluhResponseModel.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<KelompokTaniDesaResponseModel> getKelompokByDesaId(int desaId) async {
    try {
      final response = await baseService.get('${ApiEndpoints.kelompokByDesa}$desaId');
      logger.d(response.data);
      return KelompokTaniDesaResponseModel.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<RegisterResponseModel> register(RegisterPaylaodModel payload) async {
    try {
      final response = await baseService.post(ApiEndpoints.register, data: payload.toJson());
      logger.d(response.data);
      return RegisterResponseModel.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<RegisterResponseModel> registerPetani(RegisterPetaniPayloadModel payload, File? fotoKtp) async {
    try {
      dynamic data;
      if (fotoKtp != null) {
        final Map<String, dynamic> payloadMap = payload.toJson();
        payloadMap['file'] = await MultipartFile.fromFile(
          fotoKtp.path,
          filename: fotoKtp.path.split('/').last,
        );
        data = FormData.fromMap(payloadMap);
      } else {
        data = payload.toJson();
      }
      final response = await baseService.post(
        ApiEndpoints.registerPetani,
        data: data,
      );
      logger.d(response.data);
      return RegisterResponseModel.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
