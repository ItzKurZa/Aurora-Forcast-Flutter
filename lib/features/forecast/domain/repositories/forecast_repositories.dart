import '../entities/threeday_forecast.dart';

abstract class ThreeDayForecastRepository {
  Future<List<ThreeDayForecast>> getThreeDayForecast();
}

