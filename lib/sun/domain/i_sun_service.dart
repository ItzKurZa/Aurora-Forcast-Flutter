import 'package:result_type/result_type.dart';
import 'sun_model.dart';

/// Error types for SunService
enum SunError implements Exception { network, unknown }

/// Contract for SunService
abstract class ISunService {
  /// Fetches all sun images for predefined wavelengths.
  ///
  /// Returns [Result.failure] with [SunError.network] if network fails.
  Future<Result<List<SunModel>, SunError>> getSunImages();
}
