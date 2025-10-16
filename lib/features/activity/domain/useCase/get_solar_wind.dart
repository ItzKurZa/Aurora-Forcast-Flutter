import '../entities/solar_wind.dart';
import '../repositories/solar_wind_repository.dart';

class GetSolarWind {
  final SolarWindRepository repository;

  GetSolarWind(this.repository);

  Future<List<SolarWind>> call() {
    return repository.getSolarWindData();
  }
}
