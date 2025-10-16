import '../../domain/entities/solar_wind.dart';
import '../../domain/repositories/solar_wind_repository.dart';
import '../datasources/solar_wind_remote_datasource.dart';

class SolarWindRepositoryImpl implements SolarWindRepository {
  final SolarWindRemoteDataSource remoteDataSource;

  SolarWindRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<SolarWind>> getSolarWindData() {
    return remoteDataSource.fetchSolarWind();
  }
}
