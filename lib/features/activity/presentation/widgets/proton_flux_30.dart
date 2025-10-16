import 'package:aurora_forecast/features/activity/data/datasources/proton_flux_remote_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../domain/useCase/get_proton_flux.dart';
import '../../data/repositories/proton_flux_repository_impl.dart';
import '../bloc/proton_flux_bloc.dart';
import '../bloc/proton_flux_event.dart';
import '../bloc/proton_flux_state.dart';


class ProtonFlux30Page extends StatelessWidget {
  const ProtonFlux30Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final remoteDataSource = ProtonFluxRemoteDataSourceImpl(http.Client());
        final repository = ProtonFluxRepositoryImpl(remoteDataSource);
        final useCase = GetProtonFlux(repository);
        final bloc = ProtonFluxBloc(useCase);
        bloc.add(LoadProtonFlux());
        return bloc;
      },
      child: BlocBuilder<ProtonFluxBloc, ProtonFluxState>(
        builder: (context, state) {
          if (state is ProtonFluxLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProtonFluxLoaded) {
            final filtered = state.data.where((d) => d.energy == ">=30 MeV").toList();
            if (filtered.isEmpty) {
              return const Center(child: Text('Không có dữ liệu để hiển thị', style: TextStyle(color: Colors.white)));
            }
            filtered.sort((a, b) => a.time.compareTo(b.time));
            final spots = filtered
                .asMap()
                .entries
                .map((e) => FlSpot(e.key.toDouble(), e.value.flux))
                .toList();

            final fluxValues = filtered.map((e) => e.flux).toList();
            final minY = (fluxValues.reduce((a, b) => a < b ? a : b));
            final maxY = (fluxValues.reduce((a, b) => a > b ? a : b));
            final intervalY = ((maxY - minY) / 6).clamp(1e-2, double.infinity);

            final count = filtered.length;
            final labelStep = count > 10 ? 5 : 1;
            final localOffset = DateTime.now().timeZoneOffset;
            final bottomLabels = List.generate(count, (i) {
              if (i % labelStep == 0) {
                final utc = filtered[i].time;
                final local = utc.add(localOffset);
                return "${local.hour.toString().padLeft(2, '0')}:${local.minute.toString().padLeft(2, '0')}";
              }
              return "";
            });

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: LineChart(LineChartData(
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
                      reservedSize: 60,
                      interval: intervalY,
                      getTitlesWidget: (value, meta) {
                        final yLabel = value.toStringAsExponential(2);
                        return Text(
                          yLabel,
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
              )),
            );
          } else if (state is ProtonFluxError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
