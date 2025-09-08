import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/solar_wind_model.dart';

abstract class SolarWindRemoteDataSource {
  Future<List<SolarWindModel>> fetchSolarWind();
}

class SolarWindRemoteDataSourceImpl implements SolarWindRemoteDataSource {
  final http.Client client;

  SolarWindRemoteDataSourceImpl(this.client);

  @override
  Future<List<SolarWindModel>> fetchSolarWind() async {
    final response = await client.get(
      Uri.parse("https://services.swpc.noaa.gov/json/ace/swepam/ace_swepam_1h.json"),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => SolarWindModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load solar wind data");
    }
  }
}
