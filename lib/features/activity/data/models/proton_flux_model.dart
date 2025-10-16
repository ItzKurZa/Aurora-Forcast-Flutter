import '../../domain/entities/proton_flux.dart';

class ProtonFluxModel extends ProtonFlux {
  ProtonFluxModel({
    required DateTime time,
    required double flux,
    required String energy,
  }) : super(time: time, flux: flux, energy: energy);

  factory ProtonFluxModel.fromJson(Map<String, dynamic> json) {
    return ProtonFluxModel(
      time: DateTime.parse(json['time_tag']),
      flux: (json['flux'] as num).toDouble(),
      energy: json['energy'],
    );
  }
}
