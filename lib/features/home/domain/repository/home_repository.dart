import 'package:siketan/features/home/domain/model/berita_petani_response_model.dart';
import 'package:siketan/features/home/domain/model/kegiatan_petani_response_model.dart';
import 'package:siketan/features/home/domain/model/product_petani_response_model.dart';

abstract class HomeRepository {
  // get all product
  Future<ProductPetaniResponseModel> getProductPetani();

  // get all berita
  Future<BeritaPetaniResponseModel> getBeritaPetani();

  // get all kegiatan
  Future<KegiatanPetaniResponseModel> getKegiatanPetani();
}
