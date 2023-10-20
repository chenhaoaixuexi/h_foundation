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
      printTime: false // Should each log print contain a timestamp
      ),
);

// shake 未完全 要包一层
class ScreenOutput extends LogOutput {
  final ConsoleOutput consoleOutput = ConsoleOutput();
  @override
  void output(OutputEvent event) {
    consoleOutput.output(event);
    LogConsole.output(event);
  }
}

bool _shouldDebugLog() {
  return _level.index <= Level.debug.index;
}

extension LoggerEx on Logger {
  void dd(String Function() supplier) {
    if (_shouldDebugLog()) print("👋👋👋: ${supplier()}");
  }

  void df(Future<String> Function() supplier) async {
    if (_shouldDebugLog()) print("👋👋👋: ${await supplier()}");
  }

  void di(String Function() supplier) {
    if (_shouldDebugLog()) print(">>> : ${supplier()}");
  }

  void td(String Function() supplier) {
    if (_shouldDebugLog()) print("还没实现[todo] : ${supplier()}");
  }
}
