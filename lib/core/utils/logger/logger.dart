import 'package:logger/logger.dart';
import 'package:siketan/core/utils/logger/file_logger.dart';

final logger = Logger(
  printer: PrettyFilePrinter(
    methodCount: 0,
    lineLength: 50,
    printEmojis: true,
    colors: true,
  ),
);
