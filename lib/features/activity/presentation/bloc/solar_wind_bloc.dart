import 'package:aurora_forecast/features/activity/domain/useCase/get_solar_wind.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/solar_wind.dart';

part 'solar_wind_event.dart';
part 'solar_wind_state.dart';

class SolarWindBloc extends Bloc<SolarWindEvent, SolarWindState> {
  final GetSolarWind getSolarWind;

  SolarWindBloc(this.getSolarWind) : super(SolarWindInitial()) {
    on<FetchSolarWindEvent>((event, emit) async {
      emit(SolarWindLoading());
      try {
        final data = await getSolarWind();
        emit(SolarWindLoaded(data));
      } catch (e) {
        emit(SolarWindError(e.toString()));
      }
    });
  }
}
