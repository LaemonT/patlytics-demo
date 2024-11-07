import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  AppLogger._();

  static final _instance = AppLogger._();

  static AppLogger get instance => _instance;

  final Logger _logger = Logger(
    printer: PrefixPrinter(
      PrettyPrinter(
        methodCount: 2, // Number of method calls to be displayed
        errorMethodCount: 8, // Number of method calls if stacktrace is provided
        lineLength: 120, // Width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
      ),
    ),
    output: _MyConsoleOutput(),
  );

  void d(String message, {Object? e, StackTrace? st}) {
    _logger.d(message, error: e, stackTrace: st);
  }

  void e(String message, {Object? e, StackTrace? st}) {
    _logger.e(message, error: e, stackTrace: st);
  }

  void i(String message) {
    _logger.i(message);
  }

  void w(String message, {Object? e, StackTrace? st}) {
    _logger.w(message, error: e, stackTrace: st);
  }
}

class _MyConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (final line in event.lines) {
      debugPrint(line);
    }
  }
}
