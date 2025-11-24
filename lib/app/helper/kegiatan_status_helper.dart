import 'package:flutter/widgets.dart';
import 'package:siketan/shared/style/color.dart';

enum EventStatus {
  upcoming,
  ongoing,
  finished,
  invalid, // jika null atau parsing gagal
}

EventStatus getEventStatus(dynamic dateInput) {
  if (dateInput == null) return EventStatus.invalid;

  DateTime? date;

  // Jika DateTime:
  if (dateInput is DateTime) {
    date = dateInput;
  }
  // Jika String:
  else if (dateInput is String) {
    try {
      date = DateTime.parse(dateInput);
    } catch (e) {
      return EventStatus.invalid;
    }
  }

  if (date == null) return EventStatus.invalid;

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final eventDay = DateTime(date.year, date.month, date.day);

  if (eventDay.isAfter(today)) {
    return EventStatus.upcoming; // akan datang
  } else if (eventDay.isAtSameMomentAs(today)) {
    return EventStatus.ongoing; // sedang hari ini
  } else {
    return EventStatus.finished; // lewat
  }
}

String getEventStatusText(EventStatus status) {
  switch (status) {
    case EventStatus.upcoming:
      return "Akan Datang";
    case EventStatus.ongoing:
      return "Sedang Berlangsung";
    case EventStatus.finished:
      return "Sudah Berakhir";
    default:
      return "Tidak Valid";
  }
}

Color getEventStatusColor(EventStatus status) {
  switch (status) {
    case EventStatus.upcoming:
      return AppColors.blue4;
    case EventStatus.ongoing:
      return AppColors.green4;
    case EventStatus.finished:
      return AppColors.red4;
    default:
      return AppColors.gray400;
  }
}
