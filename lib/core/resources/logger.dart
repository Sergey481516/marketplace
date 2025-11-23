import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';

final appLogger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 90,
    colors: true,
    printEmojis: true,
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
  level: kReleaseMode ? Level.warning : Level.debug,
);
