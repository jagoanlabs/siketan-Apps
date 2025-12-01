import 'package:siketan/core/network/api_endpoints.dart';
import 'package:siketan/core/network/base_service.dart';
import 'package:siketan/features/search_global/domain/model/search_global_response_model.dart';

class SearchGlobalRemoteDataSource {
  final PublicBaseService publicBaseService;

  SearchGlobalRemoteDataSource({required this.publicBaseService});

  // untuk all -> search?q=beras&sortBy=relevance&page=1&limit=20
  // untuk type -> search?q=beras&type=product&sortBy=relevance&page=1&limit=20

  Future<SearchGlobalResponseModel> searchGlobal({
    required String query,
    String? type,
    String? sortBy,
    int? page,
    int? limit,
  }) async {
    final Map<String, dynamic> queryParameters = {'q': query};

    if (type != null && type.isNotEmpty) {
      queryParameters['type'] = type;
    }
    if (sortBy != null && sortBy.isNotEmpty) {
      queryParameters['sortBy'] = sortBy;
    }
    if (page != null) {
      queryParameters['page'] = page;
    }
    if (limit != null) {
      queryParameters['limit'] = limit;
    }

    final response = await publicBaseService.get(
      ApiEndpoints.search,
      queryParameters: queryParameters,
    );
    return SearchGlobalResponseModel.fromJson(response.data);
  }
}
