import 'package:siketan/core/network/api_endpoints.dart';
import 'package:siketan/core/network/base_service.dart';
import 'package:siketan/core/utils/logger/logger.dart';
import 'package:siketan/features/cek-nik/domain/model/cek_nik_payload_model.dart';
import 'package:siketan/features/cek-nik/domain/model/cek_nik_response_model.dart';

class CekNikRemoteDataSource {
  final AuthBaseService baseService;
  CekNikRemoteDataSource({required this.baseService});

  // post ceknik
  Future<CekNikResponseModel> postCekNik(CekNikPayloadModel payload) async {
    try {
      final response = await baseService.post(
        ApiEndpoints.cekNik,
        data: payload,
      );
      return CekNikResponseModel.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
