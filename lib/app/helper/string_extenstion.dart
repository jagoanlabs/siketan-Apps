extension StringExtension on String {
  /// Mengubah huruf pertama menjadi kapital
  String capitalize() {
    if (isEmpty) return "";
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
