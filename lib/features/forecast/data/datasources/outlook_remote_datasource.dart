import 'package:http/http.dart' as http;
import '../models/outlook_model.dart';

abstract class OutlookRemoteDataSource {
  Future<List<OutlookModel>> fetch27DayOutlook();
}

class OutlookRemoteDataSourceImpl implements OutlookRemoteDataSource {
  final http.Client client;

  OutlookRemoteDataSourceImpl(this.client);

  @override
  Future<List<OutlookModel>> fetch27DayOutlook() async {
    final url = Uri.parse('https://services.swpc.noaa.gov/text/27-day-outlook.txt');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final lines = response.body.split('\n');
  // Lọc các dòng dữ liệu hợp lệ (bắt đầu bằng YYYY MMM DD)
  final dataLines = lines.where((line) => RegExp(r'^\d{4} [A-Z][a-z]{2} \d{2}').hasMatch(line.trim()));
  return dataLines.map((line) => OutlookModel.fromLine(line)).toList();
    } else {
      throw Exception('Failed to fetch outlook data');
    }
  }
}
