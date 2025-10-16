
import 'package:aurora_forecast/features/forecast/domain/entities/out_look.dart';

class OutlookModel extends Outlook {
  OutlookModel({required DateTime date, required int kp, required int ap, required int flux})
      : super(date: date, kp: kp, ap: ap, flux: flux);

  factory OutlookModel.fromLine(String line) {
    // Ví dụ line: "2025 Aug 18     115          12          3"
    final parts = line.trim().split(RegExp(r'\s+'));
    if (parts.length < 4) {
      throw FormatException('Dòng dữ liệu không hợp lệ: $line');
    }
    // Parse date: "2025 Aug 18"
    final dateStr = "${parts[0]} ${parts[1]} ${parts[2]}";
    final date = DateTime.parse(_convertDate(dateStr));
    // Parse các chỉ số
    final flux = int.parse(parts[3]);
    final ap = int.parse(parts[4]);
    final kp = int.parse(parts[5]);
    return OutlookModel(
      date: date,
      kp: kp,
      ap: ap,
      flux: flux,
    );
  }

  // Chuyển "2025 Aug 18" thành "2025-08-18" để DateTime.parse
  static String _convertDate(String input) {
    final months = {
      'Jan': '01', 'Feb': '02', 'Mar': '03', 'Apr': '04', 'May': '05', 'Jun': '06',
      'Jul': '07', 'Aug': '08', 'Sep': '09', 'Oct': '10', 'Nov': '11', 'Dec': '12'
    };
    final parts = input.split(' ');
    if (parts.length != 3) return input;
    final year = parts[0];
    final month = months[parts[1]] ?? parts[1];
    final day = parts[2].padLeft(2, '0');
    return "$year-$month-$day";
  }
}
