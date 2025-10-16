import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/threeday_forecast.dart';
import '../bloc/forecast_bloc.dart';
import '../bloc/forecast_state.dart';

class ThreeDaysForecast extends StatelessWidget {
  const ThreeDaysForecast({super.key});

  Color getBarColor(double kp) {
    if (kp < 4) return const Color(0xFF58C42B); // xanh
    if (kp < 5) return const Color(0xFFF1AC3A); // vàng
    if (kp < 8) return const Color(0xFFFF5722); // cam
    return const Color(0xFFD32F2F); // đỏ
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastBloc, ForecastState>(
      builder: (context, state) {
        if (state is ForecastLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ForecastLoaded) {
          final List<ThreeDayForecast> allForecasts = state.forecasts;
          final List<ThreeDayForecast> forecasts = allForecasts.length >= 24
              ? allForecasts.sublist(0, 24)
              : allForecasts;
          return BarChart(
            BarChartData(
              maxY: 9,
              gridData: FlGridData(
                show: true,
                horizontalInterval: 1,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: Colors.white.withOpacity(0.1),
                  strokeWidth: 1,
                ),
              ),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 14,
                    interval: 1,
                    getTitlesWidget: (value, meta) => Text(
                      value.toInt().toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 50,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();
                      if (index >= 0 && index < forecasts.length) {
                        final timeStr = forecasts[index].time;
                        final timeParts = timeStr.split(' ');
                        String day = '';
                        String hour = '';
                        // Lấy ngày và giờ đúng format
                        int hourInt = 0;
                        if (timeParts.length >= 3) {
                          day = '${timeParts[0]} ${timeParts[1]}';
                          final hourMatch = RegExp(r'^(\d{2})').firstMatch(timeParts[2]);
                          hourInt = hourMatch != null ? int.parse(hourMatch.group(1)!) : 0;
                        } else if (timeParts.length == 2) {
                          day = timeParts[0];
                          final hourMatch = RegExp(r'^(\d{2})').firstMatch(timeParts[1]);
                          hourInt = hourMatch != null ? int.parse(hourMatch.group(1)!) : 0;
                        } else {
                          final hourMatch = RegExp(r'^(\d{2})').firstMatch(timeStr);
                          hourInt = hourMatch != null ? int.parse(hourMatch.group(1)!) : 0;
                        }
                        // Lấy offset múi giờ local
                        final now = DateTime.now();
                        final localOffset = now.timeZoneOffset.inHours;
                        hourInt = (hourInt + localOffset) % 24;
                        if (hourInt < 0) hourInt += 24;
                        hour = hourInt.toString().padLeft(2, '0') + ':00';
                        // Chỉ cột đầu tiên của mỗi ngày (index % 8 == 0) hiển thị ngày (trên) và giờ (dưới)
                        if (index % 8 == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              children: [
                                Text(
                                  day,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  hour,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        // Chỉ cột thứ 5 của mỗi ngày (index % 8 == 4) hiển thị giờ
                        else if (index % 8 == 4) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              hour,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }
                        // Các cột còn lại không hiển thị nhãn
                        else {
                          return const SizedBox();
                        }
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ),
              barGroups: List.generate(forecasts.length, (index) {
                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: forecasts[index].kp,
                      color: getBarColor(forecasts[index].kp),
                      width: 11,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ],
                  barsSpace: 20,
                );
              }),
            ),
          );
        }
        if (state is ForecastError) {
          return Center(
            child: Text(
              "Error: ${state.message}",
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        return Container();
      },
    );
  }
}
