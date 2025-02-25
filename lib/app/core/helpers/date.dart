import 'package:intl/intl.dart';

class DateHelper {
  static String formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    // Format tanggal dengan format tertentu
    String formattedDate = DateFormat('dd MMMM yyyy', 'id').format(date);
    return formattedDate;
  }

  static String formatDateWithTime(String dateString) {
    DateTime date = DateTime.parse(dateString);
    // Format tanggal dengan format tertentu
    String formattedDate = DateFormat('dd MMMM yyyy HH:mm', 'id').format(date);
    return formattedDate;
  }
}
