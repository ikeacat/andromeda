import 'dart:io';

void asl(int ms) {
  sleep(Duration(milliseconds: ms));
}

void illegalCommand() {
  print('Illegal Command\n');
}

void accessDeniedCommand() {
  print('You do not have the permission to run this command.');
}
