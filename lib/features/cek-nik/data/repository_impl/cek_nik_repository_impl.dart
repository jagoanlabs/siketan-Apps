import 'package:siketan/features/cek-nik/data/datasources/cek_nik_remote_data_source.dart';
import 'package:siketan/features/cek-nik/domain/model/cek_nik_payload_model.dart';
import 'package:siketan/features/cek-nik/domain/model/cek_nik_response_model.dart';
import 'package:siketan/features/cek-nik/domain/repository/cek_nik_repository.dart';

class CekNikRepositoryImpl implements CekNikRepository {
  final CekNikRemoteDataSource remoteDataSource;

  CekNikRepositoryImpl({required this.remoteDataSource});

  @override
  Future<CekNikResponseModel> postCekNik(CekNikPayloadModel payload) async {
    return remoteDataSource.postCekNik(payload);
  }
}
