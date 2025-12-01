import 'package:siketan/features/search_global/domain/model/search_global_response_model.dart';

abstract class SearchGlobalRepository {
  Future<SearchGlobalResponseModel> searchGlobal({
    required String query,
    String? type,
    String? sortBy,
    int? page,
    int? limit,
  });
}
