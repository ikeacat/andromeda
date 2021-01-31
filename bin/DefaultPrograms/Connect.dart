import '../Essential/AndromedaUser.dart';
import '../Essential/Computer.dart';

class ConnectProgram {
  static int seek(String shortName, List<Computer> avaliableConnections) {
    // Seek for index number in avaliableConnections
    var i;
    var indexFound = -1;
    for (i = 0; i <= avaliableConnections.length - 1; i++) {
      print(avaliableConnections[i].shortName);
      if (avaliableConnections[i].shortName == shortName) {
        indexFound = i;
      }
    }
    print(indexFound);
    return indexFound;
  }

  static void connectTo(String shortName, List<Computer> avaliableConnections,
      AndromedaUser userProfile) {
    print(avaliableConnections);
    var findIndex = seek(shortName, avaliableConnections);
    if (findIndex == -1) {
      print('Cound not connect to ${shortName}.');
      return;
    }
    avaliableConnections[findIndex].connect(userProfile);
  }
}
