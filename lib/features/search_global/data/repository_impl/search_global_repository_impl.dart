import 'package:siketan/features/search_global/data/datasources/search_global_remote_data_source.dart';
import 'package:siketan/features/search_global/domain/model/search_global_response_model.dart';
import 'package:siketan/features/search_global/domain/repository/search_global_repository.dart';

class SearchGlobalRepositoryImpl implements SearchGlobalRepository {
  final SearchGlobalRemoteDataSource remoteDataSource;

  SearchGlobalRepositoryImpl({required this.remoteDataSource});

  @override
  Future<SearchGlobalResponseModel> searchGlobal({
    required String query,
    String? type,
    String? sortBy,
    int? page,
    int? limit,
  }) async {
    return remoteDataSource.searchGlobal(
      query: query,
      type: type,
      sortBy: sortBy,
      page: page,
      limit: limit,
    );
  }
}
