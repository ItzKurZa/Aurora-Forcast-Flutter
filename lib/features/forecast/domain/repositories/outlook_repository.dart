import 'package:aurora_forecast/features/forecast/domain/entities/out_look.dart';

abstract class OutlookRepository {
  Future<List<Outlook>> get27DayOutlook();
}
