import 'package:siketan/features/data/data/datasources/data_remote_data_source.dart';
import 'package:siketan/features/data/domain/model/chart_statistik_response_model.dart';
import 'package:siketan/features/data/domain/model/komoditas_statistik_response_model.dart';
import 'package:siketan/features/data/domain/model/landing_statistik_response_model.dart';
import 'package:siketan/features/data/domain/repository/data_repository.dart';

class DataRepositoryImpl implements DataRepository {
  final DataRemoteDataSource dataSource;

  DataRepositoryImpl({required this.dataSource});

  @override
  Future<ChartStatistikResponseModel> getChartStatistik(
    int month,
    int year,
    String lineType,
    String pieType,
  ) {
    // TODO: implement getChartStatistik
    throw UnimplementedError();
  }

  @override
  Future<KomoditasStatistikResponseModel> getKomoditasStatistik(
    int page,
    int limit,
    String sortOrder,
  ) {
    return dataSource.getKomoditasStatistik(
      page: page,
      limit: limit,
      sortOrder: sortOrder,
    );
  }

  @override
  Future<LandingStatstikResponseModel> getLandingStatistik() {
    return dataSource.getLandingStatistik();
  }
}
