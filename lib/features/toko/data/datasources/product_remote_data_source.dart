import 'package:siketan/core/network/api_endpoints.dart';
import 'package:siketan/core/network/base_service.dart';
import 'package:siketan/features/toko/domain/model/product_response_model.dart';

class ProductRemoteDataSource {
  final PublicBaseService baseService;

  ProductRemoteDataSource({required this.baseService});

  // get product & store list with pagination
  Future<ProductResponseModel> getProductListWithPagination(
    int page,
    int limit,
  ) async {
    final response = await baseService.get(
      ApiEndpoints.productHome,
      queryParameters: {'page': page, 'limit': limit},
    );
    return ProductResponseModel.fromJson(response.data);
  }
}
