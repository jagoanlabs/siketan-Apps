import 'package:siketan/features/detail-toko/domain/model/toko_product_response_model.dart';

abstract class TokoProductRepository {
  // get detail toko
  Future<TokoProductResponseModel> getDetailToko(String id);
}
