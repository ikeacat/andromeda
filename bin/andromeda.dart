import 'Essential/AndromedaUser.dart';
import 'Essential/Computer.dart';
import 'SpecialComputers/AndromedaVM.dart';
import 'Essential/Console.dart';

void main(List<String> arguments) {
  var x;
  try {
    x = arguments[0];
  } on RangeError {
    // dont do anything, this is expected.
  } finally {
    if (x == 'skipPC') {
      skipPlayerCreation();
    } else {
      playerCreation();
    }
  }
}

void skipPlayerCreation() {
  print('Skipping Player Creation...');
  final userProfile = AndromedaUser();
  userProfile.username = 'Dunce';
  userProfile.password = 'dunceydunce';
  userProfile.pc = AndromedaVM(knownConnections: [
    Computer(fullName: 'Test Computer', shortName: 'test')
  ]);
  AConsole.clear();
  userProfile.toTerminal();
}

void playerCreation() {
  print('Connecting to the Andromeda Public Machine...');
}
