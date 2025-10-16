import 'package:aurora_forecast/features/activity/presentation/widgets/auroral_activity_appbar.dart';
import 'package:aurora_forecast/features/activity/presentation/widgets/proton_flux_10.dart';
import 'package:aurora_forecast/features/activity/presentation/widgets/proton_flux_30.dart';
import 'package:aurora_forecast/features/activity/presentation/widgets/solar_wind_density.dart';
import 'package:aurora_forecast/features/activity/presentation/widgets/solar_wind_speed.dart';
import 'package:aurora_forecast/features/activity/presentation/widgets/solar_wind_temperature.dart';
import 'package:flutter/material.dart';

class AuroralActivityPage extends StatelessWidget {
  const AuroralActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AuroralActivityAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Proton Flux 10MeV(p/cs2-sec-ster)",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Divider(color: Colors.white.withOpacity(0.5), thickness: 0.7, height: 20),
                const SizedBox(height: 10),
                AspectRatio(aspectRatio:  1.5, child: ProtonFlux10Page(),),
                const Text(
                  "Proton Flux 30MeV(p/cs2-sec-ster)",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Divider(color: Colors.white.withOpacity(0.5), thickness: 0.7, height: 20),
                const SizedBox(height: 10),
                AspectRatio(aspectRatio:  1.6, child: ProtonFlux30Page(),),
                const Text(
                  "Solar Wind Density (p/cc)",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Divider(color: Colors.white.withOpacity(0.5), thickness: 0.7, height: 20),
                const SizedBox(height: 10),
                AspectRatio(aspectRatio:  1.6, child: SolarWindDensityPage(),),
                const Text(
                  "Solar Wind Speed (km/s)",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Divider(color: Colors.white.withOpacity(0.5), thickness: 0.7, height: 20),
                const SizedBox(height: 10),
                AspectRatio(aspectRatio:  1.6, child: SolarWindSpeedPage(),),
                const Text(
                  "Solar Wind Ion Temperature (K)",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Divider(color: Colors.white.withOpacity(0.5), thickness: 0.7, height: 20),
                const SizedBox(height: 10),
                AspectRatio(aspectRatio:  1.6, child: SolarWindTemperaturePage(),)
              ],
            ),
          ),
        ),
    )
    );
  }
}