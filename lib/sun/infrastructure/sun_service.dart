import 'package:result_type/result_type.dart';
import '../domain/i_sun_service.dart';
import '../domain/sun_model.dart';
import 'constants/sun_api_keys.dart';
import 'dtos/sun_dto.dart';

/// Service to provide sun images for different wavelengths
class SunService implements ISunService {
  @override
  Future<Result<List<SunModel>, SunError>> getSunImages() async {
    try {
      // In this case, images are static URLs, so we just build the list
      final models =
          SunApiKeys.wavelengths.map((wavelength) {
            final label = 'AIA $wavelength';
            final targetUrl = SunApiKeys.imageUrl(wavelength);
            final proxyUrl = 'https://cors-anywhere.com/$targetUrl';
            return SunDto(
              label: label,
              imageUrl: proxyUrl,
              wavelength: wavelength,
            ).toDomain();
          }).toList();
      return Success(models);
    } catch (_) {
      return Failure(SunError.unknown);
    }
  }
}
