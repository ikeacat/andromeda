import 'dart:io';
import 'dart:math';

void asl(int ms) {
  sleep(Duration(milliseconds: ms));
}

void illegalCommand() {
  print('Illegal Command\n');
}

void accessDeniedCommand() {
  print('You do not have the permission to run this command.');
}

int randomInRange(int seed, int max, {int min}) {
  final pRNG = Random(seed);
  if (min == null) {
    return pRNG.nextInt(max);
  }
  return min + pRNG.nextInt(max - min);
}
