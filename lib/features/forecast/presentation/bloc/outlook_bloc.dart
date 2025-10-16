import 'package:aurora_forecast/features/forecast/domain/usecase/get_outlook.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'outlook_event.dart';
import 'outlook_state.dart';

class OutlookBloc extends Bloc<OutlookEvent, OutlookState> {
  final Get27DayOutlook get27DayOutlook;

  OutlookBloc(this.get27DayOutlook) : super(OutlookInitial()) {
    on<FetchOutlookEvent>((event, emit) async {
      emit(OutlookLoading());
      try {
        final outlooks = await get27DayOutlook();
        emit(OutlookLoaded(outlooks));
      } catch (e) {
        emit(OutlookError(e.toString()));
      }
    });
  }
}
