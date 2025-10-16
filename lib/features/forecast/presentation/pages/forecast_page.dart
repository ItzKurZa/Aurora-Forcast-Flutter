import 'package:aurora_forecast/features/forecast/data/datasources/three_day_forecast_remote_datasource.dart';
import 'package:aurora_forecast/features/forecast/domain/usecase/get_three_day_forecast.dart';
import 'package:aurora_forecast/features/forecast/presentation/widgets/radio_flux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:aurora_forecast/features/forecast/data/repositories/three_day_forecast_repository_impl.dart';
import 'package:aurora_forecast/features/forecast/presentation/bloc/forecast_bloc.dart';
import 'package:aurora_forecast/features/forecast/presentation/bloc/forecast_event.dart';

import 'package:aurora_forecast/features/forecast/presentation/widgets/forecast_page_appbar.dart';
import 'package:aurora_forecast/features/forecast/presentation/widgets/largest_kp_index_outlook.dart';
import 'package:aurora_forecast/features/forecast/presentation/widgets/planetary_index_outlook.dart';
import 'package:aurora_forecast/features/forecast/presentation/widgets/three_days_forecast.dart';

class AuroraForecastPage extends StatelessWidget {
  const AuroraForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 Tạo các dependency riêng cho feature này
    final client = http.Client();
    final remoteDataSource = ThreeDayForecastRemoteDataSourceImpl(client);
    final repository = ForecastRepositoryImpl(remoteDataSource);
    final usecase = GetThreeDayForecast(repository);

    return BlocProvider(
      create: (_) => ForecastBloc(usecase)..add(LoadForecastEvent()),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AuroraForecastPageAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "3-Day Forecast (Kp)",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Divider(
                      color: Colors.white.withOpacity(0.5),
                      thickness: 0.7,
                      height: 20),
                  const SizedBox(height: 10),
                  AspectRatio(
                    aspectRatio: 1.5,
                    child: ThreeDaysForecast(), 
                  ),
                  const Text(
                    "Planetary A Index Outlook",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Divider(
                      color: Colors.white.withOpacity(0.5),
                      thickness: 0.7,
                      height: 20),
                  const SizedBox(height: 10),
                  AspectRatio(
                      aspectRatio: 1.5, child: PlanetaryIndexOutlook()),
                  const Text(
                    "Largest Kp Index Outlook",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Divider(
                      color: Colors.white.withOpacity(0.5),
                      thickness: 0.7,
                      height: 20),
                  const SizedBox(height: 10),
                  AspectRatio(
                      aspectRatio: 1.5, child: LargestKpIndexOutlook()),
                  const Text(
                    "Radio Flux 10.7 cm",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Divider(
                      color: Colors.white.withOpacity(0.5),
                      thickness: 0.7,
                      height: 20),
                  const SizedBox(height: 10),
                  AspectRatio(
                      aspectRatio: 1.5, child: Radioflux()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
