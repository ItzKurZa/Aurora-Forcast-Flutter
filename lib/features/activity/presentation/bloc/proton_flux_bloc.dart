import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/useCase/get_proton_flux.dart';
import 'proton_flux_event.dart';
import 'proton_flux_state.dart';

class ProtonFluxBloc extends Bloc<ProtonFluxEvent, ProtonFluxState> {
  final GetProtonFlux getProtonFlux;

  ProtonFluxBloc(this.getProtonFlux) : super(ProtonFluxInitial()) {
    on<LoadProtonFlux>((event, emit) async {
      emit(ProtonFluxLoading());
      try {
        final data = await getProtonFlux();
        emit(ProtonFluxLoaded(data));
      } catch (e) {
        emit(ProtonFluxError(e.toString()));
      }
    });
  }
}
