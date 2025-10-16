import 'package:aurora_forecast/features/forecast/domain/usecase/get_three_day_forecast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'forecast_event.dart';
import 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final GetThreeDayForecast getThreeDayForecast;

  ForecastBloc(this.getThreeDayForecast) : super(ForecastInitial()) {
    on<LoadForecastEvent>((event, emit) async {
      emit(ForecastLoading());
      try {
        final forecasts = await getThreeDayForecast();
        emit(ForecastLoaded(forecasts));
      } catch (e) {
        emit(ForecastError(e.toString()));
      }
    });
  }
}
