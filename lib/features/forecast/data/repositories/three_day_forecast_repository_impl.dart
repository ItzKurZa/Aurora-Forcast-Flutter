import 'package:aurora_forecast/features/forecast/data/datasources/three_day_forecast_remote_datasource.dart';
import 'package:aurora_forecast/features/forecast/domain/repositories/forecast_repositories.dart';

import '../../domain/entities/threeday_forecast.dart';

class ForecastRepositoryImpl implements ThreeDayForecastRepository {
  final ThreeDayForecastRemoteDataSource remoteDataSource;

  ForecastRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ThreeDayForecast>> getThreeDayForecast() {
    return remoteDataSource.getThreeDayForecast();
  }
}
