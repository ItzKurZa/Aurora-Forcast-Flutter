import 'package:aurora_forecast/sun/infrastructure/sun_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/i_sun_service.dart';
import 'sun_state.dart';

class SunCubit extends Cubit<SunState> {
  final ISunService _service;

  SunCubit({ISunService? service})
    : _service = service ?? SunService(),
      super(SunState.initial());

  Future<void> initialize() async {
    emit(state.copyWith(isLoading: true, hasError: false));
    final result = await _service.getSunImages();
    if (result.isSuccess) {
      emit(state.copyWith(images: result.success, isLoading: false));
    } else {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }
}
