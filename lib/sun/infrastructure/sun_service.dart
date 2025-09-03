import 'package:result_type/result_type.dart';
import 'package:dio/dio.dart';
import '../../core/services/base_http_service.dart';
import '../../core/services/cors_proxy_service.dart';
import '../domain/i_sun_service.dart';
import '../domain/sun_model.dart';
import 'constants/sun_api_keys.dart';
import 'dtos/sun_dto.dart';

/// Service to provide sun images for different wavelengths
class SunService extends BaseHttpService implements ISunService {
  final CorsProxyService _corsProxy = CorsProxyService.instance;

  SunService({Dio? dio}) : super(baseUrl: SunApiKeys.baseUrl);

  @override
  Future<Result<List<SunModel>, SunError>> getSunImages() async {
    try {
      // Create models with platform-appropriate URLs
      final models = <SunModel>[];

      for (final wavelength in SunApiKeys.wavelengths) {
        final label = 'AIA $wavelength';
        final imageUrl = _getImageUrl(wavelength);

        models.add(
          SunDto(
            label: label,
            imageUrl: imageUrl,
            wavelength: wavelength,
          ).toDomain(),
        );
      }

      return Success(models);
    } catch (e) {
      return Failure(SunError.unknown);
    }
  }

  String _getImageUrl(int wavelength) {
    final directUrl = SunApiKeys.imageUrl(wavelength);
    return _corsProxy.getProxiedUrl(directUrl);
  }
}
