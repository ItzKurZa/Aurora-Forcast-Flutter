import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import '../bloc/outlook_bloc.dart';
import '../bloc/outlook_event.dart';
import '../bloc/outlook_state.dart';
import '../../data/repositories/outlook_repository_impl.dart';
import '../../data/datasources/outlook_remote_datasource.dart';
import '../../domain/usecase/get_outlook.dart';
import 'package:http/http.dart' as http;

class Radioflux extends StatelessWidget {
  const Radioflux({super.key});

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
            // Lấy dữ liệu radio flux
            final spots = outlooks
                .asMap()
                .entries
                .map((e) => FlSpot(e.key.toDouble(), e.value.flux.toDouble()))
                .toList();

            // Tạo nhãn trục X giống planetary_index_outlook
            final count = outlooks.length;
            final labelStep = 4;
            final monthNames = [
              '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
              'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
            ];
            final bottomLabels = List.generate(count, (i) {
              if (i % labelStep == 0) {
                final d = outlooks[i].date;
                final monthStr = d.month >= 1 && d.month <= 12 ? monthNames[d.month] : d.month.toString();
                final dayStr = d.day.toString().padLeft(2, '0');
                return "$monthStr $dayStr";
              }
              return "";
            });

            // Tính minY, maxY động từ dữ liệu flux
            final fluxValues = outlooks.map((e) => e.flux).toList();
            final minY = (fluxValues.reduce((a, b) => a < b ? a : b)).toDouble();
            final maxY = (fluxValues.reduce((a, b) => a > b ? a : b)).toDouble();
            final intervalY = 5.0;

            return LineChart(
              LineChartData(
                minY: minY,
                maxY: maxY,
                gridData: FlGridData(
                  show: true,
                  horizontalInterval: intervalY,
                  getDrawingHorizontalLine: (value) =>
                      FlLine(color: Colors.white.withOpacity(0.1), strokeWidth: 1),
                  getDrawingVerticalLine: (value) =>
                      FlLine(color: Colors.white.withOpacity(0.1), strokeWidth: 1),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: intervalY,
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
                      reservedSize: 32,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        if (index >= 0 && index < bottomLabels.length && bottomLabels[index].isNotEmpty) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              bottomLabels[index],
                              style: const TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    bottom: BorderSide(color: Colors.white.withOpacity(0.2)),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: false,
                    color: Colors.white,
                    barWidth: 2,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.2),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    dotData: FlDotData(show: false),
                  ),
                ],
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
