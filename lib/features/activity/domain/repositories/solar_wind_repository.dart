import 'package:aurora_forecast/features/activity/domain/entities/solar_wind.dart';

abstract class SolarWindRepository {
  Future<List<SolarWind>> getSolarWindData();
}
