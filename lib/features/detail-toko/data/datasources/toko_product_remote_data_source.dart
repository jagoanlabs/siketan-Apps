import 'package:siketan/core/network/api_endpoints.dart';
import 'package:siketan/core/network/base_service.dart';
import 'package:siketan/features/detail-toko/domain/model/toko_product_response_model.dart';

class TokoProductRemoteDataSource {
  final PublicBaseService baseService;

  TokoProductRemoteDataSource({required this.baseService});
  //get toko product
  Future<TokoProductResponseModel> getTokoProduct(String id) async {
    try {
      final response = await baseService.get('${ApiEndpoints.detailToko}/$id');
      return TokoProductResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
