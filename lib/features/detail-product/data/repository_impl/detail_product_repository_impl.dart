import 'package:siketan/features/detail-product/data/datasources/detail_product_remote_data_source.dart';
import 'package:siketan/features/detail-product/domain/model/detail_product_response_model.dart';
import 'package:siketan/features/detail-product/domain/repository/detail_product_repository.dart';

class DetailProductRepositoryImpl implements DetailProductRepository {
  final DetailProductRemoteDataSource remoteDataSource;

  DetailProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<DetailProductResponseModel> getDetailProduct(String id) async {
    return remoteDataSource.getDetailProduct(id);
  }
}
