import 'Essential/AndromedaUser.dart';
import 'SpecialComputers/AndromedaVM.dart';
import 'Essential/Console.dart';

void main(List<String> arguments) {
  if (arguments[0] == 'skipPC') {
    print('Skipping Player Creation...');
    final userProfile = AndromedaUser();
    userProfile.username = 'Dunce';
    userProfile.password = 'dunceydunce';
    userProfile.pc = AndromedaVM();
    AConsole.clear();
    userProfile.toTerminal();
  }
}
