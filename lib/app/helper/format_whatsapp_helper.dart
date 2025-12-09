String formatWhatsAppNumber(String rawNumber) {
  String number = rawNumber.trim();

  // Hilangkan semua spasi dan tanda non-digit kecuali plus
  number = number.replaceAll(RegExp(r'[^0-9+]'), '');

  if (number.startsWith('+62')) {
    return number; // sudah benar
  }

  if (number.startsWith('62')) {
    return '+$number'; // tambah plus
  }

  if (number.startsWith('0')) {
    return '+62${number.substring(1)}'; // ganti 0 → +62
  }

  // fallback jika format tidak diketahui
  return number.startsWith('+') ? number : '+$number';
}
