import '../../domain/entities/threeday_forecast.dart';

class ThreeDayForecastModel extends ThreeDayForecast {
  ThreeDayForecastModel({required String time, required double kp})
      : super(time: time, kp: kp);

  factory ThreeDayForecastModel.fromMessageLine(String line) {

    if (!line.contains("Kp=")) {
      throw Exception("Line không hợp lệ: $line");
    }

    final parts = line.split("Kp=");
    final kpValue = double.tryParse(parts.last.trim().split(" ").first) ?? 0;
    final time = parts.first.trim();

    return ThreeDayForecastModel(time: time, kp: kpValue);
  }
}
