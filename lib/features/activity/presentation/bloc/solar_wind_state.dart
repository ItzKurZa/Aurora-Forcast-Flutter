part of 'solar_wind_bloc.dart';

abstract class SolarWindState {}

class SolarWindInitial extends SolarWindState {}
class SolarWindLoading extends SolarWindState {}
class SolarWindLoaded extends SolarWindState {
  final List<SolarWind> data;
  SolarWindLoaded(this.data);
}
class SolarWindError extends SolarWindState {
  final String message;
  SolarWindError(this.message);
}
