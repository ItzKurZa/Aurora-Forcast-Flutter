import '../../domain/entities/solar_wind.dart';

class SolarWindModel extends SolarWind {
  SolarWindModel({
    required super.time,
    required super.density,
    required super.speed,
    required super.temperature,
  });

  factory SolarWindModel.fromJson(Map<String, dynamic> json) {
    return SolarWindModel(
      time: DateTime.parse(json['time_tag']),
      density: json['dens'] != null ? (json['dens'] as num).toDouble() : 0.0,
      speed: json['speed'] != null ? (json['speed'] as num).toDouble() : 0.0,
      temperature: json['temperature'] != null ? (json['temperature'] as num).toDouble() : 0.0,
    );
  }
}
