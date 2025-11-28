import 'package:siketan/core/network/api_endpoints.dart';
import 'package:siketan/core/network/base_service.dart';
import 'package:siketan/core/utils/logger/logger.dart';
import 'package:siketan/features/detail-product/domain/model/detail_product_response_model.dart';

class DetailProductRemoteDataSource {
  final PublicBaseService baseService;

  DetailProductRemoteDataSource({required this.baseService});

  // get detail product
  Future<DetailProductResponseModel> getDetailProduct(String id) async {
    try {
      final response = await baseService.get(
        "${ApiEndpoints.detailProduct}/$id",
      );
      return DetailProductResponseModel.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
