import '../../domain/entities/proton_flux.dart';

abstract class ProtonFluxState {}

class ProtonFluxInitial extends ProtonFluxState {}

class ProtonFluxLoading extends ProtonFluxState {}

class ProtonFluxLoaded extends ProtonFluxState {
  final List<ProtonFlux> data;
  ProtonFluxLoaded(this.data);
}

class ProtonFluxError extends ProtonFluxState {
  final String message;
  ProtonFluxError(this.message);
}
