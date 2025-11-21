import 'package:siketan/features/register/domain/model/kelompok_all_response_model.dart';
import 'package:siketan/features/register/domain/model/desa_response_model.dart';
import 'package:siketan/features/register/domain/model/kecamatan_response_model.dart';
import 'package:siketan/features/register/domain/model/register_payload_model.dart';
import 'package:siketan/features/register/domain/model/register_response_model.dart';

abstract class RegisterRepository {
  // get all kecamatan
  Future<KecamatanResponseModel> getAllKecamatan();
  // get all kelompok
  Future<KelompokAllResponseModel> getAllKelompok();
  // get all desa
  Future<DesaResponseModel> getAllDesa();
  // get desa by kecamatan id
  Future<DesaResponseModel> getDesaByKecamatanId(int kecamatanId);
  // filter kelompok desa by kecamatan
  Future<List<DataKelompok>> filterKelompokByKecamatanName(String kecamatanName);

  Future<RegisterResponseModel> register(RegisterPaylaodModel payload);

}