import '../../domain/entities/proton_flux.dart';
import '../../domain/repositories/proton_flux_repository.dart';
import '../datasources/proton_flux_remote_datasource.dart';

class ProtonFluxRepositoryImpl implements ProtonFluxRepository {
  final ProtonFluxRemoteDataSource remoteDataSource;

  ProtonFluxRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ProtonFlux>> getProtonFlux() async {
    return await remoteDataSource.fetchProtonFlux();
  }
}
