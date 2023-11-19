import 'dart:async';

import 'package:logger/logger.dart';
import 'package:logger_flutter_viewer/logger_flutter_viewer.dart';

const _level = Level.verbose;
Logger logger = Logger(
  // todo kDebugMode, 环境指定不同的 日志等级
  level: _level,
  output: ScreenOutput(),
  printer: PrettyPrinter(
      methodCount: 2, // Number of method calls to be displayed
      errorMethodCount: 8, // Number of method calls if stacktrace is provided
      lineLength: 120, // Width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: true // Should each log print contain a timestamp
      ),
);

extension LoggerExt on Object {
  LoggerWrapper get log {
    return LoggerWrapper(logger, this.runtimeType.toString());
  }
}

class LoggerWrapper {
  final Logger _logger;
  final String prefix;

  const LoggerWrapper(this._logger, this.prefix);

  bool _shouldDebugLog() {
    return _level.index <= Level.debug.index;
  }

  void dd(FutureOr<String> Function() supplier) async {
    if (_shouldDebugLog()) print("[${DateTime.now()}]👋👋👋[${prefix}]: ${await supplier()}");
  }

  void di(String Function() supplier) {
    if (_shouldDebugLog()) print("[${DateTime.now()}]>>> [${prefix}]: ${supplier()}");
  }

  void td(String Function() supplier) {
    if (_shouldDebugLog()) print("[${DateTime.now()}] 还没实现[todo][${prefix}] : ${supplier()}");
  }

  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.e(message, error, stackTrace);
  }
}

// shake 未完全 要包一层
class ScreenOutput extends LogOutput {
  final ConsoleOutput consoleOutput = ConsoleOutput();
  @override
  void output(OutputEvent event) {
    consoleOutput.output(event);
    LogConsole.output(event);
  }
}

extension LoggerEx on Logger {
  LoggerWrapper wrap(Object obj, [String? key]) {
    return LoggerWrapper(logger, obj.runtimeType.toString() + (key ?? ""));
  }
}
