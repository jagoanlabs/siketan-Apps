import 'package:siketan/features/home/data/datasources/home_remote_data_source.dart';
import 'package:siketan/features/home/domain/model/berita_petani_response_model.dart';
import 'package:siketan/features/home/domain/model/kegiatan_petani_response_model.dart';
import 'package:siketan/features/home/domain/model/product_petani_response_model.dart';
import 'package:siketan/features/home/domain/repository/home_repository.dart';
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSources remoteDataSources;

  HomeRepositoryImpl({required this.remoteDataSources});

  @override
  Future<ProductPetaniResponseModel> getProductPetani() {
    return remoteDataSources.getProductPetani();
  }

  @override
  Future<BeritaPetaniResponseModel> getBeritaPetani() {
    return remoteDataSources.getBeritaPetani();
  }

  @override
  Future<KegiatanPetaniResponseModel> getKegiatanPetani() {
    return remoteDataSources.getKegiatanPetani();
  }
}