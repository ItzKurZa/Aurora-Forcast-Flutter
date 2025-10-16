import 'package:aurora_forecast/features/forecast/domain/entities/out_look.dart';

import '../repositories/outlook_repository.dart';

class Get27DayOutlook {
  final OutlookRepository repository;

  Get27DayOutlook(this.repository);

  Future<List<Outlook>> call() async {
    return await repository.get27DayOutlook();
  }
}
