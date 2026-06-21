import 'package:intl/intl.dart';

class NumberFormatter {
  static String compact(int value) {
    return NumberFormat.compact().format(value);
  }

  static String labelWithCount({
    required int count,
    required String singularLabel,
    required String pluralLabel,
  }) {
    final formattedNumber = compact(count);
    return '$formattedNumber ${count == 1 ? singularLabel : pluralLabel}';
  }
}
