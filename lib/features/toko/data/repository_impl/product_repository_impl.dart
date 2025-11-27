import 'package:siketan/features/toko/data/datasources/product_remote_data_source.dart';
import 'package:siketan/features/toko/domain/model/product_response_model.dart';
import 'package:siketan/features/toko/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ProductResponseModel> getProduct(int page, int limit) {
    return remoteDataSource.getProductListWithPagination(page, limit);
  }
}
