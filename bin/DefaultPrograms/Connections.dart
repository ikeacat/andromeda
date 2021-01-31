import '../Essential/Computer.dart';

class Connections {
  static void run(List<Computer> listOfConnections) {
    var i;
    if (listOfConnections == null || listOfConnections == []) {
      print('No Connections Found.');
      return;
    }
    print('SHORT NAME | LONG NAME | LOCATION');
    for (i = 0; i <= listOfConnections.length - 1; i++) {
      if (listOfConnections[i].status == ComputerStatus.online) {
        print(listOfConnections[i].shortName +
            ' | ' +
            listOfConnections[i].fullName +
            ' | ' +
            listOfConnections[i].location);
      }
    }
  }
}
