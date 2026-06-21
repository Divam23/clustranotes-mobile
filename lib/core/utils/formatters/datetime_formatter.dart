import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class DateTimeFormatter {
  static String compactNumber(int value) {
    return NumberFormat.compact().format(value);
  }

  static String timeAgo(DateTime date) {
    return timeago.format(date);
  }

  static String date(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  static String time(DateTime date) {
    return DateFormat('hh:mm a').format(date);
  }

  static String dateTime(DateTime date) {
    return DateFormat('dd MMM yyyy • hh:mm a').format(date);
  }
}
