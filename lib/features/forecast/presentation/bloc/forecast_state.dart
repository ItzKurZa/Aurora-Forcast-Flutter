import '../../domain/entities/threeday_forecast.dart';

abstract class ForecastState {}

class ForecastInitial extends ForecastState {}

class ForecastLoading extends ForecastState {}

class ForecastLoaded extends ForecastState {
  final List<ThreeDayForecast> forecasts;

  ForecastLoaded(this.forecasts);
}

class ForecastError extends ForecastState {
  final String message;

  ForecastError(this.message);
}
