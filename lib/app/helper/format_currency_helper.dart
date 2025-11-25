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

  /// Format angka menjadi ribu, juta, miliar, triliun
  static String formatLargeNumber(num number) {
    if (number < 1000) {
      return number.toString();
    }

    if (number < 1_000_000) {
      return "${_removeTrailingZero(number / 1000)} Ribu";
    }

    if (number < 1_000_000_000) {
      return "${_removeTrailingZero(number / 1_000_000)} Juta";
    }

    if (number < 1_000_000_000_000) {
      return "${_removeTrailingZero(number / 1_000_000_000)} Miliar";
    }

    return "${_removeTrailingZero(number / 1_000_000_000_000)} Triliun";
  }

  /// Menghilangkan .0 atau .00 di belakang angka
  static String _removeTrailingZero(double value) {
    if (value % 1 == 0) {
      return value.toStringAsFixed(0); // angka bulat
    }
    return value.toStringAsFixed(2); // 2 decimal
  }
}
