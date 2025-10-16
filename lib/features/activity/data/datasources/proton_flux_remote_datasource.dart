import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/proton_flux_model.dart';

abstract class ProtonFluxRemoteDataSource {
  Future<List<ProtonFluxModel>> fetchProtonFlux();
}

class ProtonFluxRemoteDataSourceImpl implements ProtonFluxRemoteDataSource {
  final http.Client client;

  ProtonFluxRemoteDataSourceImpl(this.client);

  @override
  Future<List<ProtonFluxModel>> fetchProtonFlux() async {
    final url = Uri.parse(
        'https://services.swpc.noaa.gov/json/goes/primary/integral-protons-6-hour.json');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList
          .map((item) => ProtonFluxModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load Proton Flux data');
    }
  }
}
