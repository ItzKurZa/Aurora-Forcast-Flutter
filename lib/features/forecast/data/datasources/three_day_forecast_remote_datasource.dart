import 'package:http/http.dart' as http;

import '../models/three_day_forecast_model.dart';

abstract class ThreeDayForecastRemoteDataSource {
  Future<List<ThreeDayForecastModel>> getThreeDayForecast();
}

class ThreeDayForecastRemoteDataSourceImpl implements ThreeDayForecastRemoteDataSource {
  final http.Client client;

  ThreeDayForecastRemoteDataSourceImpl(this.client);

  @override
  Future<List<ThreeDayForecastModel>> getThreeDayForecast() async {
    final url = Uri.parse(
        "https://services.swpc.noaa.gov/text/3-day-forecast.txt");

    final res = await client.get(url);

    if (res.statusCode != 200) {
      throw Exception("Lỗi tải dữ liệu từ NOAA");
    }

    final lines = res.body.split('\n');
    final forecasts = <ThreeDayForecastModel>[];

    final kpLines = lines.where((line) =>
      RegExp(r'^\d{2}-\d{2}UT').hasMatch(line.trim())
    ).toList();

    final dayHeaders = <String>[];
    final regMonth = RegExp(r'^(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)$');
    for (var line in lines) {
      // Chỉ lấy dòng có nhiều tháng liên tiếp (dòng tiêu đề ngày tháng)
      final monthCount = RegExp(r'(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)').allMatches(line).length;
      if (monthCount >= 2 && line.contains('UT') == false) {
        final parts = line.trim().split(RegExp(r'\s+')).where((e) => e.isNotEmpty).toList();
        for (int i = 0; i < parts.length - 1; i++) {
          if (regMonth.hasMatch(parts[i]) && RegExp(r'^\d{2}$').hasMatch(parts[i + 1])) {
            dayHeaders.add('${parts[i]} ${parts[i + 1]}');
          }
        }
      }
    }

    // Lấy theo từng ngày (dọc): mỗi ngày 8 giá trị liên tiếp
    for (int d = 0; d < 3; d++) {
      final dayLabel = dayHeaders.length > d ? dayHeaders[d] : '';
      for (int i = 0; i < kpLines.length && i < 8; i++) {
        final kpLine = kpLines[i].trim();
        final parts = kpLine.split(RegExp(r'\s+'));
        if (parts.length >= 4) {
          final hourLabel = parts[0];
          final kpStr = parts[d + 1].replaceAll(RegExp(r'[^0-9\.]'), '');
          final kp = double.tryParse(kpStr) ?? 0.0;
          final time = '$dayLabel $hourLabel';
          forecasts.add(ThreeDayForecastModel(time: time, kp: kp));
        }
      }
    }

    return forecasts;
  }
}
