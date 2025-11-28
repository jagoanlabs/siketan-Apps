import 'package:siketan/features/detail-product/domain/model/detail_product_response_model.dart';

abstract class DetailProductRepository {
  Future<DetailProductResponseModel> getDetailProduct(String id);
}
