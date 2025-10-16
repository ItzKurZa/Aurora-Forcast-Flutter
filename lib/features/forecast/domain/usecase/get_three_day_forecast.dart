import 'package:aurora_forecast/features/forecast/domain/repositories/forecast_repositories.dart';

import '../entities/threeday_forecast.dart';

class GetThreeDayForecast {
  final ThreeDayForecastRepository repository;

  GetThreeDayForecast(this.repository);

  Future<List<ThreeDayForecast>> call() async {
    return await repository.getThreeDayForecast();
  }
}
