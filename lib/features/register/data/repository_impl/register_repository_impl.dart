import 'package:siketan/features/register/data/datasources/register_remote_datasource.dart';
import 'package:siketan/features/register/domain/model/kelompok_all_response_model.dart';
import 'package:siketan/features/register/domain/model/desa_response_model.dart';
import 'package:siketan/features/register/domain/model/kecamatan_response_model.dart';
import 'package:siketan/features/register/domain/repository/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDataSource remoteDataSource;
  RegisterRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<DataKelompok>> filterKelompokByKecamatanName(
    String kecamatan,
  ) async {
    final data = await remoteDataSource.getAllKelompok();
    final list = data.dataKelompok?.values.toList() ?? [];

    return list.where((kel) {
      return (kel.kecamatan ?? '').trim().toLowerCase() ==
          kecamatan.trim().toLowerCase();
    }).toList();
  }

  @override
  Future<DesaResponseModel> getAllDesa() {
    final dataDesa = remoteDataSource.getAllDesa();
    return dataDesa;
  }

  @override
  Future<KecamatanResponseModel> getAllKecamatan() {
    final dataKecamatan = remoteDataSource.getAllKecamatan();
    return dataKecamatan;
  }

  @override
  Future<KelompokAllResponseModel> getAllKelompok() {
    final dataKelompok = remoteDataSource.getAllKelompok();
    return dataKelompok;
  }

  @override
  Future<DesaResponseModel> getDesaByKecamatanId(int kecamatanId) {
    final dataDesa = remoteDataSource.getDesaByKecamatanId(kecamatanId);
    return dataDesa;
  }
  
}
