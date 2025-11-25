import 'package:siketan/core/network/api_endpoints.dart';
import 'package:siketan/core/network/base_service.dart';
import 'package:siketan/features/data/domain/model/komoditas_statistik_response_model.dart';
import 'package:siketan/features/data/domain/model/landing_statistik_response_model.dart';
import 'package:siketan/core/utils/logger/logger.dart';

class DataRemoteDataSource {
  final PublicBaseService baseService;

  DataRemoteDataSource({required this.baseService});

  Future<LandingStatstikResponseModel> getLandingStatistik() async {
    try {
      final response = await baseService.get(ApiEndpoints.dataStatistik);
      return LandingStatstikResponseModel.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  // get table
  // static const String komoditasStatistik =
  //     "/tanaman-petani"; //tanaman-petani?page=1&limit=10&sortOrder=ASC
  Future<KomoditasStatistikResponseModel> getKomoditasStatistik({
    int? page,
    int? limit,
    String? sortOrder,
  }) async {
    try {
      final response = await baseService.get(
        ApiEndpoints.komoditasStatistik,
        queryParameters: {'page': page, 'limit': limit, 'sortOrder': sortOrder},
      );
      return KomoditasStatistikResponseModel.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
