import 'package:siketan/features/detail-toko/data/datasources/toko_product_remote_data_source.dart';
import 'package:siketan/features/detail-toko/domain/model/toko_product_response_model.dart';
import 'package:siketan/features/detail-toko/domain/repository/toko_product_repository.dart';

class TokoProductRepositoryImpl implements TokoProductRepository {
  final TokoProductRemoteDataSource remoteDataSource;

  TokoProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<TokoProductResponseModel> getDetailToko(String id) async {
    return remoteDataSource.getTokoProduct(id);
  }
}
