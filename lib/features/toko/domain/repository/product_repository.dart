import 'package:siketan/features/toko/domain/model/product_response_model.dart';

abstract class ProductRepository {
  //get product

  Future<ProductResponseModel> getProduct(int page, int limit);
  //get toko
}
