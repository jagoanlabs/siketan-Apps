import 'package:siketan/core/network/api_endpoints.dart';
import 'package:siketan/core/network/base_service.dart';
import 'package:siketan/core/utils/logger/logger.dart';
import 'package:siketan/features/register/domain/model/desa_response_model.dart';
import 'package:siketan/features/register/domain/model/kelompok_all_response_model.dart';
import 'package:siketan/features/register/domain/model/kecamatan_response_model.dart';

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
}
