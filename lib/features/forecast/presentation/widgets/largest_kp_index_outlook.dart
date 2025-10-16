import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/outlook_bloc.dart';
import '../bloc/outlook_event.dart';
import '../bloc/outlook_state.dart';
import '../../data/repositories/outlook_repository_impl.dart';
import '../../data/datasources/outlook_remote_datasource.dart';
import '../../domain/usecase/get_outlook.dart';
import 'package:http/http.dart' as http;

class LargestKpIndexOutlook extends StatelessWidget {
  final int labelStep;
  const LargestKpIndexOutlook({super.key, this.labelStep = 4});

  Color getBarColor(double kp) {
    if (kp < 4) return const Color(0xFF58C42B); // xanh
    if (kp < 5) return const Color(0xFFF1AC3A); // vàng
    if (kp < 8) return const Color(0xFFFF5722); // cam
    return const Color(0xFFD32F2F); // đỏ
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final remoteDataSource = OutlookRemoteDataSourceImpl(http.Client());
        final repository = OutlookRepositoryImpl(remoteDataSource);
        final bloc = OutlookBloc(Get27DayOutlook(repository));
        bloc.add(FetchOutlookEvent());
        return bloc;
      },
      child: BlocBuilder<OutlookBloc, OutlookState>(
        builder: (context, state) {
          if (state is OutlookLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is OutlookLoaded) {
            final outlooks = state.outlooks;
            if (outlooks.isEmpty) {
              return const Center(child: Text('Không có dữ liệu để hiển thị', style: TextStyle(color: Colors.white)));
            }
            final kpValues = outlooks.map((e) => e.kp.toDouble()).toList();
            final monthNames = [
              '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
              'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
            ];
            final labels = List.generate(outlooks.length, (i) {
              if (i % labelStep == 0) {
                final d = outlooks[i].date;
                final monthStr = d.month >= 1 && d.month <= 12 ? monthNames[d.month] : d.month.toString();
                final dayStr = d.day.toString().padLeft(2, '0');
                return "$monthStr $dayStr";
              }
              return "";
            });
            return BarChart(
              BarChartData(
                maxY: 9,
                gridData: FlGridData(
                  show: true,
                  horizontalInterval: 1,
                  getDrawingHorizontalLine: (value) =>
                      FlLine(color: Colors.white.withOpacity(0.1), strokeWidth: 1),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 14,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 10),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index >= 0 && index < labels.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              labels[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    bottom: BorderSide(color: Colors.white.withOpacity(0.2)),
                  ),
                ),
                barGroups: List.generate(kpValues.length, (index) {
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: kpValues[index],
                        color: getBarColor(kpValues[index]),
                        width: 12,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ],
                  );
                }),
              ),
            );
          } else if (state is OutlookError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
