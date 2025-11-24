import 'package:intl/intl.dart';

class FormatCurrencyHelper {
  static String currency(String? value) {
    if (value == null || value.isEmpty) return "Rp0";

    try {
      final number = double.parse(value);
      final formatter = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'Rp',
        decimalDigits: 0,
      );
      return formatter.format(number);
    } catch (e) {
      return "Rp0";
    }
  }
}
