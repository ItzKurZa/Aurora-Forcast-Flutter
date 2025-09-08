import '../entities/proton_flux.dart';

abstract class ProtonFluxRepository {
  Future<List<ProtonFlux>> getProtonFlux();
}
