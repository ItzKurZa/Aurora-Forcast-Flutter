import 'package:aurora_forecast/features/forecast/domain/entities/out_look.dart';
import 'package:equatable/equatable.dart';

abstract class OutlookState extends Equatable {
  @override
  List<Object> get props => [];
}

class OutlookInitial extends OutlookState {}

class OutlookLoading extends OutlookState {}

class OutlookLoaded extends OutlookState {
  final List<Outlook> outlooks;
  OutlookLoaded(this.outlooks);

  @override
  List<Object> get props => [outlooks];
}

class OutlookError extends OutlookState {
  final String message;
  OutlookError(this.message);

  @override
  List<Object> get props => [message];
}
