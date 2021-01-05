import 'package:dart_console/dart_console.dart';

class AConsole {
  static final console = Console();

  static void clear() {
    console.clearScreen();
  }
}
