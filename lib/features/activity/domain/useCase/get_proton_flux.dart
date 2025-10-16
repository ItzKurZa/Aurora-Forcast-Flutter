import '../entities/proton_flux.dart';
import '../repositories/proton_flux_repository.dart';

class GetProtonFlux {
  final ProtonFluxRepository repository;

  GetProtonFlux(this.repository);

  Future<List<ProtonFlux>> call() async {
    return await repository.getProtonFlux();
  }
}
