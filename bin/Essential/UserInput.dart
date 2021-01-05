import 'dart:io';

String uInput({String initialMessage}) {
  if (initialMessage == null) {
    stdout.write("Press 'enter' to continue.");
  } else {
    stdout.write(initialMessage);
  }
  return stdin.readLineSync().toString();
}
