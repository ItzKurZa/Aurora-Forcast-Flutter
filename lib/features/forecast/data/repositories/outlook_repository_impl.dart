import 'package:aurora_forecast/features/forecast/domain/entities/out_look.dart';

import '../../domain/repositories/outlook_repository.dart';
import '../datasources/outlook_remote_datasource.dart';

class OutlookRepositoryImpl implements OutlookRepository {
  final OutlookRemoteDataSource remoteDataSource;

  OutlookRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Outlook>> get27DayOutlook() async {
    return await remoteDataSource.fetch27DayOutlook();
  }
}
