import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

String formatDateNullable(dynamic date, {String pattern = 'dd MMMM yyyy'}) {
  if (date == null) return '-';

  DateTime? parsed;

  if (date is DateTime) {
    parsed = date;
  } else if (date is String) {
    try {
      parsed = DateTime.parse(date);
    } catch (e) {
      return '-';
    }
  } else {
    return '-';
  }

  // Set locale Indonesia
  initializeDateFormatting('id_ID', null);

  return DateFormat(pattern, 'id_ID').format(parsed);
}
