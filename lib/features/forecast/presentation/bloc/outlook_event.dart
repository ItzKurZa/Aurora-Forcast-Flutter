import 'package:equatable/equatable.dart';

abstract class OutlookEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchOutlookEvent extends OutlookEvent {}
