import 'package:aurora_forecast/alerts/presentation/alerts_page.dart';
import 'package:aurora_forecast/features/activity/presentation/pages/auroral_activity_page.dart';
import 'package:aurora_forecast/features/forecast/presentation/pages/forecast_page.dart';
import 'package:aurora_forecast/sun/presentation/sun_page.dart';
import 'package:aurora_forecast/map/presentation/map_page.dart';
import 'package:aurora_forecast/core/constants/k_sizes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aurora Forecast',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Colors.black,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MainNavigationPage(),
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const AuroraForecastPage(),
    const AuroralActivityPage(),
    const SunPage(),
    const AlertsPage(),
    const MapPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border(
            top: BorderSide(
              color: Colors.deepPurple.withValues(alpha: 0.3),
              width: 1.0,
            ),
          ),
        ),
        child: SafeArea(
          child: IntrinsicHeight(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: KSizes.margin4x,
                vertical: KSizes.margin2x,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    icon: Icons.thunderstorm_outlined,
                    selectedIcon: Icons.thunderstorm,
                    label: 'Forecast',
                    index: 0,
                  ),
                  _buildNavItem(
                    icon: Icons.storm_outlined,
                    selectedIcon: Icons.storm,
                    label: 'Activity',
                    index: 1,
                  ),
                  _buildNavItem(
                    icon: Icons.wb_sunny_outlined,
                    selectedIcon: Icons.wb_sunny,
                    label: 'Sun',
                    index: 2,
                  ),
                  _buildNavItem(
                    icon: Icons.notification_important_outlined,
                    selectedIcon: Icons.notification_important,
                    label: 'Alerts',
                    index: 3,
                  ),
                  _buildNavItem(
                    icon: Icons.map_outlined,
                    selectedIcon: Icons.map,
                    label: 'Map',
                    index: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData selectedIcon,
    required String label,
    required int index,
  }) {
    final bool isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? KSizes.margin8x : KSizes.margin2x,
          vertical: KSizes.margin1x,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(KSizes.radiusDefault),
          color: isSelected
              ? Colors.deepPurple.withValues(alpha: 0.2)
              : Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? selectedIcon : icon,
              color: isSelected ? Colors.deepPurple : Colors.grey,
              size: KSizes.iconM,
            ),
            SizedBox(height: KSizes.margin1x / 2),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.deepPurple : Colors.grey,
                fontSize: KSizes.fontSizeS - 2,
                fontWeight: isSelected
                    ? KSizes.fontWeightBold
                    : KSizes.fontWeightNormal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
