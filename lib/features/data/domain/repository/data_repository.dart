import 'package:siketan/features/data/domain/model/chart_statistik_response_model.dart';
import 'package:siketan/features/data/domain/model/komoditas_statistik_response_model.dart';
import 'package:siketan/features/data/domain/model/landing_statistik_response_model.dart';

abstract class DataRepository {
  // get all landing statistik
  Future<LandingStatstikResponseModel> getLandingStatistik();

  // get all komoditas statistik response model
  Future<KomoditasStatistikResponseModel> getKomoditasStatistik(
    int page,
    int limit,
    String sort,
  );

  // gett all chart statistik response model
  Future<ChartStatistikResponseModel> getChartStatistik(
    int month,
    int year,
    String lineType,
    String pieType,
  );
}
