import 'package:siketan/features/cek-nik/domain/model/cek_nik_payload_model.dart';
import 'package:siketan/features/cek-nik/domain/model/cek_nik_response_model.dart';

abstract class CekNikRepository {
  Future<CekNikResponseModel> postCekNik(CekNikPayloadModel payload);
}
