import '../DefaultPrograms/Connect.dart';
import '../DefaultPrograms/Help.dart';
import '../DefaultPrograms/Connections.dart';
import '../Essential/misc.dart';
import '../Essential/AndromedaUser.dart';
import '../Essential/Computer.dart';
import '../Essential/UserInput.dart';

class AndromedaVM extends Computer {
  // This is the user's computer.
  AndromedaVM(
      {String fullName,
      String shortName,
      String location,
      List<Computer> knownConnections})
      : super(
            fullName: fullName,
            shortName: shortName,
            location: location,
            knownConnections: knownConnections);

  @override
  void userTerminal(AndromedaUser userProfile) {
    // Create the help program.
    HelpProgram help = HelpProgram(rowsPerPage: 5, rows: [
      'help [page number]: View this list.',
      'connect <short name>: Connect to a computer. Must have a connection.'
    ]);
    print('Connecting to your AndromedaVM...');
    asl(2500);
    print("Type 'help' to see a list of commands.");
    asl(300);
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
      } else if (ci[0] == 'connect') {
        if (ci[1] == null) {
          print(
              '2nd positional argument needs to be the shortName of a computer.');
        } else {
          print(knownConnections);
          ConnectProgram.connectTo(ci[1], super.knownConnections, userProfile);
        }
      } else if (ci[0] == 'connections') {
        Connections.run(super.knownConnections);
      } else {
        illegalCommand();
      }
    }
  }
}
