import 'package:siketan/core/network/api_endpoints.dart';
import 'package:siketan/core/network/base_service.dart';
import 'package:siketan/features/home/domain/model/berita_petani_response_model.dart';
import 'package:siketan/features/home/domain/model/kegiatan_petani_response_model.dart';
import 'package:siketan/features/home/domain/model/product_petani_response_model.dart';
import 'package:siketan/core/utils/logger/logger.dart';

class HomeRemoteDataSources {
  final PublicBaseService baseService;
  HomeRemoteDataSources({required this.baseService});

  Future<ProductPetaniResponseModel> getProductPetani() async {
    try {
      final response = await baseService.get(ApiEndpoints.productHome);
      return ProductPetaniResponseModel.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<BeritaPetaniResponseModel> getBeritaPetani() async {
    try {
      final response = await baseService.get(ApiEndpoints.beritaHome);
      return BeritaPetaniResponseModel.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<KegiatanPetaniResponseModel> getKegiatanPetani() async {
    try {
      final response = await baseService.get(ApiEndpoints.kegiatanHome);
      return KegiatanPetaniResponseModel.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}