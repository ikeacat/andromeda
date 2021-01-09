import '../DefaultPrograms/Help.dart';
import '../Essential/AndromedaSleep.dart';
import '../Essential/AndromedaUser.dart';
import '../Essential/Computer.dart';
import '../Essential/UserInput.dart';
import '../Essential/misc.dart';

class AndromedaVM extends Computer {
  // This is the user's computer.
  AndromedaVM({String fullName, String shortName, String location})
      : super(fullName: fullName, shortName: shortName, location: location);

  @override
  void userTerminal(AndromedaUser userProfile) {
    // Create the help program.
    HelpProgram help = HelpProgram(rowsPerPage: 4, rows: [
      'help [page number]: View this list.',
    ]);
    print('Connecting to your AndromedaVM...');
    Sl.asl(2500);
    print("Type 'help' to see a list of commands.");
    Sl.asl(300);
    while (true) {
      print('');
      var consoleInput =
          uInput(initialMessage: '${userProfile.username}@AndromedaVM\$ ');
      var ci = consoleInput.split(' ');
      if (ci[0] == 'help') {
        // Help command
        int pageNum;
        try {
          ci[1];
        } catch (RangeError) {
          ci.add('1');
        }

        if (ci[1] == null) {
          pageNum = 0;
        } else {
          pageNum = int.tryParse(ci[1]);
          if (pageNum == null) {
            print('2nd positional argument (${ci[1]}) must be an integer!');
          } else {
            help.outputdpPage(pageNum - 1);
          }
        }
      } else {
        illegalCommand();
      }
    }
  }
}
