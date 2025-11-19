import 'package:logger/logger.dart';

class PrettyFilePrinter extends LogPrinter {
  final PrettyPrinter prettyPrinter;

  PrettyFilePrinter({
    int methodCount = 2,
    int errorMethodCount = 5,
    int lineLength = 80,
    bool colors = true,
    bool printEmojis = true,
    bool printTime = false,
  }) : prettyPrinter = PrettyPrinter(
          methodCount: methodCount,
          errorMethodCount: errorMethodCount,
          lineLength: lineLength,
          colors: colors,
          printEmojis: printEmojis,
          printTime: printTime,
        );

  @override
  List<String> log(LogEvent event) {
    final stackTrace = StackTrace.current.toString().split('\n');
    final caller = _extractCallerInfo(stackTrace);

    // Tambahkan file & line ke dalam message-nya
    final newMessage = "[ $caller ] → ${event.message}";

    // Buat LogEvent baru dengan message yang sudah dipatch
    final newEvent = LogEvent(event.level, newMessage, error: event.error, stackTrace: event.stackTrace);

    // Biarkan PrettyPrinter bawaan yang render semuanya
    return prettyPrinter.log(newEvent);
  }

  /// Cari info file + line
  String _extractCallerInfo(List<String> lines) {
    for (var line in lines) {
      if (line.contains('.dart') && !line.contains('logger.dart')) {
        final match = RegExp(r'(\w+\.dart):(\d+)').firstMatch(line);
        if (match != null) {
          return "${match.group(1)}:${match.group(2)}";
        }
      }
    }
    return "unknown.dart:0";
  }
}
